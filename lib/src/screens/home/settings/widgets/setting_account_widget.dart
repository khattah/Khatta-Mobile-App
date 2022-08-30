import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/home/settings/profile/profile.dart';
import 'package:jt_trading/src/screens/home/settings/profile/profile_image_preview.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class SettingAccountWidget extends StatelessWidget {
  ProfileProvider _profileProvider;

  @override
  Widget build(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context);
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          NavSlideFromRight(
            page: ProfilePage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            InkWell(
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
                    borderRadius: BorderRadius.circular(30.0),
                    // child: Container(
                    //   width: 60,
                    //   height: 60,
                    //   color: randomColor(),
                    // ),
                    child: Container(
                      child: _profileProvider.tempUserProfileImage == null
                          ? CachedNetworkImage(
                              imageUrl: _profileProvider.user.imageUrl,
                              height: 60.0,
                              width: 60.0,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey[100],
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text(_profileProvider.user.name[0].toUpperCase()),
                                  ),
                                  // child: Image.asset('assets/logo.png'),
                                ),
                              ),
                            )
                          : Image.file(
                              _profileProvider.tempUserProfileImage,
                              height: 60.0,
                              width: 60.0,
                              fit: BoxFit.cover,
                            ),
                    )),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                // color: Colors.blue,
                // height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "${_profileProvider.user.name}",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      _profileProvider.user.phoneNumber,
                      textDirection: TextDirection.ltr,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                child: Icon(Icons.edit, color: appPrimaryColor),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
