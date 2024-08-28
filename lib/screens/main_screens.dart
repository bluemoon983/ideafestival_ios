import 'package:flutter/material.dart';
import 'package:iosgsmarket/screens/mypage_screens.dart';
import 'package:iosgsmarket/screens/option_screens.dart';
import 'package:iosgsmarket/screens/search_screens.dart';
import 'package:iosgsmarket/ui/chat_ui.dart';
import 'package:iosgsmarket/ui/shopping_ui.dart';
import 'package:iosgsmarket/ui/writing_ui.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Updated to match the number of tabs
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
            ChatWidget(), // Adjusted this as needed
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
            icon: Icons.settings,
            text: '설정',
            onTap: () => _navigateTo(context, const OptionScreens()),
          ),
          _buildDrawerItem(
            icon: Icons.login_outlined,
            text: '로그아웃',
            onTap: () {},
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

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hello Damyul!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "GSMarket에 온걸 환영해요",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "중고거래를 시작해 볼까요?",
                      style: TextStyle(fontSize: 23),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              "Null",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
