import 'dart:io';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';

// '_' usado para privar as variáveis
/// Caminhos dos arquivos
final String _clientesFile = 'clientes_ex1.dat';
final String _recebimentosFile = 'recebimentos_ex1.dat';
final String _estilistasFile = 'estilistas_ex13.dat';
final String _estacoesFile = 'estacoes_ex13.dat';
final String _roupasFile = 'roupas_ex13.dat';
final String _ex14File = 'registros_ex14.dat';
final String _produtosFile = 'PRODUTOS.DAT'; // Ex 15

/// Lê todas as linhas de um arquivo. Cria se não existir.
List<String> lerLinhasSync(String path) {
  try {
    File file = File(path);
    if (!file.existsSync()) {
      file.createSync();
      return [];
    }
    return file.readAsLinesSync();
  } catch (e) {
    print("Erro ao ler $path: $e");
    return [];
  }
}

/// Sobrescreve um arquivo com novas linhas.
void escreverLinhasSync(String path, List<String> lines) {
  try {
    File file = File(path);
    // O join('\n') garante que a última linha não tenha um \n extra
    file.writeAsStringSync(lines.join('\n'));
  } catch (e) {
    print("Erro ao escrever $path: $e");
  }
}

/// Adiciona uma nova linha ao final do arquivo.
void anexarLinhaSync(String path, String line) {
  try {
    File file = File(path);
    file.writeAsStringSync(line + '\n', mode: FileMode.append);
  } catch (e) {
    print("Erro ao anexar $path: $e");
  }
}

// --- EXERCÍCIOS PROPOSTOS (Capítulo 11 - Pág. 467-468) ---

// 1. Criar os arquivos (Clientes e Recebimentos)
void ex01() {
  print("\n--- Exercício 1: Criar Arquivos ---");
  // Apenas escrever uma string vazia (sobre)escreve o arquivo
  escreverLinhasSync(_clientesFile, []);
  escreverLinhasSync(_recebimentosFile, []);
  print("Arquivos '$_clientesFile' e '$_recebimentosFile' criados/zerados.");
}

// 2. Cadastrar clientes
void ex02() {
  print("\n--- Exercício 2: Cadastrar Clientes ---");
  print("(Digite '0' no código para parar)");
  while (true) {
    int cod = readInt("  Código do Cliente: ");
    if (cod == 0) break;
    String nome = readString("  Nome: ");
    String end = readString("  Endereço: ");
    String fone = readString("  Fone: ");
    
    // Formato: cod|nome|endereco|fone
    String linha = "$cod|$nome|$end|$fone";
    anexarLinhaSync(_clientesFile, linha);
    print("  Cliente $nome cadastrado.");
  }
}

// 3. Incluir recebimentos
void ex03() {
  print("\n--- Exercício 3: Incluir Recebimentos ---");
  var clientes = lerLinhasSync(_clientesFile);
  if (clientes.isEmpty) {
    print("ERRO: Nenhum cliente cadastrado. Cadastre clientes no Ex 2.");
    return;
  }
  
  print("(Digite '0' no N° do Documento para parar)");
  while(true) {
    String numDoc = readString("  N° do Documento: ");
    if (numDoc == '0') break;
    
    int codCli = readInt("  Código do Cliente: ");
    
    // Validação (Verifica se o código do cliente existe)
    bool achou = clientes.any((linha) => linha.split('|')[0] == codCli.toString());
    
    if (!achou) {
      print("  ERRO: Código de cliente $codCli não encontrado.");
      continue;
    }
    
    double valor = readDouble("  Valor: R\$ ");
    String emissao = readString("  Data Emissão (DD/MM/AA): ");
    String venc = readString("  Data Vencimento (DD/MM/AA): ");
    
    // Formato: numDoc|valor|emissao|venc|codCli
    String linha = "$numDoc|$valor|$emissao|$venc|$codCli";
    anexarLinhaSync(_recebimentosFile, linha);
    print("  Recebimento $numDoc cadastrado para o cliente $codCli.");
  }
}

// 4. Excluir clientes e seus recebimentos
void ex04() {
  print("\n--- Exercício 4: Excluir Cliente (e Recebimentos) ---");
  int codExcluir = readInt("Digite o código do cliente a excluir: ");
  
  // Excluir Cliente
  var linhasCli = lerLinhasSync(_clientesFile);
  var novasLinhasCli = linhasCli.where((l) => l.split('|')[0] != codExcluir.toString()).toList();
  escreverLinhasSync(_clientesFile, novasLinhasCli);
  
  // Excluir Recebimentos (índice 4 é o codCli)
  var linhasRec = lerLinhasSync(_recebimentosFile);
  var novasLinhasRec = linhasRec.where((l) => l.split('|')[4] != codExcluir.toString()).toList();
  escreverLinhasSync(_recebimentosFile, novasLinhasRec);
  
  print("Cliente $codExcluir e seus recebimentos foram excluídos.");
}

// 5. Alterar cliente
void ex05() {
  print("\n--- Exercício 5: Alterar Cliente ---");
  int codAlterar = readInt("Digite o código do cliente a alterar: ");
  var linhasCli = lerLinhasSync(_clientesFile);
  bool achou = false;
  
  for (int i = 0; i < linhasCli.length; i++) {
    var p = linhasCli[i].split('|');
    if (p[0] == codAlterar.toString()) {
      achou = true;
      print("  Cliente encontrado: ${p[1]}");
      String nome = readString("  Novo Nome: ");
      String end = readString("  Novo Endereço: ");
      String fone = readString("  Novo Fone: ");
      linhasCli[i] = "$codAlterar|$nome|$end|$fone"; // Reconstrói a linha
      break;
    }
  }
  
  if (achou) {
    escreverLinhasSync(_clientesFile, linhasCli);
    print("  Cliente alterado com sucesso.");
  } else {
    print("  Cliente $codAlterar não encontrado.");
  }
}

// 6. Alterar recebimento
void ex06() {
  print("\n--- Exercício 6: Alterar Recebimento ---");
  String numDoc = readString("Digite o N° do Documento: ");
  int codCli = readInt("Digite o Código do Cliente: ");
  var linhasRec = lerLinhasSync(_recebimentosFile);
  bool achou = false;

  for (int i = 0; i < linhasRec.length; i++) {
    var p = linhasRec[i].split('|');
    // numDoc == p[0] AND codCli == p[4]
    if (p[0] == numDoc && p[4] == codCli.toString()) {
      achou = true;
      print("  Recebimento encontrado.");
      double valor = readDouble("  Novo Valor: R\$ ");
      String emissao = readString("  Nova Data Emissão: ");
      String venc = readString("  Nova Data Vencimento: ");
      linhasRec[i] = "$numDoc|$valor|$emissao|$venc|$codCli";
      break;
    }
  }
  
  if (achou) {
    escreverLinhasSync(_recebimentosFile, linhasRec);
    print("  Recebimento alterado com sucesso.");
  } else {
    print("  Recebimento não encontrado para este cliente.");
  }
}

// 7. Mostrar recebimentos por data de vencimento
void ex07() {
  print("\n--- Exercício 7: Mostrar Recebimentos por Data Venc ---");
  String dataBusca = readString("Digite a Data de Vencimento (DD/MM/AA): ");
  
  // Carrega os clientes em um Mapa para busca rápida de nome
  var linhasCli = lerLinhasSync(_clientesFile);
  var mapaClientes = <String, String>{};
  for (var linha in linhasCli) {
    var p = linha.split('|');
    mapaClientes[p[0]] = p[1]; 
  }
  
  var linhasRec = lerLinhasSync(_recebimentosFile);
  print("\n--- Recebimentos em $dataBusca ---");
  int count = 0;
  for (var linha in linhasRec) {
    var p = linha.split('|');
    // p[3] é a data de vencimento
    if (p[3] == dataBusca) {
      String codCli = p[4];
      String nomeCli = mapaClientes[codCli] ?? "Cliente Desconhecido";
      print("  Doc: ${p[0]} | Cliente: $nomeCli | Dias Atraso: 0"); 
      count++;
    }
  }
  if (count == 0) print("Nenhum recebimento encontrado para esta data.");
}

// 8. Mostrar todos os recebimentos de um cliente
void ex08() {
  print("\n--- Exercício 8: Mostrar Recebimentos por Cliente ---");
  int codCli = readInt("Digite o Código do Cliente: ");
  var linhasRec = lerLinhasSync(_recebimentosFile);
  
  print("\n--- Recebimentos do Cliente $codCli ---");
  int count = 0;
  for (var linha in linhasRec) {
    // p[4] é o codCli
    if (linha.split('|')[4] == codCli.toString()) {
      print("  $linha");
      count++;
    }
  }
  if (count == 0) print("Nenhum recebimento encontrado.");
}

// 9. Mostrar recebimentos acima de um valor
void ex09() {
  print("\n--- Exercício 9: Mostrar Recebimentos Acima de um Valor ---");
  double valorBusca = readDouble("Digite o valor mínimo: R\$ ");
  var linhasRec = lerLinhasSync(_recebimentosFile);
  
  print("\n--- Recebimentos > R\$ $valorBusca ---");
  int count = 0;
  for (var linha in linhasRec) {
    var p = linha.split('|');
    double valorDoc = double.parse(p[1]);
    if (valorDoc > valorBusca) {
      print("  $linha");
      count++;
    }
  }
  if (count == 0) print("Nenhum recebimento encontrado.");
}

// 10. Mostrar recebimentos abaixo de um valor
void ex10() {
  print("\n--- Exercício 10: Mostrar Recebimentos Abaixo de um Valor ---");
  double valorBusca = readDouble("Digite o valor máximo: R\$ ");
  var linhasRec = lerLinhasSync(_recebimentosFile);
  
  print("\n--- Recebimentos < R\$ $valorBusca ---");
  int count = 0;
  for (var linha in linhasRec) {
    var p = linha.split('|');
    double valorDoc = double.parse(p[1]);
    if (valorDoc < valorBusca) {
      print("  $linha");
      count++;
    }
  }
  if (count == 0) print("Nenhum recebimento encontrado.");
}

// 11. Mostrar recebimentos entre dois valores
void ex11() {
  print("\n--- Exercício 11: Mostrar Recebimentos Entre Valores ---");
  double val1 = readDouble("Digite o valor mínimo: R\$ ");
  double val2 = readDouble("Digite o valor máximo: R\$ ");
  var linhasRec = lerLinhasSync(_recebimentosFile);
  
  print("\n--- Recebimentos entre R\$ $val1 e R\$ $val2 ---");
  int count = 0;
  for (var linha in linhasRec) {
    var p = linha.split('|');
    double valorDoc = double.parse(p[1]);
    if (valorDoc > val1 && valorDoc < val2) {
      print("  $linha");
      count++;
    }
  }
  if (count == 0) print("Nenhum recebimento encontrado.");
}

// 12. Criar arquivos (Estilista, Roupa) - (Combina com 13)
void ex12() {
  print("\n--- Exercício 12: Criar Arquivos (Estilista/Roupa) ---");
  escreverLinhasSync(_estilistasFile, []);
  escreverLinhasSync(_estacoesFile, []);
  escreverLinhasSync(_roupasFile, []);
  print("Arquivos '$_estilistasFile', '$_estacoesFile' e '$_roupasFile' criados/zerados.");
}

// 13. Menu Estilista
void ex13() {
  print("\n--- Exercício 13: Menu Estilista/Roupa ---");
  
  while(true) {
    print("\nMENU ESTILISTA (Ex 13):");
    print("1. Cadastrar Estações (Primavera-Verão/Outono-Inverno)");
    print("2. Cadastrar Estilistas");
    print("3. Cadastrar Roupas");
    print("4. Mostrar Relatório de Roupas");
    print("5. Voltar ao menu principal");
    int op = readInt("Opção: ");
    if (op == 5) break;

    switch (op) {
      case 1:
        anexarLinhaSync(_estacoesFile, "1|Primavera-Verão");
        anexarLinhaSync(_estacoesFile, "2|Outono-Inverno");
        print("  Estações cadastradas.");
        break;
      case 2:
        int codEstilista = readInt("  Cód Estilista: ");
        String nomeEstilista = readString("  Nome Estilista: ");
        double sal = readDouble("  Salário: R\$ ");
        anexarLinhaSync(_estilistasFile, "$codEstilista|$nomeEstilista|$sal");
        print("  Estilista cadastrado.");
        break;
      case 3:
        var estilistas = lerLinhasSync(_estilistasFile);
        var estacoes = lerLinhasSync(_estacoesFile);
        if (estilistas.isEmpty || estacoes.isEmpty) {
          print("  ERRO: Cadastre Estilistas e Estações primeiro.");
          break;
        }
        String desc = readString("  Descrição da Roupa: ");
        int codE = readInt("  Cód Estilista: ");
        int codS = readInt("  Cód Estação (1=PV, 2=OI): ");
        int ano = readInt("  Ano: ");
        
        bool estExiste = estilistas.any((l) => l.split('|')[0] == codE.toString());
        bool staExiste = estacoes.any((l) => l.split('|')[0] == codS.toString());
        
        if (!estExiste || !staExiste) {
          print("  ERRO: Estilista ou Estação não encontrado.");
          break;
        }
        // codRoupa|Desc|codEstilista|codEstacao|Ano
        String codRoupa = (lerLinhasSync(_roupasFile).length + 1).toString();
        anexarLinhaSync(_roupasFile, "$codRoupa|$desc|$codE|$codS|$ano");
        print("  Roupa cadastrada.");
        break;
      case 4:
        print("\n--- Relatório de Roupas ---");
        var mapaEstilistas = <String, String>{};
        lerLinhasSync(_estilistasFile).forEach((l) { var p=l.split('|'); mapaEstilistas[p[0]] = p[1]; });
        
        var mapaEstacoes = <String, String>{};
        lerLinhasSync(_estacoesFile).forEach((l) { var p=l.split('|'); mapaEstacoes[p[0]] = p[1]; });
        
        var roupas = lerLinhasSync(_roupasFile);
        for (var r in roupas) {
          var p = r.split('|');
          String nomeEstilista = mapaEstilistas[p[2]] ?? "N/A";
          String nomeEstacao = mapaEstacoes[p[3]] ?? "N/A";
          print("  Roupa: ${p[1]} | Estilista: $nomeEstilista | Estação: $nomeEstacao | Ano: ${p[4]}");
        }
        break;
    }
  }
}

// 14. Menu Genérico
void ex14() {
  print("\n--- Exercício 14: Menu Genérico (Arquivo '$_ex14File') ---");
  while (true) {
    print("\nMENU (Ex 14):");
    print("1. Criar");
    print("2. Incluir");
    print("3. Mostrar");
    print("4. Sair");
    int op = readInt("Opção: ");
    
    if (op == 4) break;
    
    switch (op) {
      case 1:
        escreverLinhasSync(_ex14File, []);
        print("  Arquivo '$_ex14File' criado/zerado.");
        break;
      case 2:
        int num = readInt("  Número: ");
        String nome = readString("  Nome: ");
        double n1 = readDouble("  Nota 1: ");
        double n2 = readDouble("  Nota 2: ");
        anexarLinhaSync(_ex14File, "$num|$nome|$n1|$n2");
        print("  Registro incluído.");
        break;
      case 3:
        var linhas = lerLinhasSync(_ex14File);
        if (linhas.isEmpty) {
          print("  Arquivo vazio.");
          break;
        }
        print("\n--- Registros Cadastrados ---");
        for (var l in linhas) {
          var p = l.split('|');
          double n1 = double.parse(p[2]);
          double n2 = double.parse(p[3]);
          double media = (n1 + n2) / 2;
          print("  $l | Média: ${media.toStringAsFixed(1)}");
        }
        break;
      default:
        print("Opção inválida.");
    }
  }
}

// 15. Criar PRODUTOS.DAT
void ex15() {
  print("\n--- Exercício 15: Criar '$_produtosFile' ---");
  escreverLinhasSync(_produtosFile, []);
  print("  Arquivo criado/zerado.");
}

// 16. Incluir Produtos (sem duplicar código)
void ex16() {
  print("\n--- Exercício 16: Incluir Produtos (sem duplicar) ---");
  var linhas = lerLinhasSync(_produtosFile);
  
  int cod = readInt("  Código: ");
  String desc = readString("  Descrição: ");
  double preco = readDouble("  Preço: R\$ ");
  
  bool existe = linhas.any((l) => l.split('|')[0] == cod.toString());
  
  if (existe) {
    print("  ERRO: Código $cod já existe.");
  } else {
    anexarLinhaSync(_produtosFile, "$cod|$desc|$preco");
    print("  Produto cadastrado.");
  }
}

// 17. Consultar preço > 500
void ex17() {
  print("\n--- Exercício 17: Consultar Produtos (Preço > 500) ---");
  var linhas = lerLinhasSync(_produtosFile);
  int count = 0;
  for (var l in linhas) {
    var p = l.split('|');
    if (double.parse(p[2]) > 500) {
      print("  Descrição: ${p[1]}");
      count++;
    }
  }
  if (count == 0) print("Nenhum produto encontrado.");
}

// 18. Aumentar preços em 15%
void ex18() {
  print("\n--- Exercício 18: Aumentar Preços em 15% ---");
  var linhas = lerLinhasSync(_produtosFile);
  var novasLinhas = <String>[];
  
  for (var l in linhas) {
    var p = l.split('|');
    double novoPreco = double.parse(p[2]) * 1.15;
    novasLinhas.add("${p[0]}|${p[1]}|${novoPreco.toStringAsFixed(2)}");
  }
  
  escreverLinhasSync(_produtosFile, novasLinhas);
  print("  Preços atualizados. Verifique no Ex 22 (por ex).");
}

// 19. Aumentar R$ 10 (se > R$ 100)
void ex19() {
  print("\n--- Exercício 19: Aumentar R\$ 10 (se > R\$ 100) ---");
  var linhas = lerLinhasSync(_produtosFile);
  var novasLinhas = <String>[];
  
  for (var l in linhas) {
    var p = l.split('|');
    double preco = double.parse(p[2]);
    if (preco > 100) {
      preco += 10;
    }
    novasLinhas.add("${p[0]}|${p[1]}|${preco.toStringAsFixed(2)}");
  }
  
  escreverLinhasSync(_produtosFile, novasLinhas);
  print("  Preços atualizados. Verifique no Ex 22 (por ex).");
}

// 20. Consultar produtos (começa com 'M')
void ex20() {
  print("\n--- Exercício 20: Consultar Produtos (Começa com 'M') ---");
  var linhas = lerLinhasSync(_produtosFile);
  int count = 0;
  for (var l in linhas) {
    var p = l.split('|'); // p[1] = descrição
    if (p[1].isNotEmpty && p[1].toUpperCase().startsWith('M')) {
      print("  $l");
      count++;
    }
  }
  if (count == 0) print("Nenhum produto encontrado.");
}

// 21. Excluir produtos (do Ex 15)
void ex21() {
  print("\n--- Exercício 21: Excluir Produto (por Código) ---");
  int codExcluir = readInt("Digite o código do produto a excluir: ");
  var linhas = lerLinhasSync(_produtosFile);
  var novasLinhas = linhas.where((l) => l.split('|')[0] != codExcluir.toString()).toList();
  
  if (linhas.length == novasLinhas.length) {
    print("  Produto não encontrado.");
  } else {
    escreverLinhasSync(_produtosFile, novasLinhas);
    print("  Produto $codExcluir excluído.");
  }
}

// 22. Consultar preços < R$ 15
void ex22() {
  print("\n--- Exercício 22: Consultar Produtos (Preço < 15) ---");
  var linhas = lerLinhasSync(_produtosFile);
  int count = 0;
  for (var l in linhas) {
    var p = l.split('|');
    if (double.parse(p[2]) < 15) {
      print("  $l");
      count++;
    }
  }
  if (count == 0) print("Nenhum produto encontrado.");
}

// 23. Consultar por letra e faixa de preço
void ex23() {
  print("\n--- Exercício 23: Consultar (Letra e Faixa de Preço) ---");
  String letra = readString("Digite a letra inicial: ").toUpperCase();
  double val1 = readDouble("Digite o valor mínimo: R\$ ");
  double val2 = readDouble("Digite o valor máximo: R\$ ");
  
  var linhas = lerLinhasSync(_produtosFile);
  int count = 0;
  for (var l in linhas) {
    var p = l.split('|');
    String nome = p[1];
    double preco = double.parse(p[2]);
    
    if (nome.toUpperCase().startsWith(letra) && (preco > val1 && preco < val2)) {
      print("  $l");
      count++;
    }
  }
  if (count == 0) print("Nenhum produto encontrado.");
}

// 24. Excluir produtos > R$ 200
void ex24() {
  print("\n--- Exercício 24: Excluir Produtos (Preço > 200) ---");
  var linhas = lerLinhasSync(_produtosFile);
  var novasLinhas = linhas.where((l) {
    return double.parse(l.split('|')[2]) <= 200;
  }).toList();
  
  int excluidos = linhas.length - novasLinhas.length;
  if (excluidos > 0) {
    escreverLinhasSync(_produtosFile, novasLinhas);
    print("  $excluidos produto(s) excluído(s).");
  } else {
    print("  Nenhum produto > R\$ 200 encontrado.");
  }
}

// 25. Conceder desconto
void ex25() {
  print("\n--- Exercício 25: Conceder Desconto (por Faixa) ---");
  double perc = readDouble("Digite o percentual de desconto (ex: 10): ");
  double val1 = readDouble("Digite o valor mínimo da faixa: R\$ ");
  double val2 = readDouble("Digite o valor máximo da faixa: R\$ ");
  
  var linhas = lerLinhasSync(_produtosFile);
  var novasLinhas = <String>[];
  
  for (var l in linhas) {
    var p = l.split('|');
    double preco = double.parse(p[2]);
    if (preco > val1 && preco < val2) {
      preco *= (1 - (perc / 100));
    }
    novasLinhas.add("${p[0]}|${p[1]}|${preco.toStringAsFixed(2)}");
  }
  
  escreverLinhasSync(_produtosFile, novasLinhas);
  print("  Descontos aplicados.");
}


// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01,  2: ex02,  3: ex03,  4: ex04,  5: ex05,
  6: ex06,  7: ex07,  8: ex08,  9: ex09,  10: ex10,
  11: ex11, 12: ex12, 13: ex13, 14: ex14, 15: ex15,
  16: ex16, 17: ex17, 18: ex18, 19: ex19, 20: ex20,
  21: ex21, 22: ex22, 23: ex23, 24: ex24, 25: ex25,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 11 (Arquivos) ---");
    print("Por favor, escolha um exercício (1-25) para executar.");

    // Lista de exercícios
    print("\n--- Exercícios 1-11 (Clientes/Recebimentos) ---");
    print("1. Criar Arquivos (Cliente/Receb) | 7. Mostrar Rec (Data Venc)");
    print("2. Cadastrar Clientes             | 8. Mostrar Rec (Cliente)");
    print("3. Incluir Recebimentos (c/ val)  | 9. Mostrar Rec (> Valor)");
    print("4. Excluir Cliente (e Rec)        | 10. Mostrar Rec (< Valor)");
    print("5. Alterar Cliente                | 11. Mostrar Rec (Entre Valores)");
    print("6. Alterar Recebimento");
    
    print("\n--- Exercícios 12-14 (Estilista/Menu Genérico) ---");
    print("12. Criar Arquivos (Estilista)    | 14. Menu Genérico (Criar/Incluir/Mostrar)");
    print("13. Menu Estilista (Cad/Relatório)");
    
    print("\n--- Exercícios 15-25 (PRODUTOS.DAT) ---");
    print("15. Criar PRODUTOS.DAT            | 21. Excluir Produto (por Cód)");
    print("16. Incluir Produto (s/ dup)      | 22. Consultar Preço (< 15)");
    print("17. Consultar Preço (> 500)       | 23. Consultar (Letra e Faixa)");
    print("18. Aumentar Preços (15%)         | 24. Excluir Preço (> 200)");
    print("19. Aumentar R\$ 10 (se > 100)    | 25. Conceder Desconto (Faixa)");
    print("20. Consultar (Começa com 'M')");


    print("\n0. Sair");

    int escolha = readInt("\nDigite sua opção: ");

    if (escolha == 0) {
      print("Encerrando programa. Até logo!");
      break;
    }

    // Procura a função no mapa
    Function? exercicioEscolhido = exercicios[escolha];

    if (exercicioEscolhido != null) {
      // Se encontrou, executa
      exercicioEscolhido();
    } else {
      // Se não, avisa o usuário
      print("Opção inválida. Por favor, tente novamente.");
    }

    print("\n-----------------------------------------");
    print("Pressione Enter para voltar ao menu...");
    stdin.readLineSync();
  }
}