import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SldeInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SldeInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SldeInfo>[

  SldeInfo('Search Food', 'Dolore officia incididunt laboris quis mollit sint occaecat proident nostrud anim.', 'assets/images/1.png'),
  SldeInfo('Fast Delivery', 'Cillum duis velit minim dolor laboris tempor nisi nostrud quis Lorem sit eu consectetur nulla.', 'assets/images/2.png'),
  SldeInfo('Enjoy Your Food', 'Occaecat excepteur et culpa ex anim occaecat in tempor nostrud duis veniam.', 'assets/images/3.png'),

];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'apptutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() { 

      final page = pageViewController.page ?? 0;

      if ( !endReached &&  page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }

    });

  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(title: slide.title, caption: slide.caption, imageUrl: slide.imageUrl)).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(child: const Text('Skip'), onPressed: () => context.pop())
          ),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar'),
              ),
            ),
          ) : const SizedBox()

        ],
      )
    );
  }
}


class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;


  const _Slide({
  required this.title, 
  required this.caption, 
  required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final TextTheme(:titleLarge, :bodySmall) = Theme.of(context).textTheme;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleLarge),
            const SizedBox(height: 10),
            Text(caption, style: bodySmall,),
          ],
        ),
      ),
    );
  }
}
