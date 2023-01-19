import 'dart:io';

import 'package:flutter/material.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key, required this.title});
  final String title;

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  bool button = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              null;
            },
            icon: Icon(
              Icons.abc,
              color: Colors.white,
            ), //Κεντραρει το College Nights
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          title: Center(
              child: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontSize: 28),
          )),
          actions: [
            IconButton(
                onPressed: () {
                  //Go to profile
                },
                icon: Icon(Icons.account_circle_rounded,
                    color: Colors.black, size: 30))
          ],
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
                  icon: Icon(Icons.notifications_outlined),
                  label: 'Notifications'),
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
