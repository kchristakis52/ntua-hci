import 'dart:io';
import 'package:flutter/material.dart';
import 'package:testwheren/LiveEventView.dart';
import 'package:testwheren/MyUpdates.dart';
import 'package:testwheren/UpcomingEvent.dart';
import 'MyProfile.dart';
import 'main.dart';
import 'package:intl/intl.dart';
import 'PastEvent.dart';
import 'globals.dart' as globals;

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
    List<Event> liveeventslist = [];
    List<Event> pasteventslist = [];
    List<Event> upcomingeventslist = [];
    for (int i = 0; i < globals.myeventslist.length; i++) {
      if (DateTime.now().isBefore(globals.myeventslist[i].hmeromhnia)) {
        upcomingeventslist.add(globals.myeventslist[i]);
      } else if (DateTime.now().isAfter(globals.myeventslist[i].hmeromhnia
          .add(globals.myeventslist[i].diarkeia))) {
        pasteventslist.add(globals.myeventslist[i]);
      } else {
        liveeventslist.add(globals.myeventslist[i]);
      }
    }
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
          ListView.builder(
            itemCount: upcomingeventslist.length,
            itemBuilder: (BuildContext context, int index) {
              return EventCard(
                event: upcomingeventslist[index],
                tabindex: 0,
              );
            },
          ),
          ListView.builder(
            itemCount: liveeventslist.length,
            itemBuilder: (BuildContext context, int index) {
              return EventCard(
                event: liveeventslist[index],
                tabindex: 1,
              );
            },
          ),
          ListView.builder(
            itemCount: pasteventslist.length,
            itemBuilder: (BuildContext context, int index) {
              return EventCard(
                event: pasteventslist[index],
                tabindex: 2,
              );
            },
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  final Event event;
  final int tabindex;

  const EventCard({super.key, required this.event, required this.tabindex});

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
          onTap: () {
            if (widget.tabindex == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UpcomingEvent(event: widget.event)));
            } else if (widget.tabindex == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LiveEventView(
                            title: widget.event.OnomaEvent,
                            meros: widget.event.meros,
                            eikona: widget.event.eikona,
                          )));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PastEvent(
                            OnomaEvent: widget.event.OnomaEvent,
                            meros: widget.event.meros,
                            eikona: widget.event.eikona,
                          )));
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 234, 221, 255),
                    child: Text(
                        '${widget.event.OnomaDiorganwti[0]}${widget.event.EpithetoDiorganwti[0]}',
                        style:
                            TextStyle(color: Color.fromARGB(255, 33, 0, 93))),
                  ),
                  title: Text(widget.event.OnomaEvent),
                  subtitle: Text(DateFormat('EEEE, d MMM yyyy HH:mm')
                      .format(widget.event.hmeromhnia)),
                  trailing: Image.asset(widget.event.eikona)),
            ],
          ),
        ),
      ),
    );
  }
}
