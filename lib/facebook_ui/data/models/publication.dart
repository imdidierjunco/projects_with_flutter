class Publications {
  final String title;
  final DateTime createPost;
  final String imageUrl;
  final int commentCount;
  final int shareCount;
  final User user;
  final Emoji currentUseReaction;

  Publications({
    required this.title,
    required this.createPost,
    required this.imageUrl,
    required this.commentCount,
    required this.shareCount,
    required this.user,
    required this.currentUseReaction,
  });
}

class User {
  final String avatar;
  final String userName;

  User({
    required this.avatar,
    required this.userName,
  });
}

enum Emoji {
  like,
  love,
  laughing,
  shocking,
  sad,
  angry,
}
