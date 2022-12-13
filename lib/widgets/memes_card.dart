part of 'widget.dart';

class MemesCard extends StatelessWidget {
  final MemesData memes;
  final Function? onTap;

  const MemesCard({
    required this.memes,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null){
          onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 6,
              blurRadius: 9,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(memes.url),
            ),
          ),
        )
      )
    );
  }
}
