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
// Mapa de exercícios para fácil acesso
final exercicios = <int, Function>{
  1: desafio01, 2: desafio02, 3: desafio03, 4: desafio04, 5: desafio05,
  6: desafio06, 7: desafio07,
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