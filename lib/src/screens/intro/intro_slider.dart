import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/screens/auth/login.dart';
import 'package:jt_trading/src/screens/widgets/custom_listView.dart';
import 'package:jt_trading/src/screens/widgets/nav/nav_slide_from_right.dart';
import 'package:jt_trading/src/utils/storage/storage_helper.dart';
import 'package:jt_trading/src/utils/storage/storage_keys.dart';
import 'package:jt_trading/src/values/app_colors_values.dart';

class IntroSliderPages extends StatefulWidget {
  @override
  _IntroSliderPagesState createState() => _IntroSliderPagesState();
}

class _IntroSliderPagesState extends State<IntroSliderPages> {
  List<Slide> slides = [];
  List<_SliderModel> mySliderData = [
    _SliderModel(
      title: S.current.intro_slider_title1,
      description: S.current.intro_slider_info1,
      pathImage: "assets/undraw_png/intro_slider/about.png",
    ),
    _SliderModel(
      title: S.current.intro_slider_title2,
      description: S.current.intro_slider_info2,
      pathImage: "assets/undraw_png/intro_slider/login_now.png",
    ),
    _SliderModel(
      title: S.current.intro_slider_title3,
      description: S.current.intro_slider_info3,
      pathImage: "assets/undraw_png/intro_slider/subscribe.png",
    ),
    _SliderModel(
      title: S.current.intro_slider_title4,
      description: S.current.intro_slider_info4,
      pathImage: "assets/undraw_png/intro_slider/pay.png",
    ),
    _SliderModel(
      title: S.current.intro_slider_title5,
      description: S.current.intro_slider_info5,
      pathImage: "assets/undraw_png/intro_slider/share.png",
    ),
    _SliderModel(
      title: S.current.intro_slider_title6,
      description: S.current.intro_slider_info6,
      pathImage: "assets/undraw_png/intro_slider/redeem.png",
    ),
    _SliderModel(
      title: S.current.intro_slider_title7,
      description: S.current.intro_slider_info7,
      pathImage: "assets/undraw_png/intro_slider/welcome.png",
    ),
  ];

  @override
  void initState() {
    _intSlider();
    super.initState();
  }
  _intSlider(){
    slides.clear();
    for (_SliderModel item in mySliderData)
      slides.add(
        new Slide(
          // te
          title: item.title.toUpperCase(),
          description: item.description,
          pathImage: item.pathImage,
          // backgroundColor: Color(0xff9932CC),
          backgroundColor: Colors.white,
         // max
          styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          styleDescription: TextStyle(fontSize: 16,color: Colors.black)
        ),
      );
    setState(() {

    });
  }

  void onDonePress() async {
    Navigator.pop(context);
    await StorageHelper.set(StorageKeys.viewIntoSlider, "view");
    Navigator.of(context).pushReplacement(
      NavSlideFromRight(
        page: Login(),
      ),
    );
// Do what you want
  }
  TextStyle _style=TextStyle(color: appPrimaryColor);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      child: Scaffold(
        body: Container(
          child: IntroSlider(
            backgroundColorAllSlides: Colors.white,
            slides: this.slides,
            nameDoneBtn: S.of(context).nameDoneBtn,
            nameNextBtn: S.of(context).nameNextBtn,
            namePrevBtn: S.of(context).namePrevBtn,
            nameSkipBtn: S.of(context).nameSkipBtn,
            onDonePress: this.onDonePress,

            // colorDoneBtn: Colors.deepOrange,
            // colorPrevBtn: Colors.deepOrange,
            // colorSkipBtn: Colors.deepOrange,
            colorActiveDot: appPrimaryColor,
            styleNameDoneBtn: _style,
            styleNamePrevBtn: _style,
            styleNameSkipBtn: _style,
          ),
        ),
      ),
    );
  }
}

class _SliderModel {
  String title;
  String description;
  String pathImage;
  _SliderModel({this.title, this.description, this.pathImage});
}
