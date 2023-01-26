import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testwheren/MyUpdates.dart';
import 'MyProfile.dart';
import 'main.dart';
import 'MySettings.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 100, 13, 134),
            labelColor: Color.fromARGB(255, 100, 13, 134),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: Text('Upcoming'),
              ),
              Tab(
                icon: Text('Live'),
              ),
              Tab(
                icon: Text('Past Events'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Column(children: [
              EventCard(
                OnomaEvent: 'Tropical',
                OnomaDiorganwti: 'Vasilis',
                EpithetoDiorganwti: 'Andreou',
                ProperText: '4 Days Until The Event',
                EventPic: ('images/Media.png'),
                EventPlace: 'Gazi',
              ),
              EventCard(
                OnomaEvent: 'Trap House',
                OnomaDiorganwti: 'Skoe',
                EpithetoDiorganwti: 'Rams',
                ProperText: '4 Days Until The Event',
                EventPic: ('images/festival.jpg'),
                EventPlace: 'Sintagma',
              )
            ]),
            Column(children: [
              EventCard(
                OnomaEvent: 'House Party',
                OnomaDiorganwti: 'Aris',
                EpithetoDiorganwti: 'Anagnostou',
                ProperText: 'Event Is Live!',
                EventPic: ('images/festival.jpg'),
                EventPlace: 'Monastiraki',
              ),
            ]),
            Column(children: [
              EventCard(
                OnomaEvent: 'Open Partaki',
                OnomaDiorganwti: 'Anestis',
                EpithetoDiorganwti: 'Sapliaouras',
                ProperText: 'Old Event',
                EventPic: ('images/Media.png'),
                EventPlace: 'Kolonaki',
              ),
            ])
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 2,
            onTap: (value) {
              if (value == 0)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              if (value == 2)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyEvents()));
              if (value == 3)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyUpdates()));
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

class EventCard extends StatefulWidget {
  final String OnomaEvent;
  final String OnomaDiorganwti;
  final String EpithetoDiorganwti;
  final String ProperText;
  final String EventPic;
  final String EventPlace;

  const EventCard(
      {super.key,
      required this.OnomaEvent,
      required this.OnomaDiorganwti,
      required this.EpithetoDiorganwti,
      required this.ProperText,
      required this.EventPic,
      required this.EventPlace});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
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
                        OnomaEvent: widget.OnomaEvent,
                        meros: widget.EventPlace,
                        eikona: widget.EventPic,
                      ))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 234, 221, 255),
                    child: Text(
                        '${widget.OnomaDiorganwti[0]}${widget.EpithetoDiorganwti[0]}',
                        style:
                            TextStyle(color: Color.fromARGB(255, 33, 0, 93))),
                  ),
                  title: Text(widget.OnomaEvent),
                  subtitle: Text(widget.ProperText),
                  trailing: Image.asset(widget.EventPic)),
            ],
          ),
        ),
      ),
    );
  }
}
