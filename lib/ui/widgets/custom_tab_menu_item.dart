part of 'widgets.dart';

class CustomTabMenuItem extends StatelessWidget {
  final int index;
  final String titleMenu;
  final Alignment align;
  const CustomTabMenuItem(
      {Key? key,
      required this.index,
      required this.titleMenu,
      required this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Align(
        alignment: align,
        child: Container(
          width: 140,
          padding: EdgeInsets.symmetric(
            horizontal: 45,
            vertical: 5,
          ),
          decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kWhiteColor,
              borderRadius: BorderRadius.circular(18)),
          child: Text(
            titleMenu,
            style: regularTextStyle.copyWith(
              color: context.read<PageCubit>().state == index
                  ? kWhiteColor
                  : kGreyColor,
              fontWeight:
                  context.read<PageCubit>().state == index ? bold : regular,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
