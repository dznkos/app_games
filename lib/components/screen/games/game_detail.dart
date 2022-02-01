import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_app/components/models/game.dart';
import 'package:get/get.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({ Key? key, required this.itemGame,}) : super(key: key);


  final Game itemGame;

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
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 0.55.sh,                
                margin: EdgeInsets.only(bottom: 5),
                child: Stack(
                  alignment: Alignment.center,
                  children: [  
                    //sombra imagen                
                    Positioned(
                      top: 30,
                      left: 0,
                      child: Opacity(
                        child: Image.network(itemGame.thumbnail ,
                        height: 0.35.sh,
                        color: Colors.black), opacity: 0.5),
                    ),
                    Hero(
                      tag: itemGame.id,
                      child: ClipRect(
                        child: Image.network(itemGame.thumbnail,
                        height: 0.3.sh,)
                      ),
                    ),
                    ClipPath(
                      clipper: CustomTriangleClipper(),
                      child: Container(
                        //height: 285,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Color(0xFF000000),
                                ],
                              begin: const FractionalOffset(0.0, 0.1),
                              end: const FractionalOffset(0.0, 0.9),
                              stops: [0.5,0.9],
                              tileMode: TileMode.clamp
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        //color: Colors.orange.withOpacity(0.1),
                        height: 100,
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/star.svg',
                                        color: Colors.yellow[700],
                                        height: 15,
                                      ),
                                      Text(
                                        '4.8',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/download.svg',
                                        color: Colors.blue[400],
                                        height: 15,
                                      ),
                                      Text(
                                        '10.1k',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                            ),
                            Text(itemGame.title,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Text(itemGame.genre.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              )),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        width: 80,
                        child: Text('Year: ${itemGame.releaseDate.year}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white
                        ),),
                      )
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 25),
                child: SizedBox(
                  width: 0.9.sw,
                  child: Text.rich(
                    TextSpan(
                      text: '${itemGame.shortDescription.toString()}'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      )
                    )
                  ),                
              ),

              Container(
                //color: Colors.red,
                width: 380,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: 
                  [                    
                    Stack(
                      //alignment: Alignment.centerRight,
                      children: [                    
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 60,
                              width: 300,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF1B1D2C),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Text('Online \nplayers', 
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white),
                                    ),
                            ),                            
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                                margin: EdgeInsets.only(right: 20),
                                alignment: Alignment.center,
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xFF353444),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Text('101 k', 
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white),
                                      ),
                          ),
                        ),  
                                          
                      ]
                    ),
                    Positioned(
                      left: 0,
                      child: Image.asset("assets/images/axe.jpg",
                      height: 100,)),
                  ]
                ),
              ),

              Container(
                //color: Colors.red,
                width: 380,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: 
                  [                    
                    Stack(
                      //alignment: Alignment.centerRight,
                      children: [                    
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 60,
                              width: 300,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF1B1D2C),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Text('Tournaments \naward', 
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white),
                                    ),
                            ),                            
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                                margin: EdgeInsets.only(right: 20),
                                alignment: Alignment.center,
                                height: 60,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xFF353444),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Text('300 pt', 
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white),
                                      ),
                          ),
                        ),  
                                          
                      ]
                    ),
                    Positioned(
                      left: 0,
                      child: Image.asset("assets/images/stars.jpg",
                      height: 100,)),
                  ]
                ),
              ),
              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Color(0xFF249cd8)),
                    color: Color(0xFF1B1D2C),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF6394BD), offset: Offset(2, 2), blurRadius: 10)
                    ]),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                      },
                      child: Center(
                          child: Text(
                        'Install',
                        style: TextStyle(color: Colors.white),
                      )),
                    )),
              )

              
            ],
          )
        ),
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0 , size.height - size.height / 5);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - size.height / 5);
    path.lineTo(size.width, 0);        
    // path.lineTo(size.width / 2, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}