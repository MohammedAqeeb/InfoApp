import 'package:flutter/material.dart';
import 'package:infoapp/models/item.dart';

import '../detail_screen.dart';

class HomeWidgetPreview extends StatelessWidget {
  final Items volumeInfo;
  const HomeWidgetPreview({
    Key? key,
    required this.volumeInfo,
  }) : super(key: key);

  @override

  /// Widget to build book preview that includes book thumbnail and title
  ///
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //
        // On tap of the preview navigate to book detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(
              item: volumeInfo,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(
            14,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // book thumbnail preview
              bookImagePreview(),

              // book title
              bookInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Container bookImagePreview() {
    return Container(
      height: 150,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(volumeInfo.volumeInfo.imageLinks.thumbnail),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Expanded bookInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Book Title : ${volumeInfo.volumeInfo.title!}",
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Average Rating : ${volumeInfo.volumeInfo.averageRating.toString()}",
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Publisher : ${volumeInfo.volumeInfo.publisher.toString()}",
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Published Date : ${volumeInfo.volumeInfo.publishedDate.toString()}",
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
