import 'package:flutter/material.dart';

class WritingWidget extends StatelessWidget {
  const WritingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "내 물건 팔기",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_enhance),
            ),
            const Text(
              "사진 추가",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "제목",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              width: 390, // 원하는 너비로 설정
              height: 100, // 원하는 높이로 설정
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // 여러 줄 입력 가능
              ),
            ),
            const Text(
              "가격",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              width: 390, // 원하는 너비로 설정
              height: 100, // 원하는 높이로 설정
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // 여러 줄 입력 가능
              ),
            ),
            const Text(
              "상세 설명",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              width: 390, // 원하는 너비로 설정
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 3, // 최소 3줄 높이
                maxLines: 10, // 최대 10줄 높이
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 버튼을 Row의 중앙에 배치
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 20.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    child: const Text(
                      "게시",
                    ),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 20.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    child: const Text(
                      "게시",
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
