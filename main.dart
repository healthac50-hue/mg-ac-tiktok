import 'package:flutter/material.dart';

void main() {
  runApp(const MgAcTikTokApp());
}

class MgAcTikTokApp extends StatelessWidget {
  const MgAcTikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MG AC TikTok',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<String> videos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: currentIndex,
        children: [
          VideoFeed(videos: videos),
          const Center(
            child: Text(
              'Discover',
              style: TextStyle(fontSize: 28),
            ),
          ),
          const Center(
            child: Icon(Icons.add_circle, size: 70),
          ),
          const Center(
            child: Text(
              'Inbox',
              style: TextStyle(fontSize: 28),
            ),
          ),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class VideoFeed extends StatelessWidget {
  final List<String> videos;

  const VideoFeed({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoItem(
          videoUrl: videos[index],
          username: '@mg_ac_tiktok',
        );
      },
    );
  }
}

class VideoItem extends StatelessWidget {
  final String videoUrl;
  final String username;

  const VideoItem({
    super.key,
    required this.videoUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 80,
              color: Colors.white54,
            ),
          ),
        ),

        const Positioned(
          top: 45,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'For You',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        Positioned(
          right: 12,
          bottom: 100,
          child: Column(
            children: [
              _ActionButton(
                icon: Icons.person_add,
                label: 'Follow',
              ),
              const SizedBox(height: 22),
              _ActionButton(
                icon: Icons.favorite,
                label: '12K',
              ),
              const SizedBox(height: 22),
              _ActionButton(
                icon: Icons.comment,
                label: '532',
              ),
              const SizedBox(height: 22),
              _ActionButton(
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
        ),

        Positioned(
          left: 15,
          right: 80,
          bottom: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'MG AC TikTok 🎵',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.music_note, size: 16),
                  SizedBox(width: 5),
                  Text('Original sound - MG AC'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 34,
          color: Colors.white,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 25),
          const CircleAvatar(
            radius: 45,
            child: Icon(
              Icons.person,
              size: 50,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '@mg_ac_tiktok',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ProfileStat(
                number: '0',
                label: 'Following',
              ),
              _ProfileStat(
                number: '0',
                label: 'Followers',
              ),
              _ProfileStat(
                number: '0',
                label: 'Likes',
              ),
            ],
          ),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Edit profile'),
          ),
          const Divider(),
          const Expanded(
            child: Center(
              child: Text(
                'No videos yet',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String number;
  final String label;

  const _ProfileStat({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
