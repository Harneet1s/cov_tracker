import 'package:flutter/material.dart';
import 'package:covtracker/datasorce.dart';

class Helpline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helplines'),
        leading: Icon(
          Icons.phone,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: DataSource.helplines.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                DataSource.helplines[index]['state'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(DataSource.helplines[index]['number']),
                )
              ],
            );
          }),
    );
  }
}
