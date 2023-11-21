import 'package:flutter/material.dart';
import 'package:precificar_app/app/presenter/widgets/text_field_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userTextController = TextEditingController();
  final passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset('assets/car.png'),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFieldCustom(
                      label: 'User',
                      controller: userTextController,
                    ),
                    TextFieldCustom(
                      label: 'Password',
                      obscureText: true,
                      controller: passTextController,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                          Size(310, 60),
                        ),
                      ),
                      onPressed: () {
                        if (userTextController.value.text.isNotEmpty) {
                          try {
                            final int userId = int.parse(
                              userTextController.value.text,
                            );
                            if (userId >= 0 && userId <= 10) {
                              Navigator.pushReplacementNamed(
                                context,
                                '/initial',
                                arguments: {
                                  'userId': userId,
                                },
                              );
                            }
                          } catch (e) {
                            return;
                          }
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
