import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(post: post),
          SizedBox(
            height: 6,
          ),
          post.caption != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(post.caption),
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 6,
          ),
          post.imageUrl != null
              ? CachedNetworkImage(imageUrl: post.imageUrl)
              : SizedBox.shrink(),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Palette.facebookBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.thumb_up,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    '${post.likes}',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Text(
                  '${post.comments} Comments',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '${post.shares} Shares',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up,
                    color: Colors.grey[600],
                  ),
                  label: Text(
                    'Like',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment,
                    color: Colors.grey[600],
                  ),
                  label: Text(
                    'Comment',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.offline_share,
                    color: Colors.grey[600],
                  ),
                  label: Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          ProfileAvatar(imageUrl: post.user.imageUrl),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '${post.timeAgo} •',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Icon(
                      Icons.public,
                      size: 20,
                      color: Colors.grey[600],
                    )
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => print('more pressed'),
          )
        ],
      ),
    );
  }
}
