import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/home/history.dart';
import 'package:jt_trading/src/screens/home/home.dart';
import 'package:jt_trading/src/screens/home/settings.dart';
import 'package:jt_trading/src/screens/home/subscripe_with_link.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:provider/provider.dart';

class MainTabs extends StatefulWidget {
  // final String isAuth;
  // MainTabs({@required this.isAuth});
  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  int _currentIndex = 0;
  List<String> titles;
  //  List<String> titles = [
  //   S.of(context).app_title,
  // S.of(context).history,
  //    S.of(context).settings,
  //  ];
  final List<Widget> _children = [HomePage(), History(), Settings()];
  DateTime currentBackPressTime;
  void onTabTapped(int index) {
    print(index);
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
    if (index == 0)
      Provider.of<PackageProvider>(context, listen: false)
          .fetchActivePackages();
    if (index == 1)
      Provider.of<PackageProvider>(context, listen: false)
          .fetchHistoryPackages();
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProfileProvider>(context, listen: false).loadUserInfo();
    Provider.of<PackageProvider>(context, listen: false).fetchActivePackages();
    // if (widget.isAuth != null)  Provider.of<ProfileProvider>(context,listen: false).loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    titles = [
      S.of(context).app_title,
      S.of(context).history,
      S.of(context).settings,
    ];
    return WillPopScope(
      onWillPop: () {
        if (_currentIndex != 0) {
          onTabTapped(0);
          return null;
        }
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          CustomToast().showToast(S.of(context).click_again_to_exit);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FittedBox(child: appLogo(width: 100, height: 100)),
          ),
          title: Text(titles[_currentIndex]),
        ),
        body: _children[_currentIndex],
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(NavSlideFromRight(page: SubscripeWithLink()));
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
//          showSelectedLabels: false,
//          showUnselectedLabels: false,
          elevation: 5,
          onTap: onTabTapped, // new
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
          // backgroundColor: Colors.grey[20],
//          elevation: 0,

          currentIndex: _currentIndex, // new
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
//              title: Icon(Icons.home),
              label: S.of(context).home,
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
//              title: Icon(Icons.home),
              label: S.of(context).history,
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
//              title: Icon(Icons.home),
              label: S.of(context).settings,
            ),
          ],
        ),
      ),
    );
  }
}
