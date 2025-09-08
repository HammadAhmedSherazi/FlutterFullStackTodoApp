import 'package:flutter/cupertino.dart';
import 'package:todoapp/export_all.dart';

//ANDROID BUTTON
class ButtonWidgetAndroid extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double width;
  const ButtonWidgetAndroid(
      {super.key, required this.buttonText, required this.onTap, required this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(Size.fromWidth(width)),
            elevation: const WidgetStatePropertyAll(10.0),
            padding: WidgetStatePropertyAll(EdgeInsets.all(15.r)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30.r),
                    right: Radius.circular(30.r)))),
            backgroundColor: const WidgetStatePropertyAll(
                Color.fromARGB(209, 119, 51, 48))),
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ));
  }
}

//IOS BUTTON
class ButtonWidgetIOS extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double  width;
  const ButtonWidgetIOS(
      {super.key, required this.buttonText, required this.onTap,required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: CupertinoButton(
          onPressed: onTap,
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          color: const Color.fromARGB(209, 119, 51, 48),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(30.r), right: Radius.circular(30.r)), minimumSize: Size(width, width),
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
