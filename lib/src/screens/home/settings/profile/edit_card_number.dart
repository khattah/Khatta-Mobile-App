import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:jt_trading/src/screens/widgets/showToast.dart';
import 'package:provider/provider.dart';

class EditCartNumberDialog extends StatefulWidget {
  @override
  _EditCartNumberDialogState createState() => _EditCartNumberDialogState();
}

class _EditCartNumberDialogState extends State<EditCartNumberDialog> {
  String _cardId = "";
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
              S.of(context).edit_card_id,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38)),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.black, width: 0.0),
// //                borderRadius: BorderRadius.circular(25.0),
//                 ),
              ),
              autofocus: true,
              initialValue: _profileProvider.user.cardID,
              onChanged: (String value) {
                print("new is $value");
                setState(() {
                  _cardId = value;
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
                  child:
                      appButton(S.of(context).save.toUpperCase(), onpress: () {
                    if (_cardId.isEmpty) {
                      Navigator.pop(context);
                      return;
                    }
                    _profileProvider.updateProfileInfo({"card_id": _cardId});
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
