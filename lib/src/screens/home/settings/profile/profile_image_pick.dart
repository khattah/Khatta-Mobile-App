import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';
import 'package:provider/provider.dart';

class ProfileImagePick extends StatefulWidget {
  @override
  _ProfileImagePickState createState() => _ProfileImagePickState();
}

class _ProfileImagePickState extends State<ProfileImagePick> {
  ProfileProvider _profileProvider;
  @override
  Widget build(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      // height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).profile_photo,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _profileProvider.updateImage(fromGallery: true);
                },
                child: Column(
                  children: [
                    Icon(Icons.image, color: appPrimaryColor, size: 80),
                    SizedBox(height: 5),
                    Text(S.of(context).gallery),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _profileProvider.updateImage();
                },
                child: Column(
                  children: [
                    Icon(Icons.camera_alt_outlined,
                        color: appPrimaryColor, size: 80),
                    SizedBox(height: 5),
                    Text(S.of(context).camera),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
