# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
from sklearn.neighbors import NearestNeighbors
import pandas as pd

def main():
    # CSVファイルの読み込み
    df_csv = pd.read_csv(
        "C:\github\sample\python\scikit\kmeans\ecg_dataset.csv")

    # 
    train_data = df_csv.iloc[1:3000, 1]
    test_data = df_csv.iloc[3001:6000, 1]
    width = 100
    nk = 5

    train = embed(train_data, width)
    test = embed(test_data, width)

    neigh = NearestNeighbors(n_neighbors=nk)
    neigh.fit(train)
    d = neigh.kneighbors(test)[0]  # [1]
    #d = d.T
    print(d)
    # 距離をmax1にするデータ整形
    mx = np.max(d)
    d = d / mx

    # プロット
    test_for_plot = train_data

 
    # グラフ表示
    fig = plt.figure(figsize=(10.0, 8.0))
    plt.rcParams['font.family'] = 'Times New Roman'
    plt.rcParams['font.size'] = 12

    # 時間信号（元）
    plt.subplot(221)
    plt.plot(train_data, label='Training')
    plt.xlabel("Amplitude", fontsize=12)
    plt.ylabel("N", fontsize=12)
    plt.grid()
    leg = plt.legend(loc=1, fontsize=15)
    leg.get_frame().set_alpha(1)

    # 周波数信号(元)
    plt.subplot(222)
    plt.plot(d, label='d')
    plt.xlabel("Amplitude", fontsize=12)
    plt.ylabel("N", fontsize=12)
    plt.grid()
    leg = plt.legend(loc=1, fontsize=15)
    leg.get_frame().set_alpha(1)

    # 時間信号(処理後)
    plt.subplot(223)
    plt.plot(test_data, label='Test')
    plt.xlabel("Time", fontsize=12)
    plt.ylabel("Signal", fontsize=12)
    plt.grid()
    leg = plt.legend(loc=1, fontsize=15)
    leg.get_frame().set_alpha(1)

    # 周波数信号(処理後)
    plt.subplot(224)

    plt.savefig('C:/github/sample/python/scikit/kmeans/sample1.png')




def embed(lst, dim):
    emb = np.empty((0, dim), float)
    for i in range(lst.size - dim + 1):
        tmp = np.array(lst[i:i+dim])[::-1].reshape((1, -1))
        emb = np.append(emb, tmp, axis=0)
    return emb


if __name__ == '__main__':
    main()
