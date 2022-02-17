import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Music_Player/Songs_Widgets/audio_screen.dart';
import 'package:flutter_meditation_app/Music_Player/UI_Model/ui_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  ///final id
  static final id = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///For bottom navigation bar
  int activeTab = 0;

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
          PopupMenuButton(itemBuilder: (_) {
            return [
              PopupMenuItem(
                onTap: () {
                  print('LogOut');
                },
                child: Text('LogOut'),
              ),
            ];
          }),
        ],
      ),
      bottomNavigationBar: getBottomNavigationBar(),
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
                        children: uimodelclass
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  print(e.txt);
                                  Navigator.pushNamed(
                                    context,
                                    AudioPlayerScreen.id,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15, top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          e.imgLink,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: 250,
                                    width: 250,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            e.txt,
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
                            )
                            .toList()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getBottomNavigationBar() {
    List items = [
      Icons.settings,
      Icons.home,
      Icons.search,
      Icons.person,
    ];
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            items.length,
            (index) {
              return IconButton(
                icon: Icon(
                  items[index],
                  color: activeTab == index ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(
                    () {
                      activeTab = index;
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
/*********************************************
   List<Categories> categoryFiltering = songsCategories
        .where(
          (e) => e.categoryName == widget.categoryFile,
        )
        .toList();
**********************************************/
