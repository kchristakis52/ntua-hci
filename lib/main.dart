import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //Χρειαζεται για CreateEvent
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        colorSchemeSeed: Color.fromRGBO(103, 80, 164, 1),
        useMaterial3: true,
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.purple.shade50,
          helpTextStyle: TextStyle(fontSize: 14),
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
  bool showLive = false;
  final currevents = <Event>[
    Event(
      OnomaEvent: 'Tropical The Party',
      OnomaDiorganwti: 'Aggelos',
      EpithetoDiorganwti: 'Dimitriou',
      meros: 'Gazi Music Hall, Athens',
      hmeromhnia: DateTime(2023, 02, 13, 23, 00, 00),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      live: true,
    ),
    Event(
      OnomaEvent: 'House Festival',
      OnomaDiorganwti: 'Reece',
      EpithetoDiorganwti: 'Johnson',
      meros: 'Technopolis Gazi, Athens',
      hmeromhnia: DateTime(2023, 02, 20, 17, 0, 0),
      perigrafh:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      eikona: '/images/festival.jpg',
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
          itemCount: currevents.length,
          itemBuilder: ((context, index) {
            return EventItem(event: currevents[index]);
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateEvent()));
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
}

class EventItem extends StatefulWidget {
  final Event event;

  EventItem({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 15),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PastEvent(
                      OnomaEvent: widget.event.OnomaEvent,
                      meros: widget.event.meros,
                      eikona: widget.event.eikona,
                    ))),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color.fromARGB(255, 234, 221, 255),
                  child: Text(
                      '${widget.event.OnomaDiorganwti[0]}${widget.event.EpithetoDiorganwti[0]}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 33, 0, 93))),
                ),
                trailing: (widget.event.live)
                    ? const Icon(
                        Icons.radio_button_checked,
                        color: Color.fromARGB(255, 179, 38, 30),
                      )
                    : null,
                title: Text(
                    '${widget.event.OnomaDiorganwti} ${widget.event.EpithetoDiorganwti}'),
                subtitle: Text(
                  widget.event.meros,
                ),
              ),
              AspectRatio(
                  aspectRatio: 335 / 170,
                  child: Image.asset(
                    widget.event.eikona,
                    fit: BoxFit.fitWidth,
                  )),
              ListTile(
                title: Text(
                  widget.event.OnomaEvent,
                ),
                subtitle: Text(DateFormat('EEEE, d MMM yyyy HH:mm')
                    .format(widget.event.hmeromhnia)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.event.perigrafh,
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
                        backgroundColor:
                            const Color.fromARGB(255, 103, 80, 164)),
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

class Event {
  final String OnomaEvent;
  final String OnomaDiorganwti;
  final String EpithetoDiorganwti;
  final String meros;
  final DateTime hmeromhnia;
  final Duration diarkeia;
  final String perigrafh;
  final String eikona;
  final bool attending;
  final bool live;
  Event(
      {required this.OnomaEvent,
      required this.OnomaDiorganwti,
      required this.EpithetoDiorganwti,
      required this.meros,
      required this.hmeromhnia,
      this.diarkeia = const Duration(hours: 4),
      required this.perigrafh,
      this.eikona = 'images/Media.png',
      this.attending = false,
      this.live = false});
}
