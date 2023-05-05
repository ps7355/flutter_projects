import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone/common/enums/enums.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/example.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/model/chat_contact_model.dart';
import 'package:whatsapp_clone/model/chatmodel.dart';
import 'package:whatsapp_clone/model/user_model.dart';

final ChatRepositoryProvider = Provider(
    (ref) => ChatRepository(FirebaseAuth.instance, FirebaseFirestore.instance));

class ChatRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ChatRepository(this.auth, this.firestore);

  Stream<List<Message>> getChats(String reciverId) {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(reciverId)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<Message> chats = [];
      for (var document in event.docs) {
        chats.add(Message.fromMap(document.data()));
      }
      return chats;
    });
  }

  Stream<List<ChatContactModel>> getcontacts() {
    return firestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ChatContactModel> contacts = [];
      for (var document in event.docs) {
        print(document.data());
        print(event.docs);
        var chatcontact = ChatContactModel.fromMap(document.data());
        print('hello 2');
        var userdetails = await firestore
            .collection('users')
            .doc(chatcontact.contactId)
            .get();
        var user = UserModel.fromMap(userdetails.data()!);

        contacts.add(ChatContactModel(
            name: user.name,
            profilepic: user.profilePic,
            contactId: chatcontact.contactId,
            timesent: chatcontact.timesent,
            lastMessage: chatcontact.lastMessage));
      }
      return contacts;
    });
  }

  _SaveDatatoContactSubCollection({
    required UserModel SenderData,
    required UserModel ReciverData,
    required var Time,
    required String LastMessage,
    required String ReciverUserid,
  }) async {
    //users->reciverid=>chats->senderid->setdata
    var reciverChatContact = ChatContactModel(
        name: SenderData.name,
        profilepic: SenderData.profilePic,
        contactId: SenderData.uid,
        timesent: Time,
        lastMessage: LastMessage);

    await firestore
        .collection('users')
        .doc(ReciverUserid)
        .collection('chats')
        .doc(SenderData.uid)
        .set(reciverChatContact.toMap());
    //users->senderid=>chats->reciverid->setdata
    var SenderChatContact = ChatContactModel(
        name: ReciverData.name,
        profilepic: ReciverData.profilePic,
        contactId: ReciverData.uid,
        timesent: Time,
        lastMessage: LastMessage);

    await firestore
        .collection('users')
        .doc(SenderData.uid)
        .collection('chats')
        .doc(ReciverUserid)
        .set(SenderChatContact.toMap());
  }

  _SaveMessageToMessageSubCOllection({
    required String Text,
    required String reciverId,
    required var time,
    required String messageId,
    required String senderusername,
    required String reciverusername,
    required MessageEnum type,
  }) async {
    var sendmessage = Message(
        senderId: auth.currentUser!.uid,
        recieverid: reciverId,
        text: Text,
        type: type,
        timeSent: time,
        messageId: messageId,
        isSeen: false);

    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(reciverId)
        .collection('messages')
        .doc(messageId)
        .set(sendmessage.toMap());

    await firestore
        .collection('users')
        .doc(reciverId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .set(sendmessage.toMap());
  }

  void SendTextMessage(
      {required BuildContext context,
      required String reciverUserId,
      required String Text,
      required UserModel SenderUser}) async {
    try {
      var timeSent = DateTime.now();
      var messid = Uuid().v1();
      var UserDataMap =
          await firestore.collection('users').doc(reciverUserId).get();
      UserModel ReciverUserData = UserModel.fromMap(UserDataMap.data()!);

      _SaveDatatoContactSubCollection(
          Time: timeSent,
          LastMessage: Text,
          SenderData: SenderUser,
          ReciverData: ReciverUserData,
          ReciverUserid: reciverUserId);

      _SaveMessageToMessageSubCOllection(
          Text: Text,
          senderusername: SenderUser.name,
          time: timeSent,
          reciverusername: ReciverUserData.name,
          reciverId: reciverUserId,
          messageId: messid,
          type: MessageEnum.text);
    } catch (e) {
      ShowSnackBar(message: e.toString(), context: context);
    }
  }
}
