import 'package:flutter/material.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkWidget extends StatefulWidget {
  const LinkWidget(this.s, {super.key});
  final String s;

  @override
  State<LinkWidget> createState() => _LinkWidgetState();
}

class _LinkWidgetState extends State<LinkWidget> {
  Future<void> _launchURL() async {
    Uri uri = Uri.parse(widget.s);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        _launchURL();
      },
      child: const CustomWidget(
        icon: Icons.language,
        label: 'Open a URL',
      ),
    );
  }
}
