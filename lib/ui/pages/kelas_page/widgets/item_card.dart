part of 'package:beelajar_admin_app/ui/widgets/widgets.dart';

class ItemCard extends StatelessWidget {
  final String titleCourse;
  final int harga;
  final String mentorName;
  final int participant;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.titleCourse, this.harga, this.mentorName, this.participant,
      {Key? key, this.onUpdate, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String urlThumbnail =
        'https://firebasestorage.googleapis.com/v0/b/beelajar-998c7.appspot.com/o/Assets%2Fimages%2Fstil-staMgYWHM7s-unsplash.jpg?alt=media&token=2b67ebdb-d488-49c5-b1eb-be8c862ea8ec';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultRadius),
                    bottomLeft: Radius.circular(defaultRadius)),
                image: DecorationImage(
                    image: NetworkImage(urlThumbnail), fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 6, top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(titleCourse, style: titleTextStyle),
                    ),
                    Text(
                      mentorName,
                      style: subTitleTextStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('6 Part of Lesson', style: informTextStyle),
                    Text(
                      participant.toString() + ' Participant',
                      style: informTextStyle,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
