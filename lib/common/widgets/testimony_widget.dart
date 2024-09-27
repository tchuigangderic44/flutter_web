import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TestimonyWidget extends StatefulWidget {
  const TestimonyWidget({super.key});

  @override
  State<TestimonyWidget> createState() => _TestimonyWidgetState();
}

class _TestimonyWidgetState extends State<TestimonyWidget> {
  final List<String> _items = [
    "Item 1",
    "Item 2",
    "Item 3",
  ];

  final PageController _pageController =
      PageController(viewportFraction: 0.34, initialPage: 0);
  int _currentPage = 0;
  final duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
  }

  void goToNextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: duration,
        curve: Curves.easeIn,
      );
    }
  }

  void goToPreviousPage() {
    if (_pageController.hasClients) {
      _pageController.previousPage(
        duration: duration,
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.none,
            height: 230,
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
                return _testimonyItem(_items[realIndex], index);
              },
            ),
          ),
          Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: goToPreviousPage,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: goToNextPage,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _testimonyItem(String item, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: duration,
          height: index != _currentPage + 1 ? 190 : 230,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors.bgWhite,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.bgGrey)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.bgGrey),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Paul TEN',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  "'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre "
                  "provisoire pour calibrer une mise en page, le texte définitif venant remplacer.'",
                  maxLines: index == _currentPage + 1 ? 10 : 3,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
