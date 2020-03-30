import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PanelTopTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllerApp>(
      builder: (context, notifier, child) {
        double spec = Provider.of<PageControllerApp>(context, listen: false)
                  .spec;
        return AnimatedPadding(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInCubic,
          padding: EdgeInsets.only(
            top: notifier.currentIndex != -1 ? 0 : 20,
          ),
          child: AnimatedOpacity(
            opacity: notifier.currentIndex == -1 || spec >= 0.6 ? 0 : 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 12),
                child: Container(
                  //color: Colors.red,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Full Card',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      AnimatedPadding(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                          top: notifier.currentIndex != -1 ? 0 : 40,
                        ),
                        child: Text('Rotate the card to view the security code',
                            style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
        );
      },
    );
  }
}
