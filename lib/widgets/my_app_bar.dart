import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08 + MediaQuery.of(context).padding.top,
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                Provider.of<PageControllerApp>(context, listen: false)
                    .setCurrentIndex(-1);
                await Provider.of<PageControllerApp>(context, listen: false)
                    .hideSheet();
              },
            ),
            Consumer<PageControllerApp>(
              builder: (context, value, child) {
                return AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: value.currentIndex != -1 ? 1 : 0,
                    child: child);
              },
              child: IconButton(
                icon: Icon(Icons.check_circle_outline),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
