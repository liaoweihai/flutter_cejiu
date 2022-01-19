import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_soon/app/controller/login&reigst/login_regist_controller.dart';
import 'package:flutter_soon/app/routes/app_pages.dart';
import 'package:flutter_soon/app/ui/pages/login&reigst/login_field_box.dart';
import 'package:flutter_soon/app/ui/pages/login&reigst/timer_button.dart';
import 'package:flutter_soon/app/ui/theme/app_colors_util.dart';
import 'package:flutter_soon/app/ui/theme/app_text_util.dart';
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
                        Get.offAllNamed(Routes.tabBar);
                      },
                      child: Text('找回',
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
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 5.w, top: ScreenUtil().statusBarHeight),
                        child: TextButton.icon(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black87,
                              size: 25,
                            ),
                            label: const Text('')),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 35.w, top: 117.h),
                        child: Text(
                          '忘记密码',
                          style: TextStyle(fontSize: 25.sp),
                        ),
                      ),
                    ],
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
            LoginFieldBox(
                icon: 'assets/images/shoujihao.png',
                hintString: '请输手机号码',
                marginTop: 35),
            LoginFieldBox(icon: 'assets/images/mima.png', hintString: '设置新密码'),
            LoginFieldBox(icon: 'assets/images/mima.png', hintString: '确认新密码'),
            LoginFieldBox(
              icon: 'assets/images/yanzhengma.png',
              hintString: '请输入验证码',
              ifTimeButton: true,
              onPressed: () {
                print('点击了获取');
              },
            ),
          ],
        ));
  }
}
