import 'package:flutter/material.dart';

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
            Opacity(
              opacity: 1,
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
