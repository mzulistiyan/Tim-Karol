import '../../shared/theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String textButton;
  final Function()? onPressed;
  // const PrimaryButton({Key? key}) : super(key: key);
  PrimaryButton(this.textButton, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Global.primary01;
              } else if (states.contains(MaterialState.disabled)) {
                return Global.primary01;
              }
              return Global.primary01; // Use the component's default.
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Global.semiBoldTextStyle12.copyWith(
              color: (onPressed != null) ? Colors.white : Colors.white),
        ),
      ),
    );
  }
}
