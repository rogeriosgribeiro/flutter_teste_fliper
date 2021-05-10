import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static List<String> _lstOpcoes = <String> [
    "Compartilhar App",
    "Avaliar App"
  ];

  void _verOpcaoTela(String opcao){
    switch (opcao) {
      case "Compartilhar App":
        //_onShare(context);
        break;
      case "Avaliar App":
        //_launchStoresApp();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Seu Resumo"),
                            PopupMenuButton<String>(
                              onSelected: _verOpcaoTela,
                              itemBuilder: (BuildContext context) {
                                return _lstOpcoes.map((String opcao) {
                                  return PopupMenuItem<String>(
                                    value: opcao,
                                    child: Text(opcao),
                                  );
                                }).toList();
                              },
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text("Valor investido"),
                            Text("R\$ xxxxxxxxxxx,xx"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Rentabilidade/mês"),
                                Text("2,767%")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("CDI"),
                                Text("3,45%")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Ganho/mês"),
                                Text("R\$ 1767,00")
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  // Observer(
                  //   builder: (_){
                  //     return CustomTextField(
                  //       // error: loginStore.emailError,
                  //       controller: _emailController,
                  //       hint: 'E-mail',
                  //       prefix: Icon(Icons.account_circle),
                  //       textInputType: TextInputType.emailAddress,
                  //       onChanged: loginStore.setEmail,
                  //       enabled: !loginStore.loading,
                  //       tamanhoBorderRadius: 32,
                  //     );
                  //   },
                  // ),
                ]
              )
            )
          )
        ),
      ),
    );
  }
}