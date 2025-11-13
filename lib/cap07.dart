import 'dart:io';

import 'package:dart_teste/cap03.dart';

/// Lê uma matriz de [rows]x[cols]
List<List<double>> readDoubleMatrix(int rows, int cols, String prompt) {
  print(prompt);
  // Cria uma lista de listas (matriz) preenchida com 0.0
  List<List<double>> matrix = List.generate(rows, (_) => List.filled(cols, 0.0));
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      matrix[i][j] = readDouble("  Digite o valor para [${i + 1}][${j + 1}]: ");
    }
  }
  return matrix;
}

/// Imprime uma matriz formatada
void printMatrix(List<List<dynamic>> matrix, {String title = "Matriz Resultante"}) {
  print("\n--- $title ---");
  if (matrix.isEmpty) {
    print("  (Matriz vazia)");
    return;
  }
  
  for (int i = 0; i < matrix.length; i++) {
    // Formata cada elemento para alinhamento básico (6 caracteres à esquerda)
    List<String> row = matrix[i].map((e) {
      if (e is double) return e.toStringAsFixed(1).padLeft(6);
      return e.toString().padLeft(6);
    }).toList();
    
    print("  ${row.join(' | ')}");
  }
}


// --- EXERCÍCIOS PROPOSTOS (Capítulo 7) ---

// 1. 4x4: Contar > 10
void ex01() {
  print("\n--- Exercício 1: Contar elementos > 10 (4x4) ---");
  var m = readDoubleMatrix(4, 4, "Digite os 16 valores da matriz:");
  
  int count = 0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (m[i][j] > 10) {
        count++;
      }
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nA matriz possui $count elementos maiores que 10.");
}

// 2. 5x5: Diagonal Principal
void ex02() {
  print("\n--- Exercício 2: Diagonal Principal (5x5) ---");
  var m = readDoubleMatrix(5, 5, "Digite os 25 valores da matriz:");
  
  List<double> diagonal = [];
  for (int i = 0; i < 5; i++) {
    diagonal.add(m[i][i]);
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nElementos da Diagonal Principal: ${diagonal.join(', ')}");
}

// 3. 3x3: Multiplicar por 5
void ex03() {
  print("\n--- Exercício 3: Multiplicar por 5 (3x3) ---");
  var m = readDoubleMatrix(3, 3, "Digite os 9 valores da matriz:");
  
  // Cria uma nova matriz para o resultado
  var mResult = List.generate(3, (_) => List.filled(3, 0.0));
  
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      mResult[i][j] = m[i][j] * 5;
    }
  }
  
  printMatrix(m, title: "Matriz Original");
  printMatrix(mResult, title: "Matriz Multiplicada por 5");
}

// 4. 4x4: Localização do Maior
void ex04() {
  print("\n--- Exercício 4: Localização do Maior (4x4) ---");
  var m = readDoubleMatrix(4, 4, "Digite os 16 valores da matriz:");
  
  double maxVal = m[0][0];
  int maxRow = 1;
  int maxCol = 1;
  
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (m[i][j] > maxVal) {
        maxVal = m[i][j];
        maxRow = i + 1; // +1 para índice amigável
        maxCol = j + 1; // +1 para índice amigável
      }
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nMaior valor: $maxVal");
  print("Localização: Linha $maxRow, Coluna $maxCol");
}

// 5. 5x5: Procurar número X
void ex05() {
  print("\n--- Exercício 5: Procurar número X (5x5) ---");
  var m = readDoubleMatrix(5, 5, "Digite os 25 valores da matriz:");
  double x = readDouble("Digite o número X que deseja procurar: ");
  
  int foundRow = -1;
  int foundCol = -1;
  
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (m[i][j] == x) {
        foundRow = i + 1;
        foundCol = j + 1;
        break; // Para a busca assim que achar o primeiro
      }
    }
    if (foundRow != -1) break; // Para o loop externo também
  }

  printMatrix(m, title: "Matriz Lida");
  if (foundRow != -1) {
    print("\nNúmero $x encontrado!");
    print("Localização: Linha $foundRow, Coluna $foundCol");
  } else {
    print("\nNúmero $x não encontrado.");
  }
}

// 6. 10x10: Diagonal Principal e Secundária
void ex06() {
  print("\n--- Exercício 6: Diagonais Principal e Secundária (10x10) ---");
  int dim = 10;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  List<double> diagP = [];
  List<double> diagS = [];
  
  for (int i = 0; i < dim; i++) {
    diagP.add(m[i][i]);
    diagS.add(m[i][(dim - 1) - i]); // (dim-1) é o último índice (ex: 9)
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nDiagonal Principal: ${diagP.join(', ')}");
  print("\nDiagonal Secundária: ${diagS.join(', ')}");
}

// 7. 5x5: Elementos fora das diagonais
void ex07() {
  print("\n--- Exercício 7: Elementos Fora das Diagonais (5x5) ---");
  int dim = 5;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  List<double> foraDiagonais = [];
  
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      bool naDiagP = (i == j);
      bool naDiagS = (i == (dim - 1) - j);
      
      if (!naDiagP && !naDiagS) {
        foraDiagonais.add(m[i][j]);
      }
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nElementos fora das diagonais: ${foraDiagonais.join(', ')}");
}

// 8. 6x6: Soma de todos os elementos
void ex08() {
  print("\n--- Exercício 8: Soma Total (6x6) ---");
  int dim = 6;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  double soma = 0;
  for (var row in m) {
    for (var val in row) {
      soma += val;
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nSoma de todos os elementos: ${soma.toStringAsFixed(2)}");
}

// 9. 3x3: Soma das diagonais
void ex09() {
  print("\n--- Exercício 9: Soma das Diagonais (3x3) ---");
  int dim = 3;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  double somaP = 0;
  double somaS = 0;
  
  for (int i = 0; i < dim; i++) {
    somaP += m[i][i];
    somaS += m[i][(dim - 1) - i];
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nSoma Diagonal Principal: ${somaP.toStringAsFixed(2)}");
  print("Soma Diagonal Secundária: ${somaS.toStringAsFixed(2)}");
}

// 10. 5x5: Somas específicas
void ex10() {
  print("\n--- Exercício 10: Somas Específicas (5x5) ---");
  int dim = 5;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  double somaLinha4 = 0; // Índice 3
  double somaCol2 = 0; // Índice 1
  double somaDiagP = 0;
  double somaDiagS = 0;
  double somaTotal = 0;

  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      // Soma Total
      somaTotal += m[i][j];
      
      // Soma Linha 4 (i=3)
      if (i == 3) {
        somaLinha4 += m[i][j];
      }
      
      // Soma Coluna 2 (j=1)
      if (j == 1) {
        somaCol2 += m[i][j];
      }
      
      // Soma Diag P (i=j)
      if (i == j) {
        somaDiagP += m[i][j];
      }
      
      // Soma Diag S (i = (dim-1)-j)
      if (i == (dim - 1) - j) {
        somaDiagS += m[i][j];
      }
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\n--- Somas ---");
  print("a) Soma Linha 4: ${somaLinha4.toStringAsFixed(2)}");
  print("b) Soma Coluna 2: ${somaCol2.toStringAsFixed(2)}");
  print("c) Soma Diagonal Principal: ${somaDiagP.toStringAsFixed(2)}");
  print("d) Soma Diagonal Secundária: ${somaDiagS.toStringAsFixed(2)}");
  print("e) Soma Total da Matriz: ${somaTotal.toStringAsFixed(2)}");
}

// 11. 3x8: Soma Total e Soma Pares
void ex11() {
  print("\n--- Exercício 11: Soma Total e Soma Pares (3x8) ---");
  var m = readDoubleMatrix(3, 8, "Digite os 24 valores da matriz:");

  double somaTotal = 0;
  double somaPares = 0;
  
  for (var row in m) {
    for (var val in row) {
      somaTotal += val;
      if (val % 2 == 0) {
        somaPares += val;
      }
    }
  }

  printMatrix(m, title: "Matriz Lida");
  print("\nSoma Total: ${somaTotal.toStringAsFixed(2)}");
  print("Soma dos Pares: ${somaPares.toStringAsFixed(2)}");
}

// 12. 5x10: Soma Total
void ex12() {
  print("\n--- Exercício 12: Soma Total (5x10) ---");
  var m = readDoubleMatrix(5, 10, "Digite os 50 valores da matriz:");
  
  double soma = 0;
  for (var row in m) {
    for (var val in row) {
      soma += val;
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nSoma de todos os elementos: ${soma.toStringAsFixed(2)}");
}

// 13. [CORRIGIDO] 15x5: Notas de Alunos
void ex13() {
  print("\n--- Exercício 13: Relatório de Notas (15 Alunos, 5 Provas) ---");
  int numAlunos = 15;
  int numProvas = 5;

  var notas = readDoubleMatrix(numAlunos, numProvas, "Digite as $numProvas notas para cada um dos $numAlunos alunos:");

  List<double> mediaAlunos = List.filled(numAlunos, 0.0);
  List<double> somaProvas = List.filled(numProvas, 0.0);
  
  print("\n--- a) Média e Status de Cada Aluno ---");
  for (int i = 0; i < numAlunos; i++) { // Aluno
    double somaAluno = 0;
    for (int j = 0; j < numProvas; j++) { // Prova
      somaAluno += notas[i][j];
      somaProvas[j] += notas[i][j]; // Já soma para o item b)
    }
    mediaAlunos[i] = somaAluno / numProvas;
    String status = mediaAlunos[i] >= 6.0 ? "Aprovado" : "Reprovado";
    print("  Aluno ${i + 1}: Média = ${mediaAlunos[i].toStringAsFixed(1)} | Status: $status");
  }
  
  print("\n--- b) Média de Cada Prova ---");
  for (int j = 0; j < numProvas; j++) {
    double mediaProva = somaProvas[j] / numAlunos;
    print("  Prova ${j + 1}: Média da Turma = ${mediaProva.toStringAsFixed(1)}");
  }
}

// 14. 5x5: Localização Maior e Menor
void ex14() {
  print("\n--- Exercício 14: Localização Maior e Menor (5x5) ---");
  var m = readDoubleMatrix(5, 5, "Digite os 25 valores da matriz:");
  
  double maxVal = m[0][0]; int maxRow = 1, maxCol = 1;
  double minVal = m[0][0]; int minRow = 1, minCol = 1;
  
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (m[i][j] > maxVal) {
        maxVal = m[i][j];
        maxRow = i + 1;
        maxCol = j + 1;
      }
      if (m[i][j] < minVal) {
        minVal = m[i][j];
        minRow = i + 1;
        minCol = j + 1;
      }
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nMaior valor: $maxVal (Linha: $maxRow, Coluna: $maxCol)");
  print("Menor valor: $minVal (Linha: $minRow, Coluna: $minCol)");
}

// 15. 10x10: Zerar fora da Diagonal Principal
void ex15() {
  print("\n--- Exercício 15: Zerar fora da Diag. Principal (10x10) ---");
  int dim = 10;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  var mResult = List.generate(dim, (i) => List.filled(dim, 0.0));
  
  for (int i = 0; i < dim; i++) {
    mResult[i][i] = m[i][i]; // Copia apenas a diagonal principal
  }
  
  printMatrix(m, title: "Matriz Original");
  printMatrix(mResult, title: "Matriz Resultante");
}

// 16. 3x4: Maior elemento de CADA LINHA
void ex16() {
  print("\n--- Exercício 16: Maior de Cada Linha (3x4) ---");
  var m = readDoubleMatrix(3, 4, "Digite os 12 valores da matriz:");
  
  printMatrix(m, title: "Matriz Lida");
  print("\n--- Maiores Valores por Linha ---");

  for (int i = 0; i < 3; i++) { // Para cada linha i
    double maxLinha = m[i][0];
    int maxCol = 1;
    
    for (int j = 1; j < 4; j++) { // Percorre as colunas j dessa linha
      if (m[i][j] > maxLinha) {
        maxLinha = m[i][j];
        maxCol = j + 1;
      }
    }
    print("  Linha ${i + 1}: Maior Valor = $maxLinha (Coluna: $maxCol)");
  }
}

// 17. 5x5: Maior da Diagonal Principal
void ex17() {
  print("\n--- Exercício 17: Maior da Diagonal Principal (5x5) ---");
  var m = readDoubleMatrix(5, 5, "Digite os 25 valores da matriz:");

  double maxDiag = m[0][0];
  int maxPos = 1; // Posição 1,1
  
  for (int i = 1; i < 5; i++) {
    if (m[i][i] > maxDiag) {
      maxDiag = m[i][i];
      maxPos = i + 1;
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nMaior valor da Diagonal Principal: $maxDiag");
  print("Localização: Linha $maxPos, Coluna $maxPos");
}

// 18. 4x4: Quadrado Mágico (Definição do PDF)
void ex18() {
  print("\n--- Exercício 18: Quadrado Mágico (4x4) ---");
  print("Verifica se a soma das linhas, colunas e DIAGONAL PRINCIPAL são iguais.");
  int dim = 4;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  // 1. Calcula a soma da Diagonal Principal (Soma Alvo)
  double somaAlvo = 0;
  for (int i = 0; i < dim; i++) {
    somaAlvo += m[i][i];
  }
  print("\nSoma Alvo (Diagonal Principal): $somaAlvo");

  bool isMagico = true;

  // 2. Verifica as Linhas
  for (int i = 0; i < dim; i++) {
    double somaLinha = 0;
    for (int j = 0; j < dim; j++) {
      somaLinha += m[i][j];
    }
    if (somaLinha != somaAlvo) {
      isMagico = false;
      print("  [FALHA] Soma Linha ${i + 1} = $somaLinha (Diferente de $somaAlvo)");
    } else {
      print("  [OK] Soma Linha ${i + 1} = $somaLinha");
    }
  }

  // 3. Verifica as Colunas
  for (int j = 0; j < dim; j++) {
    double somaColuna = 0;
    for (int i = 0; i < dim; i++) {
      somaColuna += m[i][j];
    }
    if (somaColuna != somaAlvo) {
      isMagico = false;
      print("  [FALHA] Soma Coluna ${j + 1} = $somaColuna (Diferente de $somaAlvo)");
    } else {
      print("  [OK] Soma Coluna ${j + 1} = $somaColuna");
    }
  }
  
  printMatrix(m, title: "Matriz Lida");
  if (isMagico) {
    print("\nResultado: É um quadrado mágico (pela definição do PDF)!");
  } else {
    print("\nResultado: Não é um quadrado mágico.");
  }
}

// 19. 5x5: Soma ABAIXO da Diagonal Principal
void ex19() {
  print("\n--- Exercício 19: Soma ABAIXO da Diag. Principal (5x5) ---");
  int dim = 5;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");

  double soma = 0;
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      // Abaixo da diagonal principal: linha (i) > coluna (j)
      if (i > j) {
        soma += m[i][j];
      }
    }
  }

  printMatrix(m, title: "Matriz Lida");
  print("\nSoma dos elementos ABAIXO da Diagonal Principal: ${soma.toStringAsFixed(2)}");
}

// 20. 3x3: Soma ACIMA da Diagonal Principal
void ex20() {
  print("\n--- Exercício 20: Soma ACIMA da Diag. Principal (3x3) ---");
  int dim = 3;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");

  double soma = 0;
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      // Acima da diagonal principal: linha (i) < coluna (j)
      if (i < j) {
        soma += m[i][j];
      }
    }
  }

  printMatrix(m, title: "Matriz Lida");
  print("\nSoma dos elementos ACIMA da Diagonal Principal: ${soma.toStringAsFixed(2)}");
}

// 21. 5x5: Soma NA E ACIMA da Diagonal Principal
void ex21() {
  print("\n--- Exercício 21: Soma NA E ACIMA da Diag. Principal (5x5) ---");
  int dim = 5;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");

  double soma = 0;
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      // Na e Acima da diagonal principal: linha (i) <= coluna (j)
      if (i <= j) {
        soma += m[i][j];
      }
    }
  }

  printMatrix(m, title: "Matriz Lida");
  print("\nSoma dos elementos NA E ACIMA da Diag. Principal: ${soma.toStringAsFixed(2)}");
}

// 22. 4x4: Soma NA E ABAIXO da Diagonal Principal
void ex22() {
  print("\n--- Exercício 22: Soma NA E ABAIXO da Diag. Principal (4x4) ---");
  int dim = 4;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");

  double soma = 0;
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      // Na e Abaixo da diagonal principal: linha (i) >= coluna (j)
      if (i >= j) {
        soma += m[i][j];
      }
    }
  }

  printMatrix(m, title: "Matriz Lida");
  print("\nSoma dos elementos NA E ABAIXO da Diag. Principal: ${soma.toStringAsFixed(2)}");
}

// 23. [CORRIGIDO] 5x2: Controle de Estoque
void ex23() {
  print("\n--- Exercício 23: Controle de Estoque (5 produtos) ---");
  // [Cod, Qtd] - Usando 'double' para manter a matriz genérica
  var estoque = readDoubleMatrix(5, 2, "Digite os 5 códigos de produto e suas quantidades:");

  while (true) {
    int codCliente = readInt("\nDigite o código do cliente (ou 0 para sair): ");
    if (codCliente == 0) break;

    int codProduto = readInt("  Digite o código do produto desejado: ");
    int qtdDesejada = readInt("  Digite a quantidade desejada: ");

    bool produtoEncontrado = false;
    for (int i = 0; i < 5; i++) {
      if (estoque[i][0] == codProduto) {
        produtoEncontrado = true;
        if (estoque[i][1] >= qtdDesejada) {
          // Atende o pedido
          estoque[i][1] -= qtdDesejada;
          print("  >> Pedido atendido! Estoque atualizado.");
        } else {
          // Não tem estoque
          print("  >> Estoque insuficiente. (Disponível: ${estoque[i][1]})");
        }
        break; // Para o loop de busca
      }
    }
    
    if (!produtoEncontrado) {
      print("  >> Código de produto não encontrado.");
    }
  }
  
  printMatrix(estoque, title: "Estoque Final (Cod | Qtd)");
}

// 24. 3x3: Soma Diagonal Principal
void ex24() {
  print("\n--- Exercício 24: Soma Diagonal Principal (3x3) ---");
  int dim = 3;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  double somaP = 0;
  for (int i = 0; i < dim; i++) {
    somaP += m[i][i];
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nSoma Diagonal Principal: ${somaP.toStringAsFixed(2)}");
}

// 25. 5x5: Soma Diagonal Secundária
void ex25() {
  print("\n--- Exercício 25: Soma Diagonal Secundária (5x5) ---");
  int dim = 5;
  var m = readDoubleMatrix(dim, dim, "Digite os $dim*$dim valores da matriz:");
  
  double somaS = 0;
  for (int i = 0; i < dim; i++) {
    somaS += m[i][(dim - 1) - i];
  }
  
  printMatrix(m, title: "Matriz Lida");
  print("\nSoma Diagonal Secundária: ${somaS.toStringAsFixed(2)}");
}


// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01,
  2: ex02,
  3: ex03,
  4: ex04,
  5: ex05,
  6: ex06,
  7: ex07,
  8: ex08,
  9: ex09,
  10: ex10,
  11: ex11,
  12: ex12,
  13: ex13,
  14: ex14,
  15: ex15,
  16: ex16,
  17: ex17,
  18: ex18,
  19: ex19,
  20: ex20,
  21: ex21,
  22: ex22,
  23: ex23,
  24: ex24,
  25: ex25,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 7 (Matrizes) ---");
    print("Por favor, escolha um exercício (1-25) para executar.");

    // Lista de exercícios
    print("1.  4x4: Contar > 10");
    print("2.  5x5: Diagonal Principal");
    print("3.  3x3: Multiplicar por 5");
    print("4.  4x4: Localização do Maior");
    print("5.  5x5: Procurar número X");
    print("6.  10x10: Diagonais Principal e Secundária");
    print("7.  5x5: Elementos Fora das Diagonais");
    print("8.  6x6: Soma Total");
    print("9.  3x3: Soma das Diagonais");
    print("10. 5x5: Somas Específicas");
    print("11. 3x8: Soma Total e Soma Pares");
    print("12. 5x10: Soma Total");
    print("13. 15x5: Relatório de Notas de Alunos (CORRIGIDO)");
    print("14. 5x5: Localização Maior e Menor");
    print("15. 10x10: Zerar fora da Diagonal Principal");
    print("16. 3x4: Maior elemento de CADA LINHA");
    print("17. 5x5: Maior da Diagonal Principal");
    print("18. 4x4: Quadrado Mágico (Definição do PDF)");
    print("19. 5x5: Soma ABAIXO da Diagonal Principal");
    print("20. 3x3: Soma ACIMA da Diagonal Principal");
    print("21. 5x5: Soma NA E ACIMA da Diagonal Principal");
    print("22. 4x4: Soma NA E ABAIXO da Diagonal Principal");
    print("23. 5x2: Controle de Estoque (CORRIGIDO)");
    print("24. 3x3: Soma Diagonal Principal");
    print("25. 5x5: Soma Diagonal Secundária");


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