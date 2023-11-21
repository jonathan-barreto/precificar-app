import 'package:flutter/material.dart';
import 'package:whatsapp_story_editor/whatsapp_story_editor.dart';

class AddButtonStory extends StatelessWidget {
  final int idUser;
  final void Function(int, MemoryImage, String?) uploadStoryFunction;

  const AddButtonStory({
    super.key,
    required this.idUser,
    required this.uploadStoryFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 60,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WhatsappStoryEditor(),
            ),
          ).then((imageResult) {
            final MemoryImage image = imageResult.image;
            final String caption = imageResult.caption;
            uploadStoryFunction(idUser, image, caption);
          });
        },
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
