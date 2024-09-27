import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ScrollToTopWidget extends StatefulWidget {
  const ScrollToTopWidget(
      {required this.scrollController, required this.screenWidth, super.key});
  final ScrollController scrollController;
  final double screenWidth;

  @override
  State<ScrollToTopWidget> createState() => _ScrollToTopWidgetState();
}

class _ScrollToTopWidgetState extends State<ScrollToTopWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > 400) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      } else {
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      }
    });
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: widget.screenWidth * 0.033,
          bottom: 55,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isVisible ? 1.0 : 0.0,
            child: FloatingActionButton(
              onPressed: _scrollToTop,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              backgroundColor: AppColors.primaryBlue,
              child: const Icon(
                Icons.arrow_upward,
                size: 20,
                color: AppColors.bgWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
