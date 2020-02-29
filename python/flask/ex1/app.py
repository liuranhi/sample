from flask import Flask, render_template, url_for, request, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import os
import numpy as np
import pandas as pd
from electrical.short_test import ShortTest

app = Flask(__name__)



def calc(E_target=100,
         I_target=100,
         power_num=4,
         E1_max=30.0,
         E1_min=20.0,
         Rm=5,
         R_test = 0,
         R_exts=[100, 200],
         R_line=5):
    print("E_target:", E_target)
    print("E_target:", I_target)
    print("power_num:", power_num)
    print("E1_max:", E1_max)
    print("E1_min:", E1_min)
    print("Rm:", Rm)
    print("E_target:", I_target)
    print("R_test:", R_test)
    print("R_exts:", R_exts)
    print("R_line:", R_line)
    st = ShortTest()
    # 一覧表を作成・保存
    st.make_table(power_num, Rm, R_test, R_exts, R_line, E1_max, E1_min)

    # 試験条件を満たす電源・外部短絡抵抗の組合せを探索
    st.search_pattern(I_target, E_target)

    # 結果表示
    st.show_result()
    # 自身の名称を app という名前でインスタンス化する

    return st


# index にアクセスされた場合の処理
@app.route('/')
def index():
    title = "ようこそ"
    message = "試験条件を入力してください"
    # messageとtitleをindex.htmlに変数展開
    return render_template('index.html',
                           message=message, title=title)

# /post にアクセスされた場合の処理
@app.route('/post', methods=['GET', 'POST'])
def post():
    title = "いらっしゃい"
    if request.method == 'POST':
        # リクエストフォームから「名前」を取得
        
        input_datas = request.form.getlist('input')
        target_voltage = float(input_datas[0])
        target_current = float(input_datas[1])
        power_num = int(input_datas[2])
        power_max_voltage = float(input_datas[3])
        power_min_voltage = float(input_datas[4])
        power_resistance = float(input_datas[5])
        test_resistance = float(input_datas[6])
        resistances = input_datas[7].split(',')
        resistances = list(map(int, resistances))
        line_resistance = float(input_datas[8])

        #print(float(resistances))

        st = calc(target_voltage,
             target_current,
             power_num,
             power_max_voltage,
             power_min_voltage,
             power_resistance,
             test_resistance,
             resistances,
             line_resistance)

        #calc()
        # nameとtitleをindex.htmlに変数展開
        return render_template('index.html',
                               voltage=target_current,
                               result_columns=st.df_result.columns.tolist(),
                               result_values=st.df_result.values.tolist(),
                               result_index=st.df_result.index.tolist(),
                               ierror_min_values=st.ss_ierror_min.values.tolist(),
                               ierror_min_index=st.ss_ierror_min.index.tolist(),
                               verror_min_values=st.ss_ierror_min.values.tolist(),
                               verror_min_index=st.ss_ierror_min.index.tolist(),
                               title=title)
    else:
        # エラーなどでリダイレクトしたい場合
        return redirect(url_for('index'))


if __name__ == "__main__":
    port = int(os.getenv("PORT", 5000))
    app.debug = True  # デバッグモード有効化
    app.run(host="0.0.0.0", port=port)
