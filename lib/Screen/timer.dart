import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BulbTimerApp());
}

class BulbTimerApp extends StatelessWidget {
  const BulbTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bulb Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.grey[900],
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.blue.withOpacity(0.2),
          labelStyle: const TextStyle(color: Colors.blue),
        ),
      ),
      themeMode: ThemeMode.system, // Automatically switch between light/dark
      home: const TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with TickerProviderStateMixin {
  late final List<BulbTimer> _bulbs;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _bulbs = [
      BulbTimer(id: 1, name: "Bulb 1", vsync: this),
      BulbTimer(id: 2, name: "Bulb 2", vsync: this),
      BulbTimer(id: 3, name: "Bulb 3", vsync: this),
      BulbTimer(id: 4, name: "Bulb 4", vsync: this),
    ];
  }

  @override
  void dispose() {
    for (var bulb in _bulbs) {
      bulb.dispose();
    }
    super.dispose();
  }

  void _startAllTimers() {
    for (var bulb in _bulbs) {
      if (bulb.isActive && bulb.timeInMinutes > 0) {
        bulb.startTimer();
      }
    }
    setState(() {});
  }

  void _resetAllTimers() {
    for (var bulb in _bulbs) {
      bulb.resetTimer();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    _isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bulb Timer Control'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              // This would require a state management solution to properly toggle
              // For now it will follow system theme
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _bulbs.length,
                itemBuilder: (context, index) {
                  return _buildBulbControl(_bulbs[index], isSmallScreen, theme);
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildActionButtons(isSmallScreen, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(bool isSmallScreen, ThemeData theme) {
    final anyActive = _bulbs.any((b) => b.isActive && b.timeInMinutes > 0);

    final buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );

    if (isSmallScreen) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: AnimatedScale(
              scale: anyActive ? 1 : 0.9,
              duration: const Duration(milliseconds: 200),
              child: ElevatedButton(
                onPressed: anyActive ? _startAllTimers : null,
                style: buttonStyle,
                child: const Text('START ALL', style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: anyActive ? 1 : 0.9,
                  child: ElevatedButton(
                    onPressed: anyActive ? _resetAllTimers : null,
                    style: buttonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.redAccent,
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'RESET ALL',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: anyActive ? 1 : 0.9,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedScale(
            scale: anyActive ? 1 : 0.9,
            duration: const Duration(milliseconds: 200),
            child: ElevatedButton(
              onPressed: anyActive ? _startAllTimers : null,
              style: buttonStyle.copyWith(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
              child: const Text('START ALL', style: TextStyle(fontSize: 16)),
            ),
          ),
          AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: anyActive ? 1 : 0.9,
            child: ElevatedButton(
              onPressed: anyActive ? _resetAllTimers : null,
              style: buttonStyle.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
              child: const Text('RESET ALL', style: TextStyle(fontSize: 16)),
            ),
          ),
          AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: anyActive ? 1 : 0.9,
            child: ElevatedButton(
              onPressed:
                  anyActive
                      ? () {
                        Navigator.pushNamed(context, '/timer');
                      }
                      : null,
              style: buttonStyle.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
              child: const Text('GO TO TIMER', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildBulbControl(
    BulbTimer bulb,
    bool isSmallScreen,
    ThemeData theme,
  ) {
    final isDark = theme.brightness == Brightness.dark;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(bottom: bulb.isRunning ? 16 : 8),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bulb.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        bulb.isRunning
                            ? Chip(
                              label: Text(
                                '${bulb.timeInMinutes} min remaining',
                                style: TextStyle(
                                  color: theme.chipTheme.labelStyle?.color,
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              isSmallScreen
                  ? _buildSmallScreenLayout(bulb, theme, isDark)
                  : _buildLargeScreenLayout(bulb, theme, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallScreenLayout(BulbTimer bulb, ThemeData theme, bool isDark) {
    return Column(
      children: [
        // Bulb visualization
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                bulb.isActive = !bulb.isActive;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    bulb.isActive
                        ? Colors.yellow.withOpacity(0.8)
                        : (isDark
                            ? Colors.grey[800]
                            : Colors.grey.withOpacity(0.3)),
                boxShadow:
                    bulb.isActive
                        ? [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.6),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ]
                        : null,
              ),
              child: Icon(
                Icons.lightbulb,
                size: 30,
                color:
                    bulb.isActive
                        ? Colors.amber
                        : (isDark ? Colors.grey[400] : Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Time controls
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: TextEditingController(
                  text: bulb.timeInMinutes.toString(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Minutes',
                  labelStyle: TextStyle(
                    color: theme.textTheme.labelLarge?.color,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                ),
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                onChanged: (value) {
                  bulb.timeInMinutes = int.tryParse(value) ?? 0;
                },
              ),
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      bulb.timeInMinutes += 1;
                    });
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.1),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (bulb.timeInMinutes > 0) {
                        bulb.timeInMinutes -= 1;
                      }
                    });
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child:
                    bulb.isActive
                        ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              bulb.isActive = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('TURN OFF'),
                        )
                        : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              bulb.isActive = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('TURN ON'),
                        ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed:
                  bulb.isActive && bulb.timeInMinutes > 0
                      ? () {
                        setState(() {
                          bulb.startTimer();
                        });
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('START'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLargeScreenLayout(BulbTimer bulb, ThemeData theme, bool isDark) {
    return Row(
      children: [
        // Bulb visualization
        GestureDetector(
          onTap: () {
            setState(() {
              bulb.isActive = !bulb.isActive;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  bulb.isActive
                      ? Colors.yellow.withOpacity(0.8)
                      : (isDark
                          ? Colors.grey[800]
                          : Colors.grey.withOpacity(0.3)),
              boxShadow:
                  bulb.isActive
                      ? [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.6),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ]
                      : null,
            ),
            child: Icon(
              Icons.lightbulb,
              size: 30,
              color:
                  bulb.isActive
                      ? Colors.amber
                      : (isDark ? Colors.grey[400] : Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time controls
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(
                        text: bulb.timeInMinutes.toString(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Minutes',
                        labelStyle: TextStyle(
                          color: theme.textTheme.labelLarge?.color,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                      onChanged: (value) {
                        bulb.timeInMinutes = int.tryParse(value) ?? 0;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            bulb.timeInMinutes += 1;
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (bulb.timeInMinutes > 0) {
                              bulb.timeInMinutes -= 1;
                            }
                          });
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child:
                          bulb.isActive
                              ? ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    bulb.isActive = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('TURN OFF'),
                              )
                              : ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    bulb.isActive = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('TURN ON'),
                              ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed:
                        bulb.isActive && bulb.timeInMinutes > 0
                            ? () {
                              setState(() {
                                bulb.startTimer();
                              });
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('START'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BulbTimer {
  final int id;
  final String name;
  int timeInMinutes;
  bool isActive;
  bool isRunning;
  late AnimationController _controller;

  BulbTimer({
    required this.id,
    required this.name,
    required TickerProvider vsync,
    this.timeInMinutes = 0,
    this.isActive = false,
    this.isRunning = false,
  }) {
    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
  }

  void startTimer() {
    if (timeInMinutes > 0 && isActive) {
      isRunning = true;
      _controller.repeat(reverse: true);
      // In a real app, you would start an actual countdown timer here
    }
  }

  void resetTimer() {
    timeInMinutes = 0;
    isActive = false;
    isRunning = false;
    _controller.reset();
  }

  void dispose() {
    _controller.dispose();
  }
}
