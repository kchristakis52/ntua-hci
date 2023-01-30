import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testwheren/MyEvents.dart';
import 'MyProfile.dart';
import 'main.dart';
import 'MySettings.dart';
import 'PastEvent.dart';
import 'Search.dart';

class MyUpdates extends StatelessWidget {
  const MyUpdates({super.key});

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
        body: ListView(children: const <Notification>[
          Notification(
            periexomeno: ('Time has changed. Take a look!'),
            NotPic: ('./assets/images/Media.png'),
          ),
          Notification(
              periexomeno: 'Cool', NotPic: ('./assets/images/festival.jpg')),
          Notification(
              periexomeno: ('periexomeno'),
              NotPic: ('./assets/images/Media.png'))
        ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 3,
            onTap: (value) {
              if (value == 0)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              if (value == 1) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search()));
              }
              if (value == 2)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyEvents()));
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

class Notification extends StatefulWidget {
  final String periexomeno;
  final String NotPic;

  const Notification(
      {Key? key, required this.periexomeno, required this.NotPic})
      : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: InkWell(
                splashColor: Color.fromARGB(255, 166, 33, 243).withAlpha(30),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PastEvent(
                              OnomaEvent: 'Tropical',
                              meros: 'Gazi Music Hall',
                              eikona: ('./assets/images/Media.png'),
                            ))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        leading: Text(widget.periexomeno),
                        trailing: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(widget.NotPic),
                        ))
                  ],
                ))));
  }
}
