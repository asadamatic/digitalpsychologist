import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class NewSessions extends StatefulWidget {
  @override
  _NewSessionsState createState() => _NewSessionsState();
}

class _NewSessionsState extends State<NewSessions> {
  final Random random = new Random();

  Future<int> returnStressLevel() {
    return Future.delayed(Duration(seconds: 3))
        .then((value) => random.nextInt(75 - 40) + 40);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Session'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<int>(
              future: returnStressLevel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your stress level is ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data.toString(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Wait while your stress level is being evaluated...',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SkeletonAnimation(
                          borderRadius: BorderRadius.circular(10.0),
                          shimmerColor: Colors.white54,
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[300]),
                          )),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
