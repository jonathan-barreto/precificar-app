import 'package:flutter/material.dart';
import 'package:precificar_app/app/data/models/user_model.dart';
import 'package:precificar_app/app/presenter/story/page/story_page.dart';
import 'package:precificar_app/app/presenter/widgets/add_story_button.dart';
import 'package:precificar_app/app/presenter/widgets/cached_image.dart';

class CardStory extends StatelessWidget {
  final int index;
  final User user;
  final void Function(int, MemoryImage, String?) uploadStoryFunction;

  const CardStory({
    super.key,
    required this.index,
    required this.user,
    required this.uploadStoryFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryPage(
                    idUser: user.id,
                  ),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                CachedImage(id: user.id),
                if (index == 0)
                  AddButtonStory(
                    idUser: user.id,
                    uploadStoryFunction: uploadStoryFunction,
                  ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Center(
            child: Text(
              index == 0 ? 'Seu Story' : user.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
