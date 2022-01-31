part of '../pages.dart';

class AddClassPage extends StatefulWidget {
  const AddClassPage({Key? key}) : super(key: key);

  @override
  _AddClassPageState createState() => _AddClassPageState();
}

class _AddClassPageState extends State<AddClassPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController mentorController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
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

  Widget formAddCourse() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference courseCollection =
        FirebaseFirestore.instance.collection('Courses');

    return Column(
      children: [
        CustomTextFormField(
            title: 'Nama Course',
            hintText: 'Isi Nama Course',
            controller: titleController),
        CustomTextFormField(
            title: 'Subtitle Course',
            hintText: 'Isi Nama Sub',
            controller: subTitleController),
        CustomTextFormField(
            title: 'Mentor Course',
            hintText: 'Isi Nama Mentor',
            controller: mentorController),
        CustomTextFormField(
            title: 'Harga',
            hintText: 'Harga Course Rp.',
            controller: hargaController),
        CustomTextFormField(
            title: 'Kategori',
            hintText: 'Kategori Course',
            controller: kategoriController),
        GestureDetector(
          onTap: () {
            //// ADD DATA HERE
            courseCollection.add({
              'titleCourse': titleController.text,
              'hargaCourse': int.tryParse(hargaController.text) ?? 0,
              'subTitleCourse': subTitleController.text,
              'mentorCourse': mentorController.text,
              'kategoriCourse': kategoriController.text,
              'participantCourse': 2
            });
            titleController.text = '';
            subTitleController.text = '';
            mentorController.text = '';
            hargaController.text = '';
            kategoriController.text = '';
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 30, top: 12),
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(defaultRadius)),
            child: Center(
              child: Text(
                'Create Course',
                style: titleTextStyle.copyWith(color: kWhiteColor),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget bodyPage() {
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
          SizedBox(
            height: 12,
          ),
          ////Form
          formAddCourse()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference courseCollection = firestore.collection('Courses');
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
