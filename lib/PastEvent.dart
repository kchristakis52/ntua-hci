import 'package:flutter/material.dart';
import 'MySettings.dart';
import 'MyProfile.dart';

class PastEvent extends StatefulWidget {
  const PastEvent({super.key});

  @override
  State<PastEvent> createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "FirstName LastName",
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.25),
              child: Container(
                color: Colors.black,
                height: 0.25,
              )),
        ),
        body: Column());
  }
}
