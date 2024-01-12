import 'package:flutter/material.dart';
import 'package:managment/Screens/ProfilePage.dart';
import 'package:managment/Screens/add.dart';
import 'package:managment/Screens/home.dart';
import 'package:managment/Screens/statistics.dart';

import '../Subscription/subscriptionPage.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List Screen = [Home(), Statistics(), AddSubScriptionView(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Add_Screen()));
        },
        child: Icon(Icons.add,color: Colors.lightBlue.shade50,),
        backgroundColor: Colors.blueGrey.shade600,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        height: 60,

        color: Colors.blue.shade700.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0 ? Colors.white : Colors.lightBlue.shade50,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: index_color == 1 ? Colors.white : Colors.lightBlue.shade50,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.subscriptions,
                  size: 30,
                  color: index_color == 2 ? Colors.white : Colors.lightBlue.shade50,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.person_outlined,
                  size: 30,
                  color: index_color == 3 ? Colors.white : Colors.lightBlue.shade50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
