import 'package:flutter/material.dart';
import 'package:rcinemaapps/Data/movie.dart'; 
import 'package:rcinemaapps/utils/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<MovieModel> popularItems = List.of(popularImages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // The background image
                Container(
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [
                        kBackgroundColor.withOpacity(0.8),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        popularItems[0].imageAsset.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // The basic information
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Miracle in Cell No.7",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "2022 | 2 Jam 25 Menit",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          // The ratings
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "9.7",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // The category information
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTag("Comedy"),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTag("Drama"),
                          const SizedBox(
                            width: 10,
                          ),
                          buildTag("Family"),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Text(
                          "Seorang pria yang sakit jiwa menghadapi konsekuensi dari seorang politisi Indonesia yang korup karena ia dituduh melakukan pembunuhan, dan yang ia inginkan hanyalah bertemu putrinya lagi.",
                          style: TextStyle(
                            color: Colors.white70,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // Thumbnail over each other
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "images/trailer_1.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: kBackgroundColor.withOpacity(0.8),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Comments",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    color: kBackgroundColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            buildCommentCard(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: kButtonColor,
                alignment: Alignment.center,
                height: 68,
                child: const Text(
                  "Watch Movie",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTag(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: kSearchbarColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white30,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildCommentCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 160,
      child: ListView.builder(
        itemCount: popularItems[0].comments!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kSearchbarColor,
            ),
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            popularItems[0].comments![index]['imageUrl'].toString(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(popularItems[0].comments![index]['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(popularItems[0].comments![index]['date'],
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                popularItems[0].comments![index]['rating'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.star, 
                                color: Colors.yellow,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    popularItems[0].comments![index]['comment'],
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
