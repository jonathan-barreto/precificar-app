import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/core/utils/constants/app_constants.dart';
import 'package:precificar_app/app/presenter/story/stores/story_store.dart';
import 'package:precificar_app/init.dart';

import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:precificar_app/app/presenter/story/states/story_state.dart';

class StoryPage extends StatefulWidget {
  final int idUser;
  

  const StoryPage({
    super.key,
    required this.idUser,
  });

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryStore store = getIt<StoryStore>();
  
  final controller = StoryController();

  @override
  void initState() {
    super.initState();
    store.fetchStories(id: widget.idUser);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, value, child) {
          if (value is SuccessState<StoryState>) {
            if (value.output.stories.isNotEmpty) {
              return StoryView(
                controller: controller,
                progressPosition: ProgressPosition.top,
                storyItems: List<StoryItem>.from(
                  value.output.stories.map(
                    (e) => StoryItem.inlineImage(
                      url: AppConstants.getImageUrl + e.image,
                      controller: controller,
                      caption: Text(
                        e.caption,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                onComplete: () {
                  Navigator.pop(context);
                },
              );
            } else {
              Navigator.pop(context);
            }
          }

          return Container();
        },
      ),
    );
  }
}
