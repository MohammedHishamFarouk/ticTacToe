import 'package:flutter/material.dart';
import 'game_variables.dart';

class ContainerTile extends StatefulWidget{
  const ContainerTile({super.key, required this.tileNum});
  final int tileNum;
  // final bool x = true;
  @override
  State<ContainerTile> createState() => _ContainerTileState();
}

class _ContainerTileState extends State<ContainerTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: ()=>GameVar.endGame?null:_ticTacSwitchCase(),
        child: Container(
          width: MediaQuery.of(context).size.width / 3.9,
          height: MediaQuery.of(context).size.height/6.5,
          color: Colors.blue,
          child: Center(
            child: Text(GameVar.gameTiles[widget.tileNum],
            style:const TextStyle(fontSize: 36),
           ),
          ),
        ),
      ),
    );
  }

  void _ticTacSwitchCase(){
    setState(() {});
    if(GameVar.x && GameVar.gameTiles[widget.tileNum] == ''){
      GameVar.gameTiles.removeAt(widget.tileNum);
      GameVar.gameTiles.insert(widget.tileNum, 'X');
      GameVar.x = false;
    }else if(GameVar.x == false && GameVar.gameTiles[widget.tileNum] == ''){
      GameVar.gameTiles.removeAt(widget.tileNum);
      GameVar.gameTiles.insert(widget.tileNum, 'O');
      GameVar.x = true;
    }
    _check();
  }

  void _check() {
    for (var e in GameVar.winCombin) {
      if (GameVar.gameTiles[e[0]] == GameVar.gameTiles[e[1]] &&
          GameVar.gameTiles[e[1]] == GameVar.gameTiles[e[2]]) {
        if (GameVar.gameTiles[e[0]] != '') {
          GameVar.endGame = true;
        }
      }
    }
  }
}
