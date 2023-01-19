import 'dart:io';
import 'package:flutter/material.dart';
import 'MySettings.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirstName = "FirstName";

  final LastName = "LastName";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          // ignore: prefer_const_constructors
          title: Center(
            child: profileName(),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //edit username
                },
                icon:
                    Icon(Icons.mode_edit_outline_outlined, color: Colors.black))
          ],
        ),
        body: Stack(children: [
          //Αν δεν είναι όλα positioned σκοτωνονται
          Positioned(top: 30, left: 100, right: 100, child: profilePicture()),
          Positioned(
              top: 180,
              left: 30,
              child: Text(
                "Lvl.1",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade900),
              )),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 420, top: 200, left: 130, right: 30),
              color: Colors.purple.shade700,
            ),
          ),
          Positioned(top: 230, left: 0, right: 150, child: profileDetails()),
          Positioned(
              top: 110,
              right: 150,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    iconSize: 30.0,
                    onPressed: () {
                      //edit profile pic
                    },
                    icon: Icon(Icons.mode_edit_outline_outlined,
                        color: Colors.black)),
              ))
        ]
            /* 
              Center(
                child: Container(
                child: const Text('ftasame'),
                margin: const EdgeInsets.all(50),
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                height: 100,
                width: 80,
            ),
              ),
           */

            ),
        /*
        floatingActionButton: Padding(                   //outside ->in
          padding: const EdgeInsets.only(bottom: 60.0),  //padding -> FAB
          child: FloatingActionButton(
            elevation: 10,
            child: Icon(Icons.verified),
            onPressed: () { 
              print('Kanto Pali');
            },
          ),
        ),
*/

/*
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,      //3< items
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
  */
      ),
    );
  }

  Widget profileName() => RichText(
        text: TextSpan(
            text: FirstName,
            style: TextStyle(fontSize: 28, color: Colors.black),
            children: [
              TextSpan(
                text: " ",
              ),
              TextSpan(
                  text: LastName,
                  style: TextStyle(fontSize: 28, color: Colors.black))
            ]),
      );

  Widget profilePicture() => CircleAvatar(
        backgroundColor: Colors.purple.shade800,
        radius: 60,
        child: RichText(
            text: TextSpan(
                text: FirstName[0],
                style: TextStyle(color: Colors.white, fontSize: 40),
                children: [
              TextSpan(
                  text: LastName[0],
                  style: TextStyle(color: Colors.white, fontSize: 40))
            ])),
      );

  Widget profilePictureSolid() => Stack(
        children: [
          Container(
              width: 120,
              height: 120,
              color: Colors.purple.shade800,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: RichText(
                  text: TextSpan(
                      text: FirstName[0],
                      style: TextStyle(color: Colors.white, fontSize: 40),
                      children: [
                    TextSpan(
                        text: LastName[0],
                        style: TextStyle(color: Colors.white, fontSize: 40))
                  ]))),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
            ),
          )
        ],
      );

  Widget profileDetails() => Column(
        children: [
          ListTile(
              title: RichText(
                  text: TextSpan(
                      text: 'Events Attended',
                      style: TextStyle(
                          color: Colors.purple.shade900, fontSize: 28),
                      children: [
                TextSpan(text: "      "),
                TextSpan(
                    text: '5',
                    style:
                        TextStyle(color: Colors.purple.shade900, fontSize: 28))
              ]))),
          ListTile(
              title: RichText(
                  text: TextSpan(
                      text: 'Stories Uploaded',
                      style: TextStyle(
                          color: Colors.purple.shade900, fontSize: 28),
                      children: [
                TextSpan(text: "     "),
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
                TextSpan(text: "       "),
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
                  TextSpan(text: "     "),
                  TextSpan(
                      text: '9',
                      style: TextStyle(
                          color: Colors.purple.shade900, fontSize: 28))
                ])),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Placeholder',
              border: OutlineInputBorder(),
            ),
          )
        ],
      );
}
