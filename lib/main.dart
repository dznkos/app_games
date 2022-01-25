import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/screen/home/components/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    
    return ScreenUtilInit(
      builder: () => MaterialApp(
        builder: (context, widget){
          ScreenUtil.setContext(context);
          return HomeScreen();
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue[800],
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
