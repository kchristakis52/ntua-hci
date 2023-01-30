import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';
import 'CreateEvent.dart';
import 'package:intl/intl.dart';

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

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  bool showLive = false;
  List<Event> viewnowlist = <Event>[];
  List<Event> myeventslist = <Event>[];
  List<Event> currevents = <Event>[
    Event(
        OnomaEvent: 'Tropical The Party',
        OnomaDiorganwti: 'Aggelos',
        EpithetoDiorganwti: 'Dimitriou',
        meros: 'Gazi Music Hall, Athens',
        hmeromhnia: DateTime(2023, 01, 20, 23, 00, 00),
        perigrafh:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        diarkeia: Duration(days: 30)),
    Event(
      OnomaEvent: 'House Festival',
      OnomaDiorganwti: 'Reece',
      EpithetoDiorganwti: 'Johnson',
      meros: 'Technopolis Gazi, Athens',
      hmeromhnia: DateTime(2023, 02, 20, 17, 0, 0),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      eikona: './assets/images/festival.jpg',
    ),
    Event(
      OnomaEvent: 'The Party',
      OnomaDiorganwti: 'Lorem',
      EpithetoDiorganwti: 'Ipsum',
      meros: 'Beach, Athens',
      hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    ),
    Event(
      OnomaEvent: 'The Party',
      OnomaDiorganwti: 'Lorem',
      EpithetoDiorganwti: 'Ipsum',
      meros: 'Beach, Athens',
      hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    ),
    Event(
      OnomaEvent: 'The Party',
      OnomaDiorganwti: 'Lorem',
      EpithetoDiorganwti: 'Ipsum',
      meros: 'Beach, Athens',
      hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('College Nights'),
        leading: IconButton(
            icon: (!showLive)
                ? const Icon(Icons.radio_button_unchecked)
                : const Icon(
                    Icons.radio_button_checked_outlined,
                    color: Color.fromARGB(255, 179, 38, 30),
                  ),
            onPressed: () => setState(() {
                  showLive = !showLive;
                })),
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
      body: ListView.builder(
          itemCount: viewnowlist.length,
          itemBuilder: ((context, index) {
            currevents[index].live =
                (DateTime.now().isAfter(currevents[index].hmeromhnia) &&
                    DateTime.now().isBefore(currevents[index]
                        .hmeromhnia
                        .add(currevents[index].diarkeia)));
            return Container(
              margin: const EdgeInsets.only(
                  left: 12, right: 12, bottom: 20, top: 15),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PastEvent(
                              OnomaEvent: currevents[index].OnomaEvent,
                              meros: currevents[index].meros,
                              eikona: currevents[index].eikona,
                            ))),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              const Color.fromARGB(255, 234, 221, 255),
                          child: Text(
                              '${currevents[index].OnomaDiorganwti[0]}${currevents[index].EpithetoDiorganwti[0]}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 33, 0, 93))),
                        ),
                        trailing: (currevents[index].live)
                            ? const Icon(
                                Icons.radio_button_checked,
                                color: Color.fromARGB(255, 179, 38, 30),
                              )
                            : null,
                        title: Text(
                            '${currevents[index].OnomaDiorganwti} ${currevents[index].EpithetoDiorganwti}'),
                        subtitle: Text(
                          currevents[index].meros,
                        ),
                      ),
                      AspectRatio(
                          aspectRatio: 335 / 170,
                          child: Image.asset(
                            currevents[index].eikona,
                            fit: BoxFit.fitWidth,
                          )),
                      ListTile(
                        title: Text(
                          currevents[index].OnomaEvent,
                        ),
                        subtitle: Text(DateFormat('EEEE, d MMM yyyy HH:mm')
                            .format(currevents[index].hmeromhnia)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          currevents[index].perigrafh,
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              currevents.removeAt(index);
                              setState(() {});
                            },
                            child: const Text('Not Interested'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 103, 80, 164)),
                            onPressed: () {
                              myeventslist.add(currevents[index]);
                              currevents.removeAt(index);
                              setState(() {});
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
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Event? newEvent = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateEvent()));
            if (newEvent != null) currevents.add(newEvent);
            setState(() {});
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            }
            if (value == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyEvents()));
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

  @override
  bool get wantKeepAlive => true;
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
  late bool live;

  Event({
    required this.OnomaEvent,
    required this.OnomaDiorganwti,
    required this.EpithetoDiorganwti,
    required this.meros,
    required this.hmeromhnia,
    this.diarkeia = const Duration(hours: 4),
    required this.perigrafh,
    this.eikona = './assets/images/Media.png',
  }) {
    live = (DateTime.now().isAfter(hmeromhnia) &&
        DateTime.now().isBefore(hmeromhnia.add(diarkeia)));
  }
}
