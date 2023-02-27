import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cross_file_image/cross_file_image.dart';

class StoryCamera extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const StoryCamera({Key? key, required this.cameras}) : super(key: key);

  @override
  State<StoryCamera> createState() => _StoryCameraState();
}

class _StoryCameraState extends State<StoryCamera> {
  //late List<CameraDescription> cameras;
  late CameraController _cameraController;

  int camDirection = 0;
  bool _isRearCameraSelected = true;
  Future startCamera(CameraDescription cameraDescription) async {
    //final cameras = await availableCameras();

    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: true,
    );
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;

        setState(() {}); //refresh camera
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void initState() {
    super.initState();

    startCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

/*
  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => 
      ))
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    if (_cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(_cameraController),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _isRearCameraSelected = !_isRearCameraSelected;
                  });
                  startCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                },
                child: cameraButton(
                    Icons.flip_camera_ios_outlined, Alignment.bottomLeft)),
            GestureDetector(
                onTap: () async {
                  await _cameraController.takePicture().then((XFile? file) {
                    if (mounted) {
                      if (file != null) {
                        Image(image: XFileImage(file));

                        print(
                            "Picture saved to ${file.path}"); //shows path for pictures
                      }
                    }
                  });
                },
                child: cameraButton(
                    Icons.camera_alt_outlined, Alignment.bottomCenter)),
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
