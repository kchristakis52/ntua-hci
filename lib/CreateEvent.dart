import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //Χρειαζεται για MAXlengthEnforcement

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();

  String name = '';
  String description = '';
  String location = '';

  TimeOfDay _eventTime = TimeOfDay.now();
  DateTime _eventDate = DateTime.now();

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
                  controller: _nameController,
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
                    controller: _descriptionController,
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
                  controller: _locationController,
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
              title: DatePickerDialog(
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2030),
          )),
          SizedBox(
            height: 6,
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TimePickerDialog(
                initialTime: _eventTime,
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
                      //πίσω στο home page
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
                      setState(() async {
                        name = _nameController.text;
                        description = _descriptionController.text;
                        location = _locationController.text;
                      });
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
          Text(_eventTime.toString()),
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
