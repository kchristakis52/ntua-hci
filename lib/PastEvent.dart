import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'globals.dart' as globals;

class PastEvent extends StatefulWidget {
  final String OnomaEvent;
  final String meros;
  final String eikona;
  double rating = 4;
  PastEvent({
    Key? key,
    required this.OnomaEvent,
    required this.meros,
    required this.eikona,
  }) : super(key: key);

  @override
  State<PastEvent> createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {
  bool postReview = false;
  List<Review> Reviews = <Review>[
    Review(
      Fname: 'Kostantinos',
      Lname: 'Christakis',
      revText: 'Supporting line text lorem ipsum dolor sit amet, consectetur',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.OnomaEvent,
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
                      fit: BoxFit.fitHeight, image: AssetImage(widget.eikona)),
                )),
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.25),
              child: Container(
                color: Colors.black,
                height: 0.25,
              )),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.baseline,
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Expanded(
                    child: RatingBarIndicator(
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      rating: widget.rating,
                      itemSize: 30,
                    ),
                  ),
                ),
                Expanded(child: Text("${widget.rating}/5")),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Review(
                    Fname: 'Konstantinos',
                    Lname: 'Christakis',
                  )
                ],
              ),
            ),
            postReview ? ReviewPoster() : SizedBox()
          ],
        ),
        floatingActionButton: postReview
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: FloatingActionButton(
                  onPressed: (() {
                    setState(() {
                      postReview = true;
                    });
                  }),
                  tooltip: 'Post Review',
                  child: const Icon(Icons.reviews),
                ),
              ));
  }

  Widget ReviewPoster() => Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 195, 233),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          globals.firtname + globals.lastname,
                          style: TextStyle(fontSize: 20),
                        )),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RatingBar.builder(
                        itemSize: 35,
                        initialRating: 3.5,
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {
                          //
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        setState(() {
                          postReview = false;
                        });
                      },
                    ),
                    labelText: 'Review Text',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class Review extends StatelessWidget {
  int score = Random().nextInt(4) + 1;
  String Fname;
  String Lname;
  String revText;
  DateTime now = DateTime.now();

  Review({
    Key? key,
    required this.Fname,
    required this.Lname,
    this.revText =
        'Supporting line text lorem ipsum dolor sit amet, consectetur',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: EdgeInsets.only(left: 8),
      isThreeLine: true,
      leading: CircleAvatar(
        child: Text('${Fname[0]}${Lname[0]}',
            style: TextStyle(color: Color.fromARGB(255, 33, 0, 93))),
        radius: 20,
        backgroundColor: Color.fromARGB(255, 234, 221, 255),
      ),
      title: Text(
        "$Fname $Lname",
      ),
      // trailing: Text('dd/mm/yy'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RatingBarIndicator(
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                rating: score.toDouble(),
                itemSize: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('${now.day}/${now.month}/${now.year}'),
              ),
            ],
          ),
          Text(revText),
        ],
      ),
    );
  }
}
