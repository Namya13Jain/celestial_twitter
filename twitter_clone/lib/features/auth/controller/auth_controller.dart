import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/core/utils.dart';

//creating provider
final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(AuthAPIProvider));
});

//StateNotifier helps to see values which can be read as well as modified
class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  //isLoading
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);
  //initially the value of isLoading should be false
  void signUp({
    required String email,
    required String password,
    //here we are using a BuildContext for showing the snackbar for the error message
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);
    state = false;
    //l is failure class ===> show snackbar imported from utils.dart
    //r is Account model
    res.fold((l) => showSnackBar(context, l.message), (r) => print(r.email));
  }
}
