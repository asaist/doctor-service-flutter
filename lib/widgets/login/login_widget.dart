import 'package:doctor_service_flutter/client/nauka_login_client.dart';
import 'package:doctor_service_flutter/service/validator.dart';
import 'package:doctor_service_flutter/widgets/selected_worker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1800) {
          return LoginWidgetExtends(
            width: constraints.maxWidth * 0.2,
          );
        } else if (constraints.maxWidth < 1800 && constraints.maxWidth > 1400) {
          return LoginWidgetExtends(
            width: constraints.maxWidth * 0.3,
          );
        } else if (constraints.maxWidth < 1400 && constraints.maxWidth > 1000) {
          return LoginWidgetExtends(
            width: constraints.maxWidth * 0.4,
          );
        } else if (constraints.maxWidth < 1000 && constraints.maxWidth > 600) {
          return LoginWidgetExtends(
            width: constraints.maxWidth * 0.5,
          );
        } else {
          return LoginWidgetExtends(
            width: constraints.maxWidth,
          );
        }
      },
    );
  }
}

class LoginWidgetExtends extends StatefulWidget {
  final double width;

  const LoginWidgetExtends({Key? key, required this.width}) : super(key: key);

  @override
  LoginWidgetExtendsState createState() => LoginWidgetExtendsState();
}

class LoginWidgetExtendsState extends State<LoginWidgetExtends> {
  bool _invalid = false;
  bool _obscureText = true;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  void _changeObscureText() {
    setState(
      () {
        _obscureText = !_obscureText;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            SizedBox(
              width: widget.width,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        ),
                        'Вход',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: widget.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          textAlign: TextAlign.left,
                          controller: userNameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            errorBorder: (_invalid)
                                ? const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  )
                                : InputBorder.none,
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                            ),
                            errorText:
                                (_invalid) ? 'Логин введён некорректно' : null,
                            label: const Text(
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                              'Имя пользователя',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: widget.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          obscureText: _obscureText,
                          textAlign: TextAlign.left,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: _changeObscureText,
                                icon: _obscureText
                                    ? const Icon(Icons.remove_red_eye)
                                    : const Icon(
                                        Icons.remove_red_eye_outlined)),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            errorBorder: (_invalid)
                                ? const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  )
                                : InputBorder.none,
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                            ),
                            errorText:
                                (_invalid) ? 'Пароль введён некорректно' : null,
                            label: const Text(
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                              'Пароль',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          height: 55,
                          width: widget.width,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {
                              var isValid = validate(
                                userNameController.text,
                                passwordController.text,
                              );

                              if (isValid) {
                                var login = NaukaLoginClient.login(
                                  userNameController.text,
                                  passwordController.text,
                                );

                                login.then((value) => value != 0
                                    ? {
                                        Navigator.of(context)
                                            .pushReplacementNamed("/start"),
                                        context.read<SelectedWorker>().id =
                                            value
                                      }
                                    : setState(() {
                                        _invalid = true;
                                      }));
                              } else {
                                setState(
                                  () {
                                    isValid
                                        ? _invalid = false
                                        : _invalid = true;
                                  },
                                );
                              }
                            },
                            child: const Text(
                              'Войти',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
