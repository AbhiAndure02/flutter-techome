import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = "Abhishek Andure";
  String _email = "abhishek.andure@example.com";
  bool _darkMode = true;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _buildSettingsSection(),
            const SizedBox(height: 30),
            _buildAccountSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blueAccent, width: 3),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/profile_pic.jpg', // Replace with your asset
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) =>
                      Icon(Icons.person, size: 60, color: Colors.grey[600]),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(_email, style: TextStyle(color: Colors.grey[400], fontSize: 16)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Edit profile functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          ),
          child: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Card(
          color: Colors.grey[900],
          child: Column(
            children: [
              _buildListTile(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                trailing: Switch(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildListTile(
                icon: Icons.notifications,
                title: 'Notifications',
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: Colors.blueAccent,
                ),
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildListTile(
                icon: Icons.language,
                title: 'Language',
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  // Language selection
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Card(
          color: Colors.grey[900],
          child: Column(
            children: [
              _buildListTile(
                icon: Icons.security,
                title: 'Privacy & Security',
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  // Privacy settings
                },
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildListTile(
                icon: Icons.help,
                title: 'Help & Support',
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  // Help center
                },
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildListTile(
                icon: Icons.info,
                title: 'About',
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  // About screen
                },
              ),
              const Divider(height: 1, color: Colors.grey),
              _buildListTile(
                icon: Icons.logout,
                title: 'Logout',
                iconColor: Colors.redAccent,
                textColor: Colors.redAccent,
                onTap: () {
                  _showLogoutDialog();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.blueAccent),
      title: Text(
        title,
        style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text('Logout', style: TextStyle(color: Colors.white)),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform logout
                Navigator.of(context).pop();
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}
