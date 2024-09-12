import 'package:flutter/material.dart';

class ForgetidScreens extends StatefulWidget {
  const ForgetidScreens({super.key});

  @override
  _ForgetidScreensState createState() => _ForgetidScreensState();
}

class _ForgetidScreensState extends State<ForgetidScreens> {
  bool isMetric = true;
  bool isImperial = false;
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = [isMetric, isImperial]; // 초기 상태 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: toggleSelect,
              color: Colors.black, // 기본 텍스트 색상
              selectedColor: Colors.white, // 선택된 텍스트 색상 (흰색)
              fillColor: Colors.black, // 선택된 버튼 배경색 (검정색)
              borderRadius: BorderRadius.circular(10),
              borderColor: Colors.black, // 테두리 색상
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Forgot Id',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toggleSelect(int index) {
    setState(
      () {
        if (index == 0) {
          isMetric = true;
          isImperial = false;
        } else {
          isMetric = false;
          isImperial = true;
        }
        isSelected = [isMetric, isImperial]; // 상태 업데이트
      },
    );
  }
}
