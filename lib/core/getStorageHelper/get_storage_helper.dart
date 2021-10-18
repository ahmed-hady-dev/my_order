import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  static init() async {
    await GetStorage.init();
  }

  //===============================================================

  static GetStorage storage = GetStorage();
}
