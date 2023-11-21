import 'package:flutter/material.dart';
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
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)), // Delay of 2 seconds
      builder: (context, snapshot) {
        return
Column(
        children: List.generate(
          posts.length,
          (index) => Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(posts[index].postUserProfile),
                      radius: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                    posts[index].title,
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
                        posts[index].postImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Opacity(
                      opacity: isHeartAnimating ? 1 : 0,
                      child: HeartAnimationWidget(
                        key: ValueKey(posts[index].postImageUrl),
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
                      onPressed: () {}, icon: const Icon(Icons.send_outlined)),
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
                   
                     Text('Liked by ${posts[index].likeAmount}'),
                   
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 3, bottom: 3),
                child: Row(
                  children: [
                    Text(
                      "10-29",
                      style: const TextStyle(
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
       
    );
  }
}
