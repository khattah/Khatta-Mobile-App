import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';

class BuyPackageDialog extends StatelessWidget {
  final Function() onConfirm;
  BuyPackageDialog({@required this.onConfirm});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).subscribe_ask),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: appButton(S.of(context).subscribe, onpress: () {
                  Navigator.pop(context);
                  onConfirm();
                }),
              ),
              SizedBox(width: 10),
              Expanded(
                child: appButton(S.of(context).cancel, onpress: () {
                  Navigator.pop(context);
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
