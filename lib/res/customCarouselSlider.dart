import 'barrel_file.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key, this.imageList});
  final List? imageList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 2.0,
        initialPage: 0,
      ),
      items: imageList!.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: CachedImage(
                    image: item,
                    height: 300,
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}
