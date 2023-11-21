class Post {
  final String id;
  final String title;
  final String postImageUrl; 
  final String postUserProfile; 
  final String likeAmount;
  final String submittedUserId;
  final Map<String, String> comments;

  Post({
    required this.id,
    required this.title,
    required this.postImageUrl,
    required this.postUserProfile,
    required this.likeAmount,
    required this.submittedUserId,
    required this.comments,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      postImageUrl: map['post'] ?? '',
      postUserProfile: map['postUserProfile'] ?? '',
      likeAmount: map['like_amount'] ?? 0,
      submittedUserId: map['submited_user_id'] ?? '',
      comments: (map['comments'] as Map<String, dynamic>?)
              ?.map((key, value) => MapEntry(key, value as String)) ??
          {},
    );
  }
}
