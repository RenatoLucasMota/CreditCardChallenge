import 'package:flutter/material.dart';

class PanelTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 12),
        child: Container(
          //color: Colors.red,
          height: MediaQuery.of(context).size.height / 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('Bank Cards', style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold,)),
              CircleAvatar(backgroundImage: NetworkImage('https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')),
            ],),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Balance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[400])),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text('\$2346.15', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,)),
              ],
            ),
          ],),
        ),
      ),
    );
  }
}