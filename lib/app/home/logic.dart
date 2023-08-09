import 'package:infoapp/models/item.dart';
import 'package:infoapp/services/book_services.dart';

class HomeLogic {
  /// funtion to getBook details
  ///
  ///
  Future<List<Items>> getBookPreview() async {
    return await BookServices().getBooks();
  }
}
