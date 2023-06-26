import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/presentation_constants.dart';

class LogoutPlaceholderWidget extends StatelessWidget {
  const LogoutPlaceholderWidget({super.key});

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
                'Авторизация была убрана в связи\nС отказом от Firebase, которая также хранила файлы\nДля полноценной регистрации необходимо решить\nпроблему с API ключами на сервере',
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
