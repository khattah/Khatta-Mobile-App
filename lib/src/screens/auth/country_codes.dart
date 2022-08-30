import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jt_trading/generated/l10n.dart';
import 'package:jt_trading/src/models/country_code.dart';
import 'package:jt_trading/src/providers/authProvider.dart';
import 'package:jt_trading/src/providers/language_provider.dart';
import 'package:jt_trading/src/providers/profile_povider.dart';
import 'package:jt_trading/src/screens/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

class CountryCodes extends StatefulWidget {
  CountryCodeModel codeModel;
  final Function(CountryCodeModel) onChange;
  CountryCodes({@required this.codeModel, this.onChange});
  @override
  _CountryCodesState createState() => _CountryCodesState();
}

class _CountryCodesState extends State<CountryCodes> {
  // CountryCodeModel _codeModel = CountryCodeModel();
  @override
  void initState() {
    // TODO: implement initState
    _loadCountryCodes();
    super.initState();
  }

  void _loadCountryCodes() async {
    print("load ..................... uuu ......................");
    List<CountryCodeModel> _countryCodes = await AuthProvider()
        .fetchCountriesCodes(
            Provider.of<LanguageProvider>(context, listen: false).code);
    if (_countryCodes.isNotEmpty) widget.onChange(_countryCodes[0]);
    // setState(() {
    //   // print("----------------------** ${_countryCodes[0].id} **------------");
    //   widget.codeModel = _countryCodes[0];
    // });
  }

  // CountryCodeModel _codeModel = CountryCodeModel();
  @override
  Widget build(BuildContext context) {
    print("----------------------* ${widget.codeModel.code} *------------");
    print(widget.codeModel);

    final _lang = Provider.of<LanguageProvider>(context);
    return Container(
      // data:ThemeData()
      child: DropdownSearch<CountryCodeModel>(
        mode: Mode.MENU,
        dropdownSearchDecoration: InputDecoration(
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          contentPadding: EdgeInsets.all(_lang.isArabic ? 14 : 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black, width: 4)),
        ),
        showSelectedItem: true,
        popupItemDisabled: (CountryCodeModel item) =>
            item.id == widget.codeModel.id,
        loadingBuilder: (context, searchEntry) => Center(
          child: appCustomProgressIndicator(strokeWidth: 1.5),
        ),
        //
        onFind: (String filter) => AuthProvider().fetchCountriesCodes(
            Provider.of<LanguageProvider>(context, listen: false).code),

        itemAsString: (CountryCodeModel item) =>
            "${item.code == null ? '' : '+'} ${item.code ?? '${S.of(context).wait}'}",
        dropdownButtonBuilder: (context) => Container(),
        // dropDownButton: Text("muller"),
        // popupItemBuilder: (context, item, isSelected) => Text("mull"),
        hint: S.of(context).code ?? "",
        onChanged: (CountryCodeModel item) {
          // widget.codeModel = item;
          widget.onChange(item);
          setState(() {});
        },
        compareFn: (CountryCodeModel i, CountryCodeModel s) => i.id == s.id,
        selectedItem: widget.codeModel,
      ),
    );
  }
}
