import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const ProfileAvatar({Key key, @required this.imageUrl, this.isActive = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        !isActive
            ? const SizedBox.shrink()
            : Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.online,
                      border: Border.all(width: 2, color: Colors.white)),
                ),
              ),
      ],
    );
  }
}
