import 'package:animation/Screens/Components/imagelist.dart';
import 'package:animation/Theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = CarouselController();
  bool isActive = true;
  int activeindex = 0;
  bool isAnimated = false;
  double radius = 18;
  Color color = Colors.amber;
  sizeIncrease() {
    setState(() {
      radius = 36;
      color = Colors.orange;
    });
  }

  sizeDecrease() {
    setState(() {
      radius = 18;
      color = Colors.amber;
    });
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          Icon(value ? Icons.dark_mode : Icons.light_mode),
          Switch.adaptive(
            value: value,
            onChanged: (value) {
              setState(
                () {
                  this.value = value;
                  currenttheme.toggle();
                },
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CarouselSlider.builder(
              itemCount: imagesUrl.length,
              itemBuilder: (context, index, realIndex) {
                final image = imagesUrl[index];
                return buildImage(image, index);
              },
              carouselController: controller,
              options: CarouselOptions(
                height: 450,
                autoPlay: isActive,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeindex = index;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildIndicator(),
          const SizedBox(
            height: 20,
          ),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.blue,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 8,
              color: Colors.black.withOpacity(0.1),
            ),
          ]),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      onDotClicked: currentpage,
      activeIndex: activeindex,
      count: imagesUrl.length,
      effect: WormEffect(
        activeDotColor: Colors.blue,
        dotColor: Colors.grey.withOpacity(0.5),
        dotWidth: 20,
        dotHeight: 20,
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              controller.previousPage();
            });
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 40,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isActive = !isActive;
            });
          },
          icon: Icon(
            isActive ? Icons.pause : Icons.play_arrow,
            size: 40,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {
            controller.nextPage();
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 40,
          ),
        ),
      ],
    );
  }

  void currentpage(int index) => controller.animateToPage(index);
}
