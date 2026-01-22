import cv2
import numpy as np

hw  = cv2.imread("/home/phlab/Pasted_xbr2x.png").astype(np.int16)
gpu = cv2.imread("/home/phlab/GPU-xBR/GPUv1/Pasted_output.png").astype(np.int16)

diff = np.abs(hw - gpu)          # per-channel difference
heat = diff.max(axis=2)          # take max over RGB

heat_norm = np.clip(heat * 8, 0, 255).astype(np.uint8)
cv2.imwrite("diff_heatmap.png", heat_norm)

# exact
diff_exact = np.any(hw != gpu, axis=2)
num_diff   = diff_exact.sum()
total      = diff_exact.size
print(f"Differing pixels with exact: {num_diff} / {total} ({num_diff/total*100:.2f}%)")

# tolerance
tol = 2  
diff_tol = np.any(np.abs(hw - gpu) > tol, axis=2)
num_diff   = diff_tol.sum()
total      = diff_tol.size
print(f"Differing pixels with tol: {num_diff} / {total} ({num_diff/total*100:.2f}%)")

