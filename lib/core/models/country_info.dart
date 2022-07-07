class CountryInfo {
  static const defaultCountry = {
    "name": "Nigeria",
    "flag": "🇳🇬",
    "code": "NG",
    "dial_code": "+234",
  };

  String name;
  String flag;
  String code;
  String dialCode;

  CountryInfo({
    required this.name,
    required this.flag,
    required this.code,
    required this.dialCode,
  });

  static CountryInfo fromJSON(Map<String, dynamic> data) {
    return CountryInfo(
      name: data['name'],
      flag: data['flag'],
      code: data['code'],
      dialCode: data['dial_code'],
    );
  }
}
