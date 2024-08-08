import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/select_contacts/repository/select_contact_repository.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return selectContactRepository.getContacts();
});

final selectContactConrollerProvider = Provider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return SeelectContactConroller(
    ref: ref,
    selectContactRepository: selectContactRepository,
  );
});

class SeelectContactConroller {
  final ProviderRef ref;
  final SelectContactRepository selectContactRepository;

  SeelectContactConroller(
      {required this.ref, required this.selectContactRepository});
  void selectContact(Contact selectedContact, BuildContext context) {
    selectContactRepository.selectContact(selectedContact, context);
  }
}
