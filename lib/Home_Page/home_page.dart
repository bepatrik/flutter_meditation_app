import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Music_Player/UI_Model/ui_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  ///final id
  static final id = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ///final size
    final Size s = MediaQuery.of(context).size;

    ///Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                onTap: () {
                  print('LogOut');
                },
                child: Text('LogOut'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        height: s.height,
        width: s.width,
        child: SingleChildScrollView(
          ///Main Container
          child: Column(
            children: [
              Container(
                height: s.height * 0.49,
                width: s.width,
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
                      'Love & Accept Yourself',
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
                      child: Image.asset(
                        'images/girl.png',
                        fit: BoxFit.cover,
                        height: 185,
                      ),
                    ),
                  ],
                ),
              ),

              ///Text Categories & See All
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
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
                    padding: EdgeInsets.only(right: 15, top: 10),
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
                ],
              ),

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
                            print(
                              uimodelclass[i].txt,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
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
                  ),
                ],
              )
            ],
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
////////////////////////////////////////////////////////
  ///List.Generate()
  Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        uimodelclass.length,
                        (i) => InkWell(
                          onTap: () {
                            print(
                              uimodelclass[i].txt,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
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
                  ),
                ],
              )
**********************************************/
