import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({ Key? key }) : super(key: key);

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
                height: 0.6.sh,
                child: Stack(
                  alignment: Alignment.center,
                  children: [  
                    //sombra imagen                
                    Positioned(
                      top: 60,
                      left: 0,
                      child: Opacity(
                        child: Image.asset("assets/images/battlefield.jpg",
                        height: 0.35.sh,
                        color: Colors.black), opacity: 0.5),
                    ),
                    ClipRect(
                      child: Image.asset("assets/images/battlefield.jpg",
                      height: 0.3.sh,)
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
                            Text('Battlefield 2042',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Text('Shooter',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              )),
                          ],
                        ),
                      ),
                    )
                    
                  ],
                ),
              ),
              
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