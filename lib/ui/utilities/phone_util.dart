
import 'package:libphonenumber/libphonenumber.dart';
import 'package:logging/logging.dart';

class PhoneUtil {
  Logger log = Logger('ReownPhoneUtil');
  PhoneUtil();

  Future<bool> isValidPhoneNumber({String? phoneNumber, String? isoCode}) async {
    return (await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: phoneNumber ?? '', isoCode: isoCode ?? '')) ?? false;
  }

  Future<RegionInfo> getRegionInfo({String? phoneNumber, String? isoCode}) async {
    return PhoneNumberUtil.getRegionInfo(
        phoneNumber: phoneNumber ?? '', isoCode: isoCode ?? '');
  }

  Future<String?> normalize({String? phoneNumber, String? isoCode}) async {
    try {
      return await PhoneNumberUtil.normalizePhoneNumber(
          phoneNumber: phoneNumber ?? '', isoCode: isoCode ?? '');
    } catch(e, stack) {
      log.severe('Error while normalizing phone number'
          ' ($phoneNumber) : ${e.toString()}', e, stack);
    }
    return null;
  }
}