//GLOBAL PAGE DECORATION

import '../export_all.dart';


BoxDecoration pageDecoration = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xff12C2E9), Color(0xffF64F59)]));

TextStyle headingStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
    shadows: [Shadow(color: Colors.black.withOpacity(0.5))]);

//GLOBAL VARIABLE

String apiUrl = "http://192.168.137.1:5000";
String token = "";
String userId = "";

//LOADER
const spinkit = SpinKitThreeBounce(
  color: Colors.white,
  size: 50.0,
);

//Message Alert 
  messageDialog(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 14.sp);
  }

// final List<TodoModule?> todoList = [];
