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

// Desafio 05 ()
void desafio05(){
  print("\n--- Desafio 5: ---");

}

// Desafio 06 (Numero por extenso de 1 a 10,000)
void desafio06(){
  print("\n--- Desafio 6: Número por extenso ---");
  // Recebe o input do usuário
  int num = readInt(">> Digite o número: ");
  var listaNome = {
    "unidades": ["um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"],
    "teens": ["dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"],
    "decimais": ["vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"],
    "centena": ["cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"],
  };
}

final exercicios = <int, Function>{
  1: desafio01, 2: desafio02, 3: desafio03, 4: desafio04, 5: desafio05,
  6: ex06, 7: ex07, 8: ex08, 9: ex09, 10: ex10,
  11: ex11, 12: ex12, 13: ex13, 14: ex14, 15: ex15,
  16: ex16, 17: ex17, 18: ex18, 19: ex19, 20: ex20,
  21: ex21, 22: ex22, 23: ex23, 24: ex24, 25: ex25,
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