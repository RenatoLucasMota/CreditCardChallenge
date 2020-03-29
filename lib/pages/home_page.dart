import 'package:credit_car_challenge/controllers/offset_controller.dart';
import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:credit_car_challenge/widgets/item_page.dart';
import 'package:credit_car_challenge/widgets/my_app_bar.dart';
import 'package:credit_car_challenge/widgets/panel_top.dart';
import 'package:credit_car_challenge/widgets/panel_top_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              MyAppBar(),
              Consumer<PageControllerApp>(
                  builder: (context, notifier, child) {
                    return AnimatedPadding(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.only(top: notifier.currentIndex != -1 ? 0 : 20,),
                                          child: AnimatedOpacity(
                        opacity: notifier.currentIndex != -1 ? 1 : 0,
                        child: child,
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  },
                  child: PanelTopTwo()),
              Consumer<PageControllerApp>(
                  builder: (context, notifier, child) {
                    return AnimatedOpacity(
                      opacity: notifier.currentIndex != -1 ? 0 : 1,
                      child: child,
                      duration: Duration(milliseconds: 300),
                    );
                  },
                  child: PanelTop()),
              Consumer<PageControllerApp>(
                builder: (context, notifier, child) => PageView(
                  physics:
                      Provider.of<PageControllerApp>(context, listen: false)
                                  .currentIndex !=
                              -1
                          ? NeverScrollableScrollPhysics()
                          : ClampingScrollPhysics(),
                  onPageChanged: (index) {
                    Provider.of<PageControllerApp>(context, listen: false)
                        .setPageIndex(index);
                  },
                  controller: _pageController,
                  children: <Widget>[
                    ItemPage(
                      index: 0,
                      imageURL:
                          'https://us.123rf.com/450wm/grebeshkovmaxim/grebeshkovmaxim1805/grebeshkovmaxim180500202/100769321-colorful-smooth-gradient-color-background-design-for-your-project-design-.jpg?ver=6',
                    ),
                    ItemPage(
                      index: 1,
                      imageURL:
                          'https://ak5.picdn.net/shutterstock/videos/1018020805/thumb/1.jpg',
                    ),
                    ItemPage(
                      index: 2,
                      imageURL:
                          'https://i.pinimg.com/736x/5c/ee/af/5ceeafdc811d2269821fb03df29374ff.jpg',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        create: (BuildContext context) => OffsetController(_pageController),
      ),
    );
  }
}
