part of '../pages.dart';

class AddNewCategory extends StatelessWidget {
  const AddNewCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: SizedBox(
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
                  'Add New Category',
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
      CollectionReference insertCollection =
          FirebaseFirestore.instance.collection('Category');

      return Column(
        children: [
          CustomTextFormField(
              title: 'Nama Category',
              hintText: 'Isi Nama Category',
              controller: titleController),
          GestureDetector(
            onTap: () {
              //// ADD DATA HERE
              insertCollection.add({
                'titleCourse': titleController.text,
                'categoryCreated': DateTime.now(),
                'lastEdited': DateTime.now()
              });
              titleController.text = '';
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 30, top: 12),
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
            const SizedBox(
              height: 12,
            ),
            ////Form
            formAddCourse()
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          appBar(),
          const SizedBox(
            height: 20,
          ),
          bodyPage()
        ],
      ),
    );
  }
}
