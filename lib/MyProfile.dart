import 'dart:io';
import 'package:flutter/material.dart';
import 'MySettings.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String FirstName = "FirstName";
  String LastName = "LastName";

  final _textController = TextEditingController();
  String newName = "Mpampis Sougias";
  List<String> FullName = ['No', 'Name'];
  bool NameChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
//icon: Icon(Icons.arrow_back),
          //  onPressed: () {
//Navigator.pop(context);
          //  },
          // ),

          // ignore: prefer_const_constructors
          title: NameChange
              ? nameChanger()
              : Center(
                  child: profileName(),
                ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    NameChange = true;
                  });
                },
                icon: Icon(Icons.mode_edit_outline_outlined))
          ],
        ),
        body: ListView(children: [
          ListTile(title: Center(child: profilePictureSolid())),
          ListTile(
              title: Text(
            "Lvl.1",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade900),
          )),
          ListTile(
            contentPadding: EdgeInsets.only(left: 18.0),
            title: Row(
              children: [
                RichText(
                    text: TextSpan(
                  text: 'Events Attended',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28),
                )),
                SizedBox(
                  width: 20,
                ),
                Text('5',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28))
              ],
            ),
          ),
          ListTile(
              title: RichText(
                  text: TextSpan(
                      text: 'Stories Uploaded',
                      style: TextStyle(
                          color: Colors.purple.shade900, fontSize: 28),
                      children: [
                TextSpan(text: "  "),
                TextSpan(
                    text: '14',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28))
              ]))),
          ListTile(
              title: RichText(
                  text: TextSpan(
                      text: 'Reviews Posted',
                      style: TextStyle(
                          color: Colors.purple.shade900, fontSize: 28),
                      children: [
                TextSpan(text: "    "),
                TextSpan(
                    text: '3',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28))
              ]))),
          ListTile(
            title: RichText(
                text: TextSpan(
                    text: 'QR Codes Found',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28),
                    children: [
                  TextSpan(text: "   "),
                  TextSpan(
                      text: '9',
                      style: TextStyle(
                          color: Colors.purple.shade900, fontSize: 28))
                ])),
          )
          /*
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 420, top: 200, left: 130, right: 30),
              color: Colors.purple.shade700,
            ),
          ),
          */
          ,
        ]));
  }

  Widget profileName() => RichText(
        text: TextSpan(
            text: FirstName,
            style: TextStyle(fontSize: 24, color: Colors.black),
            children: [
              TextSpan(
                text: " ",
              ),
              TextSpan(
                  text: LastName,
                  style: TextStyle(fontSize: 24, color: Colors.black))
            ]),
      );

  Widget profilePictureSolid() => Stack(
        children: [
          Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.purple.shade800, shape: BoxShape.circle),
              child: Stack(children: [
                Center(
                  child: RichText(
                      text: TextSpan(
                          text: FirstName[0],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                          children: [
                        TextSpan(
                            text: LastName[0],
                            style: TextStyle(color: Colors.white, fontSize: 40))
                      ])),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        color: Colors.purple.shade100),
                    child: IconButton(
                        iconSize: 27.0,
                        onPressed: () {
                          setState(() {
                            //edit picture
                          });
                        },
                        icon: Icon(Icons.mode_edit_outline_outlined,
                            color: Colors.black)),
                  ),
                )
              ])),
        ],
      );

  Widget nameChanger() => Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
                hintText: 'Example: Dimitrios *space* Dimitriou',
                border: null,
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                )),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                newName = _textController.text;
                final savedName = newName.split(' ');
                FullName[0] = savedName[0];
                FullName[1] = savedName[1];

                FullName[0].isEmpty ? FirstName = '_' : FirstName = FullName[0];
                FullName[1].isEmpty ? LastName = '_' : LastName = FullName[1];
                NameChange = false;
              });
            },
            color: Colors.purple,
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );

/*
  Widget profileDetails() => ListView(children: [
        ListTile(
            title: RichText(
                text: TextSpan(
                    text: 'Events Attended',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28),
                    children: [
              TextSpan(text: "   "),
              TextSpan(
                  text: '5',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28))
            ]))),
        ListTile(
            title: RichText(
                text: TextSpan(
                    text: 'Stories Uploaded',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28),
                    children: [
              TextSpan(text: "  "),
              TextSpan(
                  text: '14',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28))
            ]))),
        ListTile(
            title: RichText(
                text: TextSpan(
                    text: 'Reviews Posted',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28),
                    children: [
              TextSpan(text: "    "),
              TextSpan(
                  text: '3',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28))
            ]))),
        ListTile(
          title: RichText(
              text: TextSpan(
                  text: 'QR Codes Found',
                  style: TextStyle(color: Colors.purple.shade900, fontSize: 28),
                  children: [
                TextSpan(text: "  "),
                TextSpan(
                    text: '9',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28))
              ])),
        )
      ]);

      */
}
