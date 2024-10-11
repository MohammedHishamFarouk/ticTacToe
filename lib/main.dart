import 'package:flutter/material.dart';
import 'package:tictactoe/container_widget.dart';
import 'package:tictactoe/game_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<Widget>tiles = [];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('TicTacToe',style: TextStyle(fontSize: 26),),
          centerTitle: true,
        ),
        body: Center(
          child: Wrap(
             children:_getContainerTiles(tiles),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () => _resetgame(),
          child:const Icon(Icons.refresh),
        ),
      ),
    );
  }

  void _resetgame(){
    setState(() {});
    GameVar.gameTiles.replaceRange(0, 8, ['','','','','','','','','']);
    GameVar.endGame = false;
  }
}

List<Widget> _getContainerTiles(List<Widget>tiles){
  for(int i = 0;i<9;i++){
    tiles.add(ContainerTile(tileNum: i,));
  }
  return tiles;
}

