import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/selectContacts/repository/select_contact_repository.dart';

final getContactProvider = FutureProvider((ref) {
  final SelectContactRepository = ref.watch(SelectContactRepositoryProvider);
  return SelectContactRepository.getContact();
});

final selectContactControllerProvider = Provider((ref){
  final repository = ref.watch(SelectContactRepositoryProvider);
  return selectContactController(repository, ref);
});
class selectContactController{
  final SelectContactRepository repository;
  final ProviderRef ref;

  selectContactController(this.repository, this.ref);

  void getcontacts(Contact selectedContact, BuildContext context){
    repository.getuserContact(selectedContact, context);
  }
}
