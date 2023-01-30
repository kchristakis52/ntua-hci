import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';
import 'LiveEventView.dart';
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
  late List<Event> viewnowlist;
  List<Event> myeventslist = <Event>[];
  List<Event> liveeventslist = <Event>[];
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
      diarkeia: Duration(hours: 4),
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
        diarkeia: Duration(hours: 4)),
    Event(
        OnomaEvent: 'The Party',
        OnomaDiorganwti: 'Lorem',
        EpithetoDiorganwti: 'Ipsum',
        meros: 'Beach, Athens',
        hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
        perigrafh:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        diarkeia: Duration(hours: 4)),
    Event(
        OnomaEvent: 'The Party',
        OnomaDiorganwti: 'Lorem',
        EpithetoDiorganwti: 'Ipsum',
        meros: 'Beach, Athens',
        hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
        perigrafh:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        diarkeia: Duration(hours: 4)),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    liveeventslist = [];
    for (int i = 0; i < currevents.length; i++) {
      if (DateTime.now().isAfter(currevents[i].hmeromhnia) &&
          DateTime.now()
              .isBefore(currevents[i].hmeromhnia.add(currevents[i].diarkeia))) {
        currevents[i].live = true;
        liveeventslist.add(currevents[i]);
      }
    }
    viewnowlist = (!showLive) ? currevents : liveeventslist;
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
            return Container(
              margin: const EdgeInsets.only(
                  left: 12, right: 12, bottom: 20, top: 15),
              child: InkWell(
                onTap: () {
                  if (!viewnowlist[index].live) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PastEvent(
                                  OnomaEvent: viewnowlist[index].OnomaEvent,
                                  meros: viewnowlist[index].meros,
                                  eikona: viewnowlist[index].eikona,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LiveEventView(
                                  title: viewnowlist[index].OnomaEvent,
                                  eikona: viewnowlist[index].eikona,
                                )));
                  }
                },
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
                              '${viewnowlist[index].OnomaDiorganwti[0]}${viewnowlist[index].EpithetoDiorganwti[0]}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 33, 0, 93))),
                        ),
                        trailing: (viewnowlist[index].live)
                            ? const Icon(
                                Icons.radio_button_checked,
                                color: Color.fromARGB(255, 179, 38, 30),
                              )
                            : null,
                        title: Text(
                            '${viewnowlist[index].OnomaDiorganwti} ${viewnowlist[index].EpithetoDiorganwti}'),
                        subtitle: Text(
                          viewnowlist[index].meros,
                        ),
                      ),
                      AspectRatio(
                          aspectRatio: 335 / 170,
                          child: Image.asset(
                            viewnowlist[index].eikona,
                            fit: BoxFit.fitWidth,
                          )),
                      ListTile(
                        title: Text(
                          viewnowlist[index].OnomaEvent,
                        ),
                        subtitle: Text(DateFormat('EEEE, d MMM yyyy HH:mm')
                            .format(viewnowlist[index].hmeromhnia)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewnowlist[index].perigrafh,
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              viewnowlist.removeAt(index);
                              setState(() {});
                            },
                            child: const Text('Not Interested'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 103, 80, 164)),
                            onPressed: () {
                              myeventslist.add(viewnowlist[index]);
                              viewnowlist.removeAt(index);
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
