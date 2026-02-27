# Pixel-art scaling Accelerator in Chisel
> [GitHub](https://github.com/kstoko02/Pixel-art-scaling-Accelerator-in-Chisel-upgrade)

## Goals
* Design a pixel-art scaling hardware accelerator in Chisel, using the algorithms listed in the Wikipedia entry on [pixel-art scaling](https://en.wikipedia.org/wiki/Pixel-art_scaling_algorithms) and drawing technical insight from the [GPU-xBR project](https://github.com/mattiadr/GPU-xBR).
* Understanding xBR / GPU-xBR
   * Read and summarize at least three algorithms from:
     [Pixel-art scaling algorithms](https://en.wikipedia.org/wiki/Pixel-art_scaling_algorithms) and identify the characteristics that distinguish pixel-art scaling from generic image interpolation.
   * Read `GPU-xBR/Report.pdf` from [GPU-xBR project](https://github.com/mattiadr/GPU-xBR) and extract and summarize the following components:
     * Pattern-based edge detection
     * Diagonal continuity rules
     * Blend selection logic
     * GPU execution structure (threads, memory layout)
* Implementing an xBR-Style Scaler in Chisel, with pipelined processing
* Design neighborhood pattern extraction
   * Implement a 3×3 or 4×4 window extractor in Chisel using line buffers.
   * Verify correct windowing on test images via Verilator simulation.
* Implement xBR-style decision logic
   * Convert the extracted GPU-xBR rules into combinational Chisel logic:
     * Edge orientation checks
     * Diagonal detection
     * Similarity thresholding
   * Ensure the logic selects among candidate output pixels (A/B/C/D).
* Define and implement the scaling factor
   * Choose the scaling variant (e.g., 2×BR or 3×BR).
   * Implement the output expansion (e.g., 1 pixel → 2×2 block).
   * Handle ambiguous or undefined patterns consistently.
* Test correctness
   * Use Verilator to simulate the hardware scaler on an assortment of pixel-art test cases.
   * Compare the output images with GPU-xBR to validate behavior.

## Introduction
Version 2.0 replaces the general image interpolation algorithm used in [Version 1.0](https://hackmd.io/@sysprog/r1cybDhSye) with a pixel-art-aware scaling algorithm, shifting the design focus from smooth interpolation to edge-preserving, rule-based scaling specifically tailored for pixel art.

In essence, interpolation emphasizes visual smoothness, while pixel art scaling preserves discrete structures and design intent. Compared to the old method, the new method has the advantage of better preserving the edge and outline of pixel art, avoiding color mixing and the generation of new colors (maintaining the consistency of the palette and style), and preventing fine lines and small details from being smoothed out. The overall visual effect is closer to the pixel feel and design intent of "the original work being enlarged", rather than being interpolated into a smoother but easily blurred and discolored version.

## EPX / Scale2× / AdvMAME2×
EPX / Scale2× / AdvMAME2× belong to the same family of algorithms and are used to scale pixel art into a 2×2 block.

The core idea of this family is:
Normally, pixels are simply duplicated. If `an edge in a particular direction` is detected, only the corresponding quadrant is modified to make the edge appear smoother. If the surrounding colors are very similar, the algorithm keeps the original result to avoid artificially creating false edges.

This family mainly has two variants:
* Basic EPX
* Improved versions : Scale2× / AdvMAME2×

All of the following algorithms use the same pixel neighborhood layout as shown below:
* Neighbor pixel arrangement :
```
   A
 C P B
   D
```
* P needs to be enlarged to 2×2 :
```
  1  2
  3  4
```
### EPX Algorithm
The basic approach is to first fill the enlarged 2×2 block entirely with the original pixel P. If neighboring pixels indicate a continuous color in a certain direction, only the corresponding quadrant is adjusted to make the edge smoother. However, if the surrounding colors are almost identical, the block remains entirely P, avoiding unnecessary and incorrect edge creation.
```
1 = 2 = 3 = 4 = P

IF C == A  → 1 = A
IF A == B  → 2 = B
IF D == C  → 3 = C
IF B == D  → 4 = D

If three or more of A, B, C, and D have the same color：
    1 = 2 = 3 = 4 = P
```
### Scale2× / AdvMAME2× Algorithm
This version uses the same logic as EPX Algorithm, but with more stringent conditions to avoid misjudgments.
```
1 = 2 = 3 = 4 = P

IF C == A AND C != D AND A != B → 1 = A
IF A == B AND A != C AND B != D → 2 = B
IF D == C AND D != B AND C != A → 3 = C
IF B == D AND B != A AND D != C → 4 = D
```
### Difference
| Project | EPX | AdvMAME2x/Scale2x |
| -------- | -------- | -------- |
|Only check if colors are equal|No|Yes|
|Confirm if boundaries are truly reasonable| No|Yes|
|Probability of misjudging edges|High|Low|
|Visual stability|Good|Better|
|Edge smoothing effect|Good|Better|
|Computational complexity|Low|High|

## xBR Algorithm
xBR is a structure-aware image upscaling algorithm designed for pixel art. Unlike traditional bilinear or bicubic interpolation, which often blurs edges, xBR focuses on preserving the **sharp boundaries and geometric structure** of pixel graphics.

The algorithm analyzes each pixel’s local neighborhood (typically 3x3 or 5x5) to detect color differences and structural patterns. By converting images from RGB to YUV color space, xBR separates luminance and chrominance, enabling more accurate edge detection. Flat regions are scaled directly, while diagonal or slanted edges are reconstructed using direction-aware weighted interpolation.

This approach allows xBR to produce clear and smooth results at 2×–4× scaling, maintaining crisp pixel-art contours without introducing blur.
### xBR Algorithm Steps

#### Step1 - Preprocessing
For each input pixel P, its 3×3 or 5×5 neighborhood is extracted, and the RGB values are converted to YUV, where Y (luminance) has the greatest impact on edge perception, while U/V are used to evaluate color similarity.

#### Step2 - Color difference measurement
A weighted distance function is defined in the YUV space to measure the color difference between two pixels. For any two pixels (a,b), the distance is defined as:
$$
d(a,b)=48\left|Y_a-Y_b\right|
      +7\left|U_a-U_b\right|
      +6\left|V_a-V_b\right|
$$

Next, a color threshold (τ > 0) is specified. If the distance between two pixels does not exceed this threshold, the two colors are considered similar; otherwise, they are regarded as dissimilar. Formally, this is defined as:
$$
\operatorname{similar}(a,b) =
\begin{cases}
\text{true}, & \text{if } d(a,b) \le τ \\[4pt]
\text{false}, & \text{if } d(a,b) > τ
\end{cases}
$$

In `GPU-xBR/CPU/xBR_utils.h`, this threshold is a constant of 600.

#### Step3 - xBR edge detection (Pattern-based Edge Detection)
Using the center pixel E as the reference, xBR (taking the 5×5 case as an example) examines a 5×5 neighborhood to determine whether reliable diagonal edges exist in the four diagonal directions (TL / TR / BL / BR).

The window structure is shown below (center = E):
```
     A1  B1  C1
A0   A   B   C   C4
D0   D   E   F   F4
G0   G   H   I   I4
     G5  H5  I5
```
xBR’s directional edge detection evaluates the four diagonal directions—Top-Left, Top-Right, Bottom-Left, and Bottom-Right—by computing two weighted scores:

* **( O ) Orthogonal** : the strength of color variation **perpendicular to the edge direction**, indicating whether a strong color discontinuity (sharp transition) is present.
* **( P ) Parallel** : the degree of consistency **along the edge direction**, measuring whether color changes are smooth and coherent along the diagonal edge.

Then use the following formula to determine if there is a hypotenuse:
$$
edgeXX \iff wdXXO < wdXXP
$$
```Code=C
// 1) Bottom-Right (BR)
unsigned int wdBRO = d(C, E) + d(E, G)+ d(F4, I) + d(I, H5)+ 4 * d(F, H);
unsigned int wdBRP = d(B, F) + d(F, I4)+ d(D, H) + d(H, I5)+ 4 * d(E, I);

edgeBR = wdBRO < wdBRP;

// 2) Bottom-Left (BL)
unsigned int wdBLO = d(A, E) + d(E, I)+ d(D0, G) + d(G, H5)+ 4 * d(D, H);
unsigned int wdBLP = d(B, D) + d(D, G0)+ d(F, H) + d(H, G5)+ 4 * d(E, G);

edgeBL = wdBLO < wdBLP;

// 3) Top-Left (TL)
unsigned int wdTLO = d(C, E) + d(E, G)+ d(B1, A) + d(A, D0)+ 4 * d(B, D);
unsigned int wdTLP = d(A1, B) + d(B, F)+ d(A0, D) + d(D, H)+ 4 * d(A, E);

edgeTL = wdTLO < wdTLP;

// 4) Top-Right (TR)
unsigned int wdTRO = d(A, E) + d(E, I)+ d(B1, C) + d(C, F4)+ 4 * d(B, F);
unsigned int wdTRP = d(C1, B) + d(B, D)+ d(C4, F) + d(F, H)+ 4 * d(C, E);

edgeTR = wdTRO < wdTRP;
```
#### step4 - Interpolation
First, extract the magnified block index corresponding to (row,col) in the output image:
```
out_cols = cols * scaleFactor
out = &output[row*out_cols*scaleFactor + col*scaleFactor]
```
Then set all blocks of scaleFactor × scaleFactor to E_rgb:
```
PixelRGB E_rgb = get_RGB(..., row, col);
for r in 0..scaleFactor-1:
  for c in 0..scaleFactor-1:
    out[r*out_cols + c] = E_rgb;
```

For each corner, three steps are performed:

1. Identify the two candidate pixels for interpolation (from the two sides of the corner).
2. Select `newColor` using the YUV distance (d()), choosing the candidate that is more similar to the center pixel **E**. (Blend Selection Logic)
3. Use the `YUV_equals()` pattern test to decide whether to apply **INT2** (stronger edge extension: LVL2) or **INT1** (basic corner interpolation: LVL1). (Diagonal Continuity Rules)

Taking **Bottom-Right** as an example:
##### Blend Selection Logic
```Code=C
newColor = (d(E, F) <= d(E, H)) ? F_rgb : H_rgb;
```
* New Color : 
Compare the distances of the center pixel E to its neighbors F and H, and select the one whose color is closest to E.

##### Diagonal Continuity Rules
```Code=C
if (YUV_equals(F, G) && YUV_equals(C, H)) {
	BR_INT2_B(scaleFactor, out, out_cols, newColor);
	BR_INT2_R(scaleFactor, out, out_cols, newColor);
    } 
else if (YUV_equals(F, G))
	BR_INT2_B(scaleFactor, out, out_cols, newColor);
else if (YUV_equals(C, H))
	BR_INT2_R(scaleFactor, out, out_cols, newColor);
else
	BR_INT1(scaleFactor, out, out_cols, newColor);
```
* INT2 / INT1 selection

**Level 1 (LVL1)**
* Can only handle 45° diagonals
* For enlarged pixel squares, based on the edge position:
    * Above the line → Original pixel color
    * Below the line → New color
    * Through the boundary → Color blending (depending on the coverage ratio)

**Level 2 (LVL2, Diagonal Continuity)**
* Handles non-45° diagonal lines and arcs
* Divided into two independent rules:
    * bottom rule
    * right rule

Enabling conditions (original definition):
```
do_LVL2_bottom = (F == G) 
do_LVL2_right = (C == H)
```

## Pixel-art scaling vs. generic interpolation 

| Axis | Pixel-art scaling (e.g., EPX/Scale2x/xBR) | Generic interpolation (e.g., bilinear/bicubic) |
|---|---|---|
| Edge handling | Detects local edge direction (patterns / gradients) and preserves crisp diagonals by selectively modifying sub-pixels | Treats image as continuous; edges blur because it blends across boundaries |
| Color generation | Mostly reuses existing neighbor colors; may choose between a few candidates or simple blends to avoid “new” colors | Generates many new colors via weighted averages; smooth but can “wash out” pixel art |
| Intended content | Pixel art / low-res sprites with hard boundaries and deliberate shapes | Natural images / continuous-tone signals (photos), where smoothing is acceptable |

## GPU-xBR optimization
In [GPU-xBR](https://github.com/mattiadr/GPU-xBR), we go beyond basic parallelization strategies by further optimizing the implementation with respect to data types and hardware characteristics. Compared to conventional naïve approaches that simply port the algorithm to the GPU, such methods often overlook the impact of memory access patterns and computational precision on performance, and therefore fail to fully exploit the GPU’s computational potential.
1. **Execution Model**
    * Each thread processes one input pixel.
    * Pixels are independent of each other, making the algorithm highly suitable for GPU parallelization.
2. **Thread / Block Configuration**
    * Block size: 32×32 threads (1024 threads per block).
    * Effective computation tile: 28×28.
    * A 2-pixel halo is reserved around the tile to satisfy the 5×5 neighborhood requirement.
3. **Shared Memory and Tiling**
    * Both RGB data and YUV data are loaded into shared memory.
    * Each thread:
        * Loads its own pixel.
        * Fills the halo region using the nearest available pixels.
    * After a `__syncthreads()` barrier, edge detection and interpolation are performed.
4. **Memory Alignment (Memory Layout)**
* Original PixelRGB / PixelYUV structures use 3 bytes per pixel, which leads to shared memory bank conflicts.
* Solution:
```
struct __align__(4) PixelRGB { uchar r, g, b; };
```
* Two additional GPU kernels were designed to perform format conversions of "3→4 bytes" and "4→3 bytes" before and after the operation. Although this requires an additional kernel for data conversion, the overall performance is still improved.
5. **Floating-Point Precision Selection**
* Color mixing is performed using floating-point arithmetic.
* Switching from double precision to single-precision (float) results in a significant speedup on the Jetson Nano.
* Using half precision provides only limited benefits, as performance is constrained by other factors such as memory latency.

## Execute GPU-xBR
1. Install opencv4
```
sudo apt update
sudo apt install -y libopencv-dev pkg-config
pkg-config --modversion opencv4 
```
2. Compiling CUDA programs using nvcc
```
nvcc `pkg-config --libs --cflags opencv4` -lX11 -maxrregcount 32 -O3 main.cu -o main.out
```
3. run (scaling 4x)
```
./main.out 4 i input.png output.png
```
p.s. If it doesn't work, please modify `img_utils.h`.
```
output[index] = (PixelRGB) {.R = p.R, .G = p.G, .B = p.B};
```
change to
```
 output[index] = (PixelRGB) {p.B, p.G, p.R};
```
* Because the original code used C99 designated initializers, but CUDA’s C++ compiler (nvcc) does not support this syntax, it results in the error “out-of-order initializers are nonstandard in C++.” In addition, most OpenCV-related structures use BGR order rather than RGB.


## Implementation
Based on the design principles of the xBR algorithm and the optimization strategies of GPU-xBR, this implementation further extends these concepts toward a hardware-oriented implementation.
#### Not carried over to our Chisel hardware
1. **5×5 neighborhood:** GPU-xBR often uses larger context to stabilize diagonal continuity; our hardware uses **3×3** to reduce buffering cost and latency.
2. **GPU shared-memory tiling / coalesced access:** GPU-xBR relies on block tiling, shared memory reuse, and memory coalescing; our design is **streaming** and uses **line buffers + shift registers**, so those GPU-specific optimizations do not apply.
3. **Full set of GPU-xBR heuristics / priority rules:** Some tie-break/priority ordering differs due to deterministic hardware-friendly rule ordering.

### Scaling factor
We design and implement a **2×** image upscaler with the goal of preserving pixel-art characteristics while improving edge sharpness and visual consistency. 
If the input image size is W×H, the output image size is (2W)×(2H). Each input pixel corresponds to a 2×2 sub-pixel block in the output image.
We choose **2×** scaling because it is the best hardware trade-off:
- **Complexity:** 2× needs only a 2×2 output block per input pixel; 3×/4× requires more sub-pixel rules and more corner cases.
- **Latency & buffering:** Higher factors amplify the amount of rule evaluation and output packing, increasing pipeline depth or critical path.
- **Hardware cost:** More sub-pixels means more parallel blend/choose logic, wider output bandwidth, and larger queues to absorb stalls.

Therefore, 2× achieves clear visual improvement over nearest-neighbor while staying within reasonable area/timing for an FPGA-style pipeline.
#### Output expansion: 1 pixel → 2×2 block
For every input pixel **E**, the output is a block:
```
    E0 E1
    E2 E3
```
* The baseline behavior is replication: all four subpixels are initially set to the original center pixel color E. This guarantees a valid output even when no edge pattern is detected.

### Window extractor
We implemented a 3×3 streaming window extractor in Chisel using line buffers and shift registers, enabling one-cycle-per-pixel neighborhood generation with replicate padding and ready/valid support for seamless integration into the xBR pipeline.
### xBR-style decision logic
#### Edge orientation checks
In `src/main/scala/pixelart/S5Blend.scala`, these four boolean expressions are the core of xBR’s directional edge test (one per corner).
```
val edgeBR = (b.dCE + b.dEG + (b.dFH << 2)) < (b.dBF + b.dDH + (b.dEI << 2))
val edgeBL = (b.dAE + b.dEI + (b.dDH << 2)) < (b.dBF + b.dFH + (b.dEG << 2))
val edgeTL = (b.dCE + b.dEG + (b.dCB << 2)) < (b.dAB + b.dDG + (b.dAE << 2))
val edgeTR = (b.dAE + b.dEI + (b.dBF << 2)) < (b.dCB + b.dFH + (b.dCE << 2))
```
* Each `edge??` compares the “variation sum” of two competing directions.
* The << 2 is a ×4 weight, making some distances (e.g., b.dFH, b.dEI) more influential in the decision.
* All `b.dXX` terms are precomputed in `S4aPrecompute` using the packed YUV distance.
#### Diagonal detection
In `src/main/scala/pixelart/S5Blend.scala`,
**Step1** : Pick the corner interpolation candidate along the diagonal
In `src/main/scala/pixelart/S5Blend.scala`,
```
val brNew = closerToE(b.Fp, b.Hp, b.winYUV.F, b.winYUV.H, Ey)
val blNew = closerToE(b.Dp, b.Hp, b.winYUV.D, b.winYUV.H, Ey)
val tlNew = closerToE(b.Bp, b.Dp, b.winYUV.B, b.winYUV.D, Ey)
val trNew = closerToE(b.Bp, b.Fp, b.winYUV.B, b.winYUV.F, Ey)
```
* `closerToE()` chooses the neighbor whose YUV is closer to the center E (via yuv_dist_packed(E, y1) vs yuv_dist_packed(E, y2)), i.e., “extend from the side that looks more like E”.

**Step2** : Decide whether the diagonal pattern is continuous → INT2 vs INT1
Each corner uses `edge?? && (eq_.. || eq_..)` to decide whether to apply the stronger diagonal extension (INT2) or the weaker one (INT1).
Examples:
```
val br_hasInt2 = edgeBR && (b.eq_FG || b.eq_CH)
val br_hasNone = edgeBR && !(b.eq_FG || b.eq_CH)
```
* **BR** uses (b.eq_FG || b.eq_CH)
* If both are true → use **INT2** (stronger extension). Otherwise → fall back to **INT1** (basic corner fill).
#### Similarity thresholding and distance definition
In `src/main/scala/pixelart/Utils.scala`, similarity threshold is explicitly thr (default 600).
```
  def yuv_equals(a: UInt, b: UInt, thr: Int = 600): Bool = {
    yuv_dist_packed(a, b) <= thr.U
  }
```
The following is the YUV distance weighting formula:
```Code=C
  def yuv_dist_packed(a: UInt, b: UInt): UInt = {
    val ay = a(23,16); val au = a(15,8); val av = a(7,0)
    val by = b(23,16); val bu = b(15,8); val bv = b(7,0)
    val dy = absDiffU(ay, by)
    val du = absDiffU(au, bu)
    val dv = absDiffU(av, bv)
    (dy << 5) + (dy << 4) + (du << 2) + (du << 1) + du + (dv << 2) + (dv << 1)
  }
```
* $$ dist = 48\cdot dy + 7\cdot du + 6\cdot dv,\; \text{where } dy = |Y_a - Y_b|,\; du = |U_a - U_b|,\; dv = |V_a - V_b| $$

### Critical-path implications
In the xBR-style decision logic, the critical path is dominated by **multiple YUV-distance comparisons**.
Although each distance computation consists of several absolute differences and additions, these operations can be partially parallelized.
The longest combinational delay typically occurs in the final comparison stage, where multiple accumulated distance values are compared and resolved through a priority decision chain to select the output pixel.
As a result, the comparator and priority-selection logic in the blending stage form the critical path and ultimately limit the maximum clock frequency of the design.

### Ambiguous or undefined patterns
1. Default fallback : if a corner is not classified as an edge, or if the required pattern conditions are not met, that subpixel remains the original 𝐸.
2. Pattern gating : even if an edge is detected, the design only applies the stronger INT2 behavior when specific equality-pattern conditions in the neighborhood are satisfied (conceptually, “pattern matches” such as FG/CH-type checks for BR, DI/AH for BL, etc.).
3. Deterministic tie/priority : updates are applied in a fixed order (BR → BL → TL → TR). Each stage uses the previous stage’s intermediate subpixel values as its input. This guarantees reproducible output when multiple corner rules could apply at the same time. 
Our hardware applies corner updates in a fixed order, matching the reference GPU-xBR code. Note that other GPU-xBR variants may resolve overlapping corner updates with a different tie-break order; we use a fixed priority to guarantee deterministic hardware behavior and avoid rule conflicts.

As a result, the output is always well-defined: when patterns are unclear, the system gracefully falls back to replication or the weaker blend, avoiding unstable or inconsistent behavior.

## Pipeline Stage
This logic uses `v1–v4` to track valid data as it flows through the pipeline. When the data is about to be enqueued from S5 into the output FIFO while the FIFO is full, a stall signal is asserted to deassert `io.in.ready`, freezing the token in place to prevent data loss and pipeline misalignment.
```scala=
val v1 = RegInit(false.B)
val v2 = RegInit(false.B)
val v3 = RegInit(false.B)
val v4 = RegInit(false.B) // default is 0

val willEnq = WireDefault(false.B)  // does S5 have any effective output
val stall   = v4 && willEnq && !outQ.io.enq.ready

io.in.ready := !stall
val fireIn  = io.in.valid && io.in.ready  // new data in

when(!stall) {
  v1 := fireIn; v2 := v1; v3 := v2; v4 := v3
}
 ```
The function of each stage will be explained in turn :
### S1
This stage converts the raw pixel stream into spatially aware structured data. Pixel coordinates (x, y) are derived from sof and eol, while circular line buffers provide access to pixels from the previous two rows. Vertical padding is applied at the top boundary, enabling reliable downstream 3×3 window construction in a fully streaming manner.
### S2
The S2Window module builds a streaming 3×3 RGB/YUV window using shift registers fed by the current pixel and two prior line buffers. Replicate padding handles image boundaries, while controlled flushing completes right and bottom edges. Valid windows are emitted with center coordinates via a Decoupled interface with backpressure support.
### S3
S3Latch is inserted between S2Window and S4a because S2 is a stateful sliding-window engine that cannot roll back. The latch provides a single-cycle stallable buffer that blocks backpressure immediately, preventing S2 from advancing and ensuring window data and coordinates remain correctly aligned under stalls.
### S4
This module precomputes and packages all edge-detection data required before the xBR2x blending stage. It extracts key pixels from the 3×3 window, computes YUV distance metrics and equality flags for edge direction and rule selection, and bundles the results with metadata for downstream use, reducing complexity and improving stability in the blending stage.
### S5
The S5Blend module performs the final xBR2x step by applying edge-directed blending to produce a 2×2 upscaled pixel block. It evaluates edge directions from the 3×3 window and precomputed metrics, selects the closest candidate colors, and blends them with fixed weights, using a buffered ready/valid interface to handle backpressure safely.

### Flow diagram
![Gemini_Generated_Image_g4ebdtg4ebdtg4eb-Photoroom](https://hackmd.io/_uploads/Bykqrt1Ubg.png)
**Invariant:** A valid window’s coordinates always travel with its window data across S1→S2→S3, even when the pipeline stalls. The unit test has verified its correctness.
## Enviroment Setup
1. install sbt and Scala on Linux
```shell
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 17-tem
sdk install scala
sdk install sbt
```
2.check the version : if all three commands display their versions correctly , it means the installation is complete.
```shell
java -version
scala -version
sbt --version   
```
3. Use the command-line parameter to pass the image path. Remember to replace the path with your own file location. Note: This program can only read raster images.
```scala
sbt -Dchiseltest.simulator=verilator -Din="input image path" -Dout="output image path" "runMain pixelart.PixelArtScale"
```
4.The scaled image will be output in the same folder as the input image, named input image + `_xbr2x.png`. The fixed output format is PNG.
```scala
[Info] Done! Scaled image saved to: /home/phlab/Pasted_xbr2x.png
```

Display progress allows you to see how much longer is needed when scaling.
Once it’s finished, you’ll see a message like:
```
[info] running pixelart.PixelArtScale 
[Info] Input image size: 48 x 21
[Info] Scale factor: 2x
[Info] Output image size: 96 x 42
[DRAIN] in=1008/1008 100.00%  out=1008/1008 100.00%  t=58.3s
[Info] Total blocks processed: 1008 / 1008
[Info] Done! Scaled image saved to: /home/phlab/Pasted_xbr2x.png
[success] Total time: 66 s (0:01:06.0), completed Jan 22, 2026, 3:02:49 PM
```

## Unit testing
### Neighborhood Pattern Extraction
A 3x3 window extractor was designed.
```
[info] S2WindowTest:
[info] S2Window
[info] - should initialize with valid=false
[info] - should accept pixels and build 3x3 window
[info] - should emit windows with correct A,B,C,D,E,F,G,H,I values
[info] - should handle stall correctly
[info] - should handle end-of-line and padding
[info] - should handle output ready/valid handshake
[info] Run completed in 3 seconds, 570 milliseconds.
[info] Total number of tests run: 6
[info] Suites: completed 1, aborted 0
[info] Tests: succeeded 6, failed 0, canceled 0, ignored 0, pending 0
[info] All tests passed.
[success] Total time: 8 s, completed Jan 19, 2026, 12:50:27 AM
```
* Running `sbt "testOnly pixelart.S2WindowTest" `confirms correct behavior on the test images through Verilator simulation.

For test, Define the test image as：
* H=3, W=4
* pixBits = 8
* center = (x-1, y-1)
```
row0: 1 2 3 4
row1: 5 6 7 8
row2: 9 A B C
```
![Screenshot from 2026-01-22 12-59-35](https://hackmd.io/_uploads/BJtSvIyLZl.png)
* For the 3×4 test image, the waveform at xc = 1, yc = 1 shows a correctly aligned 3×3 window centered at pixel E = 6. The top (A) and left-column (D, G) values differ from the raw image indices because the window is generated from a streaming pipeline with line buffers and padding logic; as a result, boundary pixels are replicated and delayed, causing the window to reflect buffered neighborhood data rather than a direct memory snapshot.
```
[info] Xbr2xPipelineTest:
[info] Xbr2xPipeline
[info] - should hold S3 debug window stable under backpressure stall
[info] Run completed in 4 seconds, 509 milliseconds.
[info] Total number of tests run: 1
[info] Suites: completed 1, aborted 0
[info] Tests: succeeded 1, failed 0, canceled 0, ignored 0, pending 0
[info] All tests passed.
[success] Total time: 9 s, completed Jan 22, 2026, 3:28:32 PM
```
* Running `sbt "testOnly pixelart.Xbr2xPipelineTest" `confirms correct behavior on the test images through Verilator simulation.

![Screenshot from 2026-01-22 15-33-13](https://hackmd.io/_uploads/Hysk4L1LZx.png)
* Timing diagram of the XBR2x pipeline under backpressure. When `io.in.ready = 0`, the pipeline enters a stall condition. During this period, the 3×3 neighborhood window signals (`dbg_A`–`dbg_I`) and the corresponding center coordinates (`dbg_xc`, `dbg_yc`) remain unchanged across multiple cycles, indicating that the S1 → S2 → S3 stages correctly hold their state under stall and prevent pixel misalignment. Once backpressure is released, the pipeline resumes normal operation and the window advances to the next pixel.

## Result
We compared the 2× upscaled output produced by our Chisel-based xBR pipeline against the reference GPU-xBR implementation on one representative test image. 

| Chisel 2xBR | GPU-2xBR |
|---|---|
|![Screenshot from 2026-01-22 19-22-08](https://hackmd.io/_uploads/HJMsOKkUbe.png)|![Screenshot from 2026-01-22 19-22-41](https://hackmd.io/_uploads/H1X2dt1Ube.png)|
### Pixel-difference heatmap
![Screenshot from 2026-01-22 19-36-47](https://hackmd.io/_uploads/Sy-lnFJLZe.png =50%x)
* A pixel-difference heatmap was generated by computing the absolute RGB difference between the hardware output and the GPU-xBR result. Most differences are localized near diagonal edges, while flat regions show identical results.

### Count of differing pixels 
```
Differing pixels with exact: 310 / 4032 (7.69%)
Differing pixels with tol: 175 / 4032 (4.34%)
```
* Using an exact pixel-wise comparison (RGB values must match exactly), 7.69% of output pixels differ. When allowing a small tolerance (per-channel absolute difference ≤ 2), the mismatch rate drops significantly, indicating that many differences are due to rounding in color mixing. 

A difference inspection indicates that mismatches are mainly concentrated around diagonal edges and corner cases, while flat/constant-color regions remain identical. This behavior is expected given our hardware-oriented simplifications: 
1. the pipeline uses a 3×3 neighborhood rather than GPU-xBR’s larger context, which can change edge classification in ambiguous patterns; 
2. the design applies deterministic pattern gating for INT2-style strengthening only when equality-pattern conditions are satisfied; and 
3. in cases where multiple corner rules could overlap, the hardware follows a fixed priority order to guarantee deterministic behavior under backpressure. 

Overall, the quantitative result shows that our Chisel design preserves the core visual characteristics of xBR while introducing small, explainable differences in ambiguous regions.


## Conclusion and Future work
This project presents a streaming, pipelined xBR-style pixel art upscaler implemented in Chisel. By combining neighborhood construction, edge detection, and rule-based blending, the design produces smoother edges and more natural transitions than nearest-neighbor upscaling while preserving the original pixel art style. Despite using a simplified 3×3 window that introduces minor differences from GPU-based xBR, the design retains the core visual characteristics of xBR with efficient hardware usage and real-time performance.

#### Future Work
1. Larger neighborhoods (3×3 → 5×5): Expanding the window size to improve diagonal continuity and edge stability, enhancing the detection of slanted lines and fine details so that upscaled images more accurately preserve the geometric features of the original pixel art.

2. Conditional pruning: Using low-cost checks (e.g., color equality or luminance thresholds) to quickly exclude flat regions, and applying full distance and direction evaluation only where edges are likely present, thereby reducing critical-path delay and overall computational load.

3. Higher scaling factors (3× / 4×): Extending the existing 2× block rules via hierarchical scaling (2× → 3×/4×), or directly defining subpixel layouts and blending weights for 3× and 4× upscaling to support higher-resolution pixel art requirements.

In summary, this project successfully maps the pixel-art-oriented perceptual algorithm xBR onto a hardware architecture, demonstrating a complete path from algorithmic understanding to hardware implementation, and laying a solid foundation for future scaling, performance optimization, and portable deployment.

## AI Usage
#### Tools Used
This project was completed with the assistance of **ChatGPT** and **GitHub Copilot**.

#### Application Scopes
This HackMD report was written by the author, with assistance from ChatGPT for English wording refinement and clarity improvement.
GitHub Copilot was used to assist with code completion, boilerplate generation, and syntax suggestions during programming. 

## Reference
* [Pixel-art scaling algorithms](https://en.wikipedia.org/wiki/Pixel-art_scaling_algorithms)
* [GPU-xBR](https://github.com/mattiadr/GPU-xBR)
* [Pixel-art scaling Accelerator in Chisel](https://hackmd.io/@sysprog/r1cybDhSye)
* [xBR algorithm tutorial](https://forums.libretro.com/t/xbr-algorithm-tutorial/123)
