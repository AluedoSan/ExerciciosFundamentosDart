import 'dart:io';
import 'dart:math';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';

// --- DESAFIO PROPOSTO (Capítulo 13) ---

void desafio01() {
  print("\n--- Desafio 1: Cabos da Ponte Suspensa ---");
  
  double compKm;
  while (true) {
    compKm = readDouble("Digite o comprimento da ponte suspensa (entre 2 e 4 km): ");
    // Validação da entrada 
    if (compKm >= 2 && compKm <= 4) {
      break;
    } else {
      print("Valor inválido. O comprimento deve estar entre 2 e 4 km.");
    }
  }

  double compMetros = compKm * 1000;
  // Altura da haste é 1/20 da extensão da ponte 
  double alturaHaste = compMetros / 20; 
  // Distância da haste até o meio da ponte 
  double distCentro = compMetros / 2; 

  double somaLeque = 0; // Soma do comprimento dos 5 cabos de um lado da haste

  for (int i = 1; i <= 5; i++) {
    double baseCabo = distCentro * (i / 5);
    double compCabo = sqrt( pow(baseCabo, 2) + pow(alturaHaste, 2) );
    
    print("  Comprimento do Cabo $i (de 5) em um leque: ${compCabo.toStringAsFixed(2)} m");
    somaLeque += compCabo;
  }
  
  // --- 3. Calcular Total ---
  double totalMetros = somaLeque * 8; 

  print("\n--- Resultados Finais ---");
  print("Comprimento da Ponte: $compMetros m");
  print("Altura da Haste: $alturaHaste m");
  print("Soma de 1 leque (5 cabos): ${somaLeque.toStringAsFixed(2)} m");
  print("\nTotal de cabos de aço necessários (4 hastes, 8 leques):");
  print("==> ${totalMetros.toStringAsFixed(2)} metros");
}

// Desafio 2 (Alvos de Papelão)
void desafio02() {
  print("\n--- Desafio 2: Alvos de Papelão ---");
  print("Um alvo tem 6 círculos sobrepostos.");
  print("A área total de papelão é a área do círculo maior.");
  
  double diametroMaior = readDouble("Digite o diâmetro do círculo maior (em metros): ");
  
  double raioMaior = diametroMaior / 2;
  double areaUmAlvo = pi * pow(raioMaior, 2);
  
  double totalPapelao = areaUmAlvo * 5000000;
  
  print("\n--- Resultados ---");
  print("Área de 1 alvo: ${areaUmAlvo.toStringAsFixed(2)} m²");
  print("Quantidade de papelão para 5 milhões de alvos:");
  print("==> ${totalPapelao.toStringAsFixed(2)} m²");
}

// Desafio 3 (Escada)
void desafio03() {
  print("\n--- Desafio 3: Cálculo da Escada ---");
  double alturaPrego = readDouble("Digite a altura que deseja alcançar (em metros): ");
  double anguloGraus = readDouble("Digite o ângulo da escada (em graus): ");
  
  // Distância entre degraus em metros
  double distDegrau = 0.30; 
  
  // 1. Converter ângulo para radianos
  double anguloRad = anguloGraus * (pi / 180);
  
  // 2. Achar comprimento da escada (Trigonometria)
  // Seno(ângulo) = Cateto Oposto (altura) / Hipotenusa (escada)
  double compEscada = alturaPrego / sin(anguloRad);
  
  // 3. Calcular degraus
  // (comprimento / 0.30) e arredondar para CIMA
  int numDegraus = (compEscada / distDegrau).ceil();
  
  print("\n--- Resultados ---");
  print("Altura a alcançar: $alturaPrego m");
  print("Comprimento necessário da escada: ${compEscada.toStringAsFixed(2)} m");
  print("Para essa altura, você deve comprar uma escada com $numDegraus degraus.");
}

// Desafio 4 (Decimal para Binário)
void desafio04() {
  print("\n--- Desafio 4: Decimal para Binário ---");
  int n = readInt("Digite um número decimal (ex: 12): ");
  int numOriginal = n;
  
  if (n == 0) {
    print("Resultado: 0");
    return;
  }
  
  String binario = '';
  
  while (n > 0) {
    int resto = n % 2;
    binario = "$resto$binario"; // Adiciona o resto no INÍCIO da string
    n = n ~/ 2; // Divisão inteira
  }
  
  print("\n--- Resultados ---");
  print("Decimal: $numOriginal");
  print("Binário: $binario");
}

// Desafio 5 (Custo Condomínio)
void desafio05() {
  print("\n--- Desafio 5: Custo Mão de Obra Condomínio ---");
  
  double L = readDouble("Digite o valor base 'L' da planta (em metros): ");
  double salarioMinimo = readDouble("Digite o valor do salário mínimo: R\$ ");
  
  // 1. Áreas individuais baseadas no diagrama
  double areaSalas = (4 * L) * (2 * L);                  // 8L²
  double areaQuartos = 4 * (L * L);                      // 4L²
  double areaCopaCozinha = (3 * L * L) + ((3 * L) * (L * 0.7) / 2); // 3L² + 1.05L² = 4.05L²
  double areaEsc = (L * L) / 2;                          // 0.5L²
  double raioWC = (L / 2) / 2;                           // Raio = Diâmetro(L/2) / 2 = L/4
  double areaWCs = 4 * (pi * pow(raioWC, 2));            // 4 * (pi * (L/4)²) = (pi/4)L²
  
  // 2. Área total da casa
  double areaTotalCasa = areaSalas + areaQuartos + areaCopaCozinha + areaEsc + areaWCs;
  
  // 3. Custos
  double custoM2 = salarioMinimo * 0.10; // 10% do salário mínimo
  double custoCasa = areaTotalCasa * custoM2;
  double custoCondominio = custoCasa * 40; // 40 casas
  
  print("\n--- Detalhes do Cálculo (para L = $L) ---");
  print("  Área Salas (8L²): ${areaSalas.toStringAsFixed(2)} m²");
  print("  Área Quartos (4L²): ${areaQuartos.toStringAsFixed(2)} m²");
  print("  Área Copa/Cozinha (4.05L²): ${areaCopaCozinha.toStringAsFixed(2)} m²");
  print("  Área Escada (0.5L²): ${areaEsc.toStringAsFixed(2)} m²");
  print("  Área 4 WCs ( (pi/4)L² ): ${areaWCs.toStringAsFixed(2)} m²");
  print("  ---------------------------------");
  print("  Área Total (1 Casa): ${areaTotalCasa.toStringAsFixed(2)} m²");
  
  print("\n--- Custo da Mão de Obra ---");
  print("  Salário Mínimo: R\$ ${salarioMinimo.toStringAsFixed(2)}");
  print("  Custo por m² (10%): R\$ ${custoM2.toStringAsFixed(2)}");
  print("  Custo (1 Casa): R\$ ${custoCasa.toStringAsFixed(2)}");
  print("  ---------------------------------");
  print("  Custo Total (40 Casas):");
  print("  ==> R\$ ${custoCondominio.toStringAsFixed(2)}");
}
/////////
// Variáveis e funções auxiliares para o Desafio 6
final listaUnidades = {
  0: "zero", 1: "um", 2: "dois", 3: "três", 4: "quatro",
  5: "cinco", 6: "seis", 7: "sete", 8: "oito", 9: "nove"
};
final listaTeens = {
  10: "dez", 11: "onze", 12: "doze", 13: "treze", 14: "quatorze",
  15: "quinze", 16: "dezesseis", 17: "dezessete", 18: "dezoito", 19: "dezenove"
};
final listaDezenas = {
  2: "vinte", 3: "trinta", 4: "quarenta", 5: "cinquenta",
  6: "sessenta", 7: "setenta", 8: "oitenta", 9: "noventa"
};
final listaCentenas = {
  1: "cento", 2: "duzentos", 3: "trezentos", 4: "quatrocentos",
  5: "quinhentos", 6: "seiscentos", 7: "setecentos", 8: "oitocentos", 9: "novecentos"
};

// Desafio 06 (Numero por extenso de 1 a 10,000)
void desafio06(){
  print("\n--- Desafio 6: Número por extenso ---");
  // Recebe o input do usuário
  int num = readInt(">> Digite o número: ");
  String extenso = numeroPorExtenso(num);
  print("Número por extenso: $extenso");
}

// Método para converter número em extenso
String numeroPorExtenso(int num) {
  // Verificando se está na casa dos milhares
  if (num ~/ 1000 == 0){
    return centenas(num);
  }
  else {
    String resultado = "";
    int milhares = num ~/ 1000;
    resultado += "${listaUnidades[milhares]} mil";
    int resto = num % 1000;
    if (resto > 0) {
      resultado += " ${centenas(resto)}";
    }
    return resultado;
  }
}

// Método para converter centenas
String centenas(int num) {
  if (num < 100) {
    return dezenas(num);
  } else {
    int centena = num ~/ 100;
    String resultado = "";
    if (centena == 1 && num % 100 == 0) {
      return "cem";
    } else {
      resultado += listaCentenas[centena]!;
      int resto = num % 100;
      if (resto > 0) {
        resultado += " e ${dezenas(resto)}";
      }
      return resultado;
    }
  }
}

// Método para converter dezenas
String dezenas(int num) {
  if (num < 10) {
    return listaUnidades[num]!;
  } else if (num < 20) {
    return listaTeens[num]!;
  } else {
    int dezena = num ~/ 10;
    String resultado = listaDezenas[dezena]!;
    int resto = num % 10;
    if (resto > 0) {
      resultado += " e ${listaUnidades[resto]}";
    }
    return resultado;
  }
}

////////
// Desafio 07 (Jogo da forca)
void desafio07(){
  print("\n--- Desafio 7: Jogo da Forca ---");
  List<String> palavras = [];
  List<String> dicas = [];
  for (var i = 0; i < 10; i++) {
    palavras.add(readString("Digite a ${i+1}ª palavra: "));
    dicas.add(readString("Digite a dica para a ${i+1}ª palavra: "));
  }
  print("Sorteando a palavra...");
  Random rand = Random();
  int indiceSorteado = rand.nextInt(10);
  String palavraSorteada = palavras[indiceSorteado];
  List palavraSorteadaLista = palavraSorteada.split('');
  String dicaSorteada = dicas[indiceSorteado];
  String palavraOculta = "_" * palavraSorteada.length;
  int tentativas = 7;
  List letrasUsadas = [];
  print("Adivinhe a palavra sorteada!");
  print("Palavra: $palavraOculta");
  while (tentativas > 0) {
    var letra = readString("Digite uma letra:  ").toUpperCase();
    if (letra.length != 1 || !RegExp(r'^[A-Z]$').hasMatch(letra)) {
      print("Entrada inválida. Por favor, digite apenas uma letra.");
      continue;
    } // Verificação se apenas uma letra foi digitada
    if (letrasUsadas.contains(letra)) {
      print("Você já usou essa letra. Tente outra.");
    }
    else {
      letrasUsadas.add(letra); // Adiciona letra à lista de usadas
      if (palavraSorteadaLista.contains(letra)) {
        print("Boa! A letra '$letra' está na palavra.");
        for (var j = 0; j < palavraSorteadaLista.length; j++) {
          if (palavraSorteadaLista[j] == letra) {
            palavraOculta = palavraOculta.substring(0, j) + letra + palavraOculta.substring(j + 1); // Atualiza a palavra oculta
          }
        }
        print("Palavra: $palavraOculta");
        if (!palavraOculta.contains("_")) {
          print("Parabéns! Você adivinhou a palavra '$palavraSorteada'!");
          return;
        }
      } else { // Contador de tentativas
        print("A letra '$letra' não está na palavra."); 
        tentativas--;
        print("Tentativas restantes: $tentativas");
        if (tentativas == 1){
          print("Dica: $dicaSorteada");
        }
      }
    }
  }
}

// --- CLASSE PARA O DESAFIO 8 ---
class Aniversariante {
  String nome;
  int dia;
  int mes;
  Aniversariante(this.nome, this.dia, this.mes);
  
  @override
  String toString() {
    // Helper para formatar a data
    String diaStr = dia.toString().padLeft(2, '0');
    String mesStr = mes.toString().padLeft(2, '0');
    return "Nome: $nome, Data: $diaStr/$mesStr";
  }
}

// Lista global para a agenda (limite de 15)
List<Aniversariante> agenda = [];

/////////
// Desafio 8 (agenda de aniversariantes)
void desafio08() {
  print("\n--- Desafio 8: Agenda de Aniversariantes ---");
  
  while (true) {
    print("\nAGENDA (Limite de 15 pessoas. Atual: ${agenda.length})");
    print("1. Cadastrar pessoa");
    print("2. Excluir pessoa (por nome)");
    print("3. Alterar data (por nome)");
    print("4. Consultar (por data)");
    print("5. Consultar (por mês)");
    print("6. Consultar (por letra inicial)");
    print("7. Mostrar agenda (ordenada por nome)");
    print("8. Mostrar agenda (ordenada por mês)");
    print("9. Sair");
    int op = readInt("Opção: ");

    if (op == 9) break;

    switch (op) {
      case 1: // Cadastrar
        if (agenda.length >= 15) {
          print("  Agenda cheia! Limite de 15 pessoas atingido.");
          break;
        }
        String nome = readString("  Nome: ");
        int dia = readInt("  Dia (DD): ");
        int mes = readInt("  Mês (MM): ");
        agenda.add(Aniversariante(nome, dia, mes));
        print("  $nome cadastrado com sucesso.");
        break;

      case 2: // Excluir
        String nomeExcluir = readString("  Nome para excluir: ");
        int lenAntes = agenda.length;
        agenda.removeWhere((p) => p.nome.toUpperCase() == nomeExcluir.toUpperCase());
        if (agenda.length < lenAntes) {
          print("  $nomeExcluir excluído.");
        } else {
          print("  $nomeExcluir não encontrado.");
        }
        break;
        
      case 3: // Alterar
        String nomeAlterar = readString("  Nome para alterar: ");
        try {
          var p = agenda.firstWhere((p) => p.nome.toUpperCase() == nomeAlterar.toUpperCase());
          print("  Alterando data de ${p.nome}.");
          p.dia = readInt("  Novo Dia (DD): ");
          p.mes = readInt("  Novo Mês (MM): ");
          print("  Data alterada.");
        } catch (e) {
          print("  $nomeAlterar não encontrado.");
        }
        break;
        
      case 4: // Consultar Data
        int diaBusca = readInt("  Digite o Dia (DD): ");
        int mesBusca = readInt("  Digite o Mês (MM): ");
        var achados = agenda.where((p) => p.dia == diaBusca && p.mes == mesBusca);
        if (achados.isEmpty) {
          print("  Ninguém faz aniversário nesta data.");
        } else {
          achados.forEach(print);
        }
        break;
        
      case 5: // Consultar Mês
        int mesBusca = readInt("  Digite o Mês (MM): ");
        var achados = agenda.where((p) => p.mes == mesBusca);
        if (achados.isEmpty) {
          print("  Ninguém faz aniversário neste mês.");
        } else {
          achados.forEach(print);
        }
        break;
        
      case 6: // Consultar Letra
        String letra = readString("  Digite a letra inicial: ");
        if (letra.isEmpty) break;
        var achados = agenda.where((p) => p.nome.toUpperCase().startsWith(letra.toUpperCase()));
        if (achados.isEmpty) {
          print("  Ninguém com esta inicial.");
        } else {
          achados.forEach(print);
        }
        break;
        
      case 7: // Ordenar Nome
        print("--- Agenda (Ordenada por Nome) ---");
        var ordenadaNome = List<Aniversariante>.from(agenda);
        ordenadaNome.sort((a, b) => a.nome.compareTo(b.nome));
        ordenadaNome.forEach(print);
        break;
        
      case 8: // Ordenar Mês
        print("--- Agenda (Ordenada por Mês) ---");
        var ordenadaMes = List<Aniversariante>.from(agenda);
        ordenadaMes.sort((a, b) {
          int mesComp = a.mes.compareTo(b.mes);
          if (mesComp != 0) return mesComp;
          return a.dia.compareTo(b.dia); // Se o mês for igual, ordena pelo dia
        });
        ordenadaMes.forEach(print);
        break;

      default:
        print("Opção inválida.");
    }
  }
}

//////////
// Desafio 9 (Funcionários)
void desafio09() {
  print("\n--- Desafio 9: Relatório de Funcionários ---");
  List<int> codigos = [];
  List<double> salarios = [];
  List<int> tempo = [];
  // 1. Carregar os vetores (só na primeira vez)
  if (codigos.isEmpty) {
    print("Cadastrando 5 funcionários...");
    for (int i = 1; i <= 5; i++) {
      print("--- Funcionário $i ---");
      codigos.add(readInt("  Código: "));
      salarios.add(readDouble("  Salário: R\$ "));
      tempo.add(readInt("  Tempo de Serviço (anos): "));
    }
  } else {
    print("Funcionários já cadastrados.");
  }
  
  // a) Relatórios por valor
  print("\n--- (a) Consulta por Salário ---");
  double valorConsulta = readDouble("Digite o salário para consulta: R\$ ");
  
  List<String> relatorioAte = [];
  List<String> relatorioAcima = [];
  
  for (int i = 0; i < 5; i++) {
    String info = "Cód: ${codigos[i]}, Salário: R\$ ${salarios[i]}";
    if (salarios[i] <= valorConsulta) {
      relatorioAte.add(info);
    } else {
      relatorioAcima.add(info);
    }
  }
  
  print("\nRelatório 1 (Salário <= R\$ $valorConsulta):");
  if (relatorioAte.isEmpty) {print("  Nenhum funcionário neste relatório.");}
  else {relatorioAte.forEach(print);}
  
  print("\nRelatório 2 (Salário > R\$ $valorConsulta):");
  if (relatorioAcima.isEmpty) {print("  Nenhum funcionário neste relatório.");}
  else {relatorioAcima.forEach(print);}

  // b) Menor Salário
  print("\n--- (b) Análise do Menor Salário ---");
  double menorSalario = salarios[0];
  for (double s in salarios) {
    if (s < menorSalario) menorSalario = s;
  }
  
  List<int> codigosMenorSalario = [];
  for (int i = 0; i < 5; i++) {
    if (salarios[i] == menorSalario) {
      codigosMenorSalario.add(codigos[i]);
    }
  }
  
  print("Menor Salário Pago: R\$ $menorSalario");
  print("Quantos funcionários recebem: ${codigosMenorSalario.length}");
  print("Códigos desses funcionários: $codigosMenorSalario");
  
  // c) Vetor de Isentos
  print("\n--- (c) Vetor de Isentos de Imposto ---");
  List<int> vetorIsentos = [];
  for (int i = 0; i < 5; i++) {
    int tempos = tempo[i];
    double salario = salarios[i];
    
    // Tempo entre 2 e 4 anos E Salário < 1500
    if ((tempos >= 2 && tempos <= 4) && (salario < 1500.00)) {
      vetorIsentos.add(codigos[i]);
    }
  }
  
  if (vetorIsentos.isEmpty) {
    print("Nenhum funcionário preenche os requisitos.");
  } else {
    print("Códigos dos funcionários isentos (Tempo 2-4 anos, Salário < R\$ 1500):");
    print("$vetorIsentos");
  }
}

/////////
/// Desafio 10 (vetores desordenados)
void desafio10() {
  print("\n--- Desafio 10: Vetores Desordenados ---");
  List<int> vetor = [];
  while (true){
    int valor = readInt("Escolha uma das opções:\n1. Adicionar número ao vetor\n2. Mostrar vetor\n3. Consultar um númeroo vetor\n4. Excluir um número do vetor\n0. Sair\nOpção: ");
    switch (valor) {
      case 1:
        int numAdicionar = readInt("Digite o número para adicionar: ");
        vetor.add(numAdicionar);
        print("Número $numAdicionar adicionado.");
        break;
      case 2:
        print("Vetor atual: $vetor");
        break;
      case 3:
        int numConsultar = readInt("Digite o número para consultar: ");
        if (vetor.contains(numConsultar)) {
          print("Número $numConsultar encontrado no vetor.");
        } else {
          print("Número $numConsultar não encontrado no vetor.");
        }
        break;
      case 4:
        int numExcluir = readInt("Digite o número para excluir: ");
        if (vetor.remove(numExcluir)) {
          print("Número $numExcluir excluído do vetor.");
        } else {
          print("Número $numExcluir não encontrado no vetor.");
        }
        break;
      case 0:
        print("Encerrando o desafio 10.");
        return;
      default:
        print("Opção inválida. Tente novamente.");
    }
  }
}

/////////
// Desafio 11 (vetores desordenados)
void desafio11(){
  print("\n--- Desafio 11: Vetores Ordenados ---");
  List<int> vetor = [];
  while (true){
    int valor = readInt("Escolha uma das opções:\n1. Adicionar número ao vetor\n2. Mostrar vetor\n3. Consultar um número no vetor\n4. Excluir um número do vetor\n0. Sair\nOpção: ");
    switch (valor) {
      case 1:
        int numAdicionar = readInt("Digite o número para adicionar: ");
        vetor.add(numAdicionar);
        vetor.sort(); // Mantém o vetor ordenado
        print("Número $numAdicionar adicionado.");
        break;
      case 2:
        print("Vetor atual (ordenado): $vetor");
        break;
      case 3:
        int numConsultar = readInt("Digite o número para consultar: ");
        if (vetor.contains(numConsultar)) {
          print("Número $numConsultar encontrado no vetor.");
        } else {
          print("Número $numConsultar não encontrado no vetor.");
        }
        break;
      case 4:
        int numExcluir = readInt("Digite o número para excluir: ");
        if (vetor.remove(numExcluir)) {
          print("Número $numExcluir excluído do vetor.");
        } else {
          print("Número $numExcluir não encontrado no vetor.");
        }
        break;
      case 0:
        print("Encerrando o desafio 11.");
        return;
      default:
        print("Opção inválida. Tente novamente.");
    }
  }
}

/////////
// Desafio 12 (Departamento de Pessoal)
void desafio12() {
  print("\n--- Desafio 12: Departamento de Pessoal ---");
  print("Desafio em construção...");
}


// Mapa de exercícios para fácil acesso
final exercicios = <int, Function>{
  1: desafio01, 2: desafio02, 3: desafio03, 4: desafio04, 5: desafio05,
  6: desafio06, 7: desafio07, 8: desafio08, 9: desafio09, 10: desafio10,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 13 (Arquivos) ---");
    print("Por favor, escolha um exercício (1-25) para executar.");

    // Lista de exercícios
    print("\n--- Exercícios 1-25 ---");
    print("1. Ponte Suspensa");
    print("2. Alvo de Papelão");
    print("3. Cálculo da Escada");
    print("4. Decimal para Binário");
    print("5. Alterar Cliente");
    print("6. Número por Extenso");
    print("7. Jogo da Forca");
    print("8. Agenda de Aniversariantes");
    print("9. Relatório de Funcionários");
    print("10. Vetores Desordenados");
    print("11. Vetores Ordenados");

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