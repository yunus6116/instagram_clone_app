import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../constant/post_json.dart';
import '../constant/story_json.dart';
import '../widgets/post_item.dart';
import '../widgets/story_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // stories burada gösterilecek ve horizontal scrool olacak.
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 15, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 65,
                        height: 65,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(profile),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                  ),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: buttonFollowColor,
                                    size: 19,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: white),
                        ),
                      )
                    ],
                  ),
                ),
                // Storyler'i story_json dosyasıdan çek ve yan yana göster.
                Row(
                  children: List.generate(stories.length, (index) {
                    return StoryItem(
                      img: stories[index]['img'],
                      name: stories[index]['name'],
                    );
                  }),
                ),
              ],
            ),
          ),
          Divider(
            color: white.withOpacity(0.3),
          ),
          // Postları posts_json dosyasından çek ve alt alta göster.
          Column(
            children: List.generate(posts.length, (index) {
              return PostItem(
                postImg: posts[index]['postImg'],
                profileImg: posts[index]['profileImg'],
                name: posts[index]['name'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                viewCount: posts[index]['commentCount'],
                likedBy: posts[index]['likedBy'],
                timeAgo: posts[index]['timeAgo'],
              );
            }),
          )
        ],
      ),
    );
  }
}
