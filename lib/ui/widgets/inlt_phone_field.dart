import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:privates_app/core/data/static/world_countries.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/decorations.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/core/models/country_info.dart';
import 'package:privates_app/core/models/phone_number.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/utilities/string_util.dart';


class IntlPhoneFormField extends StatefulWidget {
  final bool obscureText;
  final TextAlign textAlign;
  final VoidCallback? onTap;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;
  final FormFieldSetter<PhoneNumber>? onSaved;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * [inputFormatter], which are called before [onChange]
  ///    runs and can validate and change ("format") the input value.
  ///  * [onEditingComplete], [onSubmitted], [onSelectionChanged]:
  ///    which are more specialized input change notifications.
  final ValueChanged<PhoneNumber> onChange;

  final ValueChanged<CountryInfo>? onCountryChange;
  final FormFieldValidator<String> validator;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType keyboardType;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController controller;

  /// Defines the keyboard focus for this widget.

  final FocusNode focusNode;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  ///
  /// See also:
  ///
  ///  * [EditableText.onSubmitted] for an example of how to handle moving to
  ///    the next/previous field when using [TextInputAction.next] and
  ///    [TextInputAction.previous] for [textInputAction].
  final void Function(String)? onSubmitted;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [Decoration.enabled] property.
  final bool enabled;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// If unset, defaults to the brightness of [ThemeData].
  final Brightness keyboardAppearance;

  /// Initial Value for the field.
  /// This property can be used to pre-fill the field.
  final String? initialValue;

  /// 2 Letter ISO Code
  final String? initialCountryCode;

  /// The decoration to show around the text field.
  ///
  /// By default, draws a horizontal line under the text field but can be
  /// configured to show an icon, label, hint text, and error text.
  ///
  /// Specify null to remove the decoration entirely (including the
  /// extra padding introduced by the decoration to save space for the labels).
  final InputDecoration decoration;

  /// The style to use for the text being edited.
  ///
  /// This text style is also used as the base style for the [decoration].
  ///
  /// If null, defaults to the `subtitle1` text style from the current [Theme].
  final TextStyle? style;
  final bool showDropdownIcon;

  final BoxDecoration? dropdownDecoration;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final TextInputFormatter? inputFormatter;

  /// Placeholder Text to Display in Searchbar for searching countries
  final String? searchText;

  /// Color of the country code
  final Color? countryCodeTextColor;

  /// Color of the drop down arrow
  final Color? dropDownArrowColor;

  final int? maxLength;

  final TextInputAction? textInputAction;

  final Color? cursorColor;

  final VoidCallback? onFieldSubmitted;

  const IntlPhoneFormField({
    Key? key,
    this.initialCountryCode,
    this.maxLength,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType = TextInputType.phone,
    required this.controller,
    required this.focusNode,
    required this.decoration,
    this.style,
    this.cursorColor,
    this.onSubmitted,
    required this.validator,
    required this.onChange,
    this.onCountryChange,
    this.onSaved,
    this.onFieldSubmitted,
    this.showDropdownIcon = true,
    this.dropdownDecoration,
    this.inputFormatter,
    this.enabled = true,
    this.keyboardAppearance = Brightness.light,
    this.searchText,
    this.countryCodeTextColor,
    this.dropDownArrowColor,
    this.textInputAction,
  }) : super(key: key);

  @override
  _IntlPhoneFormFieldState createState() => _IntlPhoneFormFieldState();
}

class _IntlPhoneFormFieldState extends State<IntlPhoneFormField>
    with SingleTickerProviderStateMixin {
  late CountryInfo _selectedCountry;
  late List<CountryInfo> countries;

  List<CountryInfo> filteredCountries = [];
  bool showCountrySelector = false;
  String? existingValue;

  @override
  void initState() {
    setInitialCountry();
    existingValue = widget.controller.text.trim();
    widget.focusNode.addListener(listener);
    super.initState();
  }

  void listener() {
    var enteredText = widget.controller.text.trim();
    if (!widget.focusNode.hasPrimaryFocus &&
        (enteredText.isEmpty || enteredText == existingValue)) {
      showCountrySelector = false;
      maybeRestoreExistingValue();
      return;
    }
    showCountrySelector = true;
  }

  void maybeRestoreExistingValue() {
    if (StringUtil.isEmpty(existingValue)) return;

    setInitialCountry();
  }

  void enableCountrySelector() {
    showCountrySelector = true;
  }

  void setInitialCountry() {
    countries = deserializedCountries();
    var data = CountryInfo.defaultCountry;
    _selectedCountry = CountryInfo.fromJSON(data);
  }

  Future<void> _selectCountry() async {
    filteredCountries = countries;

    await showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: true,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Semantics(
              explicitChildNodes: true,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search_rounded),
                        labelText: widget.searchText ??
                            S.current.search_by_country_name,
                        contentPadding: const EdgeInsets.only(left: 20)),
                    onChanged: (value) {
                      setState(() {
                        filteredCountries = countries
                            .where((country) => country.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredCountries.length,
                      itemBuilder: (ctx, index) {
                        CountryInfo info = filteredCountries[index];

                        return Column(
                          children: <Widget>[
                            ListTile(
                              leading: Text(
                                info.flag,
                                style: const TextStyle(fontSize: 27),
                              ),
                              title: Text(
                                info.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: DeviceScaler().scaleFont(16)
                                ),
                              ),
                              trailing: Text(
                                info.dialCode,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: DeviceScaler().scaleFont(16)
                                ),
                              ),
                              onTap: () {
                                onSelectCountry(index);
                                Navigator.of(context).pop();
                              },
                            ),
                            const Divider(
                              thickness: 1,
                              color: Palette.grey10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSelectCountry(int index) {
    CountryInfo value = filteredCountries[index];

    if (_selectedCountry.code == value.code) {
      return;
    }

    setState(() {
      _selectedCountry = value;
    });

    widget.onCountryChange?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      initialValue: widget.initialValue,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      textAlign: widget.textAlign,
      cursorColor: widget.cursorColor,
      onTap: () {
        enableCountrySelector();
        widget.onTap?.call();
      },
      controller: widget.controller,
      focusNode: widget.focusNode,
      onFieldSubmitted: (s) {
        widget.onSubmitted?.call(s);
      },
      decoration: widget.decoration.copyWith(prefixIcon: countryCodePickerIcon),
      style: widget.style,
      onChanged: (value) {
        widget.onChange(
          PhoneNumber(
            countryISOCode: _selectedCountry.code,
            countryCode: _selectedCountry.dialCode,
            number: value,
          ),
        );
      },
      validator: (value) {
        return widget.validator(value);
      },
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardAppearance: widget.keyboardAppearance,
      textInputAction: widget.textInputAction,
    );
  }

  Widget get countryCodePickerIcon {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 5),
      child: DecoratedBox(
        decoration: widget.dropdownDecoration ??
            BoxDecoration(border: Decorations.rightBorder),
        child: Material(
          color: Palette.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(2),
            onTap: _selectCountry,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (widget.showDropdownIcon) ...[
                  Icon(
                    Icons.arrow_drop_down,
                    color: widget.dropDownArrowColor,
                  ),
                  const SizedBox(width: 4)
                ],
                FittedBox(
                  child: Text(
                    _selectedCountry.dialCode,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: widget.countryCodeTextColor),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(listener);
    super.dispose();
  }
}
