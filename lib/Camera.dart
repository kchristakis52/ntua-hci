import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

//Ακόμα δεν έχει τίποτα, μου πηρε ωρα ενα troubleshooting, θα ολοκληρωσω αυριο
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
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
