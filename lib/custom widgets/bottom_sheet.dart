import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:comment/util/custom_colors.dart';
import 'package:comment/util/custom_text.dart';
import 'post_button.dart';
import 'uploading_screen.dart';

class CustomModalBottomSheet extends StatefulWidget {
  final Function(Map<String, String>) onPostComment;
  //final bool isUserPost;

  const CustomModalBottomSheet(
      {Key? key, required this.onPostComment, //required this.isUserPost
      })
      : super(key: key);

  @override
  _CustomModalBottomSheetState createState() => _CustomModalBottomSheetState();

  static void showCustomModalBottomSheet(BuildContext context,
      {required Function(Map<String, String>) onPostComment}) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CustomModalBottomSheet(
            onPostComment: onPostComment,
            //isUserPost: true
        );
      },
    );
  }
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 666,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 360,
              height: 56,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: CustomColors.bordersBorderLight,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 125),
                      child: Text(
                        "New Comment",
                        style: CustomTextStyles.s16w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                width: 482,
                height: 312,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: CustomColors.brandSurface,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    controller: _textEditingController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Write a comment here...",
                      hintStyle: CustomTextStyles.s14w500,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            PostButton(
              onPressed: _isEnabled
                  ? () {
                      final String comment = _textEditingController.text;
                      if (comment.isNotEmpty) {
                        String currentDate =
                            DateFormat.yMMMd().format(DateTime.now());

                        // String postedBy =
                        //     widget.isUserPost ? 'You' : 'Guest name';

                        widget.onPostComment({
                          'name': 'Rahul Prakash Singh',
                          'date': currentDate,
                          'comment': comment,
                          'postedBy': 'You',//postedBy,
                          'image': 'assets/images/userProfile.jpg'
                        });

                        Navigator.push(context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (_, __, ___) => const Upload()),
                        ).then((_) {
                          Navigator.pop(context);
                        });

                        Timer(const Duration(seconds: 3), () {
                          Navigator.pop(context);
                        });
                      }
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_checkIfTextFieldEmpty);
  }

  void _checkIfTextFieldEmpty() {
    setState(() {
      _isEnabled = _textEditingController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
