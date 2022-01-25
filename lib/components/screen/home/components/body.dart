import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,),
            //color:Colors.red,
            height: 0.1.sh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/shelby.jpg"),
                ),
                Expanded(                  
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Hi Tony", style: TextStyle(fontSize: 18, color: Colors.white),),
                  ),
                ),


                Row(
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                          child: InkWell(
                            onTap: (){},
                            splashColor: Colors.black,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              height: 35,
                              width: 35,
                              child: Icon(Icons.settings, color: Colors.white,size: 26,),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                          child: InkWell(
                            onTap: (){},
                            splashColor: Colors.black,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              height: 35,
                              width: 35,
                              child: Icon(Icons.menu, color: Colors.white,size: 26,),
                            ),
                        ),
                      ),
                    ),
                  ],
                ), 
              ],
            ),
          ),

          Container(
            width: 0.95.sw,
            height: 0.12.sh,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: new Card(
                color: Colors.transparent,
                child: ListTile(
                  tileColor: Colors.transparent,
                  leading: IconButton(
                            splashColor: Colors.transparent ,
                            highlightColor: Colors.transparent,
                            icon: Icon(Icons.search, size: 30,), 
                            onPressed: (){
                              print('search');
                            }, 
                            color: Colors.white,),
                  title: TextField(                    
                    decoration: InputDecoration(                      
                      hintText: 'Search library...',
                      hintStyle: TextStyle(color: Colors.white ),
                      border: InputBorder.none
                    ),
                    
                  ),
                  trailing: new IconButton(
                      splashColor: Colors.transparent ,
                      highlightColor: Colors.transparent,
                      icon: Icon(Icons.cancel,
                      color: Colors.white,), 
                      onPressed: (){
                        print('Cancel');
                      }
                  ),
                ),),
            ),


          )


        ],
      )
    );
  }
}