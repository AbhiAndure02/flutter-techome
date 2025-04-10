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
        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: Colors.white,
            fontSize: isSmallScreen ? 24 : 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
          child: const Text('TechHome'),
        ),
        actions: [
          IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.wifi_outlined,
                key: ValueKey<bool>(isSmallScreen),
                size: isSmallScreen ? 24 : 28,
              ),
            ),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.settings_outlined,
                key: ValueKey<bool>(isSmallScreen),
                size: isSmallScreen ? 24 : 28,
              ),
            ),
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
              FadeIn(
                delay: 100,
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
                  ],
                ),
              ),
              SizedBox(height: isSmallScreen ? 20 : 30),

              // Smart Devices Grid
              FadeIn(
                delay: 200,
                child: Text(
                  'Smart Devices',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 20 : 22,
                    fontWeight: FontWeight.bold,
                  ),
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
                    delay: 300,
                  ),
                  _DeviceCard(
                    icon: Icons.lightbulb_outline,
                    name: 'Light 3',
                    isActive: true,
                    color: Colors.green,
                    isSmallScreen: isSmallScreen,
                    delay: 400,
                  ),
                  _DeviceCard(
                    icon: Icons.lightbulb_outline,
                    name: 'Light 2',
                    isActive: true,
                    color: Colors.blue,
                    isSmallScreen: isSmallScreen,
                    delay: 500,
                  ),
                  _DeviceCard(
                    icon: Icons.lightbulb_outline,
                    name: 'Light 4',
                    isActive: true,
                    color: Colors.purple,
                    isSmallScreen: isSmallScreen,
                    delay: 600,
                  ),
                ],
              ),
              SizedBox(height: isSmallScreen ? 30 : 40),

              // Quick Actions
              FadeIn(
                delay: 700,
                child: Text(
                  'Quick Actions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 20 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final buttonSize =
                      isSmallScreen
                          ? constraints.maxWidth / 4.5
                          : (isLargeScreen ? 100 : 80);
                  return Wrap(
                    spacing: isSmallScreen ? 10 : 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      FadeIn(
                        delay: 800,
                        child: _ActionButton(
                          icon: Icons.timer_outlined,
                          label: 'Timer',
                          color: Colors.pinkAccent,
                          size: buttonSize.toDouble(),
                          isSmallScreen: isSmallScreen,
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const BulbTimerApp(),
                                transitionsBuilder: (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      FadeIn(
                        delay: 900,
                        child: _ActionButton(
                          icon: Icons.schedule_outlined,
                          label: 'Schedule',
                          color: Colors.tealAccent,
                          size: buttonSize.toDouble(),
                          isSmallScreen: isSmallScreen,
                          onPressed: () {},
                        ),
                      ),
                      FadeIn(
                        delay: 1000,
                        child: _ActionButton(
                          icon: Icons.energy_savings_leaf_outlined,
                          label: 'Energy',
                          color: Colors.lightGreen,
                          size: buttonSize.toDouble(),
                          isSmallScreen: isSmallScreen,
                          onPressed: () {},
                        ),
                      ),
                      FadeIn(
                        delay: 1100,
                        child: _ActionButton(
                          icon: Icons.add_alert_outlined,
                          label: 'Alerts',
                          color: Colors.redAccent,
                          size: buttonSize.toDouble(),
                          isSmallScreen: isSmallScreen,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: isSmallScreen ? 30 : 40),

              // Recent Activity
              FadeIn(
                delay: 1200,
                child: Text(
                  'Recent Activity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 20 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeIn(
                delay: 1300,
                child: _ActivityItem(
                  icon: Icons.lightbulb_outline,
                  title: 'Light 1',
                  subtitle: 'Turned on 10 minutes ago',
                  color: Colors.amber,
                  isSmallScreen: isSmallScreen,
                ),
              ),
              FadeIn(
                delay: 1400,
                child: _ActivityItem(
                  icon: Icons.lock_outline,
                  title: 'Front Door',
                  subtitle: 'Locked 1 hour ago',
                  color: Colors.blue,
                  isSmallScreen: isSmallScreen,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isSmallScreen ? 60 : 70,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavItem(
              icon: Icons.home_outlined,
              label: 'Home',
              isActive: true,
              isSmallScreen: isSmallScreen,
            ),
            _BottomNavItem(
              icon: Icons.devices_outlined,
              label: 'Devices',
              isActive: false,
              isSmallScreen: isSmallScreen,
            ),
            _BottomNavItem(
              icon: Icons.insights_outlined,
              label: 'Insights',
              isActive: false,
              isSmallScreen: isSmallScreen,
            ),
            _BottomNavItem(
              icon: Icons.person_outlined,
              label: 'Profile',
              isActive: false,
              isSmallScreen: isSmallScreen,
            ),
          ],
        ),
      ),
    );
  }
}

class FadeIn extends StatelessWidget {
  final Widget child;
  final int delay;

  const FadeIn({super.key, required this.child, required this.delay});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - value) * 20),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _DeviceCard extends StatefulWidget {
  final IconData icon;
  final String name;
  final bool isActive;
  final Color color;
  final bool isSmallScreen;
  final int delay;

  const _DeviceCard({
    required this.icon,
    required this.name,
    required this.isActive,
    required this.color,
    required this.isSmallScreen,
    required this.delay,
  });

  @override
  State<_DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<_DeviceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${widget.name} tapped!'),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(
                widget.isSmallScreen ? 15 : 20,
              ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: widget.isSmallScreen ? 8 : 10),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.isSmallScreen ? 8 : 10,
                      vertical: widget.isSmallScreen ? 4 : 6,
                    ),
                    decoration: BoxDecoration(
                      color:
                          widget.isActive
                              ? widget.color.withOpacity(0.2)
                              : Colors.grey[800]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: widget.isSmallScreen ? 8 : 10,
                          height: widget.isSmallScreen ? 8 : 10,
                          decoration: BoxDecoration(
                            color:
                                widget.isActive
                                    ? widget.color
                                    : Colors.grey[500],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: widget.isSmallScreen ? 6 : 8),
                        Text(
                          widget.isActive ? 'Active' : 'Inactive',
                          style: TextStyle(
                            color:
                                widget.isActive
                                    ? widget.color
                                    : Colors.grey[500],
                            fontSize: widget.isSmallScreen ? 12 : 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
    return InkWell(
      borderRadius: BorderRadius.circular(size),
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
              ),
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
      ),
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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey[900]!, Colors.grey[850]!],
        ),
        borderRadius: BorderRadius.circular(isSmallScreen ? 12 : 15),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isSmallScreen ? 40 : 50,
            height: isSmallScreen ? 40 : 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
              ),
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

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isSmallScreen;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: isSmallScreen ? 24 : 28,
          color: isActive ? Colors.white : Colors.white54,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white54,
            fontSize: isSmallScreen ? 10 : 12,
          ),
        ),
      ],
    );
  }
}
