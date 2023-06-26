import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/presentation_constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonMainColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Работа студента РТУ МИРЭА\nФедорова Сергея Анатольевича\nдля сдачи курсовой и практических работ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
