import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('College Nights'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                icon: const Icon(Icons.account_circle_rounded))
          ],
          bottom: PreferredSize(
              child: Container(
                color: Colors.black,
                height: 0.25,
              ),
              preferredSize: Size.fromHeight(0.25)),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            onTap: (value) {
              if (value == 0)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              if (value == 2)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyEvents()));
              if (value == 3)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyUpdates()));
              if (value == 4)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MySettings()));
            },
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_outline), label: 'My Events'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined), label: 'Updates'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Settings')
            ]));
  }
}
