import 'package:flutter/material.dart';
import 'package:iosgsmarket/widgets/goods_widget.dart';

class ShoppingWidget extends StatelessWidget {
  const ShoppingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "중고 거래",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GoodsWidget(
                name: "이세민의 키보드",
                code: "₩",
                amount: "12,000",
                icon: Icons.keyboard_hide,
                inIverted: false,
              ),
              SizedBox(
                height: 20,
              ),
              GoodsWidget(
                name: "김담율의 핸드폰",
                code: "₩",
                amount: "255,000",
                icon: Icons.phone_iphone,
                inIverted: false,
              ),
              SizedBox(
                height: 20,
              ),
              GoodsWidget(
                name: "함성우의 게임기",
                code: "₩",
                amount: "150,000",
                icon: Icons.videogame_asset,
                inIverted: false,
              ),
              SizedBox(
                height: 20,
              ),
              GoodsWidget(
                name: "한솔이 자전거",
                code: "₩",
                amount: "120,000",
                icon: Icons.pedal_bike,
                inIverted: false,
              ),
              SizedBox(
                height: 20,
              ),
              GoodsWidget(
                name: "마이스터부의 맥북",
                code: "₩",
                amount: "800,000",
                icon: Icons.laptop,
                inIverted: false,
              ),
              SizedBox(
                height: 20,
              ),
              GoodsWidget(
                name: "방송부 카메라",
                code: "₩",
                amount: "300,000",
                icon: Icons.camera_alt,
                inIverted: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
