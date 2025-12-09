// lib/screens/farmer_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class FarmerHomePage extends StatefulWidget {
  final String userName;

  const FarmerHomePage({
    super.key,
    required this.userName,
  });

  @override
  State<FarmerHomePage> createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _fruits = [
    {'name': 'Apples', 'icon': Icons.apple, 'days': 5},
    {'name': 'Cherries', 'icon': Icons.circle, 'days': 12},
  ];

  @override
  void initState() {
    super.initState();
    // مهم عشان ما يطلع LocaleDataException
    initializeDateFormatting('en', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      body: SafeArea(
        child: Stack(
          children: [
            // الهيدر البرتقالي
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.orange[700]!,
                      Colors.amber[600]!,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                SizedBox(
                  height: 250,
                  child: _buildHeaderSection(),
                ),
                Transform.translate(
                  offset: const Offset(0, -80),
                  child: _buildWeatherBox(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 0),
                  child: _buildAddFarmBox(),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: _buildViewHistoryBox(),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: _buildScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: 0,
            right: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo قبل Hello
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/tabbat.logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Farmer ${widget.userName}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _getCurrentDateTime(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications_none,
                color: Colors.amber[700],
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherBox() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined,
                    color: Colors.grey[700], size: 15),
                const SizedBox(width: 5),
                Text(
                  'San Francisco, CA',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '72°',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Partly Cloudy',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 22),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue[800]!,
                        Colors.blue[900]!,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.cloud_queue,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWeatherDetailCard(0),
                const SizedBox(width: 7),
                _buildWeatherDetailCard(1),
                const SizedBox(width: 7),
                _buildWeatherDetailCard(2),
                const SizedBox(width: 7),
                _buildWeatherDetailCard(3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetailCard(int index) {
    final List<Map<String, dynamic>> weatherDetails = [
      {
        'icon': Icons.wb_sunny_outlined,
        'label': 'UV',
        'value': 'High',
        'color': Colors.amber.withOpacity(0.12),
        'iconColor': Colors.amber[700],
        'textColor': Colors.amber[800],
      },
      {
        'icon': Icons.water_drop_outlined,
        'label': 'Humid',
        'value': '68%',
        'color': Colors.pink.withOpacity(0.12),
        'iconColor': Colors.pink[400],
        'textColor': Colors.pink[800],
      },
      {
        'icon': Icons.cloud_outlined,
        'label': 'Rain',
        'value': '20%',
        'color': Colors.blue.withOpacity(0.12),
        'iconColor': Colors.blue[400],
        'textColor': Colors.blue[800],
      },
      {
        'icon': Icons.air_outlined,
        'label': 'Wind',
        'value': '12mph',
        'color': Colors.teal.withOpacity(0.12),
        'iconColor': Colors.teal[400],
        'textColor': Colors.teal[800],
      },
    ];

    final detail = weatherDetails[index];

    return Container(
      width: 75,
      padding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      decoration: BoxDecoration(
        color: detail['color'],
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: detail['iconColor']!.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            detail['icon'] as IconData,
            color: detail['iconColor'],
            size: 18,
          ),
          const SizedBox(height: 2),
          Text(
            detail['label'] as String,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: detail['textColor'],
            ),
          ),
          const SizedBox(height: 1),
          Text(
            detail['value'] as String,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: detail['textColor'],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddFarmBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.green[400]!,
            Colors.blue[400]!,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.6),
                      width: 1.1),
                ),
                child: const Icon(
                  Icons.eco_outlined,
                  color: Colors.white,
                  size: 19,
                ),
              ),
              const SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Farm',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Add a new farm to your account',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }

  Widget _buildViewHistoryBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.green[400]!,
            Colors.blue[400]!,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                          color:
                              Colors.white.withOpacity(0.6),
                          width: 1.1),
                    ),
                    child: const Icon(
                      Icons.history_outlined,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'View History',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'View harvest and activity history',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 26,
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildFruitItem(_fruits[0]),
          const SizedBox(height: 5),
          _buildFruitItem(_fruits[1]),
        ],
      ),
    );
  }

  Widget _buildFruitItem(Map<String, dynamic> fruit) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: Colors.green.withOpacity(0.2),
          width: 1.1,
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  fruit['icon'],
                  color: Colors.green[800],
                  size: 18,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    fruit['name'],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  Text(
                    'Harvest soon',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: Colors.green[800],
                  size: 12,
                ),
                const SizedBox(width: 3),
                Text(
                  '${fruit['days']} days',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.orange[700]!,
            Colors.amber[600]!,
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.6),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(Icons.qr_code_scanner, size: 30),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 18,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 40, vertical: 7),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.grid_view_outlined,
                Icons.grid_view, 'Home', 0),
            _buildNavItem(Icons.person_outline,
                Icons.person, 'Profile', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData iconOutlined,
      IconData iconFilled, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 36,
            decoration: BoxDecoration(
              color: _currentIndex == index
                  ? Colors.white.withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              _currentIndex == index
                  ? iconFilled
                  : iconOutlined,
              color: _currentIndex == index
                  ? Colors.amber
                  : Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: _currentIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentDateTime() {
    final now = DateTime.now();
    final dateFormat =
        DateFormat('EEEE, dd MMMM yyyy', 'en');
    final timeFormat = DateFormat('hh:mm a', 'en');
    return '${dateFormat.format(now)} | ${timeFormat.format(now)}';
  }
}
