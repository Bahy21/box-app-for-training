part of 'home_page_details_w_imports.dart';

class ContinuousTwoImageSwiper extends StatefulWidget {
  const ContinuousTwoImageSwiper({super.key});

  @override
  State<ContinuousTwoImageSwiper> createState() => _ContinuousTwoImageSwiperState();
}

class _ContinuousTwoImageSwiperState extends State<ContinuousTwoImageSwiper> {
  late PageController _controller;
  int currentIndex = 0;

  final List<String> images = [
    'assets/images/Rectangle  (1).png',
    'assets/images/Rectangle  (1).png',
  ];

  late List<String> displayImages;

  @override
  void initState() {
    super.initState();

    // لتجنب الرجوع المرئي
    displayImages = [];
    displayImages.add(images.last); // صورة أخيرة بالبداية
    displayImages.addAll(images);
    displayImages.add(images.first); // صورة أولى بالنهاية

    _controller = PageController(initialPage: 1);

    // تحريك تلقائي
    Timer.periodic(const Duration(seconds: 3), (_) {
      if (_controller.hasClients) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _handlePageChanged(int index) {
    int count = images.length;
    setState(() {
      currentIndex = (index - 1) % count;
    });

    if (index == 0) {
      _controller.jumpToPage(count);
    } else if (index == count + 1) {
      _controller.jumpToPage(1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 275 / 100, // نفس نسبة الصورة
            child: PageView.builder(
              controller: _controller,
              itemCount: displayImages.length,
              onPageChanged: _handlePageChanged,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    displayImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 12),

        // نقطتين فقط
        SmoothPageIndicator(
          controller: _controller,
          count: images.length, // نقطتين فقط
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 24, // مستطيل بدل الدائرة
            spacing: 8,
            activeDotColor: Colors.orange,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
