part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _header() {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24),
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
                decoration: const BoxDecoration(
                    image: const DecorationImage(
                  image: AssetImage('assets/images/beelajar_logo.png'),
                )),
              ),
              const SizedBox(
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
        return const KelasPage();
      case 1:
        return const UserPage();
      case 2:
        return const OtherPage();
      default:
        return const KelasPage();
    }
  }

  Widget tabMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 30,
      child: Stack(
        children: [
          const CustomTabMenuItem(
            index: 0,
            titleMenu: 'Kelas',
            align: Alignment.centerLeft,
          ),
          const CustomTabMenuItem(
            index: 1,
            titleMenu: 'User',
            align: Alignment.center,
          ),
          const CustomTabMenuItem(
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
              const SizedBox(
                height: 12,
              ),
              tabMenu(),
              const SizedBox(
                height: 16,
              ),
              buildContent(currentIndex),
            ],
          ),
        ),
      );
    });
  }
}
