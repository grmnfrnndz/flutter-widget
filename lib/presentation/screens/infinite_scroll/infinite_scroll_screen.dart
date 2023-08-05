import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class InfiniteScrollScreen extends StatefulWidget {

static const String name = 'infinitescroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1,2,3,4,5,6,7,8,10,11,12,13,14,15];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1,2,3,4,5].map((newId) => lastId + newId));

  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
        if(scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent) {
          loadNextPage();
        }
    });
  }

  @override
  void dispose() {

    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void moveScrollToBottom() {
    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(scrollController.position.pixels + 120, duration: const Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
  }


  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2), () {});

    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});

    moveScrollToBottom();

  }

  Future<void> onRefresh() async {

    isLoading = true;
    await Future.delayed(const Duration(seconds: 3), () {});

    if (!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            physics: const RangeMaintainingScrollPhysics(),
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              
              return FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
                );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading ?  SpinPerfect(
            infinite: true,
            child: const Icon(Icons.no_backpack)
          ) : FadeIn(child: const Icon(Icons.no_backpack))
      ),
    );
  }
}