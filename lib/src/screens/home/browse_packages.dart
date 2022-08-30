import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/package_provider.dart';
import 'package:jt_trading/src/screens/home/package_details_browse.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/screens/widgets/package_widgets.dart';
import 'package:provider/provider.dart';

class BrowsePackages extends StatefulWidget {
  @override
  _BrowsePackagesState createState() => _BrowsePackagesState();
}

class _BrowsePackagesState extends State<BrowsePackages> {
  PackageProvider _packageProvider;
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(Duration(), () {
    //   Provider.of<PackageProvider>(context, listen: false).fetchPackages();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _packageProvider = Provider.of<PackageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).packages),
      ),
      body: CustomListView(
        child: _packageProvider.packageLoader
            ? Center(child: appCustomProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: _packageProvider.packages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(NavSlideFromRight(
                          page: BrowsePackageDetails(
                              packageModel: _packageProvider.packages[index])));
                    },
                    child: packageWidget(_packageProvider.packages[index],context),
                  );
                },
              ),
      ),
    );
  }
}
