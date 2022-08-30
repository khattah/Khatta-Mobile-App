import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/active_packages.dart';
import 'package:jt_trading/src/screens/home/browse_packages.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PackageProvider _packageProvider;
  @override
  void initState() {
    // TODO: implement initState
    //
    // Future.microtask(() {
    //   Provider.of<PackageProvider>(context, listen: false)
    //       .fetchActivePackages();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _packageProvider = Provider.of<PackageProvider>(context);
    return Container(
      child:  _packageProvider.activePackages.length == 0&&!_packageProvider.activePackageLoader
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: noPackages(context, S.of(context).no_active_packages),
                )
              : Column(
                  children: [
                    Card(
                      elevation: .5,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: browsePackageBtn(context),
                      ),
                    ),
                    Expanded(
                      child: ActivePackages(),
                    )
                  ],
                ),
    );
  }
}
