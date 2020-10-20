import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:loja/ios/ios.app.dart';
import 'package:loja/android/home.app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(!Platform.isIOS ? AndroidHomeApp() : IOSApp());
}
