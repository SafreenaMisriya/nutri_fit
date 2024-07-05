import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerListView() {
  return Flexible(
    child: ListView.builder(
       physics: const NeverScrollableScrollPhysics(),
       shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
              title: Container(
                width: double.infinity,
                height: 40.0,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    ),
  );
}
