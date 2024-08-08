import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class UserInfromationScreen extends ConsumerStatefulWidget {
  static const routeName = "/user-information";
  const UserInfromationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInfromationScreen> createState() =>
      _UserInfromationScreenState();
}

class _UserInfromationScreenState extends ConsumerState<UserInfromationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref
          .read(authContollerProvider)
          .saveUserDataToFirebase(context, name, image);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                image == null
                    ? const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://th.bing.com/th/id/OIP.Ghae4OEdb4UmC3hkqpFvLAHaGd?rs=1&pid=ImgDetMain"),
                        radius: 64,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(
                          image!,
                        ),
                        radius: 64,
                      ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: selectImage, icon: const Icon(Icons.add_a_photo)))
              ],
            ),
            Row(
              children: [
                Container(
                  width: size.width * 0.85,
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(hintText: "Enter your name"),
                  ),
                ),
                IconButton(onPressed: storeUserData, icon: const Icon(Icons.done))
              ],
            )
          ],
        ),
      )),
    );
  }
}
