#-*- coding:utf-8 -*-
import cv2
import numpy as np

# 入力画像をグレースケールで読み込み
gray = cv2.imread(
    "C:/github/sample/python/opencv/filter2d/median/input.png", 0)

# 方法2
dst = cv2.medianBlur(gray, ksize=13)

# 結果を出力
cv2.imwrite("C:/github/sample/python/opencv/filter2d/median/output.png", dst)
