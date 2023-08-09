import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoapp/app/home/logic.dart';
import 'package:infoapp/models/item.dart';

import 'preview.dart';

class HomePreviewList extends StatefulWidget {
  const HomePreviewList({super.key});

  @override
  State<HomePreviewList> createState() => _HomePreviewListState();
}

class _HomePreviewListState extends State<HomePreviewList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeLogic().getBookPreview(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            final List<Items> bookModel = snapshot.data!;

            if (bookModel.isEmpty) {
              return _buildListEmpty(context);
            } else {
              // display preview list
              return _buildDocsList(context, bookModel);
            }
          } else {
            return _buildListEmpty(context);
          }
        } else {
          return _buildListEmpty(context);
        }
      }),
    );
  }

  Widget _buildListEmpty(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 25),
            Flexible(
              child: Text(
                "No Books Available",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDocsList(BuildContext context, List<Items> books) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: books.length,
      itemBuilder: (ctx, index) {
        return HomeWidgetPreview(
          volumeInfo: books[index],
        );
      },
    );
  }
}
