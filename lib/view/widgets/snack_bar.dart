import 'package:flutter/material.dart';
class SnackBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SnackBar(
          content: Text ("The product was added") ,
        ),
    );
  }
}
