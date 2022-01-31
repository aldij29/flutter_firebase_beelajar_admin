part of '../pages.dart';

class KelasPage extends StatelessWidget {
  const KelasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference courses = firestore.collection('Courses');
    Widget searchForm() {
      return Container(
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(40)),
        child: TextFormField(
          style: regularTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          obscureText: false,
          cursorColor: kBlackColor,
          decoration: InputDecoration(
              hintText: 'Search Class',
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
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/add-class-page');
        },
        child: Container(
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
            'Create New Class',
            style: regularTextStyle.copyWith(
                color: kWhiteColor, fontWeight: bold, fontSize: 16),
          ),
        ),
      );
    }

    Widget bodyPage() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Class Created',
            style:
                regularTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          SizedBox(
            height: 12,
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                courses.orderBy('titleCourse', descending: true).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data!.docs
                      .map(
                        (e) => ItemCard(
                            (e.data() as dynamic)['titleCourse'],
                            (e.data() as dynamic)['hargaCourse'],
                            (e.data() as dynamic)['mentorCourse'],
                            (e.data() as dynamic)['participantCourse'],
                            onDelete: () {
                          courses.doc(e.id).delete();
                        }),
                      )
                      .toList(),
                );
              } else {
                return Text("Loading...");
              }
            },
          ),
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
            bodyPage(),
          ],
        ),
      ),
    );
  }
}
