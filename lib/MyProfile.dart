import 'dart:io';
import 'package:flutter/material.dart';
import 'MySettings.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

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
              //back
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          // ignore: prefer_const_constructors
          title: Center(
            child: const Text(
              "FirstName LastName",
              style: TextStyle(fontSize: 28, color: Colors.black),
            ),
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

  Widget profilePicture() => CircleAvatar(
        backgroundColor: Colors.purple.shade800,
        radius: 60,
        child: Text(
          'FL',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      );

  Widget profileDetails() => Column(
        children: [
          ListTile(
              title: Text(
            'Events Attended          5',
            style: TextStyle(color: Colors.purple.shade900, fontSize: 28),
          )),
          ListTile(
              title: Text(
            'Stories Uploaded        14',
            style: TextStyle(color: Colors.purple.shade900, fontSize: 28),
          )),
          ListTile(
              title: Text(
            'Reviews                        3',
            style: TextStyle(color: Colors.purple.shade900, fontSize: 28),
          )),
          ListTile(
            title: Text(
              'QR Codes Found         8',
              style: TextStyle(color: Colors.purple.shade900, fontSize: 28),
            ),
          )
        ],
      );
}
