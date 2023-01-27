import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //Χρειαζεται για MAXlengthEnforcement
import 'MySettings.dart';
import 'MyProfile.dart';
import 'PastEvent.dart';
import 'MyUpdates.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('College Nights'),
      ),
      body: ListView(
        children: [
          Container(
              height: 400,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(120.0),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          //
                        },
                        icon: Icon(Icons.camera_alt),
                        color: Colors.black54,
                      ),
                      TextButton(
                        child: Text('   Choose Image\nFrom Your Library'),
                        onPressed: () {
                          //
                        },
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple.shade50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple.shade50)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'Event Name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      isCollapsed: false),
                  style: TextStyle(
                    fontSize: 22,
                    shadows: null,
                  ),
                )),
          ),
          SizedBox(
            height: 6,
          ),
          ListTile(
              title: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.purple.shade50)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.purple.shade50)),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: 'Description',
                        contentPadding:
                            EdgeInsets.only(left: 10, right: 10, top: 20),
                        isCollapsed: false),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ))),
          SizedBox(
            height: 6,
          ),
          ListTile(
            title: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple.shade50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple.shade50)),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'Location',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      isCollapsed: false),
                  style: TextStyle(
                    fontSize: 22,
                    shadows: null,
                  ),
                )),
          ),
          SizedBox(
            height: 6,
          ),
          ListTile(
            title: Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(
                      'Event Date',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, bottom: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.today,
                            color: Colors.purple.shade700,
                          ),
                          label: Text(
                            'Enter Date',
                            style: TextStyle(color: Colors.purple.shade800),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.purple.shade700,
                            width: 4,
                          )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple.shade700,
                              width: 2,
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          hintText: 'mm/dd/yyyy',
                          contentPadding:
                              EdgeInsets.only(left: 10, right: 10, top: 40),
                          isCollapsed: false),
                      style: TextStyle(
                        fontSize: 22,
                        shadows: null,
                      ),
                    ),
                  ),
                  Positioned(
                      //Αν έχει μόνο padding τοτε δεν
                      //προσαρμόζεται σε άλλες οθόνες
                      right: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 130.0),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: (() {
                                  //
                                }),
                                child: Text(
                                  'Ok',
                                  style: TextStyle(fontSize: 20),
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            TextButton(
                                onPressed: (() {
                                  //
                                }),
                                child: Text('Cancel',
                                    style: TextStyle(fontSize: 20)))
                          ],
                        ),
                      )),
                ])),
          ),
          SizedBox(
            height: 6,
          ),
          ListTile(
            title: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child:
                  //Text(
                  //'Event Time',
                  //style: TextStyle(color: Colors.black, fontSize: 22),
                  //),

                  Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Text(
                      'Event Time',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        eventHours(),
                        SizedBox(
                          width: 6,
                        ),
                        eventTimeDot(),
                        SizedBox(
                          width: 6,
                        ),
                        eventMinutes()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (() {
                              //
                            }),
                            child: Text(
                              'Ok',
                              style: TextStyle(fontSize: 20),
                            )),
                        SizedBox(
                          width: 8,
                        ),
                        TextButton(
                            onPressed: (() {
                              //
                            }),
                            child:
                                Text('Cancel', style: TextStyle(fontSize: 20)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: (() {
                      //
                    }),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 20, color: Colors.purple.shade900),
                    )),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: (() {
                      //
                    }),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.purple.shade900),
                    child: Text('Create Event',
                        style: TextStyle(fontSize: 20, color: Colors.white)))
              ],
            ),
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }

  Widget eventHours() => SizedBox(
        width: 100,
        child: TextField(
          keyboardType: TextInputType.number,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 2,
          decoration: InputDecoration(
              hintText: "HH",
              hintStyle: TextStyle(color: Colors.black, fontSize: 40),
              counterText: '',
              contentPadding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple))),
          style: TextStyle(fontSize: 50),
        ),
      );

  Widget eventTimeDot() => Text(
        ':',
        style: TextStyle(color: Colors.black, fontSize: 50),
      );

  Widget eventMinutes() => SizedBox(
        width: 100,
        child: TextField(
          keyboardType: TextInputType.number,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 2,
          decoration: InputDecoration(
              hintText: "MM",
              hintStyle: TextStyle(color: Colors.black, fontSize: 34),
              counterText: '',
              contentPadding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple))),
          style: TextStyle(fontSize: 50),
        ),
      );
}
