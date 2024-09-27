import 'package:appbar/common/utils/app_colors.dart';
import 'package:appbar/common/utils/app_icons.dart';
import 'package:appbar/common/utils/responsive_layout.dart';
import 'package:appbar/common/widgets/widgets.dart';
import 'package:appbar/models/field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraint) {
      double screenWidth = contraint.maxWidth;
      if (screenWidth.isMobile) {
        return const MobileScreen();
      } else if (screenWidth.isDesktop) {
        return DesktopScreen(screenWidth: screenWidth);
      }
      if (screenWidth.isTablet) {
        return const TabletScreen();
      } else {
        return TvScreen(screenWidth: screenWidth);
      }
    });
  }
}

class TvScreen extends StatelessWidget {
  const TvScreen({required this.screenWidth, super.key});
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(
        screenWidth: screenWidth,
      ),
      body: Center(
        child: Text("$deviceWidth"),
      ),
    );
  }
}

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({required this.screenWidth, super.key});
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Duration duration = const Duration(seconds: 1);
    return Scaffold(
        backgroundColor: AppColors.primaryBlue100,
        appBar: DesktopAppBar(screenWidth: screenWidth),
        floatingActionButton:
            ScrollToTopWidget(scrollController: scrollController, screenWidth:screenWidth),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionBar(screenWidth: screenWidth),
              const SizedBox(height: 20),
              BannerWidget(screenWidth: screenWidth),
              const SizedBox(height: 20),
              SubBannerWidget(screenWidth: screenWidth, duration: duration),
              const SizedBox(height: 30),
              sectionTitle('Discover the right \nfurniture for your event'),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: CustomCarousel(screenWidth: screenWidth),
              ),
              const SizedBox(height: 10),
              sectionTitle('Discover our most \npopular products'),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: PopularProduct(screenWidth: screenWidth),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
              //   child: const Text(
              //     'Our customers do \nthe talking for us',
              //     style: TextStyle(
              //         color: AppColors.textBlack,
              //         fontSize: 30,
              //         fontWeight: FontWeight.w600),
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
              //   child: const TestimonyWidget(),
              // ),
              const SizedBox(height: 150),
              FooterWidget(screenWidth: screenWidth)
            ],
          ),
        ));
  }

  Padding sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Text(
        title,
        style: const TextStyle(
            color: AppColors.textBlack,
            fontSize: 30,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SubBannerWidget extends StatelessWidget {
  const SubBannerWidget({
    super.key,
    required this.screenWidth,
    required this.duration,
  });

  final double screenWidth;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    List<dynamic> items = [
      {
        'title': 'Free Shipping',
        'description': 'Free shipping on all Us order or order above \$200',
        'img': AppImages.car
      },
      {
        'title': 'Stop With Confiance',
        'description':
            'Our Protection covers your purchase from click to delivery',
        'img': AppIcons.confiance
      },
      {
        'title': '24/7 Help Center',
        'description':
            'Round-the-clock assistance for a smooth shopping experience',
        'img': AppIcons.casque
      },
    ];
    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            items.length,
            (index) => Container(
              width: screenWidth * 0.3,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.bgWhite,
                  border: Border.all(color: AppColors.bgBlack.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        items[index]['img'],
                        width: 40,
                        height: 40,
                        color: index != 0 ? AppColors.primaryBlue : null,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        items[index]['title'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.014,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.005),
                  Text(
                    items[index]['description'],
                    style: TextStyle(
                        color: AppColors.textBlack.withOpacity(0.6),
                        fontSize: screenWidth * 0.014,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    required this.screenWidth,
    super.key,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth,
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: 50)
                  .copyWith(bottom: 70),
          decoration: const BoxDecoration(
              color: AppColors.bgWhite,
              border: Border(top: BorderSide(color: AppColors.bgGrey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppIcons.footerLogo,
                        width: 70,
                      ),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: 'ChairRental',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColors.primaryBlue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Express',
                              style: TextStyle(
                                  color: Color(0XFF86A6BB),
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Follow us on our social pages \nChairRentalExpress',
                    style: TextStyle(
                        color: Color(0XFF505050),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        3,
                        (ind) => Container(
                              margin: const EdgeInsets.only(right: 5),
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.bgGrey),
                            )),
                  )
                ],
              ),
              SizedBox(width: screenWidth * 0.05),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Douala',
                    style: TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Rue Charles Eyoum, Bonatone',
                    style: TextStyle(
                        color: Color(0XFF505050),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'New Deido',
                    style: TextStyle(
                        color: Color(0XFF505050),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tel: +237 697 25 92 31',
                    style: TextStyle(
                        color: Color(0XFF505050),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(width: screenWidth * 0.05),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dschang',
                    style: TextStyle(
                        color: AppColors.textBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Rue Tchomba Tessa, Nboug',
                    style: TextStyle(
                        color: Color(0XFF505050),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Foukoue',
                    style: TextStyle(
                        color: Color(0XFF505050),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Tel: +237 653 03 82 85',
                    style: TextStyle(
                        color: Color(0XFF505050),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth,
          padding:
              EdgeInsets.symmetric(horizontal: deviceWidth * 0.03, vertical: 20)
                  .copyWith(bottom: 50),
          color: const Color(0XFFDEE2E7),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              Icon(Icons.copyright_outlined,
                  size: 20, color: Color(0XFF505050)),
              SizedBox(width: 5),
              Text(
                '2024 Derico',
                style: TextStyle(
                  color: Color(0XFF505050),
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Text(
                'Join Us',
                style: TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 20),
              Text(
                'Contact Us',
                style: TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 20),
              Text(
                'Terms & Conditions',
                style: TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PopularProduct extends StatefulWidget {
  const PopularProduct({
    required this.screenWidth,
    super.key,
  });

  final double screenWidth;

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> categories = ['All', 'Chair', 'Table', 'Tent'];
  int selectedIndex = 0;
  String hoverCategory = '';

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void changehoverCategory(String menu) {
    setState(() {
      hoverCategory = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  changeIndex(index);
                },
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: MouseRegion(
                  onEnter: (_) => changehoverCategory(categories[index]),
                  onExit: (_) => changehoverCategory(''),
                  child: Column(
                    children: [
                      Text(
                        categories[index],
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                color: categories[index] == hoverCategory
                                    ? AppColors.primaryBlue
                                    : selectedIndex == index
                                        ? AppColors.primaryBlue
                                        : AppColors.primaryGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 4,
                        width: 80,
                        color: selectedIndex == index
                            ? AppColors.primaryBlue
                            : Colors.transparent,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 740,
          child: PageView.builder(
            itemCount: categories.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            padEnds: false,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < 3; i++)
                        PopularPWidget(screenWidth: widget.screenWidth)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < 3; i++)
                        PopularPWidget(screenWidth: widget.screenWidth)
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class PopularPWidget extends StatelessWidget {
  const PopularPWidget({
    required this.screenWidth,
    super.key,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 3.3,
      height: 353,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.bgGrey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth / 3.6,
            height: 200,
            decoration: BoxDecoration(
                color: AppColors.bgGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.withOpacity(0.2)),
                child: Text('Tent',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 5),
              Text('Tent for birthday',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.textBlack, fontSize: 16)),
              const SizedBox(height: 5),
              Text('XAF 30.000/Jour',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.textBlack, fontSize: 16)),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    required this.screenWidth,
    super.key,
  });
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryBlue.withOpacity(0.5),
          image: const DecorationImage(
              image: AssetImage(AppImages.baniere), fit: BoxFit.cover)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: screenWidth * 0.010),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+1000 chair models \nfor your events',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.textWhite,
                        fontSize: screenWidth * 0.035,
                      ),
                ),
                const SizedBox(height: 4),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.primaryGrey),
                    ),
                    Positioned(
                      left: 20,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryBlue),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.bgGrey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'They trust us and you?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.textWhite,
                      ),
                ),
              ],
            ),
            const QuickOrderWidget(),
          ]),
    );
  }
}

class QuickOrderWidget extends StatefulWidget {
  const QuickOrderWidget({super.key});

  @override
  State<QuickOrderWidget> createState() => _QuickOrderWidgetState();
}

class _QuickOrderWidgetState extends State<QuickOrderWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController periodController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Field> _fields = [];
  final duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    _fields = [
      Field(fields: [
        CustomFormFiel(
          isTextarea: true,
          label: 'Which pieces of furniture do you want today',
          hintText: "Ex: I'd like 100 plastic chairs for my birthday ",
          textEditingController: descriptionController,
        ),
        CustomFormFiel(
          label: 'For which period',
          hintText: 'Select the time range',
          textEditingController: periodController,
          suffixWidget: const Icon(Icons.calendar_month),
        ),
      ]),
      Field(fields: [
        CustomFormFiel(
          label: 'Your location',
          hintText: 'Ex: Bastos - Yaoundé',
          textEditingController: locationController,
        ),
        CustomFormFiel(
          label: 'Your Phone Number',
          hintText: '+237 697 25 92 31',
          textEditingController: phoneController,
        ),
      ])
    ];
    super.initState();
  }

  void goToNextPage() {
    if (_pageController.hasClients && _currentPage != 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    if (_pageController.hasClients && _currentPage != 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      width: 445,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.bgWhite, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Order',
            style: TextStyle(
                color: AppColors.textBlack,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          AnimatedStatusRow(
            currentPage: _currentPage,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: 3,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return index != 2
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._fields[index].fields.map((e) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, right: 5),
                                  child: e,
                                ))
                          ],
                        )
                      : const OtpWidget();
                }),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyButton(
                  width: deviceHeight / 6,
                  title: 'Previous',
                  btnColor: AppColors.bgGrey,
                  titleColor: AppColors.primaryGrey,
                  onTap: goToPreviousPage),
              const SizedBox(width: 10),
              MyButton(
                  width: deviceHeight / 6, title: 'Next', onTap: goToNextPage),
            ],
          )
        ],
      ),
    );
  }
}

class SectionBar extends StatelessWidget {
  const SectionBar({
    required this.screenWidth,
    super.key,
  });
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.038),
      decoration: const BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppIcons.menu,
            color: Colors.black,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 10),
          const Text(
            'All Categories',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Image.asset(
            AppIcons.user,
            color: Colors.black,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 30),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                AppIcons.cart,
                color: Colors.black,
                width: 20,
                height: 20,
              ),
              Positioned(
                  top: -10,
                  right: -10,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Center(
                      child: Text(
                        '10',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ))
            ],
          ),
          const SizedBox(width: 30),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Help',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
          const SizedBox(width: 30),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'English',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
          const SizedBox(width: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Ship to',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 4),
              Image.asset(
                AppIcons.flag,
                width: 20,
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TabletAppBar(title: 'Tablet App Bar'),
      body: Center(
        child: Text("$deviceWidth"),
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MobileAppBar(title: 'Mobile App Bar'),
      body: Center(
        child: Text("$deviceWidth"),
      ),
    );
  }
}
