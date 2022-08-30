import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:jt_trading/generated/l10n.dart';

class CountDown extends StatefulWidget {
  int endTimeInSec;
  Function doResendSMS;
  CountDown({this.endTimeInSec, this.doResendSMS});

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int endTime = 0;
  _intCountDown() {
    endTime = widget.endTimeInSec == null
        ? DateTime.now().millisecondsSinceEpoch + 1000 * 91
        : DateTime.now().millisecondsSinceEpoch +
            1000 * widget.endTimeInSec +
            1;
    setState(() {});
  }



  @override
  void initState() {
    _intCountDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().second + 1000);
    return Container(
      child: CountdownTimer(
        endTime: endTime,
        // onEnd: widget.onEnd,
        widgetBuilder: (_, CurrentRemainingTime time) {
          return Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.message),
                  SizedBox(width: 10),
                  Text(
                    '${S.of(context).resend_activation_code}',
                    style: TextStyle(
                      fontFamily: 'Droid Sans Arabic',
                      fontSize: 16,
                      // color: const Color(0xff0e99c0),
                      height: 1.2666666666666666,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              time == null
                  ? InkWell(
                      onTap: time == null
                          ? () {
                              _intCountDown();
                              widget.doResendSMS();
                            }
                          : null,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          S.of(context).resend.toUpperCase(),
                          style: TextStyle(
                            color: const Color(0xff0e99c0),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      "${time.min != null ? time.min.toString().padLeft(2, "0") : "00"}:${time.sec != null ? time.sec.toString().padLeft(2, '0') : '00'}",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 16,
                        color: const Color(0xff0e99c0),
                        fontWeight: FontWeight.w500,
                        height: 1.2666666666666666,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
