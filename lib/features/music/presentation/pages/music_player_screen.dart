import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset('assets/down_arrow.png'),
        actions: [
          Image.asset('assets/transcript_icon.png'),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
