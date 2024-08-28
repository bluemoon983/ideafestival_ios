import 'package:flutter/material.dart';
import 'package:iosgsmarket/widgets/outline_button_widget.dart';

class MypageScreens extends StatelessWidget {
  const MypageScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Damyul",
          style: TextStyle(
            fontSize: 49,
            color: Colors.black,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 수평 중앙 정렬
          children: [
            Icon(
              Icons.account_circle,
              size: 300,
            ),
            SizedBox(height: 20), // 아이콘과 버튼 간의 간격
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
              children: [
                CustomOutlineButton(
                  text: "찜한거",
                ),
                SizedBox(width: 10), // 버튼 간의 간격
                CustomOutlineButton(
                  text: "내가 파는 거",
                ),
              ],
            ),
            SizedBox(height: 10), // Row와 아래 버튼 간의 간격
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
              children: [
                CustomOutlineButton(
                  text: "구매 내역",
                ),
                SizedBox(width: 10), // 버튼 간의 간격
                CustomOutlineButton(
                  text: "엄 뭐더라",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
