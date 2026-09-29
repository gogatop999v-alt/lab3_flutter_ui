import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Единая точка показа Toast-уведомлений.
void showToast(String message) {
  Fluttertoast.cancel(); // чтобы уведомления не копились в очереди
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 16,
  );
}
