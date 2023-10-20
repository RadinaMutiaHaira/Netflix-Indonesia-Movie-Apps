import 'package:flutter/material.dart';
import 'package:rcinemaapps/Data/movie.dart';
import 'package:rcinemaapps/Screens/category_screen.dart';
import 'package:rcinemaapps/utils/colors.dart';
import 'package:rcinemaapps/widgets/custom_card_normal.dart';
import 'package:rcinemaapps/widgets/custom_card_thumbnail.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // items
  List<MovieModel> foryouItemsList = List.of(forYouImages);
  List<MovieModel> popularItemsList = List.of(popularImages);
  List<MovieModel> genresItemsList = List.of(genresList);
  List<MovieModel> legendaryItemsList = List.of(legendaryImages);

  PageController pageController = PageController(initialPage: 0, viewportFraction: 0.9);

  int currentPage = 0;
  final ValueNotifier<int> pageNotifier = ValueNotifier<int>(0);

  //tabbar icons
  List<IconData> tabBarIcons = [Icons.home, Icons.category, Icons.person];

  // indicators
  List<Widget> buildPageIndicatorWidgets() {
    List<Widget> list = [];
    for (int i = 0; i < foryouItemsList.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      pageNotifier.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hi, Radina!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image: AssetImage("images/profile.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    child: Text(
                      "For you",
                      style: TextStyle(
                        color: Color(0x6BFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  foryoucardsLayout(forYouImages),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: kSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: buildPageIndicatorWidgets(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Populer",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            color: kButtonColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  movieListBuilder(popularItemsList),
                  // genres
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Genres",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            color: kButtonColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  genresBuilder(genresList),
                  // legendary
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Legendary",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            color: kButtonColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  movieListBuilder(legendaryItemsList),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: kBackgroundColor,
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: tabBarIcons.asMap().entries.map((entry) {
                  final index = entry.key;
                  final icon = entry.value;
                  return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                        // Navigasi ke beranda
                    } else if (index == 1) {
                        // Navigasi ke halaman kategori
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return CategoryScreen();
                    }));
                    } else {
                        // Tambahkan logika navigasi ke beranda atau profil pengguna di sini
                      }
                    },
                  child: Icon(
                      icon,
                      color: index == 0 ? Colors.white : Colors.white54,
                      size: 25,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi foryoucardsLayout
  Widget foryoucardsLayout(List<MovieModel> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.47,
      child: PageView.builder(
        physics: ClampingScrollPhysics(),
        controller: pageController,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return CustomCardThumbnail(
            imageAsset: movieList[index].imageAsset.toString(),
          );
        },
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
            pageNotifier.value = page;
          });
        },
      ),
    );
  }

  Widget movieListBuilder(List<MovieModel> movieList) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return CustomCardNormal(
            movieModel: movieList[index],
          );
        },
      ),
    );
  }

  // Building the genres here
  Widget genresBuilder(List<MovieModel> genresList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        itemCount: genresList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      genresList[index].imageAsset.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 2,
                  bottom: 5,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: Text(
                  genresList[index].movieName.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
