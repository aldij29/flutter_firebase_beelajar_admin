part of '../pages.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget searchForm() {
      return Container(
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(40)),
        child: TextFormField(
          style: regularTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          obscureText: false,
          cursorColor: kBlackColor,
          decoration: InputDecoration(
              hintText: 'Search Other',
              suffixIcon: Icon(
                Icons.search,
                color: kGreyColor,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none)),
        ),
      );
    }

    Widget newClassButton() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          'Create New Other',
          style: regularTextStyle.copyWith(
              color: kWhiteColor, fontWeight: bold, fontSize: 16),
        ),
      );
    }

    Widget bodyPage() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Other Created',
            style:
                regularTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            color: kWhiteColor,
            height: 1000,
          )
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                searchForm(),
                newClassButton(),
              ],
            ),
            bodyPage()
          ],
        ),
      ),
    );
  }
}
