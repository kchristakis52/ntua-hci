import 'dart:io';
import 'package:testwheren/MyUpdates.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'MyProfile.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  bool button = true;

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
          bottom: PreferredSize(
              child: Container(
                color: Colors.black,
                height: 0.25,
              ),
              preferredSize: Size.fromHeight(0.25)),
        ),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
                title: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: null,
                leading: Icon(
                  Icons.notifications_outlined,
                  color: Colors.grey.shade700,
                  size: 30,
                ),
                trailing: AnimatedContainer(
                  //Εδώ ξεκινάει το switch
                  duration: Duration(milliseconds: 600),
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: button
                          ? Colors.purple.shade900
                          : Color.fromARGB(255, 241, 224, 243),
                      border: button
                          ? Border.all(color: Colors.purple.shade900, width: 2)
                          : Border.all(color: Colors.grey.shade600, width: 2)),
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        top: 1,
                        left: button ? 40 : 0,
                        right: button ? 0 : 40,
                        child: InkWell(
                          onTap: toggleButton,
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return RotationTransition(
                                    child: child, turns: animation);
                              },
                              child: button
                                  ? Icon(Icons.circle,
                                      color: Colors.white,
                                      size: 35,
                                      key: UniqueKey())
                                  : Icon(Icons.circle,
                                      color: Colors.grey.shade600,
                                      size: 35,
                                      key: UniqueKey())),
                        ),
                      )
                    ],
                  ),
                ) //Εδώ τελειώνει
                ),
            Divider(),
            ListTile(
              title: Text(
                'Levels',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.person_outlined,
                color: Colors.grey.shade700,
                size: 30,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Delete Account',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.delete,
                color: Colors.grey.shade700,
                size: 30,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.grey.shade700,
                size: 30,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 4,
            onTap: (value) {
              if (value == 0)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              else if (value == 3)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyUpdates()));
              else if (value == 4)
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

  toggleButton() {
    setState(() {
      button = !button;
    });
  }
  /*
  ListView _buildListView() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (_, index) {
        return ListTile(
            title: Text('The list item #$index'),
            subtitle: null,
            leading: Icon(Icons.thumb_up),
            trailing: Icon(Icons.thumb_down));
      },
    );
  }
*/

}
