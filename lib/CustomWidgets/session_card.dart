import 'package:digitalpsychologist/DataModels/session.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SessionCard extends StatelessWidget {
  final int index;
  final Session session;
  SessionCard({this.index, this.session});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Session $index',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${DateFormat.jm().format(session.time)}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${DateFormat.yMMMd().format(session.time)}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 4.0,
              percent: session.stressLevel/100,
              center: new Text(session.stressLevel.toString()),
            )
          ],
        ),
      ),
    );
  }
}
