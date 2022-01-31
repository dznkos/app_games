import 'package:flutter/material.dart';
import 'package:games_app/components/screen/games/game_body.dart';

class GameListPage extends StatelessWidget {
  const GameListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    LinearGradient _gradient = 
      LinearGradient(
        colors: [
          Color(0xFF07478D), 
          Color(0xFF02182F),
          Color(0xFF000001)
        ],
       begin: const FractionalOffset(0.0, 0.3),
       end: const FractionalOffset(0.0, 0.8),
       stops: [0.0,0.5,1.0],
       tileMode: TileMode.clamp
   );

    return Scaffold(      
      body: Container(
        decoration: BoxDecoration(
          gradient: _gradient
        ),
        child: GamesBody()),
    );  
    
  }
}