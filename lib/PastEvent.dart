import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PastEvent extends StatefulWidget {
  final String OnomaEvent;
  final String meros;
  double rating = 4;
  PastEvent({
    Key? key,
    required this.OnomaEvent,
    required this.meros,
  }) : super(key: key);

  @override
  State<PastEvent> createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,

          title: Text(
            widget.OnomaEvent,
          ),
          //actions: [Image.asset(name)],
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
                Flexible(
                  child: RatingBarIndicator(
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    rating: widget.rating,
                    itemSize: 30,
                  ),
                ),
                Expanded(child: Text("${widget.rating}/5")),
              ],
            ),
            Expanded(
              child: ListView(
                children: [Review()],
              ),
            )
          ],
        ));
  }
}

class Review extends StatelessWidget {
  //double score;

  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.amber,
      ),
      title: Text('Konstantinos Christakis'),
      subtitle:
          Text('Supporting line text lorem ipsum dolor sit amet, consectetur'),
    );
  }
}
