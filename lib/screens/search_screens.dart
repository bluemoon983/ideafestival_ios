import 'package:flutter/material.dart';

class SearchScreens extends StatelessWidget {
  const SearchScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Hero(
          tag: "titlename",
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            return ScaleTransition(
              scale: animation.drive(
                Tween(begin: 0.9, end: 1.0)
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: Material(
                color: Colors.transparent,
                child: toHeroContext.widget,
              ),
            );
          },
          child: const Material(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              // Hero with Custom Animation
              Hero(
                tag: "searchBarHero",
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  return Material(
                    color:
                        Colors.transparent, // Makes the background transparent
                    child: ScaleTransition(
                      scale: animation.drive(
                        Tween(begin: 0.8, end: 1.0)
                            .chain(CurveTween(curve: Curves.easeInOut)),
                      ),
                      child: toHeroContext.widget,
                    ),
                  );
                },
                child: const Material(
                  color: Colors.transparent,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, // Adjusts the height of the search bar
                        horizontal: 10.0,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: "검색.... ",
                      hintStyle:
                          TextStyle(color: Colors.black54, fontSize: 16.0),
                      filled: true,
                      fillColor: Colors.white, // Background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color when enabled
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black, // Border color when focused
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
