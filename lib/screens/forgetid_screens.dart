import 'package:flutter/material.dart';

class ForgetidScreens extends StatefulWidget {
  const ForgetidScreens({super.key});

  @override
  State<ForgetidScreens> createState() => _ForgetidScreensState();
}

class _ForgetidScreensState extends State<ForgetidScreens> {
  // List to keep track of selected state of the ToggleButtons
  List<bool> isSelected = [true, false];
  String buttonText = "아이디 복구"; // Variable to hold the button text

  void toggleSelect(int index) {
    setState(() {
      isSelected = [false, false]; // Deselect all
      isSelected[index] = true; // Select the tapped button
      buttonText = index == 0 ? "아이디 복구" : "비밀번호 재설정"; // Update button text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "비밀번호/아이디를 잊으셨나요?",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "아이디를 복구하거나 비밀번호를 재설정하세요.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 79, 79, 79),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ToggleButtons(
                isSelected: isSelected,
                onPressed: (int index) {
                  toggleSelect(index);
                },
                color: Colors.black, // Default text color
                selectedColor: Colors.white, // Selected text color
                fillColor: Colors.black, // Selected button background color
                borderRadius: BorderRadius.circular(10),
                borderColor: Colors.black, // Border color
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '     아이디     ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '     비밀번호     ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "이메일",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const TextField(
                obscureText: true, // Hide the text for password input
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  hintText: "name@example.com",
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 16.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 500,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onPressed: () => _navigateToMain(context),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "로그인창으로 돌아가기",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "계정이 없으신가요?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToMain(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}
