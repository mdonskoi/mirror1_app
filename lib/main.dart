import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:screen/screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';

List<CameraDescription> cameras;
double brightness;
double timeDilation;
CameraController controller;
double minPadding = 0.0;
double maxPadding = 40.0;
Duration duration = Duration(milliseconds: 400);
Key key;
//double screenAspectRatio;
double checkedAspectRatio;
//Size size;
double heightScaleFactor;
double widthScaleFactor;

//BuildContext buildContext;

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
  // todo add necessary comments
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
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
  // queryData = MediaQuery.of(context);

  CameraController controller;
  AnimationController _animationController;
  AnimationController _brightnessAnimationController;

  void _lightToggle() {
    final status = _animationController.status;

    if (status == AnimationStatus.completed) {
      _animationController.reverse();
      _brightnessAnimationController.reverse();
      aspectRatioChecker();
    } else {
      _animationController.animateTo(30.0);
      _brightnessAnimationController.animateTo(1.0);
      aspectRatioChecker();
    }
  }

  double aspectRatioChecker() {
    final queryData = MediaQuery.of(context);
    final ios = Theme.of(context).platform == TargetPlatform.iOS;
    final android = Theme.of(context).platform == TargetPlatform.android;

    if (ios) {
      checkedAspectRatio = queryData.size.width / queryData.size.height;
    } else if (android) {
      checkedAspectRatio =
          controller.value.aspectRatio; //todo resolve aspect ratio
    }
    return checkedAspectRatio;
  }

  double heightScaleFactorCalculator() {
    final queryData = MediaQuery.of(context);
    final ios = Theme.of(context).platform == TargetPlatform.iOS;
    final android = Theme.of(context).platform == TargetPlatform.android;

    if (ios) {
      heightScaleFactor = 1.0;
    } else if (android) {
      heightScaleFactor = controller.value.aspectRatio /
          (queryData.size.width / queryData.size.height);
    }
    return heightScaleFactor;
  }

  double widthScaleFactorCalculator() {
    final queryData = MediaQuery.of(context);
    final ios = Theme.of(context).platform == TargetPlatform.iOS;
    final android = Theme.of(context).platform == TargetPlatform.android;

    if (ios) {
      widthScaleFactor = 1.0;
    } else if (android) {
      widthScaleFactor = controller.value.aspectRatio /
          (queryData.size.width / queryData.size.height);
    }
    return widthScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    aspectRatioChecker();
    heightScaleFactorCalculator();
    widthScaleFactorCalculator();
    final queryData = MediaQuery.of(context);
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            key: key,
            animation: _animationController,
            builder: (context, child) {
              Screen.setBrightness(_brightnessAnimationController.value);
              return new Padding(
                padding: EdgeInsets.all(_animationController.value),
                child: AspectRatio(
                  key: key,
                  aspectRatio: checkedAspectRatio,
                  child: CameraPreview(controller),
                ),
              );
            },
          ),
        ),

        //     ],

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

      _brightnessAnimationController = AnimationController(
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

//var size = MediaQuery.of(context).size.width;
//
//// ...
//
//Container(
//width: size,
//height: size,
//child: ClipRect(
//child: OverflowBox(
//alignment: Alignment.center,
//child: FittedBox(
//fit: BoxFit.fitWidth,
//child: Container(
//width: size,
//height:
//size / widget.cameraController.value.aspectRatio,
//child: camera, // this is my CameraPreview
//),
//),
//),
//),
//);
