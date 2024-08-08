import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/select_contacts/controllers/select_contact_controller.dart';
import 'package:whatsapp_ui/features/select_contacts/repository/select_contact_repository.dart';


class SelectContactScreen extends ConsumerWidget {
  static const String routeName = "/select-contact";
  const SelectContactScreen({Key? key}) : super(key: key);

void selectContact(WidgetRef ref, BuildContext context, Contact selectedContact)
{
  ref.read(selectContactRepositoryProvider).selectContact(selectedContact, context);
}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select contacts"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  final contact = contactList[index];
                  return InkWell(
                    onTap: ()=>selectContact(ref,context, contact),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: ListTile(
                        title: Text(contact.displayName,
                        style: const TextStyle(fontSize: 18),
                        ),
                        leading: contact.photo==null?null:CircleAvatar(
                          backgroundImage: MemoryImage(contact.photo!),
                          radius: 30,
                        ),
                      ),
                    ),
                  );
                }),
            error: (err, trace) => ErrorScreen(errors: err.toString()),
            loading: () => const Loader()));
  }
}
