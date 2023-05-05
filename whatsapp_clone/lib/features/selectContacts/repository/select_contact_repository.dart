import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/chat/screens/chat_screen.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final SelectContactRepositoryProvider =
    Provider((ref) => SelectContactRepository(FirebaseFirestore.instance));

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository(this.firestore);

  Future<List> getContact() async {
    List<Contact?> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void getuserContact(Contact selectedContact, BuildContext context) async {
    try {
      var usercollection = await firestore.collection('users').get();
      bool isFound = false;
      for (var document in usercollection.docs) {
        var userdata = UserModel.fromMap(document.data());
        final selectedphone =
            selectedContact.phones[0].number.replaceAll(' ', '');
        if (selectedphone == userdata.phoneNumber) {
          isFound = true;
          Navigator.pushNamed(context, chatScreen.routeName,
              arguments: {'name': userdata.name, 'uid': userdata.uid});
        }
      }

      if (!isFound) {
        ShowSnackBar(message: "User does not have Whatsapp", context: context);
      }
    } catch (e) {
      ShowSnackBar(message: e.toString(), context: context);
    }
  }
}
