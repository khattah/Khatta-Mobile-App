import 'package:flutter/material.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:provider/provider.dart';

class ProfileImageSource extends StatelessWidget {
  double width;
  double height;
  ProfileImageSource({this.width = 60, this.height = 60});
  ProfileProvider _profileProvider;
  @override
  Widget build(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context);
    return Container(
      child: _profileProvider.tempUserProfileImage == null
          ? Image.asset("assets/trophy.png", height: height, width: width)
          : Image.file(
              _profileProvider.tempUserProfileImage,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
    );
  }
}
