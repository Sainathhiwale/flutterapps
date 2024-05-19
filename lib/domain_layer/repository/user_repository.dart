
import 'package:flutterapps/domain_layer/shared_preferences_service.dart';
import 'package:flutterapps/models/user.dart';

class UserRepository{
  final SharedPreferencesService _sharedPreferencesService;

  UserRepository(this._sharedPreferencesService);

  Future<void> saveUser(User user) async {
    return await _sharedPreferencesService.setUser(user);
  }
  // set user session as loggedIn
  Future<void> setIsLoggedIn(bool isLoggedIn) async {
    await _sharedPreferencesService.setloggedIn(isLoggedIn);
  }
  // get user login session
  Future<bool> getIsLoggedIn() async {
    return await _sharedPreferencesService.getIsLoggedIn();
  }
  Future<void> clearUser() async {
    return await _sharedPreferencesService.clearUser();
  }

}