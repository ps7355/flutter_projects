import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone/Screens/mobile_Screen.dart';
import 'package:whatsapp_clone/common/repository/common_firebase_storage_repository.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp_clone/features/selectContacts/Screens/select_contact_Screen.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final AuthRepositoryProvider = Provider(((ref) => AuthRepository(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance)));

class AuthRepository {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  AuthRepository({required this.auth, required this.firestore});

  Future<UserModel?> getuserdata() async {
    UserModel? user;
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void SignInWithPhone(BuildContext context, String phoneno) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneno,
          verificationCompleted: ((PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          }),
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: (String verificationId, int? forceResendingToken) async {
            Navigator.pushNamed(context, OtpSCreen.routeName,
                arguments: verificationId);
          },
          codeAutoRetrievalTimeout: ((verificationId) {}));
    } catch (e) {
      ShowSnackBar(message: e.toString(), context: context);
    }
  }

  void verifyOtp({
    required BuildContext context,
    required final verificationId,
    required final userOtp,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      ShowSnackBar(message: e.message!, context: context);
    }
  }

  void SaveUserDataToFirebase({
    required String Name,
    required File? image,
    required BuildContext context,
    required ProviderRef ref,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photourl = 'https://picsum.photos/250?image=9';

      if (image != null) {
        photourl = await ref
            .read(CommonFirebaseStorageProvider)
            .StoreFileToFirebase('prpfilePic/$uid', image) as String;
      }

      final user = UserModel(
          name: Name,
          uid: uid,
          phoneNumber: auth.currentUser!.phoneNumber as String,
          profilePic: photourl,
          isOnline: true,
          groupId: []);

      await firestore.collection('users').doc(uid).set(user.toMap());
      Navigator.pushNamedAndRemoveUntil(
          context, MobileLayoutScreen.routeName, (route) => false);
    } catch (e) {
      ShowSnackBar(message: e.toString(), context: context);
    }
  }

  Stream<UserModel> useronlinedata(String uid) {
    return firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }
}
