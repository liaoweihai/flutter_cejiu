import 'package:flutter/material.dart';
import 'package:flutter_soon/app/controller/home/shoping_deatil_controller.dart';
import 'package:get/get.dart';

class ShopingDetailPage extends GetView<ShopingDetailController> {
  const ShopingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: const Text('text'),
      ),
    );
  }
}

class ShopingDetail extends StatefulWidget {
  const ShopingDetail({Key? key}) : super(key: key);

  @override
  _ShopingDetailState createState() => _ShopingDetailState();
}

class _ShopingDetailState extends State<ShopingDetail> {
  @override
  Widget build(BuildContext context) {
    return ShopingDetailPage();
  }
}
