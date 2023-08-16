import'package:flutter/material.dart';


void Snackbar(BuildContext context,String messege) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text(messege),
      )
    );
  }