import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    required this.screenWidth,
    super.key,
  });
  final double screenWidth;
  @override
  SearchBarWidgetState createState() => SearchBarWidgetState();
}

class SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  String searchText = '';

  final Duration duration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isFocused = true;
        });
      }
      if (!focusNode.hasFocus) {
        setState(() {
          isFocused = false;
        });
      }
    });
  }

  void _clearTextField() {
    setState(() {
      _textController.text = '';
      searchText = '';
    });
  }

  void handleCancelButtonPress() {
    setState(() {
      _textController.text = '';
      searchText = '';
      focusNode.unfocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: AnimatedContainer(
        duration: duration,
        width: widget.screenWidth / 3.5,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            border: Border.all(
                color: isFocused
                    ? AppColors.bgBlack
                    : AppColors.bgBlack.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.search,
                focusNode: focusNode,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                onSubmitted: (text) {
                  _clearTextField();
                },
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(30)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
