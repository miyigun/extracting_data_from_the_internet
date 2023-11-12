import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool? isLoading;
  final Widget child;


  const LoadingWidget({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    if (isLoading==null) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.blue,),
      );
    }
    else if (isLoading==false) {
      return const Center(child: Text('Error!'));
    } else {
      return child;
    }
  }

}