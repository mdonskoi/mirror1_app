//import 'package:flutter/material.dart';
//import 'package:camera/camera.dart';
//
//import 'dart:async';
//import 'dart:io';
//
//import 'package:flutter/services.dart';

//List<CameraDescription> cameras;
//bool isLightOn = false;

//class CameraApp extends StatefulWidget {
//  @override
//  CameraAppState createState() => new CameraAppState();
//}
//
//class CameraAppState extends State<CameraApp> {
//  CameraController controller;
//
//  Widget exposition() {
//    return Container(
//      child: CameraPreview(controller),
//    );
//  }
//
//  Widget lightedExposition() {
//    return Container(
//      padding: EdgeInsets.all(25.0),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(5.0),
//        color: Colors.white,
//      ),
//      // color: Colors.white,
//      child: exposition(),
//    );
//  }
//
//  Widget screenView() {
//    if (isLightOn) {
//      lightedExposition();
//    } else {
//      exposition();
//    }
//    return exposition();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//     return screenView();
//
//    //return lightedExposition();
//
//    //return screenView(isLightOn);
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//    ]);
//    controller = new CameraController(cameras[1], ResolutionPreset.high);
//    controller.initialize().then((_) {
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });
//  }
//
//  @override
//  void dispose() {
//    controller?.dispose();
//    super.dispose();
//  }
//}

//void logError(String code, String message) =>
//    print('Error: $code\nError Message: $message');
