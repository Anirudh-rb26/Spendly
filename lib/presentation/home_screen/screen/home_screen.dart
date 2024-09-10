import 'package:flutter/material.dart';
import 'package:spendly/components/bottom_navbar.dart';
import 'package:spendly/presentation/home_screen/components/gradient_button.dart';
import 'package:spendly/presentation/home_screen/screen/home_content.dart';
import 'package:spendly/presentation/stat_screen/screens/stat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  late PageController _pageController;

  void _onNavBarTap(int index) {
    setState(() {
      pageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: pageIndex,
        onTap: _onNavBarTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const GradientButton(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          HomeContent(),
          StatScreen(),
        ],
      ),
    );
  }
}
