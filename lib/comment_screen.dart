import 'package:flutter/material.dart';
import 'package:comment/custom widgets/bottom_sheet.dart';
import 'package:comment/util/custom_colors.dart';
import 'package:comment/util/custom_text.dart';
import 'package:comment/custom widgets/comment_container.dart';
import 'package:comment/custom widgets/post_button.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final List<Map<String, String>> comments = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: Row(
                children: [
                  const Text(
                    "Comments",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: CustomColors.brandSecondaryLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Text(
                        comments.length.toString(),
                        style: CustomTextStyles.s14w600.copyWith(
                            color: CustomColors.brandSecondaryDefault),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  itemCount: comments.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final commentData = comments[index];
                    return CommentContainer(
                      name: commentData['name'] ?? '',
                      date: commentData['date'] ?? '',
                      comment: commentData['comment'] ?? '',
                      postedBy: commentData['postedBy'] ?? '',
                      image: commentData['image'],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 88,
              child: PostButton(
                onPressed: () {
                  CustomModalBottomSheet.showCustomModalBottomSheet(
                    context,
                    onPostComment: (Map<String, String> newComment) {
                      setState(() {
                        comments.add(newComment);
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
