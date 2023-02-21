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
  late CameraController cameraController;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
