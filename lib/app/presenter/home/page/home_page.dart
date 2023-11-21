import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/presenter/home/state/home_state.dart';
import 'package:precificar_app/app/presenter/home/store/home_store.dart';
import 'package:precificar_app/app/presenter/widgets/card_story.dart';
import 'package:precificar_app/init.dart';

class HomePage extends StatefulWidget {
  final int userId;

  const HomePage({
    super.key,
    required this.userId,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();
    store.getFollowedUsers(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, value, child) {
        if (value is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }

        if (value is SuccessState<HomeState>) {
          return SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.output.users.length,
              itemBuilder: (context, index) {
                return CardStory(
                  index: index,
                  user: value.output.users[index],
                  uploadStoryFunction: store.uploadStory,
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
