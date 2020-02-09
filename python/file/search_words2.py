# -*- coding: utf-8 -*-
import glob
import os

# 相対パス -> 絶対パス
def listup_files(path):
    yield [os.path.abspath(p) for p in glob.glob(path)]


def get_filepath(dir_path):
    file_abs_paths = []

    for dir_path, sbdir_paths, sbfile_paths in os.walk(dir_path):
        for filepath in sbfile_paths:
            file_abs_paths.append(dir_path + '\\' + filepath)

    return file_abs_paths

# キーワード検索
def search_words(filepath):
    print(filepath + "をロードします")
    # ファイルの中身を1行ずつ読み込んでリストに格納
    with open(filepath, mode='r', newline='', encoding='utf-8') as f_in:
        lines = [line for line in f_in]

    # リストから1行文ずつデータを取り出し、検索ワードが含まれているかチェック
    for i in lines:
        if keyword in i:
            print(str(lines.index(i) + 1) + "行目でヒットしました")
            
# 検索ワード
keyword = "test"

dir_path = "C:/github/sample/python/file"


# パス内の全てのファイル・フォルダ名を取得
file_list = get_filepath(dir_path)

#print(file_list)
for filepath in file_list:
    if os.path.isdir(filepath) == False:
        search_words(filepath)
        

      
