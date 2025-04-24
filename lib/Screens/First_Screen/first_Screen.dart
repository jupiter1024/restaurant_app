import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/Appcolors.dart';
import 'package:restaurant_app/Screens/homeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final List<String> texts = [
    "Save Your \n Meal\n Ingredient",
    "Use Our App\n The Best\n Choice",
    "Our App\n Your Ultimate\n Choice",
  ];
  final List<String> discreption = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "the best choice for your kitchen do not hesitate",
    "All the best restaurants and their top menus are ready for you",
  ];
  double currentPage = 0;
  final CarouselSliderController controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pngg/image 39.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 40.w,
            right: 40.w,
            bottom: 60.h,
            child: Container(
              width: 320.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: Color.primaryColors.withOpacity(0.65),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: controller,
                    options: CarouselOptions(
                      height: 350.0.h,
                      viewportFraction: 0.99,

                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPage = index.toDouble();
                        });
                      },
                    ),
                    items: List.generate(texts.length, (index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Text(
                                texts[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.titleColor,
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                discreption[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.titleColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 25.h),
                              new DotsIndicator(
                                onTap: (index) {
                                  controller.animateToPage(index);
                                },
                                dotsCount: 3,
                                position: currentPage,
                                decorator: DotsDecorator(
                                  color: Colors.blueGrey, // Inactive color
                                  activeColor: Color.titleColor,
                                  activeSize: Size(30.0.w, 8.0.h),
                                  size: Size(30.0.w, 8.0.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.sp,
                                ),
                                child:
                                    currentPage == 2
                                        ? CircleAvatar(
                                          radius: 45.sp,
                                          child: IconButton(
                                            icon: Icon(Icons.arrow_forward),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => HomeScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                        : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            HomeScreen(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Skip',
                                                style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),

                                            InkWell(
                                              onTap: () {
                                                //currentPage++;
                                                controller.nextPage();
                                              },
                                              child: Text(
                                                'Next',
                                                style: TextStyle(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
