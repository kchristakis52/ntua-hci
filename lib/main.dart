import 'dart:io';

import 'package:flutter/material.dart';

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
        title: Center(child: const Text('College Nights')),
        leading: IconButton(
          icon: Icon(Icons.radio_button_unchecked),
          onPressed: () async {},
        ),
      ),
      body: events(),
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
  const events({super.key});

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      //width: 335,
      //height: 462,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(backgroundColor: Colors.black),
              title: const Text('Aggelos Dimitriou'),
              subtitle: Text(
                'Gazi Music Hall',
              ),
            ),

            Image.asset('images/Media.png', height: 110),

            Text('t'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
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

            //Image.asset('images/Media.png'),
          ],
        ),
      ),
    );
  }
}
