import 'package:credit_car_challenge/controllers/page_controller.dart';
import 'package:credit_car_challenge/widgets/item_page.dart';
import 'package:credit_car_challenge/widgets/my_app_bar.dart';
import 'package:credit_car_challenge/widgets/panel_top.dart';
import 'package:credit_car_challenge/widgets/panel_top_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    Provider.of<PageControllerApp>(context, listen: false).hideSheet();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PageControllerApp>(context, listen: false).hideSheet();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            MyAppBar(),
            PanelTopTwo(),
            PanelTop(),
            Consumer<PageControllerApp>(
              builder: (context, notifier, child) => Container(
                margin: EdgeInsets.only(top: 60),
                height: MediaQuery.of(context).size.height - 60,
                child: PageView(
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
                      color: Colors.pink,
                      imageURL:
                          'https://us.123rf.com/450wm/grebeshkovmaxim/grebeshkovmaxim1805/grebeshkovmaxim180500202/100769321-colorful-smooth-gradient-color-background-design-for-your-project-design-.jpg?ver=6',
                      operadoraURL:
                          'https://1000marcas.net/wp-content/uploads/2019/12/MasterCard-Logo.png',
                    ),
                    ItemPage(
                      index: 1,
                      color: Colors.lightBlue,
                      operadoraURL:
                          'https://lh3.googleusercontent.com/proxy/9ZcDV6h-xIzjUGU-TjFt1OrOrYzDmf5Sh4hKobg716Et7KITPElKJHIlwq3tOgvoDrzzMpE9PrGVyqZiDhRCWAwXjTlGj03gz3VQfHMtzv020fAJaZrOwn9HrQhAwOJV',
                      imageURL:
                          'https://ak5.picdn.net/shutterstock/videos/1018020805/thumb/1.jpg',
                    ),
                    ItemPage(
                      color: Colors.grey[800],
                      index: 2,
                      operadoraURL:
                          'https://1000marcas.net/wp-content/uploads/2019/12/MasterCard-Logo.png',
                      imageURL:
                          'https://i.pinimg.com/736x/5c/ee/af/5ceeafdc811d2269821fb03df29374ff.jpg',
                    )
                  ],
                ),
              ),
            ),
            Consumer<PageControllerApp>(
              builder: (context, value, child) {
                bool isHide = Provider.of<PageControllerApp>(context, listen: false).isHide;
                return AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: isHide ? 0 : 1,
                                  child: SlidingSheet( 
                    elevation: 8,
                    cornerRadius: 16,
                    listener: (state){
                       Provider.of<PageControllerApp>(context, listen: false)
                            .setState(state);
                      Provider.of<PageControllerApp>(context, listen: false)
                            .setProgress(state.progress);
                    },
                    color: ThemeData.dark().primaryColor,
                    controller:
                        Provider.of<PageControllerApp>(context, listen: false)
                            .sheetController,
                            
                    snapSpec:  SnapSpec(
                      snap: true,
                      snappings: [0.2, 0.6, 0.92],
                      positioning: SnapPositioning.relativeToAvailableSpace,
                    ),
                    builder: (context, state) {
                      return Material(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Text('This is the content of the sheet'),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
