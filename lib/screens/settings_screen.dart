import 'package:flutter/material.dart';

import '/enums/enums.dart';
import '/gen/gen.dart';
import '/styles/styles.dart';
import '/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Widget settingField({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.text, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 68,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CustomBackButton(),
        ),
        centerTitle: true,
        title: Text(
          t.settings.title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                settingField(
                    child: Row(
                  children: [
                    Text(
                      t.settings.language,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const Spacer(),
                    DropdownButton(
                      items: LanguageEnum.values.map((language) {
                        return DropdownMenuItem(
                          value: language,
                          child: Text(
                            language.description,
                            style: const TextStyle(fontSize: 30),
                          ),
                        );
                      }).toList(),
                      onChanged: (language) {},
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
