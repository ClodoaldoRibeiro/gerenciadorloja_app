import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/ui/android/android_app.dart';

void main() {
  runApp(Platform.isIOS ? AndroidApp() : null);
}
