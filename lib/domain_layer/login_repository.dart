
import 'package:flutterapps/Utils/login_error.dart';
import 'package:flutterapps/domain_layer/database_helper.dart';
import 'package:flutterapps/models/user.dart';

class LoginRepository{
  final DatabaseHelper databaseHelper;

  LoginRepository({required this.databaseHelper});

  Future<User?> login(String useremail, String password) async {
    final user = await databaseHelper.getUser(useremail, password);
    if (user!=null ) {
      return user;
    }
    return throw LoginError('Invalid username or password.');  // Throw a custom exception;
  }

  Future<int?> register(User user) async {
    final userId = await databaseHelper.insertUser(user);
    return userId;

  }

}