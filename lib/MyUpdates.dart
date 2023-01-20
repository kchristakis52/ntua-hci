import 'dart:io';
import 'package:flutter/material.dart';
import 'MyProfile.dart';
import 'main.dart';
import 'MySettings.dart';

class MyUpdates extends StatelessWidget {
  const MyUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //centerTitle: true,
          automaticallyImplyLeading: false,
          title: Center(child: const Text('College Nights')),

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
        body: ListView(children: [
          Card(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                  leading: Text('Time has changed! Take a look!'),
                  trailing: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('images/tropical.png'),
                  ))
            ],
          )),
        ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 3,
            onTap: (value) {
              if (value == 0)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
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
                  icon: Icon(Icons.notifications_outlined),
                  label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Settings')
            ]));
  }
}

class Notification extends StatefulWidget {
  final String periexomeno;

  const Notification({Key? key, required this.periexomeno});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
            leading: Text('Time has changed! Take a look!'),
            trailing: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('images/tropical.png'),
            ))
      ],
    )));
  }
}
