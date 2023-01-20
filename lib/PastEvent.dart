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
          centerTitle: true,
          //leading: IconButton(
          //  icon: const Icon(Icons.arrow_back),
          //  onPressed: () {
          //    Navigator.pop(context);
//},
          //  ),
          title: Text(
            widget.OnomaEvent,
          ),
          //actions: [Image.asset(name)],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.25),
              child: Container(
                color: Colors.black,
                height: 0.25,
              )),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Flexible(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text('Technopolis Gazi, Athens'),
                    ),
                  ),
                ),
                Flexible(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('180'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Stars:'),
                    trailing: Text('5/5'),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
