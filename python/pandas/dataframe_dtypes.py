# -*- coding: utf-8 -*-
import pandas as pd

def main():
    # データフレームの初期化
    df = pd.DataFrame({
    '名前' :['西住みほ', '秋山優花里', '武部沙織'],
    '役割' : ['車長', '装填手', '通信手'],
    '身長' : [158, 157, 157]
    })
    # 表示
    print(df)
    print(df.dtypes)

if __name__ == '__main__':
    main()
