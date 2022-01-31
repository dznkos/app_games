import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_app/components/models/game.dart';
import 'package:games_app/components/widgets/search_bar.dart';

import 'package:http/http.dart' as http;

final List<String> imgList = [
  'https://image.api.playstation.com/vulcan/img/rnd/202106/0806/7KJILbdp9AEmmrELwJCMJqc2.png',
  'https://static-cdn.jtvnw.net/ttv-boxart/65876_IGDB-285x380.jpg',
  'https://store.ubi.com/on/demandware.static/-/Sites-masterCatalog/default/dw96e74d63/images/large/56c494ad88a7e300458b4d5a.jpg',
  'https://cdn1.epicgames.com/offer/52f57f57120c440fad9bfa0e6c279317/EGS_Battlefield2042_DICE_S2_1200x1600-331f59b6877d2bf2194943fcf7a68048_1200x1600-331f59b6877d2bf2194943fcf7a68048',
  'https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/dead-cells-alexis-yessy.jpg',
  'https://pcgamedeal.com/wp-content/uploads/2020/01/the-forest-cover-mini.jpg',
  'https://imgs.callofduty.com/content/dam/atvi/activision/atvi-touchui/blog/callofduty/feature/codm/COD-LAUNCH-TOUT.jpg',
  'https://www.nintendo.com//content/dam/noa/es_LA/games/switch/s/super-smash-bros-ultimate-switch/super-smash-bros-ultimate-switch-hero.jpg',
  'https://cdn2.unrealengine.com/keyart-1920x1080-099668412.jpg',
  'https://www.gamingcoffee.com/wp-content/uploads/2020/02/ge-port.jpg',
  'https://cloudfront-us-east-1.images.arcpublishing.com/gruporepublica/IU4CEHK2GBG4VCHHVSAC7OBXDY.jpg',
  'https://www.financialexpress.com/wp-content/uploads/2020/05/gta-v-660-620x400.png',
  'https://avatars.mds.yandex.net/get-games/1892995/2a0000017c3bcb6965a2d456ba56b80f90e9/pjpg526x314',
  'https://i.scdn.co/image/ab67616d0000b273a99b56a3479110edd815b6fe',
  'https://thumbnails.pcgamingwiki.com/d/de/Day_of_Dragons_cover.jpg/300px-Day_of_Dragons_cover.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgKKgfv4V4itXJ1Ujw3nkc44-xo1R9YcLaXKlBPOLK55-IiNb9LszPZShs9tQjPTMg3fg&usqp=CAU'
];

class GamesBody extends StatefulWidget {
  const GamesBody({ Key? key }) : super(key: key);

  @override
  State<GamesBody> createState() => _GamesBodyState();
}

class _GamesBodyState extends State<GamesBody> {

  //Future<List<Game>> _listadoGames;
  late Future<List<Game>> _listGame;

  Future<List<Game>> _getGames() async {
    final response = await http.get(Uri.parse("https://www.freetogame.com/api/games"),
            headers: {
              "x-rapidapi-host": "free-to-play-games-database.p.rapidapi.com",
              "x-rapidapi-key": "eda27b0830mshaf301834f283c80p1151bfjsn813331d7607a"
            }
          );

          List<Game> games=[];

          if (response.statusCode == 200) {
            
            String body = utf8.decode( response.bodyBytes );

            final jsonData = jsonDecode(body);

            //print(jsonData[0]);
             for ( var item in jsonData) {
              //  print('dato id');
              //  print(item["id"]);
              //  if (item["id"] == 10) {
              //    break;
              //  }              
               games.add(Game(item["title"], item["thumbnail"]));
             }
             //print(listGame[0].url);

            return games;

          }else{
            throw Exception("Fallo en consumir api");
          }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listGame = _getGames();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomBar(),
                SearchBar(),
                FutureBuilder(
                  future: _listGame,
                  builder: (context, snapshot) {
                    
                    if (snapshot.hasData) {
                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: _listG(snapshot.data as List<Game>)
                        ,
                      );                      
                    } else if ( snapshot.hasError){
                      print(snapshot.error);
                      return Text('Error');
                    }

                    return Center(
                        child: CircularProgressIndicator(),
                      );

                  },
                )
                // Wrap(
                //   spacing: 10,
                //   runSpacing: 10,
                //   alignment: WrapAlignment.start,
                //   crossAxisAlignment: WrapCrossAlignment.center,
                //   children: List.generate(imgList.length, (index) {
                //     return Container(
                //       width: 0.42.sw,
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //         child: Image(
                //                 image: NetworkImage(imgList[index]),
                //                 loadingBuilder: (
                //                   BuildContext context,
                //                   Widget wiget,
                //                   ImageChunkEvent? loadingProgress){
                //                     if (loadingProgress == null) return wiget;
                //                       return Center(
                //                         child: CircularProgressIndicator(
                //                           value: loadingProgress.expectedTotalBytes != null
                //                           ? loadingProgress.cumulativeBytesLoaded /
                //                             loadingProgress.expectedTotalBytes!
                //                           : null,
                //                         ),
                //                       );
                //                 },
                //         ),
                //       ),
                //     );
                //   })
                // ),
                
              ],
            ),
          ),
          
        ],
      )
    );
  }
}

List<Widget> _listG(List<Game> data) {

  List<Widget> games = [];

  for (var item in data) {

    games.add(
      Container(
        width: 0.42.sw,
        child: GestureDetector(
          onTap: (){
            print('game tap');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: 
            // Image(                  
                    // image: 
                    CachedNetworkImage(
                        imageUrl: item.url.toString(),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
              //             Image.network( item.url.toString(),
              //             errorBuilder:
              //               (BuildContext context, 
              //               Object exception, 
              //                 StackTrace? stackTrace) { 
              //               print(item.url.toString());             
              //               return Container();
              //             },
              // ),
                    // loadingBuilder: (
                    //   BuildContext context,
                    //   Widget wiget,
                    //   ImageChunkEvent? loadingProgress){
                    //     if (loadingProgress == null) return wiget;
                    //       return Center(
                    //         child: CircularProgressIndicator(
                    //           value: loadingProgress.expectedTotalBytes != null
                    //           ? loadingProgress.cumulativeBytesLoaded /
                    //             loadingProgress.expectedTotalBytes!
                    //           : null,
                    //         ),
                    //       );
                    // },
           
          ),
        ),
      )
    );
  }

  return games;

}

class CustomBar extends StatelessWidget {
  const CustomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 0.1.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){},
                splashColor: Colors.black,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.arrow_back_ios, color: Colors.white,))
                )
              ),
          ),
          Text('Game List',style: TextStyle(color: Colors.white),),
           ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){},
                splashColor: Colors.black,
                child: SizedBox(
                  width: 30,
                  height: 30,
            child: Icon(Icons.menu,color: Colors.white, size: 30,))))
            ),
        ],
      ),
    );
  }
}