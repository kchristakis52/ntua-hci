import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';
import 'MyEvents.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search),
            )
          ],
          bottom: PreferredSize(
              child: Container(
                color: Colors.black,
                height: 0.25,
              ),
              preferredSize: Size.fromHeight(0.25)),
        ),
        //body: ,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
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

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = ["Tropical", "The Party", "House Festival"];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var events in searchTerms) {
      if (events.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(events);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var events in searchTerms) {
      if (events.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(events);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
