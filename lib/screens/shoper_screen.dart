import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'farms_screen.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildScanButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildFarmSection(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader() {
    return Container(
      height: 300, // نفس طول الهيدر في صفحة الفارمر
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 30),
      // ↑ هنا نزّلنا كل المجموعة (لوغو + Hello + التاريخ) لتحت أكثر
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 90, 128, 90),
            Color.fromARGB(255, 60, 156, 78),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // نفس حجم اللوغو تبع الفارمر
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Image(
                  image: AssetImage("assets/tabbat.logo.png"),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Shopper $userName",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _getCurrentDateTime(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),

          // المسافة بين (Hello + اللوغو) والـ search bar
          const SizedBox(height: 25),

          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Look for a farm from here…",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentDateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE, dd MMMM yyyy');
    final timeFormat = DateFormat('hh:mm a');
    return '${dateFormat.format(now)} | ${timeFormat.format(now)}';
  }

  // ================= FARM SECTION =================
  Widget _buildFarmSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Explore Farms",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.eco, size: 40, color: Colors.green),
                    Icon(Icons.agriculture, size: 40, color: Colors.green),
                    Icon(Icons.local_florist, size: 40, color: Colors.green),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "No added farms yet.",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FarmsPage()),
                    );
                  },
                  child: const Text(
                    "Explore Farms now",
                    style: TextStyle(
                      color: Color.fromARGB(255, 185, 149, 105),
                      fontSize: 16,
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

  // ================= BOTTOM NAV =================
  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home_outlined, size: 28),
            SizedBox(width: 40),
            Icon(Icons.person_outline, size: 28),
          ],
        ),
      ),
    );
  }

  // ================= SCAN BUTTON =================
  Widget _buildScanButton() {
    return FloatingActionButton(
      onPressed: () {
        // TODO: add scan action
      },
      backgroundColor: const Color.fromARGB(255, 185, 149, 105),
      child: const Icon(Icons.center_focus_strong, size: 32),
    );
  }
}
