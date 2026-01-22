import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using a stream builder to react to auth changes for user info
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        return Scaffold(
          backgroundColor: const Color(0xFF101C22), // background-dark
          appBar: _buildAppBar(user),
          body: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              _buildStatsSummary(),
              _buildSectionHeader("Daily Actions"),
              _buildDailyActionsList(),
              _buildSectionHeader("Reference"),
              _buildReferenceList(),
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(User? user) {
    return AppBar(
      backgroundColor: const Color(0xFF101C22).withOpacity(0.8),
      elevation: 0,
      toolbarHeight: 80,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:
                user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
            backgroundColor: const Color(0xFF2BADEE).withOpacity(0.2),
            child: user?.photoURL == null
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DASHBOARD',
                style: GoogleFonts.lexend(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                user?.displayName ?? 'User',
                style: GoogleFonts.lexend(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // TODO: Implement search functionality
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSummary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          _buildStatCard(
            icon: Icons.local_fire_department,
            iconColor: Colors.orange.shade500,
            label: 'STREAK',
            value: '15',
            subValue: 'Days',
            subValueColor: const Color(0xFF2BADEE),
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            icon: Icons.stars,
            iconColor: const Color(0xFF2BADEE),
            label: 'TOTAL XP',
            value: '1,250',
            subValue: '+15%',
            subValueColor: const Color(0xFF2BADEE),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required String subValue,
    required Color subValueColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A272E),
          borderRadius: BorderRadius.circular(60),
          // border: Border.all(color: Colors.grey.shade800, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: GoogleFonts.lexend(
                    color: Colors.grey[400],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: GoogleFonts.lexend(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  subValue,
                  style: GoogleFonts.lexend(
                    color: subValueColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16)
          .copyWith(top: 24),
      child: Text(
        title,
        style: GoogleFonts.lexend(
          color: Colors.grey[500],
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildDailyActionsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildActionItem(
            icon: Icons.style,
            title: 'Review Due',
            subtitle: 'Flashcards backlog',
            trailing: _buildCountBadge('24'),
          ),
          const SizedBox(height: 4),
          _buildActionItem(
            icon: Icons.menu_book,
            title: 'New Words for Today',
            subtitle: '5 new characters to learn',
          ),
          const SizedBox(height: 4),
          _buildActionItem(
            icon: Icons.extension,
            title: 'Vocabulary Match',
            subtitle: 'Timed drill exercise',
          ),
        ],
      ),
    );
  }

  Widget _buildReferenceList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildActionItem(
            icon: Icons.grid_on,
            title: 'Practice Tables',
            subtitle: 'Hiragana & Katakana',
          ),
          const SizedBox(height: 4),
          _buildActionItem(
            icon: Icons.account_tree,
            title: 'Kanji Radicals',
            subtitle: 'Explore 214 basic parts',
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
  }) {
    return Material(
      color: const Color(0xFF1A272E),
      borderRadius: BorderRadius.circular(55),
      child: InkWell(
        borderRadius: BorderRadius.circular(55),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(55),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2BADEE).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF2BADEE), size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.lexend(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing,
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: Colors.grey[600], size: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountBadge(String count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF2BADEE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count,
        style: GoogleFonts.lexend(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
