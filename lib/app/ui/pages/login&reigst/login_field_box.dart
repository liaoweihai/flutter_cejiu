import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_cejiu/app/ui/pages/login&reigst/timer_button.dart';

class LoginFieldBox extends StatefulWidget {
  final String? icon;
  final String? hintString;
  final double? marginTop;
  final bool? ifTimeButton;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<Widget>? subWidget;
  final TimerButton? timerBtn;
  final String? value;
  final VoidCallback? onPressed; //  = (){};
  final ValueChanged<String>? onChanged;

  LoginFieldBox(
      {this.icon,
      this.hintString,
      this.marginTop,
      this.ifTimeButton,
      this.keyboardType,
      this.obscureText = false,
      this.onPressed,
      this.value,
      this.onChanged,
      Key? key})
      : timerBtn = ifTimeButton != null
            ? TimerButton(
                label: '获取验证码',
                onPressed: onPressed ?? () {},
                timeOutInSeconds: 60,
                secPostFix: '重新获取',
                buttonType: ButtonType.TextButton,
                disabledColor: Colors.transparent,
                color: Colors.transparent,
              )
            : null,
        subWidget = [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            width: 12.5,
            height: 15.5,
            child: Image.asset(icon ?? ''),
          ),
        ],
        super(key: key);

  @override
  LoginFieldBoxState createState() => LoginFieldBoxState();
}

class LoginFieldBoxState extends State<LoginFieldBox> {
  late final TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final widgets = widget.subWidget ?? [];

    widgets.add(Expanded(
      child: TextField(
        controller: _controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        showCursor: false,
        onChanged: widget.onChanged,
        decoration: InputDecoration.collapsed(hintText: widget.hintString),
      ),
    ));

    if (widget.timerBtn != null) {
      widgets.add(widget.timerBtn!);
    }
    return Container(
        margin: EdgeInsets.only(top: widget.marginTop ?? 20),
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(max(44.h, 44) * 0.5)),
        width: 1.sw - 36.w * 2,
        height: max(44.h, 44),
        child: Row(
          children: widgets,
        ));
  }
}
