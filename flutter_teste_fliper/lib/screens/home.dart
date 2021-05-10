import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_teste_fliper/models/resumo_model.dart';
import 'package:flutter_teste_fliper/stores/resumo_store.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ResumoStore resumoStore;
  ReactionDisposer disposer;
  
  final oCcy = new NumberFormat("#,##0.00", "pt_BR");
  final percentRentabilidade = new NumberFormat("###.0##", "pt_BR");
  final percentCDI = new NumberFormat("###.0#", "pt_BR");

  static List<String> _lstOpcoes = <String> [
    "Compartilhar App",
    "Avaliar App"
  ];

  void _verOpcaoTela(String opcao){
    switch (opcao) {
      case "Compartilhar App":
        //compartilhar app
        break;
      case "Avaliar App":
        //avaliar app
        break;
      default:
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    resumoStore = Provider.of<ResumoStore>(context);

    disposer = reaction(
      (_) => resumoStore.processed,
      (processed) {
        if(processed)
          print("ok");
        else
          print("não ok");
      }
    );
  }

  Future<ResumoModel> _buscarResumo() async {
    return await resumoStore.buscarResumo();
  }

  Future<void> _reloadList() async {
    //refresh
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: FutureBuilder<ResumoModel>(
          future: _buscarResumo(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
            {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.done:
                default:
                  return Center(
                    child: Text("Erro! Tente novamente mais tarde.",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  );
                  break;
              }
            }
            else {
              return RefreshIndicator(
                strokeWidth: 4.0,
                backgroundColor: Colors.blue[800],
                color: Colors.white,
                onRefresh: _reloadList,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, int index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: Colors.white,
                                child: Container(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Seu resumo",
                                            style: TextStyle(color: Colors.blue[800], fontSize: 26.0, fontWeight: FontWeight.bold),
                                          ),
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
                                      SizedBox(
                                        height: 32.0,
                                      ),
                                      Observer(
                                        builder: (_) {
                                          return Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Valor investido",
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      resumoStore.valoresVisible ? Icons.visibility_off : Icons.visibility,
                                                    ),
                                                    onPressed: resumoStore.toggleValoresVisibility,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.0,
                                              ),
                                              SizedBox(
                                                child: resumoStore.loading
                                                ? CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(Colors.blue[800]),)
                                                : !resumoStore.valoresVisible
                                                  ? Text("R\$ " + oCcy.format(resumoStore.valorInvestido),
                                                      style: TextStyle(color: Colors.blue[800], fontSize: 26.0, fontWeight: FontWeight.bold,),
                                                    )
                                                  : Text("R\$ XXXXX",
                                                      style: TextStyle(color: Colors.blue[800], fontSize: 26.0, fontWeight: FontWeight.bold,),
                                                    ),
                                              ),
                                              SizedBox(
                                                height: 32.0,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Rentabilidade/mês",
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),
                                                  SizedBox(
                                                    child: resumoStore.loading
                                                    ? CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(Colors.blue[800]),)
                                                    : !resumoStore.valoresVisible
                                                      ? Text(percentRentabilidade.format(resumoStore.rentabilidadeMes) + "%",
                                                          style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                                                        )
                                                      : Text("XXX%",
                                                        style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                                                      ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.0,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("CDI",
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),
                                                  SizedBox(
                                                    child: resumoStore.loading
                                                    ? CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(Colors.blue[800]),)
                                                    : !resumoStore.valoresVisible
                                                      ? Text(percentCDI.format(resumoStore.valorCDI) + "%",
                                                          style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                                                        )
                                                      : Text("XX%",
                                                          style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.0,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Ganho/mês",
                                                    style: TextStyle(fontSize: 16.0),
                                                  ),
                                                  SizedBox(
                                                    child: resumoStore.loading
                                                    ? CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(Colors.blue[800]),)
                                                    : !resumoStore.valoresVisible
                                                      ? Text("R\$ " + oCcy.format(resumoStore.valorGanhoMes),
                                                          style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                                                        )
                                                      : Text("R\$ XXXXX",
                                                          style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: FontWeight.bold),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 32.0,
                                              ),
                                              Divider(color: Colors.grey,),
                                              SizedBox(
                                                height: 16.0,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: 44,
                                                    child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(32),
                                                        side: BorderSide(
                                                          color: Colors.blue[800]
                                                        )
                                                      ),
                                                      child: resumoStore.loading
                                                        ? CircularProgressIndicator( valueColor: AlwaysStoppedAnimation(Colors.blue[800]),)
                                                        : Text("VER MAIS", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                      color: Colors.white,
                                                      disabledColor: Colors.blue.withAlpha(100),
                                                      textColor: Colors.blue[800],
                                                      onPressed: resumoStore.processed ? () {
                                                        //VER MAIS
                                                        // Navigator.of(context).push(
                                                        //   MaterialPageRoute(builder: (context) => VerMais()));
                                                      } : null,
                                                    ),
                                                  ),
                                                ]
                                              ),
                                            ],
                                          );
                                        }
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ]
                          )
                        )
                      )
                    );
                  }
                ),
              );
            }
          }
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}