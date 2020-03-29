import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
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
