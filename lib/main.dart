import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:track_account/pages/root_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}