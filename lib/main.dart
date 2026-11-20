
import 'package:flutter/material.dart';

void main() {
  runApp(const VyroApp());
}

const Color background = Color(0xFF090B14);
const Color surface = Color(0xFF151827);
const Color accent = Color(0xFF795BFF);

class VyroApp extends StatelessWidget {
  const VyroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VYRO',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const VyroHome(),
    );
  }
}

class VyroHome extends StatefulWidget {
  const VyroHome({super.key});

  @override
  State<VyroHome> createState() => _VyroHomeState();
}

class _VyroHomeState extends State<VyroHome> {
  int selected = 0;

  final List<String> titles = [
    'Discover',
    'Explore',
    'Create',
    'Messages',
    'You',
  ];

  Widget homeFeed() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Your world. Your people.',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Discover what is happening around you.',
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 24),
        const Text(
          'STORIES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 105,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              story('Your story', true),
              story('Creative', false),
              story('Explorer', false),
              story('Trending', false),
              story('Friends', false),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'YOUR FEED',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        postCard('VYRO Creator', 'Welcome to a new social experience.',
            'A new world of creativity starts here.', 0),
        postCard('Creative World', 'Create something extraordinary.',
            'Share your imagination with the world.', 1),
        postCard('Explore More', 'Discover people and new ideas.',
            'Your next inspiration is waiting.', 2),
      ],
    );
  }

  Widget story(String name, bool own) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [accent, Color(0xFF00D5D5)],
              ),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: surface,
              child: Icon(
                own ? Icons.add : Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(name, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  Widget postCard(String name, String heading, String description, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: accent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Just now'),
            trailing: const Icon(Icons.more_horiz),
          ),
          Container(
            height: 190,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: index == 0
                    ? [const Color(0xFF32206D), accent]
                    : index == 1
                        ? [const Color(0xFF075C65), const Color(0xFF14243B)]
                        : [const Color(0xFF7A315D), const Color(0xFF282050)],
              ),
            ),
            child: Center(
              child: Text(
                heading,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(description),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mode_comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget otherPage() {
    if (selected == 1) {
      return const Center(child: Text('Explore VYRO'));
    }
    if (selected == 2) {
      return Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Creator tools coming next!')),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Create a post'),
        ),
      );
    }
    if (selected == 3) {
      return const Center(child: Text('Your messages'));
    }
    return const Center(child: Text('Your VYRO profile'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'VYRO',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            color: Color(0xFFAA98FF),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: selected == 0 ? homeFeed() : otherPage(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: surface,
        indicatorColor: accent.withValues(alpha: 0.25),
        selectedIndex: selected,
        onDestinationSelected: (value) {
          setState(() => selected = value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            label: 'Create',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Inbox',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
