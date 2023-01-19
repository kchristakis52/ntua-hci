import 'dart:io';
import 'package:flutter/material.dart';
import 'MySettings.dart';
import 'MyProfile.dart';

void main() {
  runApp(wheren());
}

class wheren extends StatelessWidget {
  const wheren({super.key});

  /// Μέθοδος που κατασκευάζει το [Widget] της εφαρμογής μας
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Τίτλος της εφαρμογής μας
      title: 'College Nights',

      /// Το θέμα της εφαμρογής μας
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),

      /// Αρχικοποίηση της κεντρικής οθόνης της εφαρμογής μας (TaskListScreen)
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(child: const Text('College Nights')),
        leading: IconButton(
          icon: Icon(Icons.radio_button_unchecked),
          onPressed: () async {},
        ),
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
      body: events(
        OnomaEvent: 'Tropical The Party',
        OnomaDiorganwti: 'Aggelos Dimitriou',
        meros: 'Gazi Music Hall, Athens',
        hmeromhnia: 'Saturday, 13 Feb 2023 23:00',
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
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
          ]),
    );
  }
}

class events extends StatefulWidget {
  final String OnomaEvent;
  final String OnomaDiorganwti;
  final String meros;
  final String hmeromhnia;

  const events(
      {Key? key,
      required this.OnomaEvent,
      required this.OnomaDiorganwti,
      required this.meros,
      required this.hmeromhnia})
      : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 15),
      //width: 335,
      //height: 462,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.black),
              title: Text(widget.OnomaDiorganwti),
              subtitle: Text(
                widget.meros,
              ),
            ),
            Image.asset('images/tropical.png'),
            Text(widget.OnomaEvent),
            Text(widget.hmeromhnia),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  //textColor: const Color(0xFF6200EE),
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('Not Interested'),
                ),
                TextButton(
                  //style: const ButtonStyle(backgroundColor: Colors.blue),
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('Attend'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
