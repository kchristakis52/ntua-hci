import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class StoryCamera extends StatefulWidget {
  const StoryCamera({super.key});

  @override
  State<StoryCamera> createState() => _StoryCameraState();
}

class _StoryCameraState extends State<StoryCamera> {
  late List<CameraDescription> cameras;
  late CameraController _cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: true,
    );

    await _cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //refresh camera
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(_cameraController),
            GestureDetector(
                onTap: () {},
                child: cameraButton(
                    Icons.flip_camera_ios_outlined, Alignment.bottomLeft)),
            cameraButton(Icons.camera_alt_outlined, Alignment.bottomCenter),
            cameraButton(Icons.flip_camera_ios_outlined, Alignment.bottomRight)
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget cameraButton(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black26,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 10,
              )
            ]),
        child: Center(
            child: Icon(
          icon,
          color: Colors.black54,
        )),
      ),
    );
  }
}
