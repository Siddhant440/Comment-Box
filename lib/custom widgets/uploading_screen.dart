import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:comment/util/custom_colors.dart';
import 'package:comment/util/custom_text.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool _isUploading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isUploading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: CustomColors.text.withOpacity(0.8),
              child: Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                  child: _isUploading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  CustomColors.brandSecondary),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Uploading...",
                              style: CustomTextStyles.s14w500.copyWith(
                                color: CustomColors.textBody1,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: CustomColors.newUIGreen,
                              ),
                              child:
                                  const Icon(Icons.check, color: Colors.white),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Uploading...",
                              style: CustomTextStyles.s14w500.copyWith(
                                color: CustomColors.textBody1,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
