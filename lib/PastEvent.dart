import 'package:flutter/material.dart';
import 'MySettings.dart';
import 'MyProfile.dart';

class PastEvent extends StatefulWidget {
  final String OnomaEvent;
  final String meros;
  const PastEvent({
    Key? key,
    required this.OnomaEvent,
    required this.meros,
  }) : super(key: key);

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
            widget.OnomaEvent,
          ),
          //actions: [Image.asset(name)],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.25),
              child: Container(
                color: Colors.black,
                height: 0.25,
              )),
        ),
        body: Column(
          children: [
            ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Text('Location'),
                ])
          ],
        ));
  }
}
