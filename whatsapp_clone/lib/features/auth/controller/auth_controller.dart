import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/repository/auth_repository.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final AuthControllerProvider = Provider((ref) {
  final repository = ref.watch(AuthRepositoryProvider);
  return AuthController(repository, ref);
});

final userAuthDataProvider = FutureProvider((ref) {
  final AuthControllerPro = ref.watch(AuthControllerProvider);
  return AuthControllerPro.getuserdata();
});

class AuthController {
  final AuthRepository repository;
  final ProviderRef ref;

  AuthController(this.repository, this.ref);

  Future<UserModel?> getuserdata() async {
    UserModel? user = await repository.getuserdata();
    return user;
  }

  void SingnInWithPhone(BuildContext context, String phoneno) {
    repository.SignInWithPhone(context, phoneno);
  }

  void verifyOtp(BuildContext context, String verificationId, String userOtp) {
    repository.verifyOtp(
        context: context, verificationId: verificationId, userOtp: userOtp);
  }

  void saveUserToFirebase(String Name, File? image, BuildContext context) {
    repository.SaveUserDataToFirebase(
        Name: Name, image: image, context: context, ref: ref);
  }

  Stream<UserModel> getOnlineData(String uid) {
    return repository.useronlinedata(uid);
  }
}
