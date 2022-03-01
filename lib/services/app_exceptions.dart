import 'dart:async';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

class AppException {
  static fetchError(Object e) {
    if (e is SocketException) {
      Fluttertoast.showToast(
        msg: 'No Internet connection',
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_LONG,
      );
    } else if (e is TimeoutException) {
      Fluttertoast.showToast(
        msg: 'API not responded in time',
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_LONG,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Error occurred please try again !',
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
