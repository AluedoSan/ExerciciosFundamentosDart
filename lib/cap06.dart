import 'dart:io';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';
import 'package:dart_teste/cap05.dart';

// 1. Vetor[6] (Pares, Soma Pares, Ímpares, Qtd Ímpares)
void ex01() {
  print("\n--- Exercício 1: Pares e Ímpares (Vetor[6]) ---");
  List<int> vet = [];
  for (int i = 0; i < 6; i++) {
    vet.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  List<int> pares = [];
  int somaPares = 0;
  List<int> impares = [];
  int qtdImpares = 0;

  for (int n in vet) {
    if (n % 2 == 0) {
      pares.add(n);
      somaPares += n;
    } else {
      impares.add(n);
      qtdImpares++;
    }
  }

  print("\n--- Resultados ---");
  print("a) Números pares: ${pares.join(', ')}");
  print("b) Soma dos pares: $somaPares");
  print("c) Números ímpares: ${impares.join(', ')}");
  print("d) Quantidade de ímpares: $qtdImpares");
}

// 2. Vetor[7] (Múltiplos de 2, 3, e 2&3)
void ex02() {
  print("\n--- Exercício 2: Múltiplos (Vetor[7]) ---");
  List<int> vet = [];
  for (int i = 0; i < 7; i++) {
    vet.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  List<int> mult2 = [];
  List<int> mult3 = [];
  List<int> mult2e3 = [];

  for (int n in vet) {
    if (n % 2 == 0) {
      mult2.add(n);
    }
    if (n % 3 == 0) {
      mult3.add(n);
    }
    if (n % 2 == 0 && n % 3 == 0) {
      mult2e3.add(n);
    }
  }

  print("\n--- Resultados ---");
  print("a) Múltiplos de 2: ${mult2.join(', ')}");
  print("b) Múltiplos de 3: ${mult3.join(', ')}");
  print("c) Múltiplos de 2 e 3: ${mult2e3.join(', ')}");
}

// 3. Vetor[10] (Controle de Estoque)
void ex03() {
  print("\n--- Exercício 3: Controle de Estoque (Vetor[10]) ---");
  List<int> codigos = [];
  List<int> estoque = [];

  print("--- Cadastro Inicial do Estoque ---");
  for (int i = 0; i < 10; i++) {
    codigos.add(readInt("  Digite o código do ${i + 1}º produto: "));
    estoque.add(readInt("  Digite a quantidade em estoque: "));
  }

  while (true) {
    int codCliente = readInt("\nDigite o código do cliente (ou 0 para sair): ");
    if (codCliente == 0) break;

    int codProduto = readInt("  Digite o código do produto desejado: ");
    int qtdDesejada = readInt("  Digite a quantidade desejada: ");

    int indexProduto = codigos.indexOf(codProduto);

    if (indexProduto == -1) {
      print("  >> Código inexistente.");
    } else {
      if (estoque[indexProduto] >= qtdDesejada) {
        estoque[indexProduto] -= qtdDesejada; // Efetua a atualização
        print("  >> Pedido atendido. Obrigado e volte sempre;");
      } else {
        print("  >> Não temos estoque suficiente dessa mercadoria.");
      }
    }
  }

  print("\n--- Estoque Atualizado ---");
  for (int i = 0; i < 10; i++) {
    print("  Produto Cód: ${codigos[i]} | Estoque: ${estoque[i]}");
  }
}

// 4. Vetor[15] (Posições do número 30)
void ex04() {
  print("\n--- Exercício 4: Posições do N° 30 (Vetor[15]) ---");
  List<int> vet = [];
  for (int i = 0; i < 15; i++) {
    vet.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  List<int> posicoes = [];
  for (int i = 0; i < vet.length; i++) {
    if (vet[i] == 30) {
      posicoes.add(i);
    }
  }

  if (posicoes.isEmpty) {
    print("\nO número 30 não foi encontrado no vetor.");
  } else {
    print("\nO número 30 foi encontrado nas posições (índices): ${posicoes.join(', ')}");
  }
}

// 5. Vetor[10] (Logística)
void ex05() {
  print("\n--- Exercício 5: Logística (Vetor[10]) ---");
  List<String> nomes = [];
  print("--- Cadastro de Nomes ---");
  for (int i = 0; i < 10; i++) {
    nomes.add(readString("  Digite o ${i + 1}º nome: "));
  }
  
  String nomeBusca = readString("\nDigite o nome para busca: ");
  
  if (nomes.contains(nomeBusca)) {
    print("\nACHEI");
  } else {
    print("\nNÃO ACHEI");
  }
}

// 6. Vendedores (Nomes, Vendas, Comissão)
void ex06() {
  print("\n--- Exercício 6: Relatório de Vendas (10 Vendedores) ---");
  int numVendedores = 10;
  List<String> nomes = [];
  List<double> vendas = [];
  List<double> percentuais = [];

  for (int i = 0; i < numVendedores; i++) {
    print("--- Vendedor ${i + 1} ---");
    nomes.add(readString("  Nome: "));
    vendas.add(readDouble("  Total de Vendas: R\$ "));
    percentuais.add(readDouble("  Percentual Comissão (ex: 5 para 5%): "));
  }

  List<double> aReceber = [];
  double totalVendas = 0;
  double maxReceber = -1;
  String nomeMax = '';
  double minReceber = double.maxFinite;
  String nomeMin = '';

  print("\n--- a) Relatório de Comissão ---");
  for (int i = 0; i < numVendedores; i++) {
    double comissaoValor = vendas[i] * (percentuais[i] / 100);
    aReceber.add(comissaoValor);
    totalVendas += vendas[i];

    print("  Vendedor: ${nomes[i]} | Valor a Receber: R\$ ${comissaoValor.toStringAsFixed(2)}");

    if (comissaoValor > maxReceber) {
      maxReceber = comissaoValor;
      nomeMax = nomes[i];
    }
    if (comissaoValor < minReceber) {
      minReceber = comissaoValor;
      nomeMin = nomes[i];
    }
  }

  print("\n--- b) Total de Vendas ---");
  print("  Total: R\$ ${totalVendas.toStringAsFixed(2)}");

  print("\n--- c) Extremos a Receber ---");
  print("  Maior valor: R\$ ${maxReceber.toStringAsFixed(2)} (Vendedor: $nomeMax)");
  print("  Menor valor: R\$ ${minReceber.toStringAsFixed(2)} (Vendedor: $nomeMin)");
}

// 7. Vetor[10] Reais (Qtd Negativos, Soma Positivos)
void ex07() {
  print("\n--- Exercício 7: Negativos e Positivos (Vetor[10]) ---");
  List<double> vet = [];
  for (int i = 0; i < 10; i++) {
    vet.add(readDouble("  Digite o ${i + 1}º número real: "));
  }

  int qtdNegativos = 0;
  double somaPositivos = 0;

  for (double n in vet) {
    if (n < 0) {
      qtdNegativos++;
    } else {
      somaPositivos += n; // Inclui o zero na soma dos positivos
    }
  }

  print("\n--- Resultados ---");
  print("Quantidade de negativos: $qtdNegativos");
  print("Soma dos positivos: ${somaPositivos.toStringAsFixed(2)}");
}

// 8. Alunos (Nomes, Médias)
void ex08() {
  print("\n--- Exercício 8: Aluno com Média >= 7 (7 Alunos) ---");
  int numAlunos = 7;
  List<String> nomes = [];
  List<double> medias = [];
  String nomeAprovado = ''; // Armazena o primeiro encontrado

  for (int i = 0; i < numAlunos; i++) {
    nomes.add(readString("  Nome Aluno ${i + 1}: "));
    double media = readDouble("  Média Final: ");
    medias.add(media);

    if (media >= 7.0 && nomeAprovado.isEmpty) {
      nomeAprovado = nomes[i];
    }
  }

  if (nomeAprovado.isNotEmpty) {
     print("\nPrimeiro aluno com média >= 7.0: $nomeAprovado");
  } else {
     print("\nNão há alunos com média >= 7.0.");
  }
}

// 9. Produtos (Nomes, Preços, Aumento < R$ 100)
void ex09() {
  print("\n--- Exercício 9: Aumento de Preços (10 Produtos) ---");
  int numProdutos = 10;
  List<String> nomes = [];
  List<double> precos = [];

  for (int i = 0; i < numProdutos; i++) {
    nomes.add(readString("  Produto ${i + 1}: "));
    precos.add(readDouble("  Preço: R\$ "));
  }

  print("\n--- Relatório de Aumento (Produtos < R\$ 100.00) ---");
  bool nenhumAumento = true;
  for (int i = 0; i < numProdutos; i++) {
    if (precos[i] < 100.0) {
      nenhumAumento = false;
      double novoPreco = precos[i] * 1.05;
      print("  Produto: ${nomes[i]} | Novo Preço: R\$ ${novoPreco.toStringAsFixed(2)} (Preço Antigo: R\$ ${precos[i].toStringAsFixed(2)})");
    }
  }
  if (nenhumAumento) {
    print("Nenhum produto teve aumento (todos custam R\$ 100.00 ou mais).");
  }
}

// 10. Vetor[10] (Separar Pares e Ímpares em 2 vetores)
void ex10() {
  print("\n--- Exercício 10: Separar Pares/Ímpares (Vetor[10]) ---");
  List<int> vet = [];
  for (int i = 0; i < 10; i++) {
    vet.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  List<int> pares = [];
  List<int> impares = [];

  for (int n in vet) {
    if (n % 2 == 0) {
      pares.add(n);
    } else {
      impares.add(n);
    }
  }

  print("\nVetor Original: $vet");
  print("Vetor de Pares: $pares");
  print("Vetor de Ímpares: $impares");
}

// 11. Vetor[10] (Contar Pares e Ímpares)
void ex11() {
  print("\n--- Exercício 11: Contar Pares/Ímpares (Vetor[10]) ---");
  List<int> vet = [];
  for (int i = 0; i < 10; i++) {
    vet.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  int qtdPares = 0;
  int qtdImpares = 0;

  for (int n in vet) {
    if (n % 2 == 0) {
      qtdPares++;
    } else {
      qtdImpares++;
    }
  }
  
  print("\nVetor: $vet");
  print("Quantidade de Pares: $qtdPares");
  print("Quantidade de Ímpares: $qtdImpares");
}

// 12. Vetor[10] (Mostrar > Média)
void ex12() {
  print("\n--- Exercício 12: Mostrar > Média (Vetor[10]) ---");
  List<double> vet = [];
  double soma = 0;
  
  for (int i = 0; i < 10; i++) {
    double n = readDouble("  Digite o ${i + 1}º número real: ");
    vet.add(n);
    soma += n;
  }
  
  double media = soma / 10.0;
  List<double> acimaMedia = [];
  
  for (double n in vet) {
    if (n > media) {
      acimaMedia.add(n);
    }
  }

  print("\nVetor: $vet");
  print("Média: ${media.toStringAsFixed(2)}");
  print("Valores acima da média: ${acimaMedia.join(', ')}");
}

// 13. Vetor[8] (Relatório de Notas)
void ex13() {
  print("\n--- Exercício 13: Relatório de Notas (8 Alunos) ---");
  List<String> nomes = [];
  List<double> notas = [];
  double somaNotas = 0;
  
  for (int i = 0; i < 8; i++) {
    String nome = readString("  Digite o nome do ${i + 1}º aluno: ");
    nomes.add(nome);
    double nota = readDouble("  Digite a nota do(a) $nome: ");
    notas.add(nota);
    somaNotas += nota;
  }
  
  print("\nRelatórios de notas");
  for (int i = 0; i < 8; i++) {
    print("  ${nomes[i]} ${notas[i].toStringAsFixed(1)}");
  }
  
  double mediaClasse = somaNotas / 8.0;
  print("\nMédia da classe = ${mediaClasse.toStringAsFixed(2)}");
}

// 14. Vetor[6] (Relatório Médias 6 Alunos)
void ex14() {
  print("\n--- Exercício 14: Relatório Médias (6 Alunos) ---");
  int numAlunos = 6;
  List<String> nomes = [];
  List<double> medias = [];
  double somaMediasAbaixo7 = 0;
  int qtdAbaixo7 = 0;

  for (int i = 0; i < numAlunos; i++) {
    nomes.add(readString("  Nome Aluno ${i + 1}: "));
    double media = readDouble("  Média Final: ");
    medias.add(media);
    
    if (media < 7.0) {
      somaMediasAbaixo7 += media;
      qtdAbaixo7++;
    }
  }

  int qtdAcima7 = 0;
  for (double media in medias) {
    if (media >= 7.0) {
      qtdAcima7++;
    }
  }
  
  print("\nQuantidade de alunos com média >= 7.0: $qtdAcima7");
  
  if (qtdAbaixo7 > 0) {
    double mediaReprovados = somaMediasAbaixo7 / qtdAbaixo7;
    print("Média das notas dos alunos com média < 7.0: ${mediaReprovados.toStringAsFixed(2)}");
  } else {
    print("Nenhum aluno com média < 7.0.");
  }
}

// 15. Vetor[10] (Contar iguais a 5)
void ex15() {
  print("\n--- Exercício 15: Contar N° 5 (Vetor[10]) ---");
  List<double> vet = [];
  int count5 = 0;
  
  for (int i = 0; i < 10; i++) {
    double n = readDouble("  Digite o ${i + 1}º número real: ");
    vet.add(n);
    if (n == 5.0) {
      count5++;
    }
  }
  
  print("\nVetor: $vet");
  print("O número 5.0 apareceu $count5 vezes.");
}

// 16. Vetor[5] (Média Notas, Maior/Menor)
void ex16() {
  print("\n--- Exercício 16: Média e Extremos (5 Alunos) ---");
  int numAlunos = 5;
  List<String> nomes = [];
  List<double> notas = [];
  double somaNotas = 0;
  
  double maxNota = -1;
  String nomeMax = '';
  double minNota = 11;
  String nomeMin = '';

  for (int i = 0; i < numAlunos; i++) {
    String nome = readString("  Nome Aluno ${i + 1}: ");
    nomes.add(nome);
    double nota = readDouble("  Nota: ");
    notas.add(nota);
    somaNotas += nota;
    
    if (nota > maxNota) {
      maxNota = nota;
      nomeMax = nome;
    }
    if (nota < minNota) {
      minNota = nota;
      nomeMin = nome;
    }
  }

  print("\n--- Relatório de Notas ---");
  for(int i=0; i < numAlunos; i++) {
    print("  ${nomes[i]}: ${notas[i]}");
  }

  print("\nMédia da Classe: ${(somaNotas / numAlunos).toStringAsFixed(2)}");
  print("Aluno com Maior Nota: $nomeMax (Nota: $maxNota)");
  print("Aluno com Menor Nota: $nomeMin (Nota: $minNota)");
}

// 17. Vetor[10] (Análise N° 15)
void ex17() {
  print("\n--- Exercício 17: Análise N° 15 (Vetor[10]) ---");
  List<int> vet = [];
  int somaMenor15 = 0;
  int qtdIgual15 = 0;
  int somaMaior15 = 0;
  int qtdMaior15 = 0;

  for (int i = 0; i < 10; i++) {
    int n = readInt("  Digite o ${i + 1}º número inteiro: ");
    vet.add(n);
    
    if (n < 15) {
      somaMenor15 += n;
    } else if (n == 15) {
      qtdIgual15++;
    } else {
      somaMaior15 += n;
      qtdMaior15++;
    }
  }

  print("\nVetor: $vet");
  print("Soma dos < 15: $somaMenor15");
  print("Quantidade dos = 15: $qtdIgual15");
  
  if (qtdMaior15 > 0) {
    double mediaMaior15 = somaMaior15 / qtdMaior15;
    print("Média dos > 15: ${mediaMaior15.toStringAsFixed(2)}");
  } else {
    print("Média dos > 15: N/A (Nenhum > 15)");
  }
}

// 18. Vetor[15] (Média, Maior, Menor)
void ex18() {
  print("\n--- Exercício 18: Média, Maior, Menor (Vetor[15]) ---");
  List<int> vet = [];
  int soma = 0;
  int maxVal = -2147483648;
  int minVal = 2147483647;

  for (int i = 0; i < 15; i++) {
    int n = readInt("  Digite o ${i + 1}º número inteiro: ");
    vet.add(n);
    soma += n;
    if (n > maxVal) maxVal = n;
    if (n < minVal) minVal = n;
  }
  
  double media = soma / 15.0;
  
  print("\nVetor: $vet");
  print("Média: ${media.toStringAsFixed(2)}");
  print("Maior Valor: $maxVal");
  print("Menor Valor: $minVal");
}

// 19. VetorA[10] * VetorB[10] = VetorC[10]
void ex19() {
  print("\n--- Exercício 19: Multiplicação VetorA * VetorB (Vetor[10]) ---");
  List<int> vetA = [];
  List<int> vetB = [];
  
  print("--- Vetor A ---");
  for (int i = 0; i < 10; i++) {
    vetA.add(readInt("  Digite o ${i + 1}º número: "));
  }
  
  print("--- Vetor B ---");
  for (int i = 0; i < 10; i++) {
    vetB.add(readInt("  Digite o ${i + 1}º número: "));
  }
  
  List<int> vetC = [];
  for (int i = 0; i < 10; i++) {
    vetC.add(vetA[i] * vetB[i]);
  }
  
  print("\nVetor A: $vetA");
  print("Vetor B: $vetB");
  print("Vetor C (Resultado A*B): $vetC");
}

// 20. VetorA[10] + 5 = VetorB[10]
void ex20() {
  print("\n--- Exercício 20: Somar 5 (Vetor[10]) ---");
  List<int> vetA = [];
  for (int i = 0; i < 10; i++) {
    vetA.add(readInt("  Digite o ${i + 1}º número: "));
  }
  
  List<int> vetB = [];
  for (int n in vetA) {
    vetB.add(n + 5);
  }
  
  print("\nVetor A: $vetA");
  print("Vetor B (A + 5): $vetB");
}

// 21. VetorA[10] - Média(A) = VetorB[10]
void ex21() {
  print("\n--- Exercício 21: Subtrair Média (Vetor[10]) ---");
  List<int> vetA = [];
  int soma = 0;
  for (int i = 0; i < 10; i++) {
    int n = readInt("  Digite o ${i + 1}º número: ");
    vetA.add(n);
    soma += n;
  }
  
  double media = soma / 10.0;
  List<double> vetB = [];
  
  for (int n in vetA) {
    vetB.add(n - media);
  }
  
  print("\nVetor A: $vetA");
  print("Média de A: $media");
  print("Vetor B (A - Média): $vetB");
}

// 22. Vetor[10] (Análise da Média)
void ex22() {
  print("\n--- Exercício 22: Análise da Média (Vetor[10]) ---");
  List<int> vet = [];
  int soma = 0;
  for (int i = 0; i < 10; i++) {
    int n = readInt("  Digite o ${i + 1}º número: ");
    vet.add(n);
    soma += n;
  }
  
  double media = soma / 10.0;
  List<int> acimaMedia = [];
  int qtdIgualMedia = 0;

  for (int n in vet) {
    if (n > media) {
      acimaMedia.add(n);
    } else if (n == media) {
      qtdIgualMedia++;
    }
  }

  print("\nVetor: $vet");
  print("Média: $media");
  print("Valores > Média: ${acimaMedia.join(', ')}");
  print("Quantidade = Média: $qtdIgualMedia");
}

// 23. Vetor[20] (Separar Pares e Ímpares em 2 vetores)
void ex23() {
  print("\n--- Exercício 23: Separar Pares/Ímpares (Vetor[20]) ---");
  List<int> vet = [];
  for (int i = 0; i < 20; i++) {
    vet.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  List<int> pares = [];
  List<int> impares = [];

  for (int n in vet) {
    if (n % 2 == 0) {
      pares.add(n);
    } else {
      impares.add(n);
    }
  }

  print("\nVetor Original: $vet");
  print("Vetor de Pares: $pares");
  print("Vetor de Ímpares: $impares");
}

// 24. Vetor[15] (Primos e Posições)
void ex24() {
  print("\n--- Exercício 24: Primos e Posições (Vetor[15]) ---");
  List<int> vet = [];
  for (int i = 0; i < 15; i++) {
    vet.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  print("\n--- Números Primos Encontrados ---");
  bool achouPrimo = false;
  for (int i = 0; i < vet.length; i++) {
    if (isPrimo(vet[i])) {
      print("  Número: ${vet[i]} | Posição (índice): $i");
      achouPrimo = true;
    }
  }

  if (!achouPrimo) {
    print("  Nenhum número primo encontrado.");
  }
}

// 25. Vetor[15] (Compactar, removendo Zeros)
void ex25() {
  print("\n--- Exercício 25: Compactar Vetor (Remover Zeros) (Vetor[15]) ---");
  List<int> vetOriginal = [];
  for (int i = 0; i < 15; i++) {
    vetOriginal.add(readInt("  Digite o ${i + 1}º número inteiro: "));
  }

  // Acha as posições dos zeros
  List<int> posicoesZero = [];
  for (int i = 0; i < vetOriginal.length; i++) {
    if (vetOriginal[i] == 0) {
      posicoesZero.add(i);
    }
  }

  // Cria o vetor compactado
  List<int> vetCompactado = [];
  for (int n in vetOriginal) {
    if (n != 0) {
      vetCompactado.add(n);
    }
  }

  print("\nPosições (índices) dos Zeros: ${posicoesZero.join(', ')}");
  print("Vetor Original: $vetOriginal");
  print("Vetor Compactado: $vetCompactado");
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
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 6 (Vetores - Pág. 190) ---");
    print("Por favor, escolha um exercício (1-25) para executar.");

    // Lista de exercícios
    print("1.  Análise Pares/Ímpares (Vetor[6])");
    print("2.  Múltiplos (Vetor[7])");
    print("3.  Controle de Estoque (Vetor[10])");
    print("4.  Achar Posições do N° 30 (Vetor[15])");
    print("5.  Logística (Achar nome) (Vetor[10])");
    print("6.  Relatório de Vendas (10 Vendedores)");
    print("7.  Qtd Negativos / Soma Positivos (Vetor[10])");
    print("8.  Achar Aluno com Média >= 7 (7 Alunos)");
    print("9.  Aumento de Preços (10 Produtos)");
    print("10. Separar Pares/Ímpares (Vetor[10])");
    print("11. Contar Pares/Ímpares (Vetor[10])");
    print("12. Mostrar > Média (Vetor[10])");
    print("13. Relatório de Notas (8 Alunos)");
    print("14. Relatório Médias (6 Alunos)");
    print("15. Contar N° 5 (Vetor[10])");
    print("16. Média e Extremos (5 Alunos)");
    print("17. Análise N° 15 (Vetor[10])");
    print("18. Média, Maior, Menor (Vetor[15])");
    print("19. Multiplicação VetorA * VetorB (Vetor[10])");
    print("20. Somar 5 (Vetor[10])");
    print("21. Subtrair Média (Vetor[10])");
    print("22. Análise da Média (VNetor[10])");
    print("23. Separar Pares/Ímpares (Vetor[20])");
    print("24. Primos e Posições (Vetor[15])");
    print("25. Compactar Vetor (Remover Zeros) (Vetor[15])");


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