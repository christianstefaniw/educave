import '../../../../data/providers/api_provider_interface.dart';
import '../../post/features/image.dart';
import '../../post/features/text.dart';
import '../../post/post_model.dart';
import 'fetch_posts_strategy.dart';

class FromRecent implements FetchPostsStrategy {
  @override
  Future<List<PostModel>> execute(IApiProvider client) async {
    print('from recent');
    return await Future.delayed(
      const Duration(seconds: 1),
      () => [
        PostModel(
          id: '3',
          username: 'Sarah Cameron',
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
          features: [
            TextFeature(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum et egestas a mi, imperdiet amet euismod nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            )
          ],
          postedIn: 'Coding Club',
          dateTime: DateTime.now(),
          commentCount: 20,
          isSaved: false,
          isLiked: false,
          likeCount: 83,
        ),
        PostModel(
          id: '3',
          username: 'Sarah Cameron',
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
          features: [
            ImageFeature('http://cdn.onlinewebfonts.com/svg/img_33054.png'),
            TextFeature(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum et egestas a mi, imperdiet amet euismod nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
          ],
          postedIn: 'Coding Club',
          dateTime: DateTime.now(),
          commentCount: 20,
          isSaved: false,
          isLiked: false,
          likeCount: 83,
        ),
        PostModel(
          id: '3',
          username: 'Sarah Cameron',
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
          features: [
            TextFeature(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum et egestas a mi, imperdiet amet euismod nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            )
          ],
          postedIn: 'Coding Club',
          dateTime: DateTime.now(),
          commentCount: 20,
          isSaved: false,
          isLiked: false,
          likeCount: 83,
        ),
        PostModel(
          id: '3',
          username: 'Sarah Cameron',
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
          features: [
            TextFeature(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum et egestas a mi, imperdiet amet euismod nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            )
          ],
          postedIn: 'Coding Club',
          dateTime: DateTime.now(),
          commentCount: 20,
          isSaved: false,
          isLiked: false,
          likeCount: 83,
        ),
        PostModel(
          id: '3',
          username: 'Sarah Cameron',
          profilePic:
              'https://e7.pngegg.com/pngimages/122/453/png-clipart-computer-icons-user-profile-avatar-female-profile-heroes-head.png',
          features: [
            TextFeature(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum et egestas a mi, imperdiet amet euismod nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            )
          ],
          postedIn: 'Coding Club',
          dateTime: DateTime.now(),
          commentCount: 20,
          isSaved: false,
          isLiked: false,
          likeCount: 83,
        ),
      ],
    );
  }
}
