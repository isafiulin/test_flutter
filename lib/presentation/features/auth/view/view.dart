import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_shop_app/presentation/features/auth/bloc/auth_bloc.dart';
import 'package:test_shop_app/presentation/features/main/main_tab_screen.dart';
import 'package:test_shop_app/presentation/widgets/custom_button.dart';
import 'package:test_shop_app/presentation/widgets/custom_input_field.dart';
import 'package:test_shop_app/presentation/widgets/extensions/custom_paint.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: CustomPaint(
          painter: AuthPagePainter(deviceSize: size),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthConfirmedState) {
                  print("f");
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    MainTabScreen.routeName,
                    (Route<dynamic> route) => false,
                  );
                }
                if (state is AuthConfirmedErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Произошла ошибка авторизации"),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        "Добро пожаловать",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Gilroy"),
                      )),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                        controller: loginController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        width: double.infinity,
                        borderRadius: 38,
                        backgroundColor: Colors.green,
                        borderColor: Colors.green,
                        spaceBetweenIcon: false,
                        title: "Войти",
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthConfirmPressed(
                              login: loginController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                      ),
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
