import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  //ruta del archivo del icono
  final String iconPath;
  final String tabName;
  const MyTab({super.key, required this.iconPath, required this.tabName});
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Column(
        children: [
          Image.asset(
            iconPath,
            width: 30,
            height: 30,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 5),
          Text(
            tabName,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
