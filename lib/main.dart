import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:screen/screen.dart';
import 'package:flutter/animation.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

//import 'package:flutter/';

//import 'package:path_provider/path_provider.dart';
//import 'package:video_player/video_player.dart';

//List<CameraDescription> cameras;
//
//
//
//void main() async {
//  // Fetch the available cameras before initializing the app.
//  try {
//    cameras = await availableCameras();
//  } on CameraException catch (e) {
//    logError(e.code, e.description);
//  }
//  runApp(new MyApp());
//}
//
///// Returns a suitable camera icon for [direction].
////IconData getCameraLensIcon(CameraLensDirection direction) {
////  switch (direction) {
////    case CameraLensDirection.back:
////      return Icons.camera_rear;
////    case CameraLensDirection.front:
////      return Icons.camera_front;
////    case CameraLensDirection.external:
////      return Icons.camera;
////  }
////  throw new ArgumentError('Unknown lens direction');
////}
//
//
//void logError(String code, String message) =>
//    print('Error: $code\nError Message: $message');
//
//class MyApp extends StatelessWidget {
////  // This widget is the root of your application.
////  @override
////  Widget build(BuildContext context) {
////    return new MaterialApp(
////      //debugShowCheckedModeBanner: false,
////      title: 'Flutter Demo',
////      theme: new ThemeData(
////        // This is the theme of your application.
////        //
////        // Try running your application with "flutter run". You'll see the
////        // application has a blue toolbar. Then, without quitting the app, try
////        // changing the primarySwatch below to Colors.green and then invoke
////        // "hot reload" (press "r" in the console where you ran "flutter run",
////        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
////        // counter didn't reset back to zero; the application is not restarted.
////        primarySwatch: Colors.blue,
////      ),
////      home: new MyHomePage(title: 'Mirror'),
////    );
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      home: new CameraExampleHome(),
//    );
//  }
//}
//
//class CameraExampleHome extends StatefulWidget {
//  @override
//  _CameraExampleHomeState createState() {
//    return new _CameraExampleHomeState();
//  }
//}
//
//class _CameraExampleHomeState extends State<CameraExampleHome> {
//  //final cameraDescription = CameraDescription();
//
//  String imagePath;
// // String videoPath;
//  //VideoPlayerController videoController;
// // VoidCallback videoPlayerListener;
//
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      key: _scaffoldKey,
//      appBar: new AppBar(
//        title: const Text('Camera example'),
//      ),
//      body: new Column(
//        children: <Widget>[
//          new Expanded(
//            child: new Container(
//              child: new Padding(
//                padding: const EdgeInsets.all(1.0),
//                child: new Center(
//                  child: _cameraPreviewWidget(),
//                ),
//              ),
//              decoration: new BoxDecoration(
//                color: Colors.black,
//                border: new Border.all(
//                  color: controller != null && controller.value.isRecordingVideo
//                      ? Colors.redAccent
//                      : Colors.grey,
//                  width: 3.0,
//                ),
//              ),
//            ),
//          ),
//          _captureControlRowWidget(),
//          new Padding(
//            padding: const EdgeInsets.all(5.0),
//            child: new Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                _cameraTogglesRowWidget(),
//               // _thumbnailWidget(),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  /// Display the preview from the camera (or a message if the preview is not available).
//  Widget _cameraPreviewWidget() {
//    if (controller == null || !controller.value.isInitialized) {
//      return Center(
//          child: new CameraPreview(controller),
//      );
////      return const Text(
////        'Tap a camera NOW',
////        style: TextStyle(
////          color: Colors.white,
////          fontSize: 24.0,
////          fontWeight: FontWeight.w900,
////        ),
////      );
//    } else {
//      return new AspectRatio(
//        aspectRatio: controller.value.aspectRatio,
//        child: new CameraPreview(controller),
//      );
//    }
//  }
//
//  /// Display the thumbnail of the captured image or video.
////  Widget _thumbnailWidget() {
////    return new Expanded(
////      child: new Align(
////        alignment: Alignment.centerRight,
////        child: videoController == null && imagePath == null
////            ? null
////            : new SizedBox(
////          child: (videoController == null)
////              ? new Image.file(new File(imagePath))
////              : new Container(
////            child: new Center(
////              child: new AspectRatio(
////                  aspectRatio: videoController.value.size != null
////                      ? videoController.value.aspectRatio
////                      : 1.0,
////                  child: new VideoPlayer(videoController)),
////            ),
////            decoration: new BoxDecoration(
////                border: new Border.all(color: Colors.pink)),
////          ),
////          width: 64.0,
////          height: 64.0,
////        ),
////      ),
////    );
////  }
//
//  /// Display the control bar with buttons to take pictures and record videos.
//  Widget _captureControlRowWidget() {
//    return new Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      mainAxisSize: MainAxisSize.max,
//      children: <Widget>[
////        new IconButton(
////          icon: const Icon(Icons.camera_alt),
////          color: Colors.blue,
////          onPressed: controller != null &&
////              controller.value.isInitialized &&
////              !controller.value.isRecordingVideo
////              ? onTakePictureButtonPressed
////              : null,
////        ),
////        new IconButton(
////          icon: const Icon(Icons.videocam),
////          color: Colors.blue,
////          onPressed: controller != null &&
////              controller.value.isInitialized &&
////              !controller.value.isRecordingVideo
////              ? onVideoRecordButtonPressed
////              : null,
////        ),
////        new IconButton(
////          icon: const Icon(Icons.stop),
////          color: Colors.red,
////          onPressed: controller != null &&
////              controller.value.isInitialized &&
////              controller.value.isRecordingVideo
////              ? onStopButtonPressed
////              : null,
////        )
//      ],
//    );
//  }
//
//  /// Display a row of toggle to select the camera (or a message if no camera is available).
//  Widget _cameraTogglesRowWidget() {
//    final List<Widget> toggles = <Widget>[];
//
//    if (cameras.isEmpty) {
//      return const Text('No camera found');
//    } else {
//      for (CameraDescription cameraDescription in cameras) {
//
//        onNewCameraSelected(cameraDescription);
//        cameraDescription.lensDirection;
//
////        toggles.add(
////          new SizedBox(
////            width: 90.0,
////            child: new RadioListTile<CameraDescription>(
////              title:
////              new Icon(getCameraLensIcon(cameraDescription.lensDirection)),
////              groupValue: controller?.description,
////              value: cameraDescription,
////              onChanged: controller != null && controller.value.isRecordingVideo
////                  ? null
////                  : onNewCameraSelected,
////            ),
////          ),
////        );
//      }
//    }
//
//    return new Row(children: toggles);
//    //return controller.dispose(CameraLensDirection.front);
//  }
//
//  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();
//
//  void showInSnackBar(String message) {
//    _scaffoldKey.currentState
//        .showSnackBar(new SnackBar(content: new Text(message)));
//  }
//
//  void onNewCameraSelected(CameraDescription cameraDescription) async {
//    if (controller != null) {
//      await controller.dispose();
//    }
//    controller = new CameraController(cameraDescription, ResolutionPreset.high);
//
//    // If the controller is updated then update the UI.
//    controller.addListener(() {
//      if (mounted) setState(() {});
//      if (controller.value.hasError) {
//        showInSnackBar('Camera error ${controller.value.errorDescription}');
//      }
//    });
//
//    try {
//      await controller.initialize();
//    } on CameraException catch (e) {
//      _showCameraException(e);
//    }
//
//    if (mounted) {
//      setState(() {});
//    }
//  }
//
////  void onTakePictureButtonPressed() {
////    takePicture().then((String filePath) {
////      if (mounted) {
////        setState(() {
////          imagePath = filePath;
////          //videoController?.dispose();
////          //videoController = null;
////        });
////        if (filePath != null) showInSnackBar('Picture saved to $filePath');
////      }
////    });
////  }
//
////  void onVideoRecordButtonPressed() {
////    startVideoRecording().then((String filePath) {
////      if (mounted) setState(() {});
////      if (filePath != null) showInSnackBar('Saving video to $filePath');
////    });
////  }
//
////  void onStopButtonPressed() {
////    stopVideoRecording().then((_) {
////      if (mounted) setState(() {});
////      showInSnackBar('Video recorded to: $videoPath');
////    });
////  }
//
////  Future<String> startVideoRecording() async {
////    if (!controller.value.isInitialized) {
////      showInSnackBar('Error: select a camera first.');
////      return null;
////    }
////
////    final Directory extDir = await getApplicationDocumentsDirectory();
////    final String dirPath = '${extDir.path}/Movies/flutter_test';
////    await new Directory(dirPath).create(recursive: true);
////    final String filePath = '$dirPath/${timestamp()}.mp4';
////
////    if (controller.value.isRecordingVideo) {
////      // A recording is already started, do nothing.
////      return null;
////    }
////
////    try {
////      videoPath = filePath;
////      await controller.startVideoRecording(filePath);
////    } on CameraException catch (e) {
////      _showCameraException(e);
////      return null;
////    }
////    return filePath;
////  }
//
////  Future<void> stopVideoRecording() async {
////    if (!controller.value.isRecordingVideo) {
////      return null;
////    }
////
////    try {
////      await controller.stopVideoRecording();
////    } on CameraException catch (e) {
////      _showCameraException(e);
////      return null;
////    }
////
////    await _startVideoPlayer();
////  }
//
////  Future<void> _startVideoPlayer() async {
////    final VideoPlayerController vcontroller =
////    new VideoPlayerController.file(new File(videoPath));
////    videoPlayerListener = () {
////      if (videoController != null && videoController.value.size != null) {
////        // Refreshing the state to update video player with the correct ratio.
////        if (mounted) setState(() {});
////        videoController.removeListener(videoPlayerListener);
////      }
////    };
////    vcontroller.addListener(videoPlayerListener);
////    await vcontroller.setLooping(true);
////    await vcontroller.initialize();
////    await videoController?.dispose();
////    if (mounted) {
////      setState(() {
////        imagePath = null;
////        videoController = vcontroller;
////      });
////    }
////    await vcontroller.play();
////  }
//
////  Future<String> takePicture() async {
////    if (!controller.value.isInitialized) {
////      showInSnackBar('Error: select a camera first.');
////      return null;
////    }
////    final Directory extDir = await getApplicationDocumentsDirectory();
////    final String dirPath = '${extDir.path}/Pictures/flutter_test';
////    await new Directory(dirPath).create(recursive: true);
////    final String filePath = '$dirPath/${timestamp()}.jpg';
////
////    if (controller.value.isTakingPicture) {
////      // A capture is already pending, do nothing.
////      return null;
////    }
////
////    try {
////      await controller.takePicture(filePath);
////    } on CameraException catch (e) {
////      _showCameraException(e);
////      return null;
////    }
////    return filePath;
////  }
//
//  void _showCameraException(CameraException e) {
//    logError(e.code, e.description);
//    showInSnackBar('Error: ${e.code}\n${e.description}');
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return new Scaffold(
//      appBar: new AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: new Text(widget.title),
//      ),
//      body: new Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: new Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug paint" (press "p" in the console where you ran
//          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
//          // window in IntelliJ) to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.blur_on),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation
//          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}

/////////////////////////////////////////////////

//List<CameraDescription> cameras;

List<CameraDescription> cameras;
double brightness;
double timeDilation;
CameraController controller;
//double minPadding = 0.0;
//double maxPadding = 5.0;
Duration duration = new Duration(milliseconds: 400);

void main() async {
  brightness = await Screen.brightness;
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(new MyApp());
}

bool isLightOn = false;

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
      Screen.setBrightness(1.0);
    }
  }

  AnimationController _animationController;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Padding(
                padding: EdgeInsets.all(_animationController.value),
                child: child,
              );
            },
            child: CameraPreview(controller),
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

    _animationController = AnimationController(
      value: 0.0,
      lowerBound: 0.0,
      upperBound: 25.0,
      duration: duration,
      vsync: this,
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    controller = new CameraController(cameras[1], ResolutionPreset.high);

    // (!controller.value.isInitialized) ? new Container() : buildCameraView(context);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
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
