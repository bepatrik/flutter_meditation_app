import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/Main_Screens/displaysongs.dart';
import 'package:flutter_meditation_app/Models/songs_model.dart';

class CategoryScreen extends StatelessWidget {
  static final id = '/CategoryScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///GridView
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: audios.length,
        itemBuilder: (BuildContext context, int index) {
          ///Inkwell of container
          return InkWell(
            onTap: () {
              ///checking printing or not
              print(audios[index].category);
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                ///Taking Data to Display Screen
                return DisplayScreen(
                  categoryFile: audios[index].category,
                );
              }));
            },

            ///Container
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    ///Categories of Songs
                    '${audios[index].category}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
