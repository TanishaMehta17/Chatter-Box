import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/chat/repositories/chat_repository.dart';

class BottomChatFeild extends ConsumerStatefulWidget {
  const BottomChatFeild({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BottomChatFeild> createState() => _BottomChatFeildState();
}

class _BottomChatFeildState extends ConsumerState<BottomChatFeild> {
  bool isShowSendButton = false;

  void sendTextMessage()async{
    if(isShowSendButton)
    {
     // ref.read(chatRepositoryProvider).sendTextMessage(context: context, text: text, recieverUserId: recieverUserId, senderUser: senderUser)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (val) {
              if (val.isNotEmpty) {
                setState(() {
                  isShowSendButton = true;
                });
              } else {
                setState(() {
                  isShowSendButton = false;
                });
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: mobileChatBoxColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.gif,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              hintText: 'Type a message!',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
          child: CircleAvatar(
            backgroundColor: const Color(0XFF128C7E),
            radius: 25,
            child: Icon(
              isShowSendButton ? Icons.send : Icons.mic,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
