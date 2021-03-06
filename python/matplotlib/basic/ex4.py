# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt

x1 = [1, 2, 3]
y1 = [4, 5, 6]

x2 = [1.3, 2.3, 3.3]
y2 = [2, 4, 1]

label_x = ['Result1', 'Result2', 'Result3']

# 1つ目の棒グラフ
plt.bar(x1, y1, color='b', width=0.3, label='Data1', align="center")

# 2つ目の棒グラフ
plt.bar(x2, y2, color='g', width=0.3, label='Data2', align="center")

# 凡例
plt.legend(loc=2)

# X軸の目盛りを置換
plt.xticks([1.15, 2.15, 3.15], label_x)
plt.show()
