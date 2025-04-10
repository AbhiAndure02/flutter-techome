import 'package:flutter/material.dart';
import 'package:my_app/Screen/timer.dart';

class BeautifulHome extends StatelessWidget {
  const BeautifulHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isLargeScreen = screenWidth > 1200;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'TechHome',
          style: TextStyle(
            color: Colors.white,
            fontSize: isSmallScreen ? 24 : 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.wifi_outlined, size: isSmallScreen ? 24 : 28),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined, size: isSmallScreen ? 24 : 28),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 16.0 : 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back,',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: isSmallScreen ? 16 : 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Abhishek Andure!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 24 : 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isSmallScreen ? 20 : 30),

              // Smart Devices Grid
              Text(
                'Smart Devices',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 20 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: isSmallScreen ? 2 : (isLargeScreen ? 4 : 2),
                crossAxisSpacing: isSmallScreen ? 14 : 20,
                mainAxisSpacing: isSmallScreen ? 16 : 20,
                childAspectRatio: isSmallScreen ? 0.9 : 1.4,
                children: [
                  _DeviceCard(
                    icon: Icons.lightbulb_outline,
                    name: 'Light 1',
                    isActive: true,
                    color: Colors.amber,
                    isSmallScreen: isSmallScreen,
                  ),
                  _DeviceCard(
                    icon: Icons.lightbulb_outline,
                    name: 'Light 3',
                    isActive: true,
                    color: Colors.green,
                    isSmallScreen: isSmallScreen,
                  ),
                  _DeviceCard(
                    icon: Icons.lightbulb_outline,
                    name: 'Light 2',
                    isActive: true,
                    color: Colors.blue,
                    isSmallScreen: isSmallScreen,
                  ),
                  _DeviceCard(
                    icon: Icons.lightbulb_outline,
                    name: 'Light 4',
                    isActive: true,
                    color: Colors.purple,
                    isSmallScreen: isSmallScreen,
                  ),
                ],
              ),
              SizedBox(height: isSmallScreen ? 30 : 40),

              // Quick Actions
              Text(
                'Quick Actions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 20 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final buttonSize =
                      isSmallScreen
                          ? constraints.maxWidth / 4.5
                          : (isLargeScreen ? 100 : 80);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ActionButton(
                        icon: Icons.scale_outlined,
                        label: 'Timer',
                        color: Colors.pinkAccent,
                        size: buttonSize.toDouble(),
                        isSmallScreen: isSmallScreen,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TimerScreen(),
                            ),
                          );
                        },
                      ),
                      _ActionButton(
                        icon: Icons.schedule_outlined,
                        label: 'Schedule',
                        color: Colors.tealAccent,
                        size: buttonSize.toDouble(),
                        isSmallScreen: isSmallScreen,
                        onPressed: () {
                          // Add your timer functionality here
                        },
                      ),
                      _ActionButton(
                        icon: Icons.energy_savings_leaf_outlined,
                        label: 'Use',
                        color: Colors.lightGreen,
                        size: buttonSize.toDouble(),
                        isSmallScreen: isSmallScreen,
                        onPressed: () {
                          // Add your timer functionality here
                        },
                      ),
                      if (isLargeScreen)
                        _ActionButton(
                          icon: Icons.add_alert_outlined,
                          label: 'Alerts',
                          color: Colors.redAccent,
                          size: buttonSize.toDouble(),
                          isSmallScreen: isSmallScreen,
                          onPressed: () {
                            // Add your timer functionality here
                          },
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: isSmallScreen ? 30 : 40),

              // Recent Activity
              Text(
                'Recent Activity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 20 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _ActivityItem(
                icon: Icons.lightbulb_outline,
                title: 'Light 1',
                subtitle: 'Turned on 10 minutes ago',
                color: Colors.amber,
                isSmallScreen: isSmallScreen,
              ),
              _ActivityItem(
                icon: Icons.lock_outline,
                title: 'Front Door',
                subtitle: 'Locked 1 hour ago',
                color: Colors.blue,
                isSmallScreen: isSmallScreen,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type:
            isSmallScreen
                ? BottomNavigationBarType.fixed
                : BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: isSmallScreen ? 24 : 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices_outlined, size: isSmallScreen ? 24 : 28),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined, size: isSmallScreen ? 24 : 28),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, size: isSmallScreen ? 24 : 28),
            label: 'Profile',
          ),
          if (isLargeScreen)
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                size: isSmallScreen ? 24 : 28,
              ),
              label: 'Settings',
            ),
        ],
      ),
    );
  }
}

class _DeviceCard extends StatefulWidget {
  final IconData icon;
  final String name;
  final bool isActive;
  final Color color;
  final bool isSmallScreen;

  const _DeviceCard({
    required this.icon,
    required this.name,
    required this.isActive,
    required this.color,
    required this.isSmallScreen,
  });

  @override
  State<_DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<_DeviceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.name} tapped!'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(widget.isSmallScreen ? 15 : 20),
            boxShadow:
                widget.isActive
                    ? [
                      BoxShadow(
                        color: widget.color.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ]
                    : null,
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.isSmallScreen ? 12 : 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              children: [
                Icon(
                  widget.icon,
                  size: widget.isSmallScreen ? 32 : 40,
                  color: widget.isActive ? widget.color : Colors.grey[600],
                ),
                SizedBox(height: widget.isSmallScreen ? 10 : 15),
                Text(
                  widget.name,
                  style: TextStyle(
                    color: widget.isActive ? Colors.white : Colors.grey[400],
                    fontSize: widget.isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Center the text
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: widget.isSmallScreen ? 8 : 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the row
                  mainAxisSize: MainAxisSize.min, // Make row take minimum space
                  children: [
                    Container(
                      width: widget.isSmallScreen ? 10 : 12,
                      height: widget.isSmallScreen ? 10 : 12,
                      decoration: BoxDecoration(
                        color:
                            widget.isActive ? widget.color : Colors.grey[700],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: widget.isSmallScreen ? 6 : 8),
                    Text(
                      widget.isActive ? 'Active' : 'Inactive',
                      style: TextStyle(
                        color:
                            widget.isActive ? widget.color : Colors.grey[500],
                        fontSize: widget.isSmallScreen ? 12 : 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final double size;
  final bool isSmallScreen;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.size,
    required this.isSmallScreen,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, size: isSmallScreen ? 24 : 30, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: isSmallScreen ? 12 : 14,
          ),
        ),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final bool isSmallScreen;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(isSmallScreen ? 12 : 15),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 15),
      ),
      child: Row(
        children: [
          Container(
            width: isSmallScreen ? 40 : 50,
            height: isSmallScreen ? 40 : 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: isSmallScreen ? 20 : 24),
          ),
          SizedBox(width: isSmallScreen ? 12 : 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: isSmallScreen ? 12 : 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_outlined,
            color: Colors.grey[600],
            size: isSmallScreen ? 28 : 34,
          ),
        ],
      ),
    );
  }
}
