import 'package:dio/dio.dart';
import 'package:infoapp/models/item.dart';

class BookServices {
  Dio dio = Dio();
  Future<List<Items>> getBooks() async {
    List<Items> bookItems = [];

    String url =
        'https://www.googleapis.com/books/v1/volumes?q=subject:health';

    try {
      await dio.get(url).then((response) {
        if (response.statusCode == 200) {
          // print(response.data['items']);

          var responseItems = response.data['items'];

          for (var items in responseItems) {
            bookItems.add(Items.fromJson(items));
            print(bookItems.length);
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }

    return bookItems;
  }
}
