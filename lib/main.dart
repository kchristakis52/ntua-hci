import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:testwheren/UpcomingEvent.dart';
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';
import 'Search.dart';
import 'LiveEventView.dart';
import 'CreateEvent.dart';
import 'package:intl/intl.dart';
import 'globals.dart' as globals;
import 'HomePage.dart';

void main() {
  runApp(const wheren());
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
        applyElevationOverlayColor: true,
        colorSchemeSeed: const Color.fromRGBO(103, 80, 164, 1),
        useMaterial3: true,
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.purple.shade50,
          helpTextStyle: const TextStyle(fontSize: 14),
        ),
      ),

      /// Αρχικοποίηση της κεντρικής οθόνης της εφαρμογής μας (TaskListScreen)
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pageList = [
    HomePage(),
    Search(),
    MyEvents(),
    MyUpdates(),
    MySettings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_outline), label: 'My Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined), label: 'Updates'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings')
          ]),
    );
  }
}

class Event {
  final String OnomaEvent;
  final String OnomaDiorganwti;
  final String EpithetoDiorganwti;
  final String meros;
  final DateTime hmeromhnia;
  final Duration diarkeia;
  final String perigrafh;
  final String eikona;
  bool live;

  Event(
      {required this.OnomaEvent,
      required this.OnomaDiorganwti,
      required this.EpithetoDiorganwti,
      required this.meros,
      required this.hmeromhnia,
      required this.diarkeia,
      required this.perigrafh,
      this.eikona = './assets/images/Media.png',
      this.live = false});
}
