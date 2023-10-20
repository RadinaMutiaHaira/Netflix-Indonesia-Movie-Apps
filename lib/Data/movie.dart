class MovieModel {
  String? imageAsset;
  String? movieName;
  String? movieRating;
  String? year;
  final List<Map>? comments;

  MovieModel(
      {this.imageAsset,
      this.movieName,
      this.movieRating,
      this.year,
      this.comments});
}

// data
final forYouImages = [
  MovieModel(imageAsset: "images/for_your_image_1.jpeg"),
  MovieModel(imageAsset: "images/for_your_image_2.jpg"),
  MovieModel(imageAsset: "images/for_your_image_3.jpg"),
  MovieModel(imageAsset: "images/for_your_image_4.jpg"),
];

final popularImages = [
  MovieModel(
      imageAsset: "images/popular_image_1.jpg",
      movieName: "Miracle in Cell No.7",
      comments: [
        {
          "name": "Radina Mutia Haira",
          "imageUrl": "images/actor_3.png",
          "date": "Senin, 09-10-2023",
          "rating": "5.0",
          "comment":
              "Film nya sangat menguras air mata!"
        },
        {
          "name": "Siti Julfa",
          "imageUrl": "images/actor_3.png",
          "date": "Sabtu, 07-10-2023",
          "rating": "5.0",
          "comment": "Sedih bangett"
        },
        {
          "name": "Muhammad Adlany Haira",
          "imageUrl": "images/actor_2.png",
          "date": "Rabu, 04-10-2023",
          "rating": "5.0",
          "comment": "Suka banget sama film nya!"
        },
      ],
      year: "2022",
      movieRating: "9.7"),
  MovieModel(
      imageAsset: "images/popular_image_2.jpg",
      movieName: "KKN di Desa Penari",
      year: "2022",
      movieRating: "8.5"),
  MovieModel(
      imageAsset: "images/for_your_image_4.jpg",
      movieName: "The Big 4",
      year: "2022",
      movieRating: "9.7"),
  MovieModel(
      imageAsset: "images/popular_image_3.jpg",
      movieName: "Merindu Cahaya de Amstel",
      year: "2022",
      movieRating: "7.2"),
  MovieModel(
      imageAsset: "images/for_your_image_3.jpg",
      movieName: "Keluarga Cemara 2",
      year: "2022",
      movieRating: "8.0"),
];
final legendaryImages = [
  MovieModel(
      imageAsset: "images/legendary_movie_1.png",
      movieName: "Petualangan Sherina 2",
      year: "2022",
      movieRating: "7.4"),
  MovieModel(
      imageAsset: "images/legendary_movie_2.jpg",
      movieName: "Terlalu Tampan",
      year: "2019",
      movieRating: "7.5"),
  MovieModel(
      imageAsset: "images/popular_image_3.jpg",
      movieName: "Merindu Cahaya de Amstel",
      year: "2022",
      movieRating: "8.3"),
  MovieModel(
      imageAsset: "images/for_your_image_2.jpg",
      movieName: "Dear Nathan",
      year: "2017",
      movieRating: "7.7"),
  MovieModel(
      imageAsset: "images/for_your_image_1.jpeg",
      movieName: "Lara Ati Ini",
      year: "2022",
      movieRating: "7.2"),
];

final genresList = [
  MovieModel(movieName: "Comedy", imageAsset: "images/genres_1.jpg"),
  MovieModel(movieName: "Romance", imageAsset: "images/genres_2.jpg"),
  MovieModel(movieName: "Horor", imageAsset: "images/genres_3.jpg"),
  MovieModel(movieName: "Action", imageAsset: "images/genres_4.jpg"),
  MovieModel(movieName: "Family", imageAsset: "images/genres_5.jpg"),
];