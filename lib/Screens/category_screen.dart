import 'package:flutter/material.dart';
import 'package:rcinemaapps/Data/movie.dart';
import 'package:rcinemaapps/utils/colors.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  static List<MovieModel> genresItemsList = List.of(genresList);

  void updateList(String value) {
    setState(() {
      genresItemsList = genresList.where((element) => 
        element.movieName!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kSearchbarColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a movie",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: kSearchbarColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Miracle In Cell No.7",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white54,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: genresItemsList.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    genresItemsList[index].movieName!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Image.asset(
                     "${genresItemsList[index].imageAsset!}",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
