// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*********************************************
 * IMAGE IS FROM NETWORK
 * FOR BACKGROUND IMAGE LOGIN
**********************************************/
String bgLogInImgPage =
    'https://files.structurae.net/files/photos/5256/2015-06-11/dsc07246.jpg';

/*********************************************
 * IMAGE IS FROM NETWORK
 * FOR BACKGROUND IMAGE SIGNUP
**********************************************/
String bgSingUpImgPage =
    'https://media.istockphoto.com/photos/highrise-buildings-and-blue-sky-shinjuku-tokyo-japan-picture-id624031578?k=20&m=624031578&s=612x612&w=0&h=tKwEfcPofNk_8FdxL3IhQh5k0vKfehppn0pX19cBtqI=';

/*********************************************
 * IMAGE IS FROM NETWORK
 * FOR BACKGROUND IMAGE
**********************************************/
String splashImgBg =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUNc9UDh-5oG3sdLbrqm1CvmVCdFv8fEWgk90wrmakvS-MToj4t5Ii0aDqgaMuenYpcc8&usqp=CAU';

/*********************************************
 * IMAGE IS FROM NETWORK
 * FOR Profile Image
**********************************************/
String myImgLink =
    'https://scontent.fkhi10-1.fna.fbcdn.net/v/t39.30808-6/271037628_114657831078331_8286816738665498079_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_eui2=AeHGEp7BxOe8Be0GX9g2qCM11iBcqTOZRm7WIFypM5lGbi9ntfoaERv0l2VQfXJYIXfpOrfRcKxnNyVgaqw9hCYi&_nc_ohc=WXEn_o40PkMAX_fq_NR&tn=VsrH7Dgi8rMpqEGY&_nc_ht=scontent.fkhi10-1.fna&oh=00_AT-GTRZGiFvWtnOzEhoOWH0XjaW1BKp5Z9UpiaXD1tsYLQ&oe=6218605F';
/*********************************************
 * Making FlutterToast
 * Globally Accessible
**********************************************/
toastmsg(String msg) {
  Fluttertoast.showToast(msg: msg);
}

/*********************************************
 * Making User's Collection
 * Globally Accessible
**********************************************/
DatabaseReference userRef =
    FirebaseDatabase.instance.ref().child("User's Info");

FirebaseDatabase database = FirebaseDatabase.instance;
