import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.speedometer),
                    Text('Pendapatan'),
                  ],
                ),
                Text('Rp.1000.000')
              ],
            ),
          ),
        )
      ],
    );
  }
}