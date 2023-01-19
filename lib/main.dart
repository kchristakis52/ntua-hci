import 'dart:io';
import 'package:flutter/material.dart';
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';

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
        title: const Center(child: Text('College Nights')),
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
      body: ListView(children: <events>[
        const events(
          OnomaEvent: 'Tropical The Party',
          OnomaDiorganwti: 'Aggelos Dimitriou',
          meros: 'Gazi Music Hall, Athens',
          hmeromhnia: 'Saturday, 13 Feb 2023 23:00',
          perigrafh:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        ),
        const events(
          OnomaEvent: 'House Festival',
          OnomaDiorganwti: 'Reece Johnson',
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
            if (value == 0)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            if (value == 4)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MySettings(
                            title: 'College Nights',
                          )));
          },
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.star_outline), label: 'My Events'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Notifications'),
            const BottomNavigationBarItem(
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
  final String perigrafh;
  final bool attending = false;
  final bool live = false;

  const events(
      {Key? key,
      required this.OnomaEvent,
      required this.OnomaDiorganwti,
      required this.meros,
      required this.hmeromhnia,
      required this.perigrafh})
      : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 15),
      //width: 335,
      //height: 462,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PastEvent(
                    OnomaEvent: widget.OnomaEvent, meros: widget.meros))),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.black),
                title: Text(widget.OnomaDiorganwti),
                subtitle: Text(
                  widget.meros,
                ),
              ),
              Image.asset('images/tropical.png'),
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
                    //textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('Not Interested'),
                  ),
                  TextButton(
                    //style: TextButton.styleFrom(backgroundColor: appcolor),
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
      ),
    );
  }
}
