import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/audio_screen.dart';
import 'package:flutter_meditation_app/Music_Player/UI_Model/dummy_ui_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            ///Main Container
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/bg.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Love And Accept YourSelf',
                        style: GoogleFonts.lateef(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      Text(
                        'Relax Your Mind 🧠',
                        style: GoogleFonts.lateef(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w300,
                        )),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 185,
                          child: Image.asset(
                            'images/girl.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///SizedBox
                SizedBox(height: 10),

                ///Text Categories & See All
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Center(
                            child: Text(
                              'Categories',
                              style: GoogleFonts.lateef(
                                textStyle: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Center(
                          child: Text(
                            'See all',
                            style: GoogleFonts.lateef(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),

                ///Music Categories
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          uimodelclass.length,
                          (i) => InkWell(
                            onTap: () {
                              print(uimodelclass[i].txt);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return AudioPlayerScreen();
                              }));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      uimodelclass[i].imgLink,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 250,
                                width: 250,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        uimodelclass[i].txt,
                                        style: GoogleFonts.lateef(
                                          textStyle: TextStyle(
                                            fontSize: 35.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*********************************************
  Filtering
**********************************************/
/*********************************************
   List<Categories> categoryFiltering = songsCategories
        .where(
          (e) => e.categoryName == widget.categoryFile,
        )
        .toList();
**********************************************/