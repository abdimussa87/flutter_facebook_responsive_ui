import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

import '../models/models.dart';

class Stories extends StatelessWidget {
  final List<Story> storiesList;
  final User currentUser;
  const Stories({Key key, this.storiesList, this.currentUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storiesList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _StoryCard(isCurrentUser: true, currentUser: currentUser);
          }
          Story story = storiesList[index - 1];
          return _StoryCard(story: story);
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isCurrentUser;
  final User currentUser;
  final Story story;

  const _StoryCard({
    Key key,
    this.isCurrentUser = false,
    this.currentUser,
    this.story,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  isCurrentUser ? currentUser.imageUrl : story.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          height: double.infinity,
          width: 150,
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 10,
          left: 12,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: !isCurrentUser
                  ? story.isViewed
                      ? Border.all(color: Colors.transparent, width: 0)
                      : Border.all(color: Palette.facebookBlue, width: 2)
                  : Border.all(
                      color: Colors.transparent,
                    ),
            ),
            child: isCurrentUser
                ? IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    color: Palette.facebookBlue,
                    onPressed: () => print('Add Clicked'),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,
                  ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 10,
          right: 8,
          child: Text(
            isCurrentUser ? 'Add to Story' : story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
