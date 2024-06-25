import 'package:fluttertoast/fluttertoast.dart';

class AppToast {

  ///Show a toast message
  static void show(String toastMessage) {
    ///Here we can also pass several parameters
    ///like gravity,toastLength
    ///by creating custom enums
    Fluttertoast.showToast(
      msg: toastMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
      
    );
  }
}
