//1. abstract class is created to easily change the backjend from appwrite to some other like firebase or node js
//by simply making changes in AuthAPI class
//2. another reason is for testing the auth functions using the abstract class
// this ensures that every function is tested easily
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/core/type_defs.dart';

//Provider provides only a read only value, won't be able to change its state
//State Provider and State Notifier Provider lets us change the state as well
final AuthAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(
    account: account,
  );
});

//want to signup, want to get user account ---> Account
//wnat to acccess user related data ---> model.Account

abstract class IAuthAPI {
  //here if success is there then account will be returned
  //else in case of failure, string will be returned
  FutureEither<model.Account> signUp({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  //constructor of the class
  //private members can't be accessed using this._account
  //the above syntax is wrong
  //instead we'll use the way it is coded here
  AuthAPI({required Account account}) : _account = account;
  @override
  FutureEither<model.Account> signUp({
    required String email,
    required String password,
  }) async {
    try {
      //since we want Appwrite to generate the userId uniquely
      //so we'll use 'unique()'
      final account = await _account.create(
          userId: 'unique()', email: email, password: password);
      //case of success
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      //case of failure
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      //case of failure
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
