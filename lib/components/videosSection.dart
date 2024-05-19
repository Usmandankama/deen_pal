import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class VideosWidget extends StatefulWidget {
  const VideosWidget({super.key});

  @override
  State<VideosWidget> createState() => _VideosWidgetState();
}

class _VideosWidgetState extends State<VideosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/supplication.jpg',
            height: 100,
            width: 165,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 165,
            decoration: BoxDecoration(
              color: colors.tileColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            // padding: const EdgeInsets.all(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Learn about patience',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: colors.secondaryColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
