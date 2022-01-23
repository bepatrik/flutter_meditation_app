import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Dummy_Music_Testing/Custom/custom_category_container.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy HomePage'),
        centerTitle: true,
      ),
      body: Container(
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

              ///Categories
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Popular',
                          style: GoogleFonts.lateef(
                              textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text(
                          'See all',
                          style: GoogleFonts.lateef(
                              textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          )),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomCategoryContainer(
                          firstText: 'Calm Music',
                        ),
                        CustomCategoryContainer(
                          firstText: 'Fast Music',
                        ),
                        CustomCategoryContainer(
                          firstText: 'Nature Music',
                        ),
                        CustomCategoryContainer(
                          firstText: 'Sleepy Music',
                        ),
                        CustomCategoryContainer(
                          firstText: 'Romantic Music',
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
