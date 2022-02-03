part of '../pages.dart';

class AddNewUserPage extends StatefulWidget {
  const AddNewUserPage({Key? key}) : super(key: key);

  @override
  State<AddNewUserPage> createState() => _AddNewUserPageState();
}

class _AddNewUserPageState extends State<AddNewUserPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                'Add New User',
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
        FirebaseFirestore.instance.collection('Users');

    return Column(
      children: [
        CustomTextFormField(
            title: 'Email', hintText: 'Isi Email', controller: emailController),
        CustomTextFormField(
            title: 'First Name',
            hintText: 'Isi Nama Depan',
            controller: firstNameController),
        CustomTextFormField(
            title: 'Last Name',
            hintText: 'Isi Nama Belakang',
            controller: lastNameController),
        CustomTextFormField(
            title: 'Password',
            hintText: 'Password',
            obsecureText: true,
            controller: passwordController),
        GestureDetector(
          onTap: () {
            //// ADD DATA HERE
            insertCollection.add({
              'email': emailController.text,
              'firstName': firstNameController.text,
              'lastName': lastNameController.text,
              'fullname':
                  firstNameController.text + ' ' + lastNameController.text,
              'password': passwordController.text,
              'userSignUp': DateTime.now(),
              'lastEdited': DateTime.now()
            });
            emailController.text = '';
            firstNameController.text = '';
            lastNameController.text = '';
            passwordController.text = '';
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
                'Create User',
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

  @override
  Widget build(BuildContext context) {
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
