// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/firebase_helper/firebase_data_helper.dart';
import 'package:social_media_app/screens/widgets/heart_animation_widget.dart';

/// posts
class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isHeartAnimating = false;
  bool isLiked = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    SocialMediaProvider socialProvider =
        Provider.of<SocialMediaProvider>(context);
    return Column(
      children: List.generate(
        socialProvider.posts.length,
        (index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(socialProvider.posts[index].postUserProfile),
                    radius: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                   socialProvider. posts[index].title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz)
                ],
              ),
            ),
            GestureDetector(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                     socialProvider. posts[index].postImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Opacity(
                    opacity: isHeartAnimating ? 1 : 0,
                    child: HeartAnimationWidget(
                      key: ValueKey(socialProvider.posts[index].postImageUrl),
                      onEnd: () => setState(() {
                        isHeartAnimating = false;
                      }),
                      isAnimating: isHeartAnimating,
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
              onDoubleTap: () {
                setState(() {
                  isHeartAnimating = true;
                  isLiked = true;
                });
              },
            ),
            Row(
              children: [
                HeartAnimationWidget(
                  alWaysAnimate: true,
                  isAnimating: isLiked,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isLiked == true) {
                            isLiked = false;
                          } else {
                            isLiked = true;
                          }
                        });
                      },
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_outline,
                        color: isLiked ? Colors.red : Colors.black,
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_comment_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined)),
                const Spacer(),
                HeartAnimationWidget(
                  alWaysAnimate: true,
                  isAnimating: isBookmarked,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isBookmarked == true) {
                            isBookmarked = false;
                          } else {
                            isBookmarked = true;
                          }
                        });
                      },
                      icon: Icon(
                        isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_outline_outlined,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  Text('Liked by ${socialProvider.posts[index].likeAmount}'),
                ],
              ),
            ),
          const  Padding(
              padding:  EdgeInsets.only(left: 7, top: 3, bottom: 3),
              child: Row(
                children: [
                  Text(
                    "10-29",
                    style:  TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
