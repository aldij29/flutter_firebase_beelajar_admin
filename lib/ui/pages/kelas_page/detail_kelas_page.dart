part of '../pages.dart';

class DetailKelasPage extends StatelessWidget {
  final String titleCourse;
  final String urlThumbnail;
  const DetailKelasPage(
      {Key? key, required this.titleCourse, required this.urlThumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(color: kBackgroundColor),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.arrow_back,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Text(
                    titleCourse,
                    overflow: TextOverflow.ellipsis,
                    style: regularTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            )
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ////Upload Gambar Course
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: kGreyColor,
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                    image: NetworkImage(urlThumbnail), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          appBar(),
          const SizedBox(
            height: 20,
          ),
          body()
        ],
      ),
    );
  }
}
