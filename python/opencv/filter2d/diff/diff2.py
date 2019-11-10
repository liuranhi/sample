#-*- coding:utf-8 -*-
import cv2
import numpy as np
    
# 入力画像を読み込み
img = cv2.imread("C:/github/sample/python/opencv/filter2d/diff/input.png")

# グレースケール変換
gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
    
# カーネル（縦方向の輪郭検出用）
kernel = np.array([[0, 0, 0],
                   [-1, 0, 1],
                   [0, 0, 0]])
    
# 方法2       
dst = cv2.filter2D(gray, cv2.CV_64F, kernel)

# 結果を出力
cv2.imwrite("C:/github/sample/python/opencv/filter2d/diff/output.png", dst)