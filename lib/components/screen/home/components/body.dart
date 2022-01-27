import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<String> imgList = [
  'https://stealthoptional.com/wp-content/uploads/2021/08/metaimage1-1920x1080-abb60090deaf.png',
  'https://cdn.vox-cdn.com/thumbor/4xRw8n5c11ZzDH1ZlTYe-Ua2rNE=/0x0:1920x1080/1200x0/filters:focal(0x0:1920x1080):no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/11624169/rocket_out_of_the_portal.png',
  'https://overwatch2-static.playoverwatch.com/a38a816d1c18852caa3de8dcee694643f1555d1d/static/images/share.jpg',
  'https://i.ytimg.com/vi/aLUGHQq2aek/maxresdefault.jpg',
  'https://imgs.callofduty.com/content/dam/atvi/activision/atvi-touchui/blog/callofduty/feature/codm/COD-LAUNCH-TOUT.jpg',
];

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
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
                      child: Text(
                        "Hi Tony",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.black,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              height: 35,
                              width: 35,
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.black,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              height: 35,
                              width: 35,
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  children: [
                    Container(
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
                            trailing: new IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  print('Cancel');
                                }),
                          ),
                        ),
                      ),
                    ),
                    //CARD Install
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      width: 0.9.sw,
                      //height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFF1B1D2C),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Try for free',
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Dragon saga',
                              style: Theme.of(context).textTheme.headline3
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ButtonInstall()
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      width: double.infinity,
                      //color: Colors.red,
                      child: Text(
                        'Your games',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/dragon.png",
                  height: 300,
                )
              ],
            ),

            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  height: 160),
              items: imgList
                  .map((item) => Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(item).image)),
                      ))
                  .toList(),
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              width: double.infinity,
              //color: Colors.red,
              child: Text(
                'Top this month',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),

            // Top Card
            Column(
              children: [
                Container(
                    height: 90,
                    //width: 400,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF1B1D2C),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/images/1.jpg',
                                height: 90,
                              )),
                        ),
                        Container(
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dead space 2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
                                    ),
                                    Text('Space',
                                        style: TextStyle(
                                          color: Colors.white54,
                                        )),
                                  ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/star.svg',
                                    color: Colors.yellow[700],
                                    height: 17,
                                  ),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/download.svg',
                                    color: Colors.blue[400],
                                    height: 17,
                                  ),
                                  Text(
                                    '10.1k',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        //button card
                        ButtonInstall()
                      ],
                    )),
              
              // Top Card 2
              Container(
                height: 90,
                //width: 400,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF1B1D2C),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            'assets/images/battle.jpg',
                            height: 90,
                          )),
                    ),
                    Container(
                      width: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Battlefield 2042',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ),
                                Text('War',
                                    style: TextStyle(
                                      color: Colors.white54,
                                    )),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star.svg',
                                color: Colors.yellow[700],
                                height: 17,
                              ),
                              Text(
                                '4.7',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SvgPicture.asset(
                                'assets/icons/download.svg',
                                color: Colors.blue[400],
                                height: 17,
                              ),
                              Text(
                                '25.1k',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    //button card
                    ButtonInstall()
                  ],
                ))
              ],
            ),
            
          ],
        ),
      ],
    ));
  }
}

Widget ButtonInstall() {
  return Container(
    width: 90,
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
          onTap: () {},
          child: Center(
              child: Text(
            'Install',
            style: TextStyle(color: Colors.white),
          )),
        )),
  );
}
