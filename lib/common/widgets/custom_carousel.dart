import 'dart:async';
import 'package:appbar/common/utils/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({required this.screenWidth, super.key});
  final double screenWidth;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final List<String> _items = [
    "Item 1",
    "Item 2",
    "Item 3",
  ];

  final PageController _pageController =
      PageController(viewportFraction: 0.45, initialPage: 10);
  int _currentPage = 10;
  Timer? _timer;

  @override
  void initState() {
    _startAutoScroll();
    super.initState();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      _autoScroll();
    });
  }

  void _autoScroll() {
    setState(() {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 400,
        child: PageView.builder(
          onPageChanged: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
          padEnds: false,
          controller: _pageController,
          itemBuilder: (context, index) {
            final realIndex = index % _items.length;
            return _carouselItem(_items[realIndex]);
          },
        ),
      ),
    );
  }

  Widget _carouselItem(String item) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: deviceWidth,
            height: 280,
            decoration: BoxDecoration(
              color: AppColors.bgGrey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(item),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'The appropriate tents for your event, \nthey can hold up to 2000 chairs.',
            style: TextStyle(
              color: AppColors.textBlack,
              fontSize: widget.screenWidth * 0.016,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
