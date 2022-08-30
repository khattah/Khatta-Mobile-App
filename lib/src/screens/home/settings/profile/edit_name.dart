import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:provider/provider.dart';

class EditNameDialog extends StatefulWidget {
  @override
  _EditNameDialogState createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<EditNameDialog> {
  String fullname = "";
  ProfileProvider _profileProvider;

  // void _update
  @override
  Widget build(BuildContext context) {
    _profileProvider = Provider.of<ProfileProvider>(context);

    return Padding(
      padding: EdgeInsets.all(18),
      // padding: MediaQuery.of(context).viewInsets,
      child: Container(
        // padding: EdgeInsets.all(15),
        // height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).enter_your_name,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38)),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.black, width: 0.0),
// //                borderRadius: BorderRadius.circular(25.0),
//                 ),
              ),
              autofocus: true,
              initialValue: _profileProvider.user.name,
              onChanged: (String value) {
                print("new is $value");
                setState(() {
                  fullname = value;
                });

              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: appButton(
                      S.of(context).cancel.toUpperCase(),
                      isPlane: true,
                      onpress: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: appButton(S.of(context).save.toUpperCase(),onpress: (){
                    if(fullname.isEmpty){
                      Navigator.pop(context);
                      return;
                    }
                    _profileProvider.updateProfileInfo(
                        {"fname": fullname, "sname": ""});
                    Navigator.pop(context);
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
