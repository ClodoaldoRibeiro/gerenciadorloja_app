import 'dart:io';

import 'package:flutter/material.dart';

import 'android/android_app.dart';

class GerenciadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? Container() : AndroidApp() ;
  }
}
