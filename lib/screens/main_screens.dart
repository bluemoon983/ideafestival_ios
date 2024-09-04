import 'package:flutter/material.dart';
import 'package:iosgsmarket/screens/alarm_screens.dart';
import 'package:iosgsmarket/screens/login_screens.dart';
import 'package:iosgsmarket/screens/mypage_screens.dart';
import 'package:iosgsmarket/screens/search_screens.dart';
import 'package:iosgsmarket/ui/chat_ui.dart';
import 'package:iosgsmarket/ui/shopping_ui.dart';
import 'package:iosgsmarket/ui/writing_ui.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.shopping_bag)),
            Tab(icon: Icon(Icons.edit)),
            Tab(icon: Icon(Icons.chat)),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
        ),
        endDrawer: _buildMenuDrawer(context),
        body: const TabBarView(
          children: <Widget>[
            _HomeTab(),
            ShoppingWidget(),
            WritingWidget(),
            ChatUi(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: AppBar(
        shape: const Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
        backgroundColor: Colors.white,
        title: const Hero(
          tag: "titlename",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "GSMarket",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateTo(context, const SearchScreens()),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => _navigateTo(context, const MypageScreens()),
            icon: const Icon(Icons.account_circle_rounded),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
    );
  }

  Drawer _buildMenuDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          _buildDrawerItem(
            icon: Icons.home,
            text: '홈',
            onTap: () => Navigator.pop(context),
          ),
          _buildDrawerItem(
            icon: Icons.search,
            text: '검색',
            onTap: () => _navigateTo(context, const SearchScreens()),
          ),
          _buildDrawerItem(
            icon: Icons.notifications_active,
            text: "알림",
            onTap: () => _navigateTo(context, AlarmScreens()),
          ),
          _buildDrawerItem(
            icon: Icons.login_outlined,
            text: '로그아웃',
            onTap: () => _navigateTo(context, const LoginScreens()),
          ),
        ],
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(color: Colors.black),
      child: ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '메뉴',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 130,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }
}

class _HomeTab extends StatefulWidget {
  const _HomeTab();

  @override
  State<_HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<_HomeTab> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _typingController;
  late Animation<double> _fadeAnimation;
  late List<String> _texts;
  int _textIndex = 0;

  @override
  void initState() {
    super.initState();

    // Texts to be animated
    _texts = ["GSMarket에 온걸 환영합니다.", "중고거래를 시작해 볼까요?"];

    // Fade-in animation controller and animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();

    // Typing animation controller
    _typingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Start the typing animation and loop the text
    _typingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _textIndex = (_textIndex + 1) % _texts.length;
            _typingController.reset();
            _typingController.forward();
          });
        });
      }
    });

    _typingController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _typingController.dispose();
    super.dispose();
  }

  String get _currentText {
    final text = _texts[_textIndex];
    final typedLength =
        (_typingController.value * text.length).floor().clamp(0, text.length);
    return text.substring(0, typedLength);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        'Hello Damyul!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedBuilder(
                      animation: _typingController,
                      builder: (context, child) {
                        return Text(
                          _currentText,
                          style: const TextStyle(fontSize: 23),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              "hood",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
            Image.asset('assets/images/hoood.jpg'),
          ],
        ),
      ),
    );
  }
}
