import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/core/utils/colors/app_colors.dart';
import 'package:precificar_app/app/presenter/home/page/home_page.dart';
import 'package:precificar_app/app/presenter/initial/state/initial_state.dart';
import 'package:precificar_app/app/presenter/initial/store/initial_store.dart';
import 'package:precificar_app/app/presenter/login/page/login_page.dart';
import 'package:precificar_app/app/presenter/person/page/person_page.dart';
import 'package:precificar_app/app/presenter/search/page/search_page.dart';
import 'package:precificar_app/init.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final InitialStore store = getIt<InitialStore>();

  late final arguments;

  late final List<Widget> widgets;

  @override
  void initState() {
    super.initState();

    store.selectIndex(
      index: 0,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    arguments = ModalRoute.of(context)!.settings.arguments;

    final int userId = int.parse(arguments["userId"]);

    widgets = [
      HomePage(userId: userId),
      SearchPage(idUser: userId),
      const PersonPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, value, child) {
        if (value is SuccessState<InitialState>) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'PRECIFICAR',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            body: widgets[value.output.index],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Person',
                ),
              ],
              currentIndex: value.output.index,
              onTap: (value) => store.selectIndex(
                index: value,
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
