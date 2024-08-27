import 'package:flutter/material.dart';
import 'package:iosgsmarket/screens/mypage_screens.dart';
import 'package:iosgsmarket/screens/option_screens.dart';
import 'package:iosgsmarket/screens/search_screens.dart';
import 'package:iosgsmarket/widgets/shopping_widget.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0), // Adjust the height here
          child: AppBar(
            shape: const Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreens(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MypageScreens(),
                    ),
                  );
                },
                icon: const Icon(Icons.account_circle_rounded),
              ),
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.shopping_bag),
            ),
            Tab(
              icon: Icon(Icons.edit),
            ),
            Tab(
              icon: Icon(Icons.chat),
            ),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: ClipRect(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '메뉴',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Transform.scale(
                        scale: 1.5, // Adjust the scale factor as needed
                        child: Transform.translate(
                          offset: const Offset(
                              -10, 10), // Adjust the offset if needed
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 130, // Adjust the size of the icon as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('홈'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('검색'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreens(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('설정'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OptionScreens(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.login_outlined),
                title: const Text('로그아웃'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "GSMarket에 온걸 환영해요",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "중고거래를 시작해 볼까요?",
                              style: TextStyle(
                                fontSize: 23,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      child: Text(
                        "Null",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ShoppingWidget(),
            OptionScreens(),
          ],
        ),
      ),
    );
  }
}
