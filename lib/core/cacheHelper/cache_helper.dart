import 'package:easy_localization/easy_localization.dart';
import '../../view/login/model/user_model.dart';

import 'package:get_storage/get_storage.dart';

class CacheHelper {
  static final GetStorage _appBox = GetStorage();
  static Future<void> init() async => await GetStorage.init();

  static Future<void> cacheUserInfo({
    required String token,
    required UserModel userModel,
  }) async {
    await _cacheUserToken(token);
    await _cacheUserModel(userModel);
  }

  static Future<void> cacheUserModel({
    required UserModel userModel,
  }) async {
    await _cacheUserModel(userModel);
  }

  static Future<void> _cacheUserModel(UserModel userModel) async =>
      await _appBox.write('userModel', userModel.toJson());

  static Future<void> _cacheUserToken(String token) async =>
      await _appBox.write('token', token);

  static String? get getUserToken => _appBox.read('token');

  static bool get isLogged => getUserInfo != null;

  static UserModel? get getUserInfo {
    UserModel? userModel;
    if (_appBox.hasData('userModel')) {
      userModel = UserModel.fromJson(_appBox.read('userModel'));
    }
    return userModel;
  }

  static String get userName =>
      toBeginningOfSentenceCase(getUserInfo!.data!.firstName!).toString() +
      ' ' +
      toBeginningOfSentenceCase(getUserInfo!.data!.lastName!).toString();

  static String get userFirstName =>
      toBeginningOfSentenceCase(getUserInfo!.data!.firstName!).toString();
  static String get userLastName =>
      toBeginningOfSentenceCase(getUserInfo!.data!.lastName!).toString();

  static Future<void> signOut() async => await _appBox.erase();
}
