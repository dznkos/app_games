import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_app/components/screen/games/game_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/screen/games/game_detail.dart';
import 'components/screen/home/components/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    
    return ScreenUtilInit(
      builder: () => GetMaterialApp(        
        debugShowCheckedModeBanner: false,
        builder: (context, widget){
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: GoogleFonts.prozaLibre(
              textStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
            )
            ),
            headline2: GoogleFonts.prozaLibre(
              textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
            )
            ),
            headline3: GoogleFonts.prozaLibre(
              textStyle: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.w800
            )
            ) 
          ),
          scaffoldBackgroundColor: Color(0xFF044386),
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/gamelist', page: () => const GameListPage()),
        // GetPage(
        //     name: '/page-four/:data',
        //     page: () => const PageFour()) // Dynamic route
      ],
      ),
      designSize: const Size(360, 640),
    );
  }
}
