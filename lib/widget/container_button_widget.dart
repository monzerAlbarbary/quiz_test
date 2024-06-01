
import 'package:flutter/material.dart';

class ContainerButtonLogin extends StatelessWidget {
  const ContainerButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      height: 59,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Color(0xffDA8BD9),
            Color(0xffF3BD6B),
          ],
        ),
      ),
    );
  }
}
