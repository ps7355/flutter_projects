import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/chat/repository/chat_repository.dart';
import 'package:whatsapp_clone/model/chat_contact_model.dart';
import 'package:whatsapp_clone/model/chatmodel.dart';

final ChatControllerProvider = Provider((ref) {
  final repository = ref.watch(ChatRepositoryProvider);
  return ChatController(repository, ref);
});

class ChatController {
  final ChatRepository repository;
  final ProviderRef ref;

  ChatController(this.repository, this.ref);

  Stream<List<Message>> getchat(String reciverid) {
    return repository.getChats(reciverid);
  }

  Stream<List<ChatContactModel>> getcontacts() {
    return repository.getcontacts();
  }

  void sendMessage({
    required BuildContext context,
    required String reciverUserId,
    required String Text,
  }) {
    print('hay');
    ref.read(userAuthDataProvider).whenData((value) =>
        repository.SendTextMessage(
            context: context,
            reciverUserId: reciverUserId,
            Text: Text,
            SenderUser: value!));
  }
}
