import 'package:flutter/material.dart';

class LiveEventView extends StatefulWidget {
  final String meros;
  const LiveEventView({
    super.key,
    required this.title,
    required this.eikona,
    required this.meros,
  });

  final String title;
  final String eikona;

  @override
  State<LiveEventView> createState() => _LiveEventViewState();
}

class _LiveEventViewState extends State<LiveEventView> {
  final _commentController = TextEditingController();
  String Comment = "";

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
                child: _buildListView()), //Expanded για List μέσα σε Column
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          //
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
      itemCount: 15,
      itemBuilder: (_, index) {
        return ListTile(
            title: Text('Username'),
            subtitle: Text('Live Comment #$index'),
            leading: CircleAvatar(
                backgroundColor: Colors.purple.shade800,
                radius: 20,
                child: Text(
                  'FL',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            trailing: Text(
              'HH:MM',
              style: TextStyle(fontSize: 16),
            ));
      },
    );
  }
}
