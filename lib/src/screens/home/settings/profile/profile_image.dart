import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/home/settings/profile/profile_image_pick.dart';
import 'package:jt_trading/src/screens/home/settings/profile/profile_image_preview.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  ProfileProvider _profileProvider;
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LanguageProvider>(context, listen: false);
    _profileProvider = Provider.of<ProfileProvider>(context);
    return Container(
      height: 200,
      // height: MediaQuery.of(context).size.height * .3,
      // color: Colors.blue,
      child: Stack(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  NavSlideFromRight(
                    page: ProfileImagePreview(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: appPrimaryColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),

                  // child: Container(
                  //   width: 60,
                  //   height: 60,
                  //   color: randomColor(),
                  // ),
                  child: Container(
                    child: _profileProvider.tempUserProfileImage == null
                        ? CachedNetworkImage(
                            imageUrl: _profileProvider.user.imageUrl,
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[100],
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text( _profileProvider.user.name[0].toUpperCase()),
                                ),
                                // child: Image.asset('assets/logo.png'),
//                                    child: CircularProgressIndicator(
//                                        strokeWidth: 1),
                              ),
                            ),
                          )
                        : Image.file(
                            _profileProvider.tempUserProfileImage,
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                  ),
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
                        color: Colors.black26, shape: BoxShape.circle),
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
          Positioned(
            bottom: 20,
            right: bloc.isArabic ? null : 0,
            left: bloc.isArabic ? 0 : null,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) {
                    return ProfileImagePick();
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
