import 'package:flutter/material.dart';
import 'package:fotoanalog/screens/onboarding_screen.dart';
import 'package:fotoanalog/screens/LoginPage.dart';
import 'package:fotoanalog/screens/CameraPage.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:fotoanalog/constant/Constant.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    //logError(e.code, e.description);
  }

  runApp(
    MaterialApp(
      title: "Camera App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraHomeScreen(cameras),
      routes: <String, WidgetBuilder>{
        CAMERA_SCREEN: (BuildContext context) => CameraHomeScreen(cameras),
      },
    ),
  );
}
