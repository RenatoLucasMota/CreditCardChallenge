import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:credit_car_challenge/framework/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class ItemPage extends StatelessWidget {
  final Color color;
  final int index;
  final String numberCard;
  final String name;
  final String imageURL;
  final String operadoraURL;

  final MultiTrackTween multiTrackTween = MultiTrackTween([
    Track('rotate')
        .add(Duration(milliseconds: 300), Tween(begin: 0.0, end: -0.5)),
    Track('scale')
        .add(Duration(milliseconds: 300), Tween(begin: 1.0, end: 0.5)),
    Track('opacity')
        .add(Duration(milliseconds: 300), Tween(begin: 1.0, end: 0.0)),
    Track('padding_right')
        .add(Duration(milliseconds: 300), Tween(begin: 0.0, end: 20))
  ]);

  final MultiTrackTween animacaoCard = MultiTrackTween([
    Track('rotate')
        .add(Duration(milliseconds: 300), Tween(begin: 0.0, end: 1.57)),
    Track('top').add(Duration(milliseconds: 300), Tween(begin: 0.20, end: 0.05),
        curve: Curves.easeInCubic),
    Track('scale').add(Duration(milliseconds: 300), Tween(begin: 1.0, end: 0.7),
        curve: Curves.easeInCubic)
  ]);

  ItemPage(
      {Key key,
      this.color,
      this.index,
      this.numberCard,
      this.name,
      this.imageURL,
      this.operadoraURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int currentIndex =
            Provider.of<PageControllerApp>(context, listen: false).currentIndex;
        if (currentIndex != -1) {
          Provider.of<PageControllerApp>(context, listen: false).setisFlipped(
              !Provider.of<PageControllerApp>(context, listen: false)
                  .isFlipped);
        } else {
          Provider.of<PageControllerApp>(context, listen: false)
              .setCurrentIndex(index);
        }
      },
      child: Consumer<PageControllerApp>(
        child: FlippableBox(
          front: FrontCard(
            operadoraURL: operadoraURL,
            imageURL: imageURL,
            color: color,
          ),
          back: BackCard(color),
          isFlipped:
              Provider.of<PageControllerApp>(context, listen: false).isFlipped,
        ),
        builder: (BuildContext context, PageControllerApp value, Widget child) {
          int pageIndex =
              Provider.of<PageControllerApp>(context, listen: false).index;

          int currentIndex =
              Provider.of<PageControllerApp>(context, listen: false)
                  .currentIndex;

          bool hideCard;
          if (currentIndex != -1) {
            if (index == currentIndex) {
              hideCard = false;
            } else {
              hideCard = true;
            }
          } else {
            hideCard = false;
          }

          return AnimatedOpacity(
            duration: Duration(milliseconds: !hideCard ? 3000 : 10),
            opacity: hideCard ? 0 : 1,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ControlledAnimation(
                  tween: animacaoCard,
                  duration: animacaoCard.duration,
                  playback: currentIndex != -1
                      ? Playback.PLAY_FORWARD
                      : Playback.PLAY_REVERSE,
                  builder: (context, animation) {
                    return Positioned(
                      top:
                          MediaQuery.of(context).size.height * animation['top'],
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Transform.rotate(
                        angle: animation['rotate'],
                        child: Transform.scale(
                          scale: animation['scale'],
                          child: ControlledAnimation(
                            tween: multiTrackTween,
                            duration: multiTrackTween.duration,
                            playback: pageIndex > index
                                ? Playback.PLAY_FORWARD
                                : Playback.PLAY_REVERSE,
                            builder: (context, animation) {
                              return Transform.rotate(
                                angle: animation['rotate'],
                                child: Transform.scale(
                                  child: Opacity(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 0/*animation['padding_right']*/),
                                      child: child,
                                    ),
                                    opacity: animation['opacity'],
                                  ),
                                  scale: animation['scale'],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FrontCard extends Container {
  final String imageURL;
  final Color color;
  final String operadoraURL;

  FrontCard({
    Key key,
    this.imageURL,
    this.color,
    this.operadoraURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            RotatedBox(
              quarterTurns: 1,
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Credit Card',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Image.network(
                            'https://i.ya-webdesign.com/images/white-wifi-logo-png-6.png',
                            width: 45,
                            height: 45),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Row(
                      children: <Widget>[
                        Image.network(
                            'https://img.icons8.com/cotton/2x/sim-card-chip--v1.png',
                            width: 70,
                            height: 70),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Text('1223 56655 22665 26263',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('CARD HOLDER', style: TextStyle(fontSize: 12)),
                            Text('Renato Mota',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Image.network(operadoraURL, width: 60, height: 60),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 10), blurRadius: 15)
      ], borderRadius: BorderRadius.circular(20), color: color),
    );
  }
}

class BackCard extends Container {
  final Color color;

  BackCard(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RotatedBox(
        quarterTurns: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                color: Colors.black38,
                height: 60,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Container(
                  color: Colors.white,
                  height: 60,
                  width: 250,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        '2263 212',
                        style: TextStyle(color: Colors.grey[800], fontSize: 21),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.07,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Text('1223 56655 22665 26263',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: color,
                          shadows: [
                            Shadow(color: Colors.black38, offset: Offset(0, 3)),
                          ]))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('', style: TextStyle(fontSize: 12)),
                      Text('',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Service Hotline / 0800 223 545',
                        style: TextStyle(fontSize: 16)),
                  ),
                  //Image.network(operadoraURL, width: 60, height: 60),
                ],
              ),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 10), blurRadius: 15)
      ], borderRadius: BorderRadius.circular(20), color: color),
    );
  }
}
