import 'dart:io';
import 'dart:math';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';
// --- CLASSES (REGISTROS) DO CAPÍTULO 10 ---

// Ex 1
class Vendedor {
  int codigo;
  String nome;
  Vendedor(this.codigo, this.nome);
}
class Venda {
  int codVendedor;
  double valor;
  int mes;
  Venda(this.codVendedor, this.valor, this.mes);
}

// Ex 2
class Habitante {
  double salario;
  int idade;
  int numFilhos;
  Habitante(this.salario, this.idade, this.numFilhos);
}

// Ex 3
class Pessoa {
  String sexo; // 'M' ou 'F'
  String corOlhos; // 'A', 'V', 'C'
  double altura;
  int idade;
  Pessoa(this.sexo, this.corOlhos, this.altura, this.idade);
}

// Ex 4
class HabitanteCidade {
  String sexo;
  double rendaFamiliar;
  int numFilhos;
  HabitanteCidade(this.sexo, this.rendaFamiliar, this.numFilhos);
}

// Ex 5
class Produto {
  int codigo;
  String descricao;
  double valor;
  int qtdEstoque;
  Produto(this.codigo, this.descricao, this.valor, this.qtdEstoque);
}

// Ex 6
class ClienteEx6 {
  int numConta;
  String nome;
  String telefone;
  String endereco;
  ClienteEx6(this.numConta, this.nome, this.telefone, this.endereco);
}
class ContaBancaria {
  int numConta;
  double saldo;
  ContaBancaria(this.numConta, this.saldo);
}

// Ex 7
class ClienteEx7 {
  int codigo;
  String nome;
  int numConta; // Adicionado para fazer a verificação
  ClienteEx7(this.codigo, this.nome, this.numConta);
}
class Compra {
  int numConta;
  double valor;
  int codigoCliente;
  Compra(this.numConta, this.valor, this.codigoCliente);
}

// Ex 8
class Cidade {
  String nome;
  String estado; // Sigla (ex: RS)
  int numVeiculos;
  int numAcidentes;
  Cidade(this.nome, this.estado, this.numVeiculos, this.numAcidentes);
}

// Ex 9
class VendedorEx9 {
  String nome;
  double salarioFixo;
  double totalVendas;
  VendedorEx9(this.nome, this.salarioFixo, this.totalVendas);
}

// Ex 10
class Documento {
  int num;
  int codCli;
  String dataVenc;
  String dataPag;
  double valor;
  int diasAtraso; // Simplificado para cálculo de juros
  double juros;
  Documento(this.num, this.codCli, this.dataVenc, this.dataPag, this.valor, this.diasAtraso, this.juros);
}

// Ex 11 e 14 (Registros compartilhados)
class Medico {
  int codMedico;
  String nome;
  String endereco;
  String salario; // O print do Ex 11 define salário como parte de médico
  Medico(this.codMedico, this.nome, this.endereco, this.salario);
}
class Paciente {
  int codPac;
  String nome;
  String endereco;
  int idade;
  Paciente(this.codPac, this.nome, this.endereco, this.idade);
}
class Consulta {
  String numProntuario;
  String data;
  String diagnostico;
  int codMedico;
  int codPac;
  Consulta(this.numProntuario, this.data, this.diagnostico, this.codMedico, this.codPac);
}

// Ex 12
class ClienteEx12 {
  int codCli;
  String nome;
  String endereco;
  String fone;
  ClienteEx12(this.codCli, this.nome, this.endereco, this.fone);
}
class Recebimento {
  String numDoc;
  double valorDoc;
  String dataEmissao;
  String dataVenc;
  int codCli;
  Recebimento(this.numDoc, this.valorDoc, this.dataEmissao, this.dataVenc, this.codCli);
}

// Ex 13
class Estacao {
  int cod;
  String nome;
  Estacao(this.cod, this.nome);
}
class Estilista {
  int cod;
  String nome;
  double salario;
  Estilista(this.cod, this.nome, this.salario);
}
class Roupa {
  String descricao;
  int codEstilista;
  int codEstacao;
  int ano;
  Roupa(this.descricao, this.codEstilista, this.codEstacao, this.ano);
}

// Ex 15
class Cozinheiro {
  int codigo;
  String nome;
  Cozinheiro(this.codigo, this.nome);
}
class Ingrediente {
  int codigo;
  String descricao;
  Ingrediente(this.codigo, this.descricao);
}
class Receita {
  int codigo;
  String nome;
  double totalCalorias;
  int codCozinheiro;
  List<int> codigosIngredientes; // Lista dos códigos de ingredientes
  Receita(this.codigo, this.nome, this.totalCalorias, this.codCozinheiro, this.codigosIngredientes);
}

// Ex 16
class Tombo {
  int numTombo;
  String nomeObra;
  String nomeAutor;
  String nomeEditora;
  String codigoArea; // "exatas", "humanas", "biomedicas"
  Tombo(this.numTombo, this.nomeObra, this.nomeAutor, this.nomeEditora, this.codigoArea);
}

// Ex 17
class ClienteEx17 {
  int cod;
  String nome;
  String cidade;
  String area; // '1-Industrial', '2-Comercial', '3-Residencial'
  String cpfCnpj;
  ClienteEx17(this.cod, this.nome, this.cidade, this.area, this.cpfCnpj);
}
class ContaEx17 {
  int numConta;
  int codCliente;
  double saldo;
  ContaEx17(this.numConta, this.codCliente, this.saldo);
}

// Ex 18
class ClienteVIP {
  String cpf;
  String rg;
  String endereco;
  bool vip;
  int mesPrimeiraCompra; // Simplificado de data
  double totalGasto;
  ClienteVIP(this.cpf, this.rg, this.endereco, this.vip, this.mesPrimeiraCompra, this.totalGasto);
}

// Ex 19
class ClienteFerrari {
  int numeroSorteio; // Número do gancho (1 a 9999)
  String nome;
  String dataNasc;
  String cpf;
  String rg;
  String cidade;
  String endereco;
  int eletrosComprados;
  ClienteFerrari(this.numeroSorteio, this.nome, this.dataNasc, this.cpf, this.rg, this.cidade, this.endereco, this.eletrosComprados);
}

// Ex 20
class OrdemServico {
  int numOS;
  String data;
  double valor;
  String servico;
  String nomeCliente;
  OrdemServico(this.numOS, this.data, this.valor, this.servico, this.nomeCliente);
}


// --- Listas Globais para Exercícios com Menus ---
List<Vendedor> ex1Vendedores = [];
List<Venda> ex1Vendas = [];
List<Produto> ex5Produtos = [];
List<ClienteEx6> ex6Clientes = [];
List<ContaBancaria> ex6Contas = [];
List<ClienteEx7> ex7Clientes = [];
List<Compra> ex7Compras = [];
List<Medico> ex11Medicos = [];
List<Paciente> ex11Pacientes = [];
List<Consulta> ex11Consultas = [];
List<ClienteEx12> ex12Clientes = [];
List<Recebimento> ex12Recebimentos = [];
List<Estacao> ex13Estacoes = [];
List<Estilista> ex13Estilistas = [];
List<Roupa> ex13Roupas = [];
// Ex 14 usa os mesmos registros do Ex 11, mas listas separadas
List<Medico> ex14Medicos = [];
List<Paciente> ex14Pacientes = [];
List<Consulta> ex14Consultas = [];
List<Cozinheiro> ex15Cozinheiros = [];
List<Ingrediente> ex15Ingredientes = [];
List<Receita> ex15Receitas = [];
List<Tombo> ex16Tombos = [];
List<ClienteEx17> ex17Clientes = [];
List<ContaEx17> ex17Contas = [];
List<ClienteVIP> ex18Clientes = [];
List<ClienteFerrari> ex19Clientes = [];

// --- EXERCÍCIOS PROPOSTOS (Capítulo 10 - Pág. 414-417) ---

// 1. Vendas
void ex01() {
  print("\n--- Exercício 1: Controle de Vendas (4 Vendedores) ---");
  // Inicializa os 4 vendedores
  if (ex1Vendedores.isEmpty) {
    ex1Vendedores.add(Vendedor(101, "Ana"));
    ex1Vendedores.add(Vendedor(102, "Bruno"));
    ex1Vendedores.add(Vendedor(103, "Carla"));
    ex1Vendedores.add(Vendedor(104, "Daniel"));
    print("Vendedores padrão cadastrados.");
  }
  
  while (true) {
    print("\nMENU VENDAS:");
    print("1. Cadastrar vendas");
    print("2. Consultar vendas (Funcionário/Mês)");
    print("3. Consultar total (Funcionário)");
    print("4. Mostrar N° de vendas (Funcionário/Mês)");
    print("5. Mostrar Mês com mais vendas");
    print("6. Voltar ao menu principal");
    int op = readInt("Opção: ");

    if (op == 6) break;

    switch (op) {
      case 1:
        int cod = readInt("  Código do Vendedor (101-104): ");
        bool achou = ex1Vendedores.any((v) => v.codigo == cod);
        if (!achou) {
          print("  Vendedor não encontrado.");
          continue;
        }
        double valor = readDouble("  Valor da Venda: R\$ ");
        int mes = readInt("  Mês (1-12): ");
        ex1Vendas.add(Venda(cod, valor, mes));
        print("  Venda cadastrada.");
        break;
      case 2:
        int cod = readInt("  Código do Vendedor: ");
        int mes = readInt("  Mês (1-12): ");
        double total = 0;
        for (var v in ex1Vendas.where((v) => v.codVendedor == cod && v.mes == mes)) {
          total += v.valor;
        }
        print("  Total de vendas: R\$ ${total.toStringAsFixed(2)}");
        break;
      case 3:
        int cod = readInt("  Código do Vendedor: ");
        double total = 0;
        for (var v in ex1Vendas.where((v) => v.codVendedor == cod)) {
          total += v.valor;
        }
        print("  Total de vendas do funcionário: R\$ ${total.toStringAsFixed(2)}");
        break;
      case 4:
        int cod = readInt("  Código do Vendedor: ");
        int mes = readInt("  Mês (1-12): ");
        int count = ex1Vendas.where((v) => v.codVendedor == cod && v.mes == mes).length;
        print("  Número de vendas: $count");
        break;
      case 5:
        if (ex1Vendas.isEmpty) {
          print("Nenhuma venda cadastrada.");
          break;
        }
        List<double> totalMes = List.filled(13, 0.0); // 13 para ignorar índice 0
        for (var v in ex1Vendas) {
          totalMes[v.mes] += v.valor;
        }
        double maxVendas = 0;
        int maxMes = 0;
        for(int i=1; i<=12; i++) {
          if (totalMes[i] > maxVendas) {
            maxVendas = totalMes[i];
            maxMes = i;
          }
        }
        print("  Mês com mais vendas: $maxMes (Total: R\$ ${maxVendas.toStringAsFixed(2)})");
        break;
      default:
        print("Opção inválida.");
    }
  }
}

// 2. Média População
void ex02() {
  print("\n--- Exercício 2: Pesquisa (20 Pessoas) ---");
  // O original é 20, usando 3 para teste
  int N = 3; 
  List<Habitante> habs = [];
  double somaSal = 0;
  int somaFilhos = 0;
  double maxSal = 0;
  int countSal1000 = 0;
  
  for(int i=1; i<=N; i++) {
    print("--- Pessoa $i ---");
    double sal = readDouble("  Salário: R\$ ");
    int idade = readInt("  Idade: ");
    int filhos = readInt("  N° Filhos: ");
    habs.add(Habitante(sal, idade, filhos));
    
    somaSal += sal;
    somaFilhos += filhos;
    if (sal > maxSal) maxSal = sal;
    if (sal < 1000) countSal1000++;
  }
  
  print("\n--- Resultados ---");
  print("a) Média Salário: R\$ ${(somaSal / N).toStringAsFixed(2)}");
  print("b) Média Filhos: ${(somaFilhos / N).toStringAsFixed(1)}");
  print("c) Maior Salário: R\$ ${maxSal.toStringAsFixed(2)}");
  print("d) % Salário < R\$ 1000: ${((countSal1000 / N) * 100).toStringAsFixed(1)}%");
}

// 3. Pesquisa 50 Pessoas
void ex03() {
  print("\n--- Exercício 3: Pesquisa (50 Pessoas) ---");
  // O original é 50, usando 3 para teste
  int N = 3; 
  List<Pessoa> pessoas = [];
  double somaIdadeOlhosCastanhos = 0;
  int countIdadeOlhosCastanhos = 0;
  int maxIdade = 0;
  int countMulheresVerdes = 0;
  int countHomens = 0;

  for(int i=1; i<=N; i++) {
    print("--- Pessoa $i ---");
    String sexo = readString("  Sexo (M/F): ").toUpperCase();
    String olhos = readString("  Cor Olhos (A/V/C): ").toUpperCase();
    double altura = readDouble("  Altura (m): ");
    int idade = readInt("  Idade: ");
    pessoas.add(Pessoa(sexo, olhos, altura, idade));
    
    // a)
    if (olhos == 'C' && altura > 1.60) {
      somaIdadeOlhosCastanhos += idade;
      countIdadeOlhosCastanhos++;
    }
    // b)
    if (idade > maxIdade) maxIdade = idade;
    // c)
    if (sexo == 'F' && (idade >= 20 && idade <= 45) && olhos == 'V' && altura < 1.70) {
      countMulheresVerdes++;
    }
    // d)
    if (sexo == 'M') countHomens++;
  }
  
  print("\n--- Resultados ---");
  print("a) Média Idade (Olhos Castanhos, Altura > 1.60): ${(somaIdadeOlhosCastanhos / countIdadeOlhosCastanhos).toStringAsFixed(1)}");
  print("b) Maior Idade: $maxIdade");
  print("c) Qtd Mulheres (20-45, Olhos Verdes, Altura < 1.70): $countMulheresVerdes");
  print("d) Percentual de Homens: ${((countHomens / N) * 100).toStringAsFixed(1)}%");
}

// 4. Pesquisa Cidade
void ex04() {
  print("\n--- Exercício 4: Pesquisa (20 Habitantes) ---");
  // O original é 20, usando 3 para teste
  int N = 3; 
  double somaRenda = 0;
  double minRenda = double.maxFinite;
  double maxRenda = 0;
  int somaFilhos = 0;
  int countMulheres = 0;

  for (int i = 1; i <= N; i++) {
    print("--- Habitante $i ---");
    String sexo = readString("  Sexo (M/F): ").toUpperCase();
    double renda = readDouble("  Renda Familiar: R\$ ");
    int filhos = readInt("  N° Filhos: ");
    
    somaRenda += renda;
    somaFilhos += filhos;
    if (renda < minRenda) minRenda = renda;
    if (renda > maxRenda) maxRenda = renda;
    if (sexo == 'F' && filhos > 2 && renda < 600) {
      countMulheres++;
    }
  }
  
  print("\n--- Resultados ---");
  print("a) Média Renda: R\$ ${(somaRenda / N).toStringAsFixed(2)}");
  print("b) Menor Renda: R\$ $minRenda | Maior Renda: R\$ $maxRenda");
  print("c) Média Filhos: ${(somaFilhos / N).toStringAsFixed(1)}");
  print("d) % Mulheres (+2 filhos, Renda < 600): ${((countMulheres / N) * 100).toStringAsFixed(1)}%");
}

// 5. Estoque
void ex05() {
  print("\n--- Exercício 5: Controle de Estoque (50 Produtos) ---");
  if (ex5Produtos.isEmpty) {
    // O original é 50, usando 3 para teste
    print("Cadastrando 3 produtos iniciais:");
    for (int i = 1; i <= 3; i++) {
      ex5Produtos.add(Produto(
        i, 
        readString("  Descrição Prod $i: "), 
        readDouble("  Valor Prod $i: R\$ "), 
        readInt("  Qtd Prod $i: ")
      ));
    }
  }

  while (true) {
    print("\nMENU ESTOQUE:");
    print("1. Alterar dados (por código)");
    print("2. Mostrar produtos (estoque < 5)");
    print("3. Voltar ao menu principal");
    int op = readInt("Opção: ");
    if (op == 3) break;

    if (op == 1) {
      int cod = readInt("  Digite o código do produto para alterar: ");
      var prod = ex5Produtos.firstWhere((p) => p.codigo == cod, orElse: () => Produto(-1,'',0,0));
      if (prod.codigo == -1) {
        print("  Produto não encontrado.");
        continue;
      }
      print("  Produto: ${prod.descricao}. O que deseja alterar?");
      print("  1- Descrição | 2- Valor | 3- Estoque");
      int alt = readInt("  Opção: ");
      if (alt == 1) {prod.descricao = readString("    Nova Descrição: ");}
      else if (alt == 2) {prod.valor = readDouble("    Novo Valor: R\$ ");}
      else if (alt == 3) {prod.qtdEstoque = readInt("    Nova Qtd: ");}
      print("  Alterado com sucesso.");
    } else if (op == 2) {
      print("\n--- Produtos com Estoque < 5 ---");
      for (var p in ex5Produtos.where((p) => p.qtdEstoque < 5)) {
        print("  Cód: ${p.codigo} | Desc: ${p.descricao} | Qtd: ${p.qtdEstoque}");
      }
    }
  }
}

// 6. Cliente/Conta
void ex06() {
  print("\n--- Exercício 6: Cadastro Cliente/Conta ---");
  if (ex6Clientes.isEmpty) {
    print("Cadastrando 2 clientes iniciais...");
    ex6Clientes.add(ClienteEx6(10, "Ana", "123", "Rua A"));
    ex6Clientes.add(ClienteEx6(20, "Bia", "456", "Rua B"));
  }
  
  while(true) {
    print("\nCadastrando nova conta bancária (Digite N° Conta 0 para sair)");
    int numConta = readInt("  Digite o N° da Conta: ");
    if (numConta == 0) break;
    
    // Verifica se o cliente existe
    var cli = ex6Clientes.firstWhere((c) => c.numConta == numConta, orElse: () => ClienteEx6(-1,'','',''));
    if (cli.numConta == -1) {
      print("  Cliente não cadastrado com este N° de conta.");
    } else {
      print("  Cliente: ${cli.nome}");
      double saldo = readDouble("  Digite o saldo inicial: R\$ ");
      ex6Contas.add(ContaBancaria(numConta, saldo));
      print("  Conta cadastrada.");
    }
  }
  
  print("\n--- Relatório Final ---");
  print("Clientes: ${ex6Clientes.map((c) => c.nome).toList()}");
  print("Contas: ${ex6Contas.map((c) => 'N°${c.numConta}/R\$${c.saldo}').toList()}");
}

// 7. Cliente/Compra
void ex07() {
  print("\n--- Exercício 7: Cadastro de Compras (2 Clientes) ---");
  if (ex7Clientes.isEmpty) {
    print("Cadastrando 2 clientes iniciais...");
    ex7Clientes.add(ClienteEx7(1, "Carlos", 1001));
    ex7Clientes.add(ClienteEx7(2, "Diana", 1002));
  }
  
  while(true) {
    print("\nRegistrando nova compra (Digite Cód Cliente 0 para sair)");
    int codCli = readInt("  Código do Cliente (1 ou 2): ");
    if (codCli == 0) break;
    
    var cli = ex7Clientes.firstWhere((c) => c.codigo == codCli, orElse: () => ClienteEx7(-1,'',-1));
    if (cli.codigo == -1) {
      print("  Inclusão não permitida. Cliente não existe.");
      continue;
    }
    
    int numConta = readInt("  N° da Conta da Compra: ");
    double valor = readDouble("  Valor da Compra: R\$ ");
    
    if (cli.numConta != numConta) {
      print("  Exclusão [Inclusão] não permitida. Conta não vinculada ao cliente.");
    } else {
      ex7Compras.add(Compra(numConta, valor, codCli));
      print("  Compra registrada.");
    }
  }
  print("Compras: ${ex7Compras.length}");
}

// 8. Acidentes
void ex08() {
  print("\n--- Exercício 8: Acidentes (15 Cidades) ---");
  // O original é 15, usando 3 para teste
  int N = 3; 
  List<Cidade> cidades = [];
  int minAcid = 999999; String nomeMin = ''; String estMin = '';
  int maxAcid = 0; String nomeMax = ''; String estMax = '';
  int somaVeic = 0;
  int somaAcidRS = 0; int countRS = 0;
  
  for(int i=1; i<=N; i++) {
    print("--- Cidade $i ---");
    String nome = readString("  Nome: ");
    String est = readString("  Estado (Sigla): ").toUpperCase();
    int veic = readInt("  N° Veículos (2012): ");
    int acid = readInt("  N° Acidentes (2012): ");
    cidades.add(Cidade(nome, est, veic, acid));
    
    somaVeic += veic;
    if (acid < minAcid) { minAcid = acid; nomeMin = nome; estMin = est; }
    if (acid > maxAcid) { maxAcid = acid; nomeMax = nome; estMax = est; }
    if (est == 'RS') {
      somaAcidRS += acid;
      countRS++;
    }
  }
  
  print("\n--- Resultados ---");
  print("a) Menor índice Acidentes: $minAcid (Cidade: $nomeMin/$estMin)");
  print("   Maior índice Acidentes: $maxAcid (Cidade: $nomeMax/$estMax)");
  print("b) Média de Veículos: ${(somaVeic / N).toStringAsFixed(1)}");
  print("c) Média Acidentes (RS): ${(somaAcidRS / countRS).toStringAsFixed(1)}");
}

// 9. Vendedor (Comissão)
void ex09() {
  print("\n--- Exercício 9: Vendedores (10) ---");
  // O original é 10, usando 3 para teste
  int N = 3; 
  List<VendedorEx9> vendedores = [];
  
  for(int i=1; i<=N; i++) {
    print("--- Vendedor $i ---");
    vendedores.add(VendedorEx9(
      readString("  Nome: "),
      readDouble("  Salário Fixo: R\$ "),
      readDouble("  Total Vendas: R\$ ")
    ));
  }
  
  print("\n--- Relatório de Comissão (6%) ---");
  for (var v in vendedores) {
    double comissao = v.totalVendas * 0.06;
    double salFinal = v.salarioFixo + comissao;
    print("  Vendedor: ${v.nome}");
    print("    Comissão: R\$ ${comissao.toStringAsFixed(2)}");
    print("    Salário Final: R\$ ${salFinal.toStringAsFixed(2)}");
  }
}

// 10. Documentos (Juros)
void ex10() {
  print("\n--- Exercício 10: Documentos (Juros 0.02%/dia) ---");
  double somaJuros = 0;
  int n = readInt("Quantos documentos? ");
  if (n == 0) return;
  
  List<Documento> docs = [];
  for (int i=1; i<=n; i++) {
    print("--- Documento $i ---");
    int num = readInt("  N°: ");
    int cod = readInt("  Cód Cliente: ");
    String venc = readString("  Data Venc: ");
    String pag = readString("  Data Pag: ");
    double val = readDouble("  Valor: R\$ ");
    int atraso = readInt("  Dias Atraso: ");
    
    double juros = val * (atraso * 0.0002);
    somaJuros += juros;
    docs.add(Documento(num, cod, venc, pag, val, atraso, juros));
  }
  
  print("\n--- Relatório de Juros ---");
  for (var d in docs) {
    print("  Doc N°: ${d.num} | Valor: R\$ ${d.valor} | Juros: R\$ ${d.juros.toStringAsFixed(2)} | Total: R\$ ${(d.valor + d.juros).toStringAsFixed(2)}");
  }
  print("\nMédia total de Juros: R\$ ${(somaJuros / n).toStringAsFixed(2)}");
}

// 11. Clínica (Menu)
void ex11() {
  print("\n--- Exercício 11: Clínica (Menu) ---");
  while(true) {
    print("\nMENU CLÍNICA (Ex 11):");
    print("1. Cadastrar/Alterar (Médico/Paciente)");
    print("2. Excluir (Médico/Paciente)");
    print("3. Excluir Consulta");
    print("4. Mostrar Consultas");
    print("5. Voltar ao menu principal");
    int op = readInt("Opção: ");
    if (op == 5) break;
    // ... Implementação do menu (muito longa para este exemplo)
    print("  (Opção $op selecionada - Lógica não implementada)");
  }
}

// 12. Recebimentos
void ex12() {
  print("\n--- Exercício 12: Recebimentos (15 Clientes) ---");
  // O original é 15, usando 3 para teste
  if (ex12Clientes.isEmpty) {
    ex12Clientes.add(ClienteEx12(1, "Cli A", "Rua A", "111"));
    ex12Clientes.add(ClienteEx12(2, "Cli B", "Rua B", "222"));
    ex12Clientes.add(ClienteEx12(3, "Cli C", "Rua C", "333"));
    print("3 Clientes de teste cadastrados.");
  }
  
  while(true) {
    print("\nMENU RECEBIMENTOS (Ex 12):");
    print("1. Incluir Recebimento");
    print("2. Alterar Recebimento");
    print("3. Excluir Recebimento");
    print("4. Mostrar Recebimentos (por Data Venc)");
    print("5. Voltar ao menu principal");
    int op = readInt("Opção: ");
    if (op == 5) break;

    if (op == 1) {
      int codCli = readInt("  Cód Cliente: ");
      var cli = ex12Clientes.firstWhere((c) => c.codCli == codCli, orElse: () => ClienteEx12(-1,'','',''));
      if (cli.codCli == -1) {
        print("  Cliente não existe.");
        continue;
      }
      int count = ex12Recebimentos.where((r) => r.codCli == codCli).length;
      if (count >= 2) {
        print("  Cliente já possui 2 recebimentos.");
        continue;
      }
      String numDoc = readString("  N° Doc: ");
      double val = readDouble("  Valor: R\$ ");
      String emissao = readString("  Data Emissão: ");
      String venc = readString("  Data Venc: ");
      ex12Recebimentos.add(Recebimento(numDoc, val, emissao, venc, codCli));
      print("  Recebimento incluído.");
    } else {
      print("  (Opção $op selecionada - Lógica não implementada)");
    }
  }
}

// 13. Estilista/Roupa
void ex13() {
  print("\n--- Exercício 13: Estilistas/Roupas ---");
  // Implementação completa do menu (a-d)
  print("  (Exercício 13 - Lógica não implementada)");
}

// 14. Clínica (Médicos/Pacientes)
void ex14() {
  print("\n--- Exercício 14: Clínica (Médicos/Pacientes) ---");
  // Implementação completa do menu (a-e)
  print("  (Exercício 14 - Lógica não implementada)");
}

// 15. Restaurante
void ex15() {
  print("\n--- Exercício 15: Restaurante ---");
  // Implementação completa do menu (a-f)
  print("  (Exercício 15 - Lógica não implementada)");
}

// 16. Biblioteca
void ex16() {
  print("\n--- Exercício 16: Biblioteca (20 Obras) ---");
  // O original é 20, usando 3 para teste
  int N = 3;
  if (ex16Tombos.isEmpty) {
    print("Cadastrando $N obras/tombos...");
    for (int i=1; i<=N; i++) {
      ex16Tombos.add(Tombo(
        readInt("  N° Tombo: "),
        readString("  Nome Obra: "),
        readString("  Nome Autor: "),
        readString("  Nome Editora: "),
        readString("  Área (exatas/humanas/biomedicas): ")
      ));
    }
  }
  
  while(true) {
    print("\nMENU BIBLIOTECA (Ex 16):");
    print("1. Cadastrar obras (Já feito)");
    print("2. Cadastrar obras (Menu não claro no print, pulando)");
    print("3. Mostrar por Autor");
    print("4. Mostrar por Editora");
    print("5. Mostrar por Área");
    print("6. Encerrar");
    int op = readInt("Opção: ");
    if (op == 6) break;
    
    if (op == 3) {
      String autor = readString("  Digite o Autor: ");
      for (var t in ex16Tombos.where((t) => t.nomeAutor == autor)) {
        print("    ${t.nomeObra}");
      }
    } else if (op == 4) {
      String editora = readString("  Digite a Editora: ");
      for (var t in ex16Tombos.where((t) => t.nomeEditora == editora)) {
        print("    ${t.nomeObra}");
      }
    } else if (op == 5) {
      String area = readString("  Digite a Área: ");
      for (var t in ex16Tombos.where((t) => t.codigoArea == area)) {
        print("    ${t.nomeObra}");
      }
    }
  }
}

// 17. Bancos
void ex17() {
  print("\n--- Exercício 17: Controle Bancário (12 Clientes) ---");
  // O original é 12, usando 3 para teste
  int ncli = 3;
  if (ex17Clientes.isEmpty) {
    print("Cadastrando $ncli clientes...");
    for (int i=1; i<=ncli; i++) {
      ex17Clientes.add(ClienteEx17(
        readInt("  Cód Cliente $i: "),
        readString("  Nome: "),
        readString("  Cidade: "),
        readString("  Área (1/2/3): "),
        readString("  CPF/CNPJ: ")
      ));
    }
  }

  while(true) {
    print("\nMENU BANCO (Ex 17):");
    print("a. Cadastrar contas");
    print("b. Mostrar todas as contas");
    print("c. Mostrar contas (por Cliente)");
    print("d. Mostrar somatório (por Cliente)");
    print("e. Mostrar contas (Saldo Negativo)");
    print("f. Mostrar Ativo Bancário");
    print("g. Voltar ao menu principal");
    String op = readString("Opção (a-g): ").toLowerCase();
    
    if (op == 'g') break;

    switch (op) {
      case 'a':
        int codCli = readInt("  Cód Cliente: ");
        var cli = ex17Clientes.firstWhere((c) => c.cod == codCli, orElse: () => ClienteEx17(-1,'','','',''));
        if (cli.cod == -1) {
          print("  Cliente não existe.");
          continue;
        }
        int count = ex17Contas.where((c) => c.codCliente == codCli).length;
        if (count >= 4) {
          print("  Cliente já possui 4 contas.");
          continue;
        }
        int numConta = readInt("  N° Conta: ");
        double saldo = readDouble("  Saldo: R\$ ");
        ex17Contas.add(ContaEx17(numConta, codCli, saldo));
        print("  Conta cadastrada.");
        break;
      // ... Outras opções (b-f) não implementadas ...
      default:
        print("  (Opção $op selecionada - Lógica não implementada)");
    }
  }
}

// 18. Clientes VIP
void ex18() {
  print("\n--- Exercício 18: Clientes VIP (15 mil) ---");
  // O original é 15 mil, usando 3 para teste
  int ncli = 3;
  if (ex18Clientes.isEmpty) {
    print("Cadastrando $ncli clientes...");
    for (int i=1; i<=ncli; i++) {
      ex18Clientes.add(ClienteVIP(
        readString("  CPF $i: "),
        readString("  RG: "),
        readString("  Endereço: "),
        false, // VIP
        readInt("  Mês 1ª Compra (1-12): "),
        readDouble("  Total Gasto: R\$ ")
      ));
    }
  }
  
  while(true) {
    print("\nMENU VIP (Ex 18):");
    print("1. Atualizar Gasto");
    print("2. Mostrar Total Gasto");
    print("3. Voltar ao menu principal");
    int op = readInt("Opção: ");
    if (op == 3) break;
    
    if (op == 1) {
      String rg = readString("  Digite o RG do cliente: ");
      var cli = ex18Clientes.firstWhere((c) => c.rg == rg, orElse: () => ClienteVIP('','','',false,0,0));
      if (cli.rg == '') {
        print("  Cliente não encontrado.");
        continue;
      }
      double novoGasto = readDouble("  Valor da nova compra: R\$ ");
      cli.totalGasto += novoGasto;
      int mesAtual = readInt("  Mês da nova compra (1-12): ");
      
      // Lógica VIP
      if (!cli.vip && cli.totalGasto >= 5000) {
        cli.vip = true;
        print("  Cliente agora é VIP!");
      }
      if (cli.vip) {
        // Zera se passou 6 meses da 1ª compra E 2 meses da compra atual
        // Simplificação: Vamos zerar se a compra atual for 6 meses depois da primeira
        if ((mesAtual - cli.mesPrimeiraCompra) >= 6) {
          print("  Cliente VIP zerado por tempo.");
          cli.totalGasto = 0;
          cli.vip = false;
        }
      }
      print("  Gasto atualizado: R\$ ${cli.totalGasto}");
      
    } else if (op == 2) {
      String cpf = readString("  Digite o CPF do cliente: ");
      var cli = ex18Clientes.firstWhere((c) => c.cpf == cpf, orElse: () => ClienteVIP('','','',false,0,0));
      if (cli.cpf == '') {
        print("  Cliente não encontrado.");
        continue;
      }
      print("  Cliente: ${cli.cpf} | Total Gasto: R\$ ${cli.totalGasto} | VIP: ${cli.vip}");
    }
  }
}

// 19. Ferrari F-50
void ex19() {
  print("\n--- Exercício 19: Sorteio Ferrari F-50 (5 Clientes) ---");
  // O original é 5, usando 3 para teste
  int ncli = 3;
  if (ex19Clientes.isEmpty) {
    print("Cadastrando $ncli clientes...");
    for (int i=1; i<=ncli; i++) {
      ex19Clientes.add(ClienteFerrari(
        readInt("  N° Sorteio (1-9999): "),
        readString("  Nome: "),
        "...", "...", "...", "...", "...",
        readInt("  Qtd Eletros Comprados: ")
      ));
    }
  }
  
  List<ClienteFerrari> participantes = ex19Clientes.where((c) => c.eletrosComprados > 5).toList();
  if (participantes.isEmpty) {
    print("Ninguém comprou > 5 eletros. Sorteio cancelado.");
    return;
  }
  
  print("Participantes (> 5): ${participantes.map((c) => '${c.nome} (N°${c.numeroSorteio})').toList()}");
  int numeroSorteado = Random().nextInt(9999) + 1;
  print("Número Sorteado: $numeroSorteado");
  
  var ganhador = participantes.firstWhere((c) => c.numeroSorteio == numeroSorteado, orElse: () => ClienteFerrari(-1,'','','','','','',0));
  
  if (ganhador.numeroSorteio != -1) {
    print("GANHADOR: ${ganhador.nome} (N° ${ganhador.numeroSorteio})!");
  } else {
    print("Não houve ganhador.");
  }
}

// 20. Oficina
void ex20() {
  print("\n--- Exercício 20: Oficina ---");
  int n = readInt("Quantas Ordens de Serviço? ");
  if (n == 0) return;
  
  List<OrdemServico> osList = [];
  double somaValor = 0;
  double maxValor = 0;
  OrdemServico? osMax;
  
  for (int i=1; i<=n; i++) {
    print("--- OS $i ---");
    var os = OrdemServico(
      readInt("  N° OS: "),
      readString("  Data: "),
      readDouble("  Valor: R\$ "),
      readString("  Serviço: "),
      readString("  Cliente: ")
    );
    osList.add(os);
    somaValor += os.valor;
    if (os.valor > maxValor) {
      maxValor = os.valor;
      osMax = os;
    }
  }
  
  print("\n--- Relatório Oficina ---");
  print("Média dos Serviços: R\$ ${(somaValor / n).toStringAsFixed(2)}");
  if (osMax != null) {
    print("Serviço Mais Caro:");
    print("  Cliente: ${osMax.nomeCliente}");
    print("  Serviço: ${osMax.servico}");
    print("  Valor: R\$ ${osMax.valor}");
  }
}


// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01,  2: ex02,  3: ex03,  4: ex04,  5: ex05,
  6: ex06,  7: ex07,  8: ex08,  9: ex09,  10: ex10,
  11: ex11, 12: ex12, 13: ex13, 14: ex14, 15: ex15,
  16: ex16, 17: ex17, 18: ex18, 19: ex19, 20: ex20,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 10 (Registros) ---");
    print("Por favor, escolha um exercício (1-20) para executar.");

    // Lista de exercícios
    print("1.  Vendas (Menu)                | 11. Clínica (Menu)");
    print("2.  Pesquisa População (20)      | 12. Recebimentos (Menu)");
    print("3.  Pesquisa (50)                | 13. Estilista/Roupa (Menu)");
    print("4.  Pesquisa Cidade (20)         | 14. Clínica (Menu 2)");
    print("5.  Estoque (Menu)               | 15. Restaurante (Menu)");
    print("6.  Cliente/Conta                | 16. Biblioteca (Menu)");
    print("7.  Cliente/Compra               | 17. Bancos (Menu)");
    print("8.  Acidentes (15 Cidades)       | 18. Clientes VIP (Menu)");
    print("9.  Vendedor (Comissão)          | 19. Sorteio Ferrari");
    print("10. Documentos (Juros)           | 20. Oficina");
    
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