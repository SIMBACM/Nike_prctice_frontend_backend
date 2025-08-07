import 'package:flutter/material.dart';

Widget productImageSliderCard({
  List<String>? imageUrls,
  VoidCallback? onAddToCart,
  VoidCallback? onShare,
  double height = 300,
  double borderRadius = 20,
}) {
  final pageController = PageController();
  final currentPageNotifier = ValueNotifier<int>(0);
  final List<String> urls = imageUrls ?? [];

  return ValueListenableBuilder<int>(
    valueListenable: currentPageNotifier,
    builder: (context, currentPage, _) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SizedBox(
              height: height,
              width: double.infinity,
              child: PageView.builder(
                controller: pageController,
                itemCount: urls.length,
                onPageChanged: (index) {
                  currentPageNotifier.value = index;
                },
                itemBuilder: (context, index) {
                  return Image.network(
                    urls[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(urls.length, (index) {
                final isActive = currentPage == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 10 : 8,
                  height: isActive ? 10 : 8,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.black : Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          // Cart and Share Buttons
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: onAddToCart,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: onShare,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.share_outlined, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}