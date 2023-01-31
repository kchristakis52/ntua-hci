import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class LiveEventView extends StatefulWidget {
  final String meros;
  const LiveEventView({
    super.key,
    required this.title,
    required this.eikona,
    required this.meros,
    //required this.Username, //apo profile
    //required this.FirstName, //apo profile
    //required this.LastName, //apo profile
  });

  final String title;
  final String eikona;
  //final String Username;
  //final String FirstName;
  //final String LastName;

  @override
  State<LiveEventView> createState() => _LiveEventViewState();
}

class _LiveEventViewState extends State<LiveEventView> {
  final _commentController = TextEditingController();
  String Comment = "";
  String time = "";
  List<LiveComment> Feedback = <LiveComment>[
    LiveComment(
        commentBody: "Εδώ περνάμε καλά :D",
        UploadTime: TimeOfDay(hour: 20, minute: 32),
        FirstName: "Kyriakh",
        LastName: "Pantelopoulou"),
    LiveComment(
        commentBody: "Τελειωσαν τα ποτα!",
        UploadTime: TimeOfDay(hour: 21, minute: 03),
        FirstName: "Γιώργος",
        LastName: "Καραγιώργος"),
    LiveComment(
        commentBody: "Έφερα ποτά!!",
        UploadTime: TimeOfDay(hour: 21, minute: 10),
        FirstName: "xXPotoFertisXx",
        LastName: "_"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            shadowColor: Colors.black,
            elevation: 2,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.radio_button_checked_outlined,
                  color: Color.fromARGB(255, 179, 38, 30),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 20,
                  child: Container(
                      decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(widget.eikona)),
                  )),
                ),
              )
            ],
          )),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(widget.meros),
                    ),
                  ),
                ),
                Flexible(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('180'),
                    ),
                  ),
                ),
              ],
            ),

            Divider(
              height: 5,
              color: Colors.grey.shade400,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: Feedback.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                        Feedback[index].FirstName + Feedback[index].LastName),
                    subtitle: Text(Feedback[index].commentBody),
                    leading: CircleAvatar(
                        backgroundColor: Colors.purple.shade800,
                        radius: 20,
                        child: Text(
                          Feedback[index].FirstName[0] +
                              Feedback[index].LastName[0],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    trailing: Text(
                      Feedback[index].UploadTime.format(context).toString(),
                      style: TextStyle(fontSize: 16),
                    ));
              },
            )), //Expanded για List μέσα σε Column
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          Comment = _commentController.text;
                          _commentController.clear();
                          time = TimeOfDay.now().format(context).toString();
                          Feedback.add(LiveComment(
                              UploadTime: TimeOfDay.now(),
                              commentBody: Comment,
                              FirstName: globals.firtname,
                              LastName: globals.lastname));
                          setState(() {});
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Type your message'),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: (() {
            //
          }),
          tooltip: 'Post Story',
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: Feedback.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(Feedback[index].FirstName + Feedback[index].LastName),
            subtitle: Text(Feedback[index].commentBody),
            leading: CircleAvatar(
                backgroundColor: Colors.purple.shade800,
                radius: 20,
                child: Text(
                  Feedback[index].FirstName[0] + Feedback[index].LastName[0],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            trailing: Text(
              Feedback[index].UploadTime.format(context).toString(),
              style: TextStyle(fontSize: 16),
            ));
      },
    );
  }
}

class LiveComment {
  final String FirstName;
  final String LastName;
  final String commentBody;
  final TimeOfDay UploadTime;

  LiveComment({
    this.FirstName = "FirstName",
    this.LastName = "LastName",
    required this.commentBody,
    required this.UploadTime,
  });
}
