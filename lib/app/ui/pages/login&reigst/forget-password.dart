import 'package:flutter/material.dart';
import 'package:flutter_soon/app/controller/login&reigst/login_regist_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const ForgetPasswordView();
  }
}

class ForgetPasswordView extends GetView<LoginRegistController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LoginPage')),
        body: SafeArea(child: Text('LoginController')));
  }
}
