import 'dart:io';
import 'dart:math';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';

bool isPrimo(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return false; // Encontrou um divisor, não é primo
    }
  }
  return true; // Nenhum divisor encontrado
}

// --- EXERCÍCIOS PROPOSTOS (Capítulo 5) ---

// 1. Ler 5 grupos de 4 valores (A, B, C, D) e ordenar
void ex01Ordenacao() {
  print("\n--- Exercício 1: Ordenação de Grupos ---");
  for (int i = 1; i <= 5; i++) {
    print("\n--- Grupo $i ---");
    List<double> nums = [];
    nums.add(readDouble("  Digite A: "));
    nums.add(readDouble("  Digite B: "));
    nums.add(readDouble("  Digite C: "));
    nums.add(readDouble("  Digite D: "));
    
    print("  Ordem lida: ${nums.join(', ')}");
    
    // Ordena a lista
    nums.sort();
    print("  Ordem crescente: ${nums.join(', ')}");
    
    // Inverte a lista já ordenada
    print("  Ordem decrescente: ${nums.reversed.join(', ')}");
  }
}

// 2. Calcular lucro de um teatro
void ex02LucroTeatro() {
  print("\n--- Exercício 2: Lucro do Teatro ---");
  double despesaFixa = 200.00;
  double lucroMaximo = -double.maxFinite;
  double precoIdeal = 0;
  int ingressosIdeal = 0;
  
  int ingressosBase = 120; // Ingressos a R$ 5.00
  int aumentoIngressos = 26; // A cada R$ 0.50 de redução

  print("Relatório de Previsão de Lucro:");
  
  // Loop decrescente de R$ 5.00 até R$ 1.00, caindo R$ 0.50
  for (double preco = 5.0; preco >= 1.0; preco -= 0.5) {
    int ingressosAtuais;
    
    // Calcula quantos ingressos serão vendidos nesse preço
    if (preco == 5.0) {
      ingressosAtuais = ingressosBase;
    } else {
      // Calcula o número de reduções de R$ 0.50
      int numReducoes = ((5.0 - preco) / 0.5).round();
      ingressosAtuais = ingressosBase + (numReducoes * aumentoIngressos);
    }
    
    double receita = preco * ingressosAtuais;
    double lucroAtual = receita - despesaFixa;
    
    print("  Preço: R\$${preco.toStringAsFixed(2)} | Ingressos: $ingressosAtuais | Receita: R\$${receita.toStringAsFixed(2)} | Lucro: R\$${lucroAtual.toStringAsFixed(2)}");
    
    // Atualiza o lucro máximo
    if (lucroAtual > lucroMaximo) {
      lucroMaximo = lucroAtual;
      precoIdeal = preco;
      ingressosIdeal = ingressosAtuais;
    }
  }

  print("\n--- Resultado ---");
  print("Lucro Máximo esperado: R\$ ${lucroMaximo.toStringAsFixed(2)}");
  print("Preço do ingresso para lucro máximo: R\$ ${precoIdeal.toStringAsFixed(2)}");
  print("Número de ingressos vendidos: $ingressosIdeal");
}


// 3. Contar 8 pessoas por faixa etária
void ex03FaixaEtaria() {
  print("\n--- Exercício 3: Faixa Etária (8 pessoas) ---");
  int f1 = 0; // 1-15
  int f2 = 0; // 16-30
  int f3 = 0; // 31-45
  int f4 = 0; // 46-60
  int f5 = 0; // >60
  int totalPessoas = 8;
  
  for (int i = 1; i <= totalPessoas; i++) {
    int idade = readInt("Digite a idade da pessoa $i: ");
    if (idade <= 15) {f1++;}
    else if (idade <= 30) {f2++;}
    else if (idade <= 45) {f3++;}
    else if (idade <= 60) {f4++;}
    else {f5++;}
  }
  
  print("\n--- Resultados ---");
  print("Faixa 1 (Até 15 anos): $f1 pessoas");
  print("Faixa 2 (16 a 30 anos): $f2 pessoas");
  print("Faixa 3 (31 a 45 anos): $f3 pessoas");
  print("Faixa 4 (46 a 60 anos): $f4 pessoas");
  print("Faixa 5 (Acima de 60 anos): $f5 pessoas");
  
  print("\nPorcentagem (Faixa 1): ${(f1 / totalPessoas * 100).toStringAsFixed(1)}%");
  print("Porcentagem (Faixa 5): ${(f5 / totalPessoas * 100).toStringAsFixed(1)}%");
}

// 4. Tabuada de um número
void ex04Tabuada() {
  print("\n--- Exercício 4: Tabuada ---");
  int num = readInt("Digite um número para ver a tabuada: ");
  print("Tabuada do $num:");
  for (int i = 0; i <= 10; i++) {print("$num x $i = ${num * i}");}
}

// 5. Tabuadas de 1 a 10
void ex05Tabuadas1a10() {
  print("\n--- Exercício 5: Tabuadas de 1 a 10 ---");
  for (int i = 1; i <= 10; i++) {
    print("\n--- Tabuada do $i ---");
    for (int j = 0; j <= 10; j++) {
      print("$i x $j = ${i * j}");
    }
  }
}

// 6. Transações de uma loja
void ex06TransacoesLoja() {
  print("\n--- Exercício 6: Transações da Loja (15 transações) ---");
  double totalVista = 0;
  double totalPrazo = 0;
  
  for (int i = 1; i <= 15; i++) {
    String codigo = readString("Transação $i (V - Vista / P - Prazo): ");
    double valor = readDouble("  Valor da transação $i: R\$ ");
    if (codigo == 'V') {
      totalVista += valor;
    } else if (codigo == 'P') {
      totalPrazo += valor;
    } else {
      print("Código inválido, ignorando transação.");
    }
  }
  
  double totalGeral = totalVista + totalPrazo;
  double primeiraPrestacao = totalPrazo / 3;
  
  print("\n--- Relatório Final ---");
  print("Total à Vista: R\$ ${totalVista.toStringAsFixed(2)}");
  print("Total a Prazo: R\$ ${totalPrazo.toStringAsFixed(2)}");
  print("Total Geral: R\$ ${totalGeral.toStringAsFixed(2)}");
  print("Valor da 1ª prestação (a prazo): R\$ ${primeiraPrestacao.toStringAsFixed(2)}");
}

// 7. Análise de 5 Pessoas
void ex07AnalisePessoas() {
  print("\n--- Exercício 7: Análise de 5 Pessoas ---");
  int countIdade50 = 0;
  double somaAltura10a20 = 0;
  int countAltura10a20 = 0;
  int countPeso40 = 0;
  int totalPessoas = 5;
  
  for (int i = 1; i <= totalPessoas; i++) {
    print("--- Pessoa $i ---");
    int idade = readInt("  Idade: ");
    double altura = readDouble("  Altura (m): ");
    double peso = readDouble("  Peso (kg): ");
    
    if (idade > 50) {
      countIdade50++;
    }
    
    if (idade >= 10 && idade <= 20) {
      somaAltura10a20 += altura;
      countAltura10a20++;
    }
    
    if (peso < 40) {
      countPeso40++;
    }
  }
  
  print("\n--- Resultados ---");
  print("Qtd. pessoas com mais de 50 anos: $countIdade50");
  
  if (countAltura10a20 > 0) {
    double mediaAltura = somaAltura10a20 / countAltura10a20;
    print("Média de altura (10-20 anos): ${mediaAltura.toStringAsFixed(2)} m");
  } else {
    print("Nenhuma pessoa entre 10 e 20 anos.");
  }
  
  print("% Pessoas com peso < 40kg: ${(countPeso40 / totalPessoas * 100).toStringAsFixed(1)}%");
}

// 8. Análise detalhada de 6 Pessoas
void ex08AnaliseDetalhada() {
  print("\n--- Exercício 8: Análise Detalhada (6 pessoas) ---");
  int countIdade50Peso60 = 0;
  double somaIdadeAltura150 = 0;
  int countIdadeAltura150 = 0;
  int countOlhosAzuis = 0;
  int countRuivosNaoAzuis = 0;
  
  for (int i = 1; i <= 6; i++) {
    print("--- Pessoa $i ---");
    int idade = readInt("  Idade: ");
    double peso = readDouble("  Peso (kg): ");
    double altura = readDouble("  Altura (m): ");
    String olhos = readString("  Cor Olhos (A-Azul, P-Preto, V-Verde, C-Castanho): ");
    String cabelos = readString("  Cor Cabelos (P-Preto, C-Castanho, L-Louro, R-Ruivo): ");
    
    if (idade > 50 && peso < 60) {
      countIdade50Peso60++;
    }
    
    if (altura < 1.50) {
      somaIdadeAltura150 += idade;
      countIdadeAltura150++;
    }
    
    if (olhos == 'A') {
      countOlhosAzuis++;
    }
    
    if (cabelos == 'R' && olhos != 'A') {
      countRuivosNaoAzuis++;
    }
  }
  
  print("\n--- Resultados ---");
  print("Qtd. (Idade > 50 e Peso < 60kg): $countIdade50Peso60");
  
  if (countIdadeAltura150 > 0) {
    double mediaIdade = somaIdadeAltura150 / countIdadeAltura150;
    print("Média Idade (Altura < 1.50m): ${mediaIdade.toStringAsFixed(1)} anos");
  } else {
    print("Nenhuma pessoa com altura < 1.50m.");
  }
  
  print("% Pessoas com olhos azuis: ${(countOlhosAzuis / 6 * 100).toStringAsFixed(1)}%");
  print("Qtd. Ruivos que não têm olhos azuis: $countRuivosNaoAzuis");
}

// 9. Análise de 10 Pessoas
void ex09Analise10Pessoas() {
  print("\n--- Exercício 9: Análise (10 pessoas) ---");
  double somaIdades = 0;
  int countPeso90Altura150 = 0;
  int countIdade10a30Altura190 = 0;
  int totalPessoas = 10;
  
  for (int i = 1; i <= totalPessoas; i++) {
    print("--- Pessoa $i ---");
    int idade = readInt("  Idade: ");
    double peso = readDouble("  Peso (kg): ");
    double altura = readDouble("  Altura (m): ");
    
    somaIdades += idade;
    
    if (peso > 90 && altura < 1.50) {
      countPeso90Altura150++;
    }
    
    if ((idade >= 10 && idade <= 30) && altura > 1.90) {
      countIdade10a30Altura190++;
    }
  }
  
  print("\n--- Resultados ---");
  print("Média de idade: ${(somaIdades / totalPessoas).toStringAsFixed(1)} anos");
  print("Qtd. (Peso > 90kg e Altura < 1.50m): $countPeso90Altura150");
  print("% (Idade 10-30 e Altura > 1.90m): ${(countIdade10a30Altura190 / totalPessoas * 100).toStringAsFixed(1)}%");
}

// 10. Soma de Pares e Primos
void ex10ParesPrimos() {
  print("\n--- Exercício 10: Soma Pares e Primos ---");
  int somaPares = 0;
  int somaPrimos = 0;
  
  for (int i = 1; i <= 10; i++) {
    int num = readInt("Digite o número $i: ");
    
    if (num % 2 == 0) {
      somaPares += num;
    }
    
    if (isPrimo(num)) {
      somaPrimos += num;
    }
  }
  
  print("\n--- Resultados ---");
  print("Soma dos números pares: $somaPares");
  print("Soma dos números primos: $somaPrimos");
}

// 11. Compra de Carro
void ex11CompraCarro() {
  print("\n--- Exercício 11: Compra de Carro ---");
  double valor = readDouble("Digite o valor do carro: R\$ ");
  
  double valorVista = valor * 0.80; // 20% desconto
  print("\nOpção 1: À Vista");
  print("  Valor: R\$ ${valorVista.toStringAsFixed(2)} (Desconto de 20%)");
  
  print("\nOpções Parceladas:");
  
  double acrescimoPercent = 3;
  for (int parcelas = 6; parcelas <= 60; parcelas += 6) {
    double valorFinal = valor * (1 + (acrescimoPercent / 100));
    double valorParcela = valorFinal / parcelas;
    print("  $parcelas parcelas: R\$ ${valorParcela.toStringAsFixed(2)} (Total: R\$ ${valorFinal.toStringAsFixed(2)} - ${acrescimoPercent.toStringAsFixed(0)}% acréscimo)");
    acrescimoPercent += 3; // Acréscimo aumenta 3%
  }
}

// 12. Quantidade de Números Primos
void ex12QtdPrimos() {
  print("\n--- Exercício 12: Quantidade de Primos ---");
  int countPrimos = 0;
  for (int i = 1; i <= 10; i++) {
    int num = readInt("Digite o número $i: ");
    if (isPrimo(num)) {
      countPrimos++;
    }
  }
  print("Foram digitados $countPrimos números primos.");
}

// 13. Média de Peso por Faixa Etária
void ex13MediaPesoFaixaEtaria() {
  print("\n--- Exercício 13: Média Peso por Faixa Etária ---");
  double somaPesoF1 = 0; int countF1 = 0; // 1-10
  double somaPesoF2 = 0; int countF2 = 0; // 11-20
  double somaPesoF3 = 0; int countF3 = 0; // 21-30
  double somaPesoF4 = 0; int countF4 = 0; // >30
  
  for (int i = 1; i <= 15; i++) {
    print("--- Pessoa $i ---");
    int idade = readInt("  Idade: ");
    double peso = readDouble("  Peso (kg): ");
    
    if (idade <= 10) { somaPesoF1 += peso; countF1++; }
    else if (idade <= 20) { somaPesoF2 += peso; countF2++; }
    else if (idade <= 30) { somaPesoF3 += peso; countF3++; }
    else { somaPesoF4 += peso; countF4++; }
  }
  
  print("\n--- Média de Peso por Faixa ---");
  print("Faixa 1 (1-10 anos): ${countF1 > 0 ? (somaPesoF1 / countF1).toStringAsFixed(2) : 'N/A'} kg");
  print("Faixa 2 (11-20 anos): ${countF2 > 0 ? (somaPesoF2 / countF2).toStringAsFixed(2) : 'N/A'} kg");
  print("Faixa 3 (21-30 anos): ${countF3 > 0 ? (somaPesoF3 / countF3).toStringAsFixed(2) : 'N/A'} kg");
  print("Faixa 4 (>30 anos): ${countF4 > 0 ? (somaPesoF4 / countF4).toStringAsFixed(2) : 'N/A'} kg");
}

// 14. Pesquisa de Cinema
void ex14PesquisaCinema() {
  print("\n--- Exercício 14: Pesquisa de Cinema ---");
  double somaIdadeOtimo = 0;
  int countOtimo = 0;
  int countRegular = 0;
  int countBom = 0;
  int totalPessoas = 15;
  
  for (int i = 1; i <= totalPessoas; i++) {
    print("--- Espectador $i ---");
    int idade = readInt("  Idade: ");
    print("  Opinião: 3-Ótimo, 2-Bom, 1-Regular");
    int opiniao = readInt("  Opinião: ");
    
    if (opiniao == 3) {
      somaIdadeOtimo += idade;
      countOtimo++;
    } else if (opiniao == 1) {
      countRegular++;
    } else if (opiniao == 2) {
      countBom++;
    }
  }
  
  print("\n--- Resultados ---");
  if (countOtimo > 0) {
    print("Média idade (Ótimo): ${(somaIdadeOtimo / countOtimo).toStringAsFixed(1)} anos");
  } else {
    print("Ninguém votou 'Ótimo'.");
  }
  print("Qtd. (Regular): $countRegular");
  print("% (Bom): ${(countBom / totalPessoas * 100).toStringAsFixed(1)}%");
}

// 15. Pesquisa de Mercado (S/N)
void ex15PesquisaMercado() {
  print("\n--- Exercício 15: Pesquisa de Mercado (S/N) ---");
  int countSim = 0;
  int countNao = 0;
  int countMulherSim = 0;
  int countHomemNao = 0;
  int countHomemTotal = 0;
  
  for (int i = 1; i <= 10; i++) {
    print("--- Pessoa $i ---");
    String sexo = readString("  Sexo (M/F): ");
    String resp = readString("  Gostou? (S/N): ");
    
    if (resp == 'S') {
      countSim++;
      if (sexo == 'F') {
        countMulherSim++;
      }
    } else if (resp == 'N') {
      countNao++;
      if (sexo == 'M') {
        countHomemNao++;
      }
    }
    
    if (sexo == 'M') {
      countHomemTotal++;
    }
  }
  
  print("\n--- Resultados ---");
  print("Qtd. 'Sim': $countSim");
  print("Qtd. 'Não': $countNao");
  print("Qtd. Mulheres 'Sim': $countMulherSim");
  
  if (countHomemTotal > 0) {
    print("% Homens 'Não' (entre os homens): ${(countHomemNao / countHomemTotal * 100).toStringAsFixed(1)}%");
  } else {
    print("Nenhum homem participou da pesquisa.");
  }
}

// 16. Audiência de TV
void ex16AudienciaTV() {
  print("\n--- Exercício 16: Audiência de TV ---");
  int c4 = 0, c5 = 0, c7 = 0, c12 = 0;
  int totalEspectadores = 0;
  
  while (true) {
    int canal = readInt("Digite o canal (4, 5, 7, 12) ou 0 para sair: ");
    if (canal == 0) break;
    
    int espectadores = readInt("  Digite o N° de espectadores: ");
    totalEspectadores += espectadores;
    
    switch (canal) {
      case 4: c4 += espectadores; break;
      case 5: c5 += espectadores; break;
      case 7: c7 += espectadores; break;
      case 12: c12 += espectadores; break;
      default:
        print("Canal inválido, ignorando.");
        totalEspectadores -= espectadores; // Remove espectadores inválidos da contagem
    }
  }
  
  if (totalEspectadores > 0) {
    print("\n--- Relatório de Audiência ---");
    print("Canal 4: ${(c4 / totalEspectadores * 100).toStringAsFixed(1)}%");
    print("Canal 5: ${(c5 / totalEspectadores * 100).toStringAsFixed(1)}%");
    print("Canal 7: ${(c7 / totalEspectadores * 100).toStringAsFixed(1)}%");
    print("Canal 12: ${(c12 / totalEspectadores * 100).toStringAsFixed(1)}%");
  } else {
    print("Nenhum dado de audiência inserido.");
  }
}

// 17. Pesquisa de Habitantes
void ex17PesquisaHabitantes() {
  print("\n--- Exercício 17: Pesquisa de Habitantes ---");
  double somaSalario = 0;
  int countPessoas = 0;
  int maxIdade = -1;
  int minIdade = 9999;
  int countMulherSalario200 = 0;
  
  double minSalario = double.maxFinite;
  int idadeMinSalario = 0;
  String sexoMinSalario = '';
  
  while (true) {
    int idade = readInt("Digite a idade (ou negativa para sair): ");
    if (idade < 0) break;
    
    String sexo = readString("  Sexo (M/F): ");
    double salario = readDouble("  Salário: R\$ ");
    
    somaSalario += salario;
    countPessoas++;
    
    if (idade > maxIdade) maxIdade = idade;
    if (idade < minIdade) minIdade = idade;
    
    if (sexo == 'F' && salario <= 200) {
      countMulherSalario200++;
    }
    
    if (salario < minSalario) {
      minSalario = salario;
      idadeMinSalario = idade;
      sexoMinSalario = sexo;
    }
  }
  
  if (countPessoas > 0) {
    print("\n--- Resultados da Pesquisa ---");
    print("Média Salarial: R\$ ${(somaSalario / countPessoas).toStringAsFixed(2)}");
    print("Maior Idade: $maxIdade");
    print("Menor Idade: $minIdade");
    print("Qtd. Mulheres (Salário <= R\$200): $countMulherSalario200");
    print("Pessoa com Menor Salário (R\$ ${minSalario.toStringAsFixed(2)}):");
    print("  Idade: $idadeMinSalario");
    print("  Sexo: $sexoMinSalario");
  } else {
    print("Nenhum dado inserido.");
  }
}

// 18. Pesquisa de Audiência (Duplicata do 16)
void ex18AudienciaTVRepetido() {
  print("\n--- Exercício 18: Audiência de TV (Repetido) ---");
  print("Este exercício (18) é uma duplicata do 16 no PDF.");
  ex16AudienciaTV();
}

// 19. Lucro com Ações
void ex19Acoes() {
  print("\n--- Exercício 19: Lucro com Ações ---");
  int countLucro1000 = 0;
  int countLucro200 = 0;
  double lucroTotalEmpresa = 0;
  
  while (true) {
    String tipo = readString("Digite o tipo da ação (ou 'F' para finalizar): ");
    if (tipo == 'F') break;
    
    double precoCompra = readDouble("  Preço de Compra: R\$ ");
    double precoVenda = readDouble("  Preço de Venda: R\$ ");
    
    double lucroAcao = precoVenda - precoCompra;
    lucroTotalEmpresa += lucroAcao;
    
    if (lucroAcao > 0) {
      print("  Lucro da ação $tipo: R\$ ${lucroAcao.toStringAsFixed(2)}");
      if (lucroAcao > 1000) countLucro1000++;
      if (lucroAcao < 200) countLucro200++;
    } else {
      print("  Prejuízo da ação $tipo: R\$ ${lucroAcao.toStringAsFixed(2)}");
    }
  }
  
  print("\n--- Relatório Final ---");
  print("Qtd. ações com lucro > R\$ 1000.00: $countLucro1000");
  print("Qtd. ações com lucro < R\$ 200.00 (mas > 0): $countLucro200");
  print("Lucro total da empresa: R\$ ${lucroTotalEmpresa.toStringAsFixed(2)}");
}

// 20. Menu (Média Aritmética / Ponderada)
void ex20MenuMedias() {
  print("\n--- Exercício 20: Menu de Médias ---");
  
  while (true) {
    print("\nMenu de Opções:");
    print("1. Média Aritmética");
    print("2. Média Ponderada");
    print("3. Sair");
    int op = readInt("Digite a opção: ");
    
    if (op == 1) {
      double n1 = readDouble("  Nota 1: ");
      double n2 = readDouble("  Nota 2: ");
      print("  Média Aritmética: ${((n1 + n2) / 2).toStringAsFixed(2)}");
    } else if (op == 2) {
      double n1 = readDouble("  Nota 1: ");
      double p1 = readDouble("  Peso 1: ");
      double n2 = readDouble("  Nota 2: ");
      double p2 = readDouble("  Peso 2: ");
      double n3 = readDouble("  Nota 3: ");
      double p3 = readDouble("  Peso 3: ");
      double mediaPond = (n1*p1 + n2*p2 + n3*p3) / (p1 + p2 + p3);
      print("  Média Ponderada: ${mediaPond.toStringAsFixed(2)}");
    } else if (op == 3) {
      print("Saindo do menu.");
      break;
    } else {
      print("Opção inválida.");
    }
  }
}

// 21. Eleição Presidencial
void ex21Eleicao() {
  print("\n--- Exercício 21: Eleição Presidencial ---");
  int c1=0, c2=0, c3=0, c4=0, nulo=0, branco=0;
  int totalVotos = 0;
  
  while (true) {
    print("Candidatos: 1, 2, 3, 4 | 5-Nulo | 6-Branco");
    int voto = readInt("Digite seu voto (ou 0 para encerrar): ");
    
    if (voto == 0) break;
    
    totalVotos++;
    switch (voto) {
      case 1: c1++; break;
      case 2: c2++; break;
      case 3: c3++; break;
      case 4: c4++; break;
      case 5: nulo++; break;
      case 6: branco++; break;
      default:
        print("Voto inválido, não será computado.");
        totalVotos--;
    }
  }
  
  if (totalVotos > 0) {
    print("\n--- Resultados da Eleição ---");
    print("Total de votos: $totalVotos");
    print("Candidato 1: $c1 votos");
    print("Candidato 2: $c2 votos");
    print("Candidato 3: $c3 votos");
    print("Candidato 4: $c4 votos");
    print("Nulos: $nulo votos");
    print("Brancos: $branco votos");
    print("\n% Nulos sobre o total: ${(nulo / totalVotos * 100).toStringAsFixed(1)}%");
    print("% Brancos sobre o total: ${(branco / totalVotos * 100).toStringAsFixed(1)}%");
  } else {
    print("Nenhum voto computado.");
  }
}

// 22. Média de Altura (Idade > 50)
void ex22MediaAltura() {
  print("\n--- Exercício 22: Média de Altura (Idade > 50) ---");
  double somaAltura50 = 0;
  int countAltura50 = 0;
  
  while (true) {
    int idade = readInt("Digite a idade (ou <= 0 para sair): ");
    if (idade <= 0) break;
    double altura = readDouble("  Digite a altura (m): ");
    
    if (idade > 50) {
      somaAltura50 += altura;
      countAltura50++;
    }
  }
  
  if (countAltura50 > 0) {
    print("Média de altura (Pessoas > 50 anos): ${(somaAltura50 / countAltura50).toStringAsFixed(2)} m");
  } else {
    print("Nenhuma pessoa com mais de 50 anos registrada.");
  }
}

// 23. Menu RH
void ex23MenuRH() {
  print("\n--- Exercício 23: Menu RH ---");
  
  while (true) {
    print("\nMenu de Opções:");
    print("1. Novo Salário");
    print("2. Férias");
    print("3. Décimo Terceiro");
    print("4. Sair");
    int op = readInt("Digite a opção: ");
    
    if (op == 4) {
      print("Saindo do menu.");
      break;
    }
    
    double salario;
    
    switch (op) {
      case 1:
        salario = readDouble("  Digite o salário: R\$ ");
        double reajuste;
        if (salario <= 210) {reajuste = 0.15;}
        else if (salario <= 600) {reajuste = 0.10;}
        else {reajuste = 0.05;}
        print("  Novo salário: R\$ ${(salario * (1 + reajuste)).toStringAsFixed(2)}");
        break;
      case 2:
        salario = readDouble("  Digite o salário: R\$ ");
        print("  Valor das férias: R\$ ${(salario + (salario / 3)).toStringAsFixed(2)}");
        break;
      case 3:
        salario = readDouble("  Digite o salário: R\$ ");
        int meses = readInt("  N° de meses trabalhados (max 12): ");
        if (meses < 0 || meses > 12) {
          print("Número de meses inválido.");
        } else {
          print("  Décimo terceiro: R\$ ${(salario * meses / 12).toStringAsFixed(2)}");
        }
        break;
      default:
        print("Opção inválida.");
    }
  }
}

// 24. Maior e Menor Valor
void ex24MaiorMenor() {
  print("\n--- Exercício 24: Maior e Menor Valor ---");
  double maior = 0;
  double menor = 0;
  int count = 0;
  
  while (true) {
    double num = readDouble("Digite um N° positivo (0 para sair, negativos são ignorados): ");
    if (num == 0) break;
    if (num < 0) {
      print(" (Ignorando número negativo)");
      continue;
    }
    
    if (count == 0) {
      // Define o primeiro número válido como maior e menor
      maior = num;
      menor = num;
    } else {
      if (num > maior) maior = num;
      if (num < menor) menor = num;
    }
    count++;
  }
  
  if (count > 0) {
    print("Maior número digitado: $maior");
    print("Menor número digitado: $menor");
  } else {
    print("Nenhum número positivo foi digitado.");
  }
}

// 25. Investimentos Banco
void ex25InvestimentosBanco() {
  print("\n--- Exercício 25: Investimentos Banco ---");
  double totalInvestido = 0;
  double totalJuros = 0;
  
  while (true) {
    int codigo = readInt("Digite o código do cliente (ou <= 0 para sair): ");
    if (codigo <= 0) break;
    
    print("  Tipo: 1-Poupança (1.5%), 2-Poupança Plus (2%), 3-Renda Fixa (4%)");
    int tipo = readInt("  Digite o tipo de investimento: ");
    double valor = readDouble("  Digite o valor investido: R\$ ");
    
    totalInvestido += valor;
    double rendimento = 0;
    
    if (tipo == 1) {rendimento = valor * 0.015;}
    else if (tipo == 2) {rendimento = valor * 0.02;}
    else if (tipo == 3) {rendimento = valor * 0.04;}
    else {print("  Tipo inválido, sem rendimento.");}
    
    totalJuros += rendimento;
    print("  Rendimento mensal: R\$ ${rendimento.toStringAsFixed(2)}");
  }
  
  print("\n--- Relatório Final Banco ---");
  print("Total Investido: R\$ ${totalInvestido.toStringAsFixed(2)}");
  print("Total de Juros Pagos: R\$ ${totalJuros.toStringAsFixed(2)}");
}


// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01Ordenacao,
  2: ex02LucroTeatro,
  3: ex03FaixaEtaria,
  4: ex04Tabuada,
  5: ex05Tabuadas1a10,
  6: ex06TransacoesLoja,
  7: ex07AnalisePessoas,
  8: ex08AnaliseDetalhada,
  9: ex09Analise10Pessoas,
  10: ex10ParesPrimos,
  11: ex11CompraCarro,
  12: ex12QtdPrimos,
  13: ex13MediaPesoFaixaEtaria,
  14: ex14PesquisaCinema,
  15: ex15PesquisaMercado,
  16: ex16AudienciaTV,
  17: ex17PesquisaHabitantes,
  18: ex18AudienciaTVRepetido,
  19: ex19Acoes,
  20: ex20MenuMedias,
  21: ex21Eleicao,
  22: ex22MediaAltura,
  23: ex23MenuRH,
  24: ex24MaiorMenor,
  25: ex25InvestimentosBanco,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 5 ---");
    print("Por favor, escolha um exercício (1-25) para executar.");
    
    // Lista de exercícios
    print("1. Ordenação de Grupos (A,B,C,D)");
    print("2. Lucro do Teatro");
    print("3. Faixa Etária (8 pessoas)");
    print("4. Tabuada");
    print("5. Tabuadas de 1 a 10");
    print("6. Transações da Loja (Vista/Prazo)");
    print("7. Análise de 5 Pessoas");
    print("8. Análise Detalhada (6 pessoas)");
    print("9. Análise (10 pessoas)");
    print("10. Soma Pares e Primos");
    print("11. Compra de Carro (Parcelas)");
    print("12. Quantidade de Primos");
    print("13. Média Peso por Faixa Etária");
    print("14. Pesquisa de Cinema (Opinião)");
    print("15. Pesquisa de Mercado (S/N)");
    print("16. Audiência de TV");
    print("17. Pesquisa de Habitantes");
    print("18. Audiência de TV (Repetido do 16)");
    print("19. Lucro com Ações");
    print("20. Menu (Média Arit/Pond)");
    print("21. Eleição Presidencial");
    print("22. Média de Altura (Idade > 50)");
    print("23. Menu RH (Salário/Férias/13º)");
    print("24. Maior e Menor Valor");
    print("25. Investimentos Banco");
    
    print("0. Sair");

    int escolha = readInt("\nDigite sua opção: ");
    print(escolha);
    if (escolha == 0) {
      print("Encerrando programa. Até logo!");
      break;
    }
    // Verifica se a escolha está no mapa e a executa
    if (exercicios.containsKey(escolha)) {exercicios[escolha]!();} // Chama a função correspondente
    else {print("Opção inválida. Por favor, tente novamente.");}
    print("\n-----------------------------------------");
    print("Pressione Enter para voltar ao menu...");
    stdin.readLineSync();
  }
}