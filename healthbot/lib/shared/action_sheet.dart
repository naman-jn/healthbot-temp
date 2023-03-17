import 'package:flutter/cupertino.dart';
import 'package:healthbot/styles/app_colors.dart';

Future<dynamic> showActionSheet(
  BuildContext context,
  String title,
  List<ActionSheetData> actions,
) async {
  final result = await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Cancel',
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w600,
            color: AppColors.blue,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Satoshi',
        ),
      ),
      actions: actions
          .map(
            (actionSheetData) => CupertinoActionSheetAction(
              onPressed: actionSheetData.onPressed,
              child: Text(
                actionSheetData.text,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                  color: actionSheetData.isDestructiveAction
                      ? AppColors.red
                      : AppColors.blue,
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
  return result;
}

class ActionSheetData {
  final Function() onPressed;
  final String text;
  final bool isDestructiveAction;

  ActionSheetData({
    required this.onPressed,
    required this.text,
    this.isDestructiveAction = false,
  });
}
