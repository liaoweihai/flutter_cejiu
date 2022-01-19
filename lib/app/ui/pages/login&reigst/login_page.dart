import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/login&reigst/login_regist_controller.dart';
import 'package:flutter_soon/app/routes/app_pages.dart';
import 'package:flutter_soon/app/ui/pages/login&reigst/login_field_box.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    String? authorization = prefs.getString('Authorization');
    if (authorization != null) {
      // ApiRequest().authorization = authorization;
      print('获取本地token === $authorization');
    }
  }

  @override
  Widget build(BuildContext context) {
    ///适配工具初始化
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        context: context,
        designSize: const Size(375, 957),
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return const LoginView();
  }
}

class LoginView extends GetView<LoginRegistController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          width: 1.sw,
          height: (75 + 44).h,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                    // width: 109.w,
                    height: 54.h,
                    child: Image.asset(
                      'assets/images/login2.png',
                      fit: BoxFit.fill,
                    )),
              ),
              Positioned(
                left: 36.w,
                child: SizedBox(
                  width: 1.sw - 36.w * 2,
                  height: max(44.h, 44),
                  child: OutlinedButton(
                      onPressed: () {
                        // Get.offAllNamed(Routes.tabBar);
                        Get.find<LoginRegistController>().login();
                      },
                      child: Text('登录',
                          style: SeaFont.s15FontTextStyle(
                            color: Colors.white,
                          )),
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: ColorsUtil.mainColor)),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => ColorsUtil.mainColor))),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 22.5.w, top: 77.h),
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 25.sp),
                  ),
                ),
                SizedBox(
                    width: 114.w,
                    height: 152.h,
                    child: Image.asset(
                      'assets/images/login1.png',
                      fit: BoxFit.fill,
                    )),
              ],
            ),
            Obx(() => LoginFieldBox(
                  icon: 'assets/images/shoujihao.png',
                  hintString: '请输手机号码',
                  marginTop: 35,
                  value: controller.mobile,
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    controller.mobile = text;
                  },
                )),
            Obx(() => LoginFieldBox(
                  icon: 'assets/images/mima.png',
                  hintString: '请输入密码',
                  obscureText: true,
                  value: controller.password,
                  onChanged: (text) {
                    controller.password = text;
                  },
                )),
            Container(
                width: 1.sw - 36.w * 2,
                height: max(44.h, 44),
                margin: EdgeInsets.only(top: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.regist);
                        },
                        child: Text('立即注册',
                            style: SeaFont.s13FontTextStyle(
                                color: ColorsUtil.mainColor))),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.forgetPassword);
                        },
                        child: Text(
                          '忘记密码',
                          style: SeaFont.s13FontTextStyle(),
                        ))
                  ],
                ))
          ],
        ));
  }
}
