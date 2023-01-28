import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';

class MyLiveEvent extends StatefulWidget {
  const MyLiveEvent({super.key, required this.title});

  final String title;

  @override
  State<MyLiveEvent> createState() => _MyLiveEventState();
}

class _MyLiveEventState extends State<MyLiveEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            shadowColor: Colors.black,
            elevation: 2,
            centerTitle: true,
            title: Text(widget.title),
            actions: [
              IconButton(
                  iconSize: 50,
                  onPressed: (() {}),
                  icon: ImageIcon(AssetImage('assets/images/festival.jpg')))
            ],
          )),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 30,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined),
                          TextButton(
                            onPressed: () {
                              //
                            },
                            child: Text(
                              'Location',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  width: 18,
                ),
                Container(
                    height: 30,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          Text(
                            '419',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  width: 18,
                ),
                Icon(
                  Icons.radio_button_checked,
                  color: Colors.red.shade900,
                  size: 25,
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 5,
              color: Colors.grey.shade400,
            ),
            Expanded(
                child: _buildListView()), //Expanded για List μέσα σε Column
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          //
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Type your message'),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: (() {
            //
          }),
          tooltip: 'Post Story',
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_, index) {
        return ListTile(
            title: Text('Username'),
            subtitle: Text('Live Comment #$index'),
            leading: CircleAvatar(
                backgroundColor: Colors.purple.shade800,
                radius: 20,
                child: Text(
                  'FL',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            trailing: Text(
              'HH:MM',
              style: TextStyle(fontSize: 16),
            ));
      },
    );
  }
}
