part of 'widgets.dart';

class CustomTextFormField extends StatelessWidget {
  String title;
  String hintText;
  bool obsecureText;
  TextEditingController controller;
  CustomTextFormField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.obsecureText = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            style: regularTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            controller: controller,
            obscureText: obsecureText,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: kGreyColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: kPrimaryColor))),
          )
        ],
      ),
    );
  }
}
