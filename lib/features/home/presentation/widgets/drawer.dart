import 'package:flutter/material.dart';
import 'package:haoyako/features/profile/presentation/pages/profile_screen.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;
  final GlobalKey<CustomDrawerState> drawerKey;

  CustomDrawer({required this.child, required this.drawerKey})
      : super(key: drawerKey);

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const double maxSlide = 255.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          double slide = maxSlide * _controller.value;
          double scale = 1 - (_controller.value * 0.2);
          return Stack(
            children: [
              _buildDrawer(context),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: widget.child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Material(
      color: Colors.blue, // Background color for the drawer
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDrawerItem(
              icon: Icons.home_outlined,
              label: 'Home',
              isSelected: true, // Highlight Home as selected
              onTap: () {
                // Navigate to home page
                toggle();
              },
            ),
            _buildDrawerItem(
              icon: Icons.person_outline,
              label: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );

                toggle();
              },
            ),
            _buildDrawerItem(
              icon: Icons.location_on_outlined,
              label: 'Nearby',
              onTap: () {
                // Navigate to nearby page
                toggle();
              },
            ),
            Divider(color: Colors.white54), // Optional divider
            _buildDrawerItem(
              icon: Icons.bookmark_border,
              label: 'Bookmark',
              onTap: () {
                // Navigate to bookmark page
                toggle();
              },
            ),
            _buildDrawerItem(
              icon: Icons.notifications_outlined,
              label: 'Notification',
              onTap: () {
                // Navigate to notification page
                toggle();
              },
            ),
            _buildDrawerItem(
              icon: Icons.message_outlined,
              label: 'Message',
              onTap: () {
                // Navigate to message page
                toggle();
              },
            ),
            Divider(color: Colors.white54), // Optional divider
            _buildDrawerItem(
              icon: Icons.settings_outlined,
              label: 'Setting',
              onTap: () {
                // Navigate to settings page
                toggle();
              },
            ),
            _buildDrawerItem(
              icon: Icons.help_outline,
              label: 'Help',
              onTap: () {
                // Navigate to help page
                toggle();
              },
            ),
            _buildDrawerItem(
              icon: Icons.logout,
              label: 'Logout',
              onTap: () {
                // Handle logout
                toggle();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
              ? Colors.blueAccent
              : Colors.white, // Change icon color when selected
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.blueAccent
                : Colors.white, // Change text color when selected
            fontSize: 16,
          ),
        ),
        selected: isSelected,
        selectedTileColor: Colors.white,
        onTap: onTap,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
