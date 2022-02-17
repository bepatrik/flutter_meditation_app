// import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*********************************************
 * IMAGE IS FROM NETWORK
 * FOR BACKGROUND IMAGE LOGIN
**********************************************/
String bgLogInImgPage =
    'https://images.unsplash.com/photo-1434873740857-1bc5653afda8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80';

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
// DatabaseReference userRef =
//     FirebaseDatabase.instance.ref().child("User's Info");

// FirebaseDatabase database = FirebaseDatabase.instance;
