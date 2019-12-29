import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  ScrollPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  int _currentIndex = 0; // currentIndexにデフォルト値を与えないとコンパイルエラー
  final ScrollController controller = ScrollController();
  var listItem = ["Savar", "Archer", "Lancer", "Rider", "Caster", "Assassin", "Berserker", "Ruler", "Avenger", "Alterego", "Mooncancer"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HomePage'),
      ),
      body: ListView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.done),
                title: Text(listItem[index]),
                subtitle: Text('$index'),
                onTap: () { /* react to the tile being tapped */ },
              )
          );
          },
        itemCount: listItem.length,
      ),

      // ② 下部ナビゲーションバーでページ遷移
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: Text("ホーム")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              title: Text("設定")
          ),
        ],
        // ナビゲーションバーのいずれかのボタンがタップされたら
        onTap: (int index) {
          print(index); // デバッグ用に出力（タップされたボタンによって数値がかわる）
          if(index == 0){
            controller.animateTo(
              30.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
          else if(index == 1){
            controller.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        },
      ),
    );
  }
}