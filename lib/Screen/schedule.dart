import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // Track the state of each light
  final List<bool> _lightStates = [false, false, false, false];
  final List<Color> _lightColors = [
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.purple,
  ];
  final List<String> _lightNames = [
    "Living Room",
    "Bedroom",
    "Kitchen",
    "Bathroom",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Light Scheduler'),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Schedule Your Lights',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildLightCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLightCard(int index) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color:
                          _lightStates[index]
                              ? _lightColors[index]
                              : Colors.grey[600],
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      _lightNames[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: _lightStates[index],
                  onChanged: (value) {
                    setState(() {
                      _lightStates[index] = value;
                    });
                  },
                  activeColor: _lightColors[index],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Schedule',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _showTimePicker(context, index, true),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    ),
                    child: const Text(
                      'Set ON Time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    onPressed: () => _showTimePicker(context, index, false),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    ),
                    child: const Text(
                      'Set OFF Time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showTimePicker(
    BuildContext context,
    int index,
    bool isOnTime,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: _lightColors[index],
              surface: Colors.grey[900]!,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Here you would typically save the schedule
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${_lightNames[index]} set to turn ${isOnTime ? 'ON' : 'OFF'} at ${picked.format(context)}',
          ),
          backgroundColor: _lightColors[index],
        ),
      );
    }
  }
}
