part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _header() {
    return Container(
      padding: EdgeInsets.only(top: 16.0, left: 24.0, right: 24),
      width: double.infinity,
      height: 120,
      color: kWhiteColor,
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to',
            style: titleTextStyle.copyWith(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/beelajar_logo.png'),
                )),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Administrator',
                style: titleTextStyle.copyWith(fontSize: 24),
              )
            ],
          ),
          Text(
            'Site',
            style: titleTextStyle.copyWith(fontSize: 24),
          )
        ],
      )),
    );
  }

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return KelasPage();
      case 1:
        return UserPage();
      case 2:
        return OtherPage();
      default:
        return KelasPage();
    }
  }

  Widget tabMenu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 30,
      child: Stack(
        children: [
          CustomTabMenuItem(
            index: 0,
            titleMenu: 'Kelas',
            align: Alignment.centerLeft,
          ),
          CustomTabMenuItem(
            index: 1,
            titleMenu: 'User',
            align: Alignment.center,
          ),
          CustomTabMenuItem(
            index: 2,
            titleMenu: 'Other',
            align: Alignment.centerRight,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(builder: (context, currentIndex) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: ListView(
            children: [
              _header(),
              SizedBox(
                height: 12,
              ),
              tabMenu(),
              SizedBox(
                height: 16,
              ),
              buildContent(currentIndex)
            ],
          ),
        ),
      );
    });
  }
}
