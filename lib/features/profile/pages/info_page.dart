import 'package:bnv/core/theme/app_colors.dart';
import 'package:bnv/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blue800),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Informações do perfil",
          style: AppTypography.highlightText(context)!
              .copyWith(color: AppColors.blue800),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            Flexible(
              child: Wrap(
                runSpacing: 20,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome Completo:',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'CPF:',
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'E-mail:',
                          ),
                        ),
                        Text(
                          "Confirmar email",
                          textAlign: TextAlign.right,
                          style: AppTypography.subText(context)!
                              .copyWith(color: AppColors.blue800),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Celular:',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Salvar alterações",
                      style: AppTypography.highlightText(context)!
                          .copyWith(color: AppColors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue800,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 64)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
