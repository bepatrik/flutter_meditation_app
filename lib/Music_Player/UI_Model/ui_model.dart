import 'package:flutter/cupertino.dart';

/*********************************************
 * TO MAKE UI
**********************************************/
class UIModelClass {
  @required
  String txt;
  @required
  String imgLink;

  UIModelClass({
    @required this.txt,
    @required this.imgLink,
  });
}

/*********************************************
 * LIST OF IMAGES
 * AND NAME
 * USED IN HOMESCREEN TO MAKE
 * CATEGORIES
**********************************************/

List<UIModelClass> uimodelclass = [
  UIModelClass(
    txt: 'Calm Music',
    imgLink: 'https://i1.sndcdn.com/artworks-000209052199-yv6xgp-t500x500.jpg',
  ),
  UIModelClass(
    txt: 'Fast Music',
    imgLink:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1gmuRBFhF_zonSS04Y1nLX1FBExE-yLVLhw&usqp=CAU',
  ),
  UIModelClass(
    txt: 'Nature Music',
    imgLink:
        'https://thumbs.dreamstime.com/z/music-nature-piano-keys-background-nature-60731433.jpg',
  ),
  UIModelClass(
    txt: 'Sleepy Music',
    imgLink: 'https://wallpapercave.com/wp/wp8317038.jpg',
  ),
  UIModelClass(
    txt: 'Romantic Music',
    imgLink: 'https://cdn.wallpapersafari.com/32/80/eqELlz.jpg',
  ),
];
