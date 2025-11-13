import 'dart:io';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';

// --- CLASSES (REGISTROS) DO CAPÍTULO 12 ---

// --- Exercício 1 ---
class Carro {
  String placa;
  int ano;

  Carro(this.placa, this.ano);

  /// (Método A) Calcula o imposto baseado no ano atual.
  double calculaImposto(int anoAtual) {
    int anosDeUso = anoAtual - ano;
    if (anosDeUso >= 10 || anosDeUso < 0) {
      return 0.0; // Isento
    }

    return 100.0;
  }
  
  /// (Método B - C) Verifica se não paga imposto.
  bool naoPagaImposto(int anoAtual) {
    return (anoAtual - ano) >= 10;
  }
}

// --- Exercício 2 ---
class PessoaEx2 {
  String nome;
  int anoNascimento; // Assumindo que o atributo 'idade' era 'anoNascimento'

  PessoaEx2(this.nome, this.anoNascimento);

  int getIdadeEmMeses(int anoAtual) {
    return (anoAtual - anoNascimento) * 12;
  }
  
  int getIdadeEm2050() {
    return 2050 - anoNascimento;
  }
}

// --- Exercício 3 ---
class ProdutoEx3 {
  int numero;
  double preco;
  ProdutoEx3(this.numero, this.preco);
  
  void calculaPreco(double percentual) {
    preco = preco * (1 + percentual / 100);
  }
}
class ClienteEx3 {
  int codigo;
  String sexo; // 'M' ou 'F'
  ClienteEx3(this.codigo, this.sexo);
  
  double calculaDesconto(double precoProduto) {
    if (sexo == 'M') return precoProduto * 0.10;
    if (sexo == 'F') return precoProduto * 0.05;
    return 0;
  }
}
// As classes LIBERADO e COMPRA são processos,
// implementados na lógica do ex03.

// --- Exercício 4 ---
class Aluno {
  int prontuario;
  String nome;
  Aluno(this.prontuario, this.nome);
}
class Disciplina {
  int codigo;
  String nome;
  int cargaHoraria;
  bool ehPratica; // Distingue Disciplina de DisciplinaPratica
  Disciplina(this.codigo, this.nome, this.cargaHoraria, this.ehPratica);
}
class Matricula {
  int ano;
  int serie;
  int codAluno;
  int codDisciplina;
  double nota1, nota2, nota3, nota4;
  
  Matricula(this.ano, this.serie, this.codAluno, this.codDisciplina, 
            this.nota1, this.nota2, this.nota3, this.nota4);
            
  double getMedia() {
    return (nota1 + nota2 + nota3 + nota4) / 4;
  }
}

// --- Exercício 5 ---
class FuncionarioEx5 {
  int codigo;
  String nome;
  double salario;
  FuncionarioEx5(this.codigo, this.nome, this.salario);
}
class DependenteEx5 {
  int codFuncionario;
  String nome;
  DependenteEx5(this.codFuncionario, this.nome);
}


// --- Listas Globais para Armazenamento ---
List<Carro> ex1Carros = [];
List<ProdutoEx3> ex3Produtos = [];
List<ClienteEx3> ex3Clientes = [];
List<Aluno> ex4Alunos = [];
List<Disciplina> ex4Disciplinas = [];
List<Matricula> ex4Matriculas = [];
List<FuncionarioEx5> ex5Funcionarios = [];
List<DependenteEx5> ex5Dependentes = [];


// --- EXERCÍCIOS PROPOSTOS (Capítulo 12 - Pág. 544-546) ---

// 1. Cadastro de Carros
void ex01() {
  print("\n--- Exercício 1: Cadastro de Carros (5 carros) ---");
  if (ex1Carros.isNotEmpty) {
     print(" (Carros já cadastrados, pulando cadastro.)");
  } else {
    for (int i = 1; i <= 5; i++) {
      print("--- Carro $i ---");
      ex1Carros.add(Carro(
        readString("  Placa: "),
        readInt("  Ano Fabricação: ")
      ));
    }
  }

  int anoAtual = readInt("\nDigite o Ano Atual (ex: 2025): ");
  
  double totalImpostos = 0;
  int qtdNaoPagam = 0;
  
  for (var carro in ex1Carros) {
    totalImpostos += carro.calculaImposto(anoAtual);
    if (carro.naoPagaImposto(anoAtual)) {
      qtdNaoPagam++;
    }
  }
  
  print("\n--- Resultados ---");
  print("b) Total de Impostos: R\$ ${totalImpostos.toStringAsFixed(2)}");
  print("c) Qtd. Carros Isentos: $qtdNaoPagam");
}

// 2. Pessoa (Idade)
void ex02() {
  print("\n--- Exercício 2: Pessoa (Cálculo de Idade) ---");
  String nome = readString("  Digite o nome: ");
  int anoNasc = readInt("  Digite o ano de nascimento: ");
  int anoAtual = readInt("  Digite o ano atual: ");
  
  PessoaEx2 p = PessoaEx2(nome, anoNasc);
  
  print("\n--- Resultados ---");
  print("Idade em Meses: ${p.getIdadeEmMeses(anoAtual)}");
  print("a) Idade em 2050: ${p.getIdadeEm2050()} anos");
}

// 3. Venda (Produto/Cliente)
void ex03() {
  print("\n--- Exercício 3: Sistema de Venda ---");
  // Setup inicial (só na primeira vez)
  if (ex3Produtos.isEmpty) {
    print(" (Setup) Cadastrando 2 produtos...");
    ex3Produtos.add(ProdutoEx3(1, 15000.0)); // < 20k
    ex3Produtos.add(ProdutoEx3(2, 25000.0)); // > 20k
  }
  if (ex3Clientes.isEmpty) {
    print(" (Setup) Cadastrando 2 clientes...");
    ex3Clientes.add(ClienteEx3(101, 'M')); // Masculino
    ex3Clientes.add(ClienteEx3(102, 'F')); // Feminino
  }
  
  print("\n--- Iniciar Venda --- (Cód. Cliente 0 para sair)");
  while(true) {
    int codCli = readInt("Digite o Código do Cliente: ");
    if (codCli == 0) break;
    
    var cliente = ex3Clientes.firstWhere((c) => c.codigo == codCli, orElse: () => ClienteEx3(-1, ''));
    if (cliente.codigo == -1) {
      print("  Cliente não encontrado.");
      continue;
    }
    
    int codProd = readInt("Digite o Código do Produto: ");
    var produto = ex3Produtos.firstWhere((p) => p.numero == codProd, orElse: () => ProdutoEx3(-1, 0));
    if (produto.numero == -1) {
      print("  Produto não encontrado.");
      continue;
    }
    
    int qtd = readInt("Digite a quantidade: ");
    
    double precoBase = produto.preco * qtd;
    double desconto = cliente.calculaDesconto(precoBase);
    double adicional = 0;
    
    // Lógica do 'LIBERADO'
    bool liberado = (produto.preco > 20000) || (cliente.sexo == 'F' && produto.preco > 10000);
    
    if (liberado) {
      print("  (Status: LIBERADO)");
      if (cliente.sexo == 'M') adicional = precoBase * 0.05;
      if (cliente.sexo == 'F') adicional = precoBase * 0.08;
    } else {
      print("  (Status: COMPRA)");
    }
    
    double precoFinal = precoBase - desconto + adicional;
    
    print("\n--- Recibo ---");
    print("  Preço Base (Produto R\$ ${produto.preco} x $qtd): R\$ ${precoBase.toStringAsFixed(2)}");
    print("  Desconto (${cliente.sexo}): R\$ ${desconto.toStringAsFixed(2)}");
    print("  Adicional (Liberado): R\$ ${adicional.toStringAsFixed(2)}");
    print("  PREÇO FINAL: R\$ ${precoFinal.toStringAsFixed(2)}\n");
  }
}

// 4. Escola (Menu)
void ex04() {
  print("\n--- Exercício 4: Secretaria da Escola ---");
  while (true) {
    print("\nMENU ESCOLA:");
    print("1. Cadastrar disciplinas (práticas ou não)");
    print("2. Matricular aluno em uma disciplina");
    print("3. Matricular aluno em várias disciplinas");
    print("4. Alterar notas de um aluno");
    print("5. Mostrar Boletim do aluno");
    print("6. Sair");
    int op = readInt("Opção: ");
    if (op == 6) break;

    switch (op) {
      case 1:
        print(" (1) Cadastrar Disciplina");
        int codD = readInt("  Código: ");
        String nomeD = readString("  Nome: ");
        int carga = readInt("  Carga Horária: ");
        String pratica = readString("  É prática (S/N)? ").toUpperCase();
        ex4Disciplinas.add(Disciplina(codD, nomeD, carga, pratica == 'S'));
        print("  Disciplina cadastrada.");
        break;
      case 2:
      case 3:
        print(" (2/3) Matricular Aluno");
        int pront = readInt("  Prontuário do Aluno: ");
        var aluno = ex4Alunos.firstWhere((a) => a.prontuario == pront, orElse: () {
          String nomeA = readString("  Aluno novo. Digite o nome: ");
          var novoA = Aluno(pront, nomeA);
          ex4Alunos.add(novoA);
          return novoA;
        });
        
        do {
          int codDisc = readInt("  Cód da Disciplina (0 para parar): ");
          if (codDisc == 0) break;
          var disc = ex4Disciplinas.firstWhere((d) => d.codigo == codDisc, orElse: () => Disciplina(-1,'',0,false));
          if (disc.codigo == -1) {
            print("    Disciplina não encontrada.");
          } else {
            int ano = readInt("    Ano: ");
            int serie = readInt("    Série: ");
            ex4Matriculas.add(Matricula(ano, serie, aluno.prontuario, disc.codigo, 0,0,0,0));
            print("    Matriculado em ${disc.nome}.");
          }
        } while (op == 3); // Se for opção 3, continua no loop
        break;
      case 4:
        print(" (4) Alterar Notas");
        int prontA = readInt("  Prontuário do Aluno: ");
        int codDisc = readInt("  Cód da Disciplina: ");
        int anoM = readInt("  Ano da Matrícula: ");
        
        var mat = ex4Matriculas.firstWhere(
          (m) => m.codAluno == prontA && m.codDisciplina == codDisc && m.ano == anoM,
          orElse: () => Matricula(-1, -1, -1, -1, 0,0,0,0)
        );
        
        if (mat.ano == -1) {
          print("  Matrícula não encontrada.");
        } else {
          mat.nota1 = readDouble("  Nota 1º Bim: ");
          mat.nota2 = readDouble("  Nota 2º Bim: ");
          mat.nota3 = readDouble("  Nota 3º Bim: ");
          mat.nota4 = readDouble("  Nota 4º Bim: ");
          print("  Notas alteradas.");
        }
        break;
      case 5:
        print(" (5) Mostrar Boletim");
        int prontB = readInt("  Prontuário do Aluno: ");
        int anoB = readInt("  Ano: ");
        
        var mats = ex4Matriculas.where((m) => m.codAluno == prontB && m.ano == anoB);
        if (mats.isEmpty) {
          print("  Nenhum boletim encontrado.");
        } else {
          print("\n--- BOLETIM $anoB - Aluno $prontB ---");
          for (var m in mats) {
            String nomeDisc = ex4Disciplinas.firstWhere((d) => d.codigo == m.codDisciplina).nome;
            print("  Disc: $nomeDisc | N1: ${m.nota1} | N2: ${m.nota2} | N3: ${m.nota3} | N4: ${m.nota4} | Média: ${m.getMedia()}");
          }
        }
        break;
      default:
        print("Opção inválida.");
    }
  }
}

// 5. Funcionário/Dependente
void ex05() {
  print("\n--- Exercício 5: RH - Funcionários/Dependentes ---");
  while (true) {
    print("\nMENU RH:");
    print("1. Cadastrar funcionário");
    print("2. Cadastrar dependente");
    print("3. Mostrar bônus mensal");
    print("4. Excluir funcionário");
    print("5. Excluir dependente");
    print("6. Alterar salário");
    print("7. Sair");
    int op = readInt("Opção: ");
    if (op == 7) break;
    
    switch (op) {
      case 1:
        print(" (1) Cadastrar Funcionário");
        int codF = readInt("  Código: ");
        String nomeF = readString("  Nome: ");
        double salF = readDouble("  Salário: R\$ ");
        ex5Funcionarios.add(FuncionarioEx5(codF, nomeF, salF));
        print("  Funcionário cadastrado.");
        break;
      case 2:
        print(" (2) Cadastrar Dependente");
        int codFunc = readInt("  Código do Funcionário: ");
        var func = ex5Funcionarios.firstWhere((f) => f.codigo == codFunc, orElse: () => FuncionarioEx5(-1, '', 0));
        if (func.codigo == -1) {
          print("  Funcionário não encontrado.");
          break;
        }
        int depCount = ex5Dependentes.where((d) => d.codFuncionario == codFunc).length;
        if (depCount >= 10) {
          print("  Limite de 10 dependentes atingido.");
          break;
        }
        String nomeD = readString("  Nome do Dependente: ");
        ex5Dependentes.add(DependenteEx5(codFunc, nomeD));
        print("  Dependente cadastrado para ${func.nome}.");
        break;
      case 3:
        print(" (3) Mostrar Bônus (2% por dependente)");
        int codFuncB = readInt("  Código do Funcionário: ");
        var funcB = ex5Funcionarios.firstWhere((f) => f.codigo == codFuncB, orElse: () => FuncionarioEx5(-1, '', 0));
        if (funcB.codigo == -1) {
          print("  Funcionário não encontrado.");
          break;
        }
        int depCountB = ex5Dependentes.where((d) => d.codFuncionario == codFuncB).length;
        double bonus = (funcB.salario * 0.02) * depCountB;
        print("  Funcionário: ${funcB.nome}");
        print("  Dependentes: $depCountB");
        print("  Bônus Mensal: R\$ ${bonus.toStringAsFixed(2)}");
        break;
      case 4:
        print(" (4) Excluir Funcionário");
        int codFuncE = readInt("  Código do Funcionário: ");
        int depCountE = ex5Dependentes.where((d) => d.codFuncionario == codFuncE).length;
        if (depCountE > 0) {
          print("  Erro: Funcionário possui $depCountE dependente(s). Exclua-os primeiro.");
        } else {
          ex5Funcionarios.removeWhere((f) => f.codigo == codFuncE);
          print("  Funcionário excluído (se existia).");
        }
        break;
      case 5:
        print(" (5) Excluir Dependente");
        int codFuncD = readInt("  Código do Funcionário: ");
        String nomeDepD = readString("  Nome do Dependente: ");
        ex5Dependentes.removeWhere((d) => d.codFuncionario == codFuncD && d.nome == nomeDepD);
        print("  Dependente excluído (se existia).");
        break;
      case 6:
        print(" (6) Alterar Salário");
        int codFuncA = readInt("  Código do Funcionário: ");
        var funcA = ex5Funcionarios.firstWhere((f) => f.codigo == codFuncA, orElse: () => FuncionarioEx5(-1, '', 0));
        if (funcA.codigo == -1) {
          print("  Funcionário não encontrado.");
        } else {
          funcA.salario = readDouble("  Digite o NOVO salário: R\$ ");
          print("  Salário de ${funcA.nome} alterado.");
        }
        break;
      default:
        print("Opção inválida.");
    }
  }
}


// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01,
  2: ex02,
  3: ex03,
  4: ex04,
  5: ex05,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 12 (OO) ---");
    print("Por favor, escolha um exercício (1-5) para executar.");

    // Lista de exercícios
    print("1. Cadastro de Carros (Imposto)");
    print("2. Pessoa (Cálculo de Idade)");
    print("3. Sistema de Venda (Produto/Cliente)");
    print("4. Secretaria da Escola (Menu)");
    print("5. RH - Funcionários/Dependentes (Menu)");

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