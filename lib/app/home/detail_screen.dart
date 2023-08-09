import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoapp/models/item.dart';

// ignore: must_be_immutable
class BookDetailScreen extends StatelessWidget {
  final Items item;
  BookDetailScreen({
    required this.item,
    Key? key,
  }) : super(key: key);

  FlutterTts ftts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(43, 42, 42, 1),
        appBar: _buildAppBar(),
        body: buildBody(context),
        floatingActionButton: buildFAB(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Detail Screen",
        style: GoogleFonts.openSans(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildBookCover(context),
                  const SizedBox(height: 8),
                  _buildBookTitle(context),
                  _buildAuthor(context),
                  _buildVolumeInfo(context),
                ],
              ),
            ),
          ),
        ),
        _buildDescInfo(context),
      ],
    );
  }

  Widget buildAppBar(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// navigate back to previous screen
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            "Detail Screen",
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget to build book cover
  ///
  Widget _buildBookCover(BuildContext context) {
    return Container(
      height: 180,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            item.volumeInfo.imageLinks.smallThumbnail,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBookTitle(BuildContext context) {
    return Flexible(
      child: Text(
        item.volumeInfo.title!,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAuthor(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "by ${item.volumeInfo.authors}",
        style: GoogleFonts.lato(
            textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  Widget _buildVolumeInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRatingInfo(context),
          _buildPageInfo(context),
          _buildPublishDateInfo(context)
        ],
      ),
    );
  }

  Widget _buildRatingInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Rating",
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 15, color: Colors.grey[400])),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 18,
            ),
            Text(
              item.volumeInfo.averageRating.toString(),
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPageInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pages",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          item.volumeInfo.pageCount.toString(),
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPublishDateInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Publish date",
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 15, color: Colors.grey[400])),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          item.volumeInfo.publishedDate.toString(),
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDescInfo(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 25),
              child: ListView(
                children: [
                  Text(
                    "About this book?",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item.volumeInfo.description.toString(),
                    style:
                        GoogleFonts.lato(color: Colors.grey[600], fontSize: 15),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildFAB() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.hearing_outlined),
        label: const Text('LISTEN'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () async {
          await ftts.setLanguage("en-India");
          await ftts.setSpeechRate(0.5); //speed of speech
          await ftts.setVolume(1.0); //volume of speech
          await ftts.setPitch(1); //pitc of sound

          await ftts.speak(
            item.volumeInfo.description.toString(),
          );
        },
      ),
    );
  }
}
