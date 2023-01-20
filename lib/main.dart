import 'dart:io';
import 'package:flutter/material.dart';
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';

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
          colorSchemeSeed: Color.fromRGBO(103, 80, 164, 1),
          useMaterial3: true),

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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('College Nights'),
        leading: IconButton(
          icon: const Icon(Icons.radio_button_unchecked),
          onPressed: () async {},
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyProfile()));
              },
              icon: const Icon(Icons.account_circle_rounded))
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.25),
            child: Container(
              color: Colors.black,
              height: 0.25,
            )),
      ),
      body: ListView(children: const <events>[
        events(
          OnomaEvent: 'Tropical The Party',
          OnomaDiorganwti: 'Aggelos',
          EpithetoDiorganwti: 'Dimitriou',
          meros: 'Gazi Music Hall, Athens',
          hmeromhnia: 'Saturday, 13 Feb 2023 23:00',
          perigrafh:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        ),
        events(
          OnomaEvent: 'House Festival',
          OnomaDiorganwti: 'Reece',
          EpithetoDiorganwti: 'Johnson',
          meros: 'Technopolis Gazi, Athens',
          hmeromhnia: 'Saturday, 20 Feb 2023 17:00',
          perigrafh:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        )
      ]),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            }
            if (value == 4) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MySettings()));
            }
            if (value == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyUpdates()));
            }
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
          ]),
    );
  }
}

class events extends StatefulWidget {
  final String OnomaEvent;
  final String OnomaDiorganwti;
  final String EpithetoDiorganwti;
  final String meros;
  final String hmeromhnia;
  final String perigrafh;
  final String eikona;
  final bool attending = false;
  final bool live = false;

  const events(
      {Key? key,
      required this.OnomaEvent,
      required this.OnomaDiorganwti,
      required this.EpithetoDiorganwti,
      required this.meros,
      required this.hmeromhnia,
      required this.perigrafh,
      this.eikona = 'images/tropical.png'})
      : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 15),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PastEvent(
                      OnomaEvent: widget.OnomaEvent,
                      meros: widget.meros,
                      eikona: widget.eikona,
                    ))),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text(
                      '${widget.OnomaDiorganwti[0]}${widget.EpithetoDiorganwti[0]}',
                      style: TextStyle(color: Color.fromARGB(255, 33, 0, 93))),
                  radius: 20,
                  backgroundColor: Color.fromARGB(255, 234, 221, 255),
                ),
                title: Text(
                    widget.OnomaDiorganwti + ' ' + widget.EpithetoDiorganwti),
                subtitle: Text(
                  widget.meros,
                ),
              ),
              Image.asset(widget.eikona),
              ListTile(
                title: Text(
                  widget.OnomaEvent,
                ),
                subtitle: Text(widget.hmeromhnia),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.perigrafh,
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('Not Interested'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 103, 80, 164)),
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('Attend',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
