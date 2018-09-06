import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:screen/screen.dart';
import 'package:flutter/animation.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart'; // use it?

List<CameraDescription> cameras;
double brightness;
double timeDilation;
CameraController controller;
double minPadding = 0.0;
double maxPadding = 30.0;
Duration duration = new Duration(milliseconds: 400);

Key key;

MediaQueryData queryData;

void main() async {
  brightness = await Screen.brightness;
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
//   This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: Center(child: CameraApp()),
      ),
    );
  }
}

class CameraApp extends StatefulWidget {
  @override
  CameraAppState createState() => new CameraAppState();
}

class CameraAppState extends State<CameraApp> with TickerProviderStateMixin {
  CameraController controller;

  void _lightToggle() {
    final status = _animationController.status;

    if (status == AnimationStatus.completed) {
      _animationController.reverse();

      Screen.setBrightness(brightness);
    } else {
      _animationController.animateTo(
        30.0,
      );
      Screen.setBrightness(_lightAnimationController.value);
    }
//    new AnimatedCrossFade(
//      duration:  Duration(seconds: 1),
//      firstChild: maximumBrightness(),
//      secondChild: defaultBrightness(),
//      crossFadeState: status != AnimationStatus.completed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//    );
  }

  Widget defaultBrightness() {
    Screen.setBrightness(brightness);
    return Container();
  }

  Widget maximumBrightness() {
    Screen.setBrightness(1.0);
    return Container();
  }

  AnimationController _animationController;
  AnimationController _lightAnimationController;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    // bool isLightOn;

    return new MaterialApp(
      home: Scaffold(
        body: Container(
          key: key,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return new Padding(
                padding: EdgeInsets.all(_animationController.value),
                //child: CameraPreview(controller),

                child: Center(
                  child: AspectRatio(
                    aspectRatio: queryData.size.width / queryData.size.height,
                    child: CameraPreview(controller),
                  ),
                ),
              );
            },

            //child: buildCameraView(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _lightToggle,
          backgroundColor: Colors.transparent,
          child: Icon(Icons.blur_on),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    controller = new CameraController(cameras[1], ResolutionPreset.high);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});

      _animationController = AnimationController(
        value: minPadding,
        lowerBound: minPadding,
        upperBound: maxPadding,
        duration: duration,
        vsync: this,
      );

      _lightAnimationController = AnimationController(
          value: brightness,
          lowerBound: brightness,
          upperBound: 1.0,
          duration: duration,
          vsync: this);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');
