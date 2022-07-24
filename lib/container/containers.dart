import 'package:electrical_comsuption/widgets/snackbar_widget.dart';
import 'package:electrical_comsuption/principal/principal.dart';
import 'package:electrical_comsuption/themes/constants.dart';
import 'package:electrical_comsuption/user/user_area.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Containers extends StatefulWidget {
  const Containers({Key? key}) : super(key: key);

  @override
  State<Containers> createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  // @override
  // void initState() {
  //   super.initState();

  //   getData(Underwear.listDevices).then((value) {
  //     if (value['status'] == 'success') {
  //       AppSnackBar().showSnack(context, "Erro ao pegar os dados", 2);
  //     } else {
  //       AppSnackBar().showSnack(context, "Erro ao pegar os dados", 2);
  //     }
  //   }).catchError((e) {
  //     AppSnackBar()
  //         .showSnack(context, "Erro inesperado, Erro ao pegar os dados", 2);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline),
            onPressed: () async {
              if (await canLaunch(Underwear.dicasURL)) {
                await launch(Underwear.dicasURL);
              } else {
                AppSnackBar().showSnack(
                  context,
                  "Não foi possivel acessar as Dicas!",
                  3,
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserArea(),
                ),
              );
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(top: 130, left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Meias.imges),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            for (var i = 0; i < 5; i++) ...[
              Row(
                children: [
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text('Casa ${i + 1}'),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Principal(),
                        ),
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 20)
            ]
          ],
        ),
      ),
    );
  }
}
