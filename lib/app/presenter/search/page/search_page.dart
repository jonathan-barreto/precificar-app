import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/data/models/user_search_model.dart';
import 'package:precificar_app/app/presenter/search/state/search_state.dart';
import 'package:precificar_app/app/presenter/search/store/search_store.dart';
import 'package:precificar_app/app/presenter/widgets/cached_image.dart';
import 'package:precificar_app/init.dart';

class SearchPage extends StatefulWidget {
  final int idUser;

  const SearchPage({
    super.key,
    required this.idUser,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchStore store = getIt<SearchStore>();

  @override
  void initState() {
    super.initState();
    store.fetchUser(
      idUser: widget.idUser,
    );
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

        if (value is SuccessState<SearchState>) {
          return ListView.builder(
            itemCount: value.output.users.length,
            itemBuilder: (context, index) {
              final SearchUserModel user = value.output.users[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: SizedBox(
                  height: 100,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CachedImage(id: user.id),
                        Text(
                          value.output.users[index].name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (user.following)
                          IconButton(
                            onPressed: () {
                              store.unfollowUser(
                                idUser: widget.idUser,
                                unfollowId: user.id,
                                index: index,
                              );
                            },
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                        if (!user.following)
                          IconButton(
                            onPressed: () {
                              store.followUser(
                                idUser: widget.idUser,
                                followId: user.id,
                                index: index,
                              );
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
