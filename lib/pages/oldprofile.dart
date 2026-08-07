import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            SizedBox(height: 10),
            ProfileHeader(),
            SizedBox(height: 16),
            StatusBar(),
            SizedBox(height: 20),
            ReaderStatsRow(),
            SizedBox(height: 20),
            AboutMeCard(),
            SizedBox(height: 20),
            ProfileDetailsCard(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// 1. Header with Avatar & Online/Reading Badge
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.purple.shade50,
              child: Icon(Icons.person, size: 55, color: Colors.indigo.shade400),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Hazel Kioko",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "@haze_reads",
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

// 2. Custom Reading Status Banner
class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple.shade100),
      ),
      child: Row(
        children: [
          const Text("📖", style: TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CURRENT STATUS",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade700,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  "Currently reading Project Hail Mary 🚀",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Reader Quick Stats Bar
class ReaderStatsRow extends StatelessWidget {
  const ReaderStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem("14", "Read"),
          Container(height: 30, width: 1, color: Colors.grey.shade300),
          _buildStatItem("2", "Wishlist"),
          Container(height: 30, width: 1, color: Colors.grey.shade300),
          _buildStatItem("5⭐", "Reviews"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

// 4. About Me Bio Card
class AboutMeCard extends StatelessWidget {
  const AboutMeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.auto_awesome, size: 18, color: Colors.amber),
              SizedBox(width: 8),
              Text(
                "About Me",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Avid Manga reader and coffee addict. Always looking for the next yaoi to keep me up until 3 AM.",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.4),
          ),
        ],
      ),
    );
  }
}

// 5. User Account Info List
class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final fields = [
      {'label': 'Email', 'value': 'haze.kio@example.com', 'icon': Icons.email_outlined},
      {'label': 'Phone', 'value': '0712345678', 'icon': Icons.phone_outlined},
      {'label': 'Favorite Genre', 'value': 'Manga', 'icon': Icons.bookmark_border},
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fields.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Colors.grey.shade300,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) {
          final item = fields[index];
          return ListTile(
            leading: Icon(item['icon'] as IconData, color: Colors.indigo),
            title: Text(
              item['label'] as String,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            subtitle: Text(
              item['value'] as String,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}