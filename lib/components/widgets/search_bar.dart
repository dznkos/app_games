import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.95.sw,
      height: 80,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: new Card(
          color: Colors.transparent,
          child: ListTile(
            tileColor: Colors.transparent,
            leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {
                print('search');
              },
              color: Colors.white54,
            ),
            title: Material(
              color: Colors.transparent,
              child: TextField(
                style: TextStyle(color: Colors.white),
                //autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Search library...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none),
              ),
            ),
            // trailing: new IconButton(
            //     splashColor: Colors.transparent,
            //     highlightColor: Colors.transparent,
            //     icon: Icon(
            //       Icons.cancel,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       print('Cancel');
            //     }),
          ),
        ),
      ),
    );
  }
}