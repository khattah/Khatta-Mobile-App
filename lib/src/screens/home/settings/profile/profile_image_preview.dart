import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/home/settings/profile/profile_image_pick.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class ProfileImagePreview extends StatefulWidget {
  @override
  _ProfileImagePreviewState createState() => _ProfileImagePreviewState();
}

class _ProfileImagePreviewState extends State<ProfileImagePreview> {
  ProfileProvider _profileProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black45,
      statusBarBrightness: Brightness.light,
    ));
    print("change colors");
  }

  @override
  Widget build(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context);
    return Theme(
      data: ThemeData(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).profile_photo),
            backgroundColor: Colors.black,
            centerTitle: true, // status bar color
            brightness: Brightness.light,
            actions: [
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) {
                      return ProfileImagePick();
                    },
                  );
                },
                child: Icon(Icons.edit),
              )
            ],
          ),
          body: Stack(
            children: [
              Center(
                child: Container(
                  // height: 400,
                  child: PhotoView(
                    // imageProvider: AssetImage("assets/package.jpg"),
                    imageProvider: _profileProvider.tempUserProfileImage == null
                        ? CachedNetworkImageProvider(
                        _profileProvider.user.imageUrl,


//                       imageUrl: _profileProvider.user.imageUrl,
//
//                              // placeholder: 'assets/logo.png',
//                              // _profileProvider.user.imageUrl,
//
// //                             // height: 150.0,
//                             // width: 150.0,
//                             placeholder: (context, url) => Container(
//                               color: Colors.grey[100],
//                               child: FittedBox(
//                                 fit: BoxFit.fill,
//                                 child: Image.asset('assets/logo.png'),
// //                                    child: CircularProgressIndicator(
// //                                        strokeWidth: 1),
//                               ),
//                             ),
                          )
                        : FileImage(
                            _profileProvider.tempUserProfileImage,
                          ),
                  ),
                ),
              ),
              _profileProvider.imageLoading
                  ? Center(
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        padding: EdgeInsets.all(55),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                        ),
                        child: Container(
                          // color: Colors.amber,
                          // width: 40,
                          // height: 40,
                          child: Theme(
                            data: ThemeData(accentColor: Colors.white),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          )),
    );
  }
}
