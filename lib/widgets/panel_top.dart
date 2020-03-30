import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllerApp>(
      builder: (context, value, child) {
        return AnimatedOpacity(
          opacity: value.currentIndex != -1 ? 0 : 1,
          child: child,
          curve: Curves.easeInCubic,
          duration: Duration(milliseconds: 400),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Bank Cards',
                        style: TextStyle(
                          fontSize: 38 + MediaQuery.of(context).size.width * 0.001,
                          fontWeight: FontWeight.bold,
                        )),
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80')),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Balance',
                        style: TextStyle(
                            fontSize: 16 + MediaQuery.of(context).size.width * 0.001,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400])),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text('\$2346.15',
                        style: TextStyle(
                          fontSize: 28 + MediaQuery.of(context).size.width * 0.001,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
