part of '../pages.dart';

class AddClassPage extends StatefulWidget {
  const AddClassPage({Key? key}) : super(key: key);

  @override
  _AddClassPageState createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  Widget appBar() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(color: kBackgroundColor),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.arrow_back,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          Align(
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
                'Add New Course',
                style: regularTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: kGreyColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload,
                    color: kWhiteColor,
                  ),
                  Text(
                    'Upload Gambar',
                    style: regularTextStyle.copyWith(color: kWhiteColor),
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          appBar(),
          SizedBox(
            height: 20,
          ),
          bodyPage()
        ],
      ),
    );
  }
}
