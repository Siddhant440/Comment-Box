import 'package:flutter/material.dart';
import 'package:comment/util/custom_colors.dart';
import 'package:comment/util/custom_text.dart';

class PostButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PostButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 56),
          backgroundColor: CustomColors.brandPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          "Post Comment",
          style: CustomTextStyles.s16w500,
        ),
      ),
    );
  }
}
