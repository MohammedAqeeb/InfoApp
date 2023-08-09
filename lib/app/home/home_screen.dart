import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoapp/app/home/widgets/preview_lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: const HomePreviewList(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: 70,
      title: Text(
        'Book Info',
        style: GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
