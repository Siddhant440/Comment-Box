import 'package:flutter/material.dart';
import 'package:comment/util/custom_colors.dart';
import 'package:comment/util/custom_text.dart';

class CommentContainer extends StatelessWidget {
  final String name;
  final String date;
  final String comment;
  final String postedBy;
  final String? image;

  const CommentContainer(
      {Key? key,
      required this.name,
      required this.date,
      required this.comment,
      required this.postedBy,
      required this.image
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: CustomColors.bordersBorderLight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image!,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: CustomTextStyles.s14w600),
                      const SizedBox(height: 4),
                      Text(date, style: CustomTextStyles.s10w500),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 13),
              Text(comment),
              const SizedBox(height: 13),
              Text("Post by $postedBy", style: CustomTextStyles.s12w400),
            ],
          ),
        ),
      ),
    );
  }
}
