import 'dart:io';
import 'dart:math';

import 'package:dart_teste/cap03.dart';

// Lê um texto (String) e converte para maiúsculas
String readString(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()?.toUpperCase() ?? '';
}

// --- EXERCÍCIOS PROPOSTOS (Capítulo 4) ---

// 1. Média e Aprovação
void ex01MediaAprovacao() {
  print("\n--- Exercício 1: Média e Aprovação ---");
  double n1 = readDouble("Digite a nota 1: ");
  if (n1 < 0 || n1 > 10){print("O valor tem que ser de 0 a 10");}
  double n2 = readDouble("Digite a nota 2: ");
  if (n2 < 0 || n2 > 10){print("O valor tem que ser de 0 a 10");}
  double n3 = readDouble("Digite a nota 3: ");
  if (n3 < 0 || n3 > 10){print("O valor tem que ser de 0 a 10");}
  double n4 = readDouble("Digite a nota 4: ");
  if (n4 < 0 || n4 > 10){print("O valor tem que ser de 0 a 10");}
  double media = (n1 + n2 + n3 + n4) / 4;
  print("Média: ${media.toStringAsFixed(2)}");
  if (media >= 7) {
    print("Situação: Aprovado");
  } else {
    print("Situação: Reprovado");
  }
}

// 2. Média e Conceito
void ex02MediaConceito() {
  print("\n--- Exercício 2: Média e Conceito ---");
  double n1 = readDouble("Digite a nota 1: ");
  if (n1 < 0 || n1 > 10){print("O valor tem que ser de 0 a 10");}
  double n2 = readDouble("Digite a nota 2: ");
  if (n2 < 0 || n2 > 10){print("O valor tem que ser de 0 a 10");}
  double media = (n1 + n2) / 2;
  print("Média: ${media.toStringAsFixed(2)}");
  if (media >= 7) {
    print("Mensagem: Aprovado");
  } else if (media >= 3) {
    print("Mensagem: Exame");
  } else {
    print("Mensagem: Reprovado");
  }
}

// 3. Mostrar o Menor
void ex03MenorNumero() {
  print("\n--- Exercício 3: Mostrar o Menor ---");
  double n1 = readDouble("Digite o número 1: ");
  double n2 = readDouble("Digite o número 2: ");
  if (n1 < n2) {
    print("O menor número é: $n1");
  } else if (n2 < n1) {
    print("O menor número é: $n2");
  } else {
    print("Os números são iguais.");
  }
}

// 4. Mostrar o Maior
void ex04MaiorNumero() {
  print("\n--- Exercício 4: Mostrar o Maior ---");
  double n1 = readDouble("Digite o número 1: ");
  double n2 = readDouble("Digite o número 2: ");
  double n3 = readDouble("Digite o número 3: ");
  double maior = max(n1, max(n2, n3));
  // List maior = [n1, n2, n3].reduce(max); outra forma de fazer
  // reduce pega da esquerda para a direita aplicando a função max, para ir comparando os valores
  print("O maior número é: $maior");
}

// 5. Menu de Operações 1
void ex05MenuOperacoes1() {
  print("\n--- Exercício 5: Menu de Operações 1 ---");
  double n1 = readDouble("Digite o número 1: ");
  double n2 = readDouble("Digite o número 2: ");
  double n3 = readDouble("Digite o número 3: ");

  print("Escolha a operação:");
  print("1. Média entre os números");
  print("2. Diferença do maior pelo menor");
  print("3. Produto dos números");
  print("4. Divisão do primeiro pelo segundo");
  int op = readInt("Opção: ");

  switch (op) {
    case 1:
      double media = (n1 + n2 + n3) / 3;
      print("Média: ${media.toStringAsFixed(2)}");
      break;
    case 2:
      double maior = max(n1, max(n2, n3));
      double menor = min(n1, min(n2, n3));
      print("Diferença (Maior - Menor): ${maior - menor}");
      break;
    case 3:
      print("Produto: ${n1 * n2 * n3}");
      break;
    case 4:
      if (n2 == 0) {
        print("Erro: Divisão por zero.");
      } else {
        print("Divisão (N1 / N2): ${n1 / n2}");
      }
      break;
    default:
      print("Opção inválida.");
  }
}

// 6. Menu de Operações 2
void ex06MenuOperacoes2() {
  print("\n--- Exercício 6: Menu de Operações 2 ---");
  double n1 = readDouble("Digite o número 1: ");
  double n2 = readDouble("Digite o número 2: ");

  print("Escolha a operação:");
  print("1. O primeiro número elevado ao segundo");
  print("2. Raiz quadrada de cada um dos números");
  print("3. Raiz cúbica de cada um dos números");
  int op = readInt("Opção: ");

  switch (op) {
    case 1:
      print("$n1 elevado a $n2 = ${pow(n1, n2)}"); // pow pega o valor da base e eleva à potência do expoente, (n1 é a base e n2 o expoente)
      break;
    case 2:
      print("Raiz quadrada de $n1: ${sqrt(n1).toStringAsFixed(2)}");
      print("Raiz quadrada de $n2: ${sqrt(n2).toStringAsFixed(2)}");
      break;
    case 3:
      print("Raiz cúbica de $n1: ${pow(n1, 1 / 3).toStringAsFixed(2)}");
      print("Raiz cúbica de $n2: ${pow(n2, 1 / 3).toStringAsFixed(2)}");
      break;
    default:
      print("Opção inválida.");
  }
}

// 7. Aumento Salarial (30%)
void ex07AumentoSalario30() {
  print("\n--- Exercício 7: Aumento Salarial 30% ---");
  double salario = readDouble("Digite o salário: R\$ ");
  if (salario < 500) {
    double novoSalario = salario * 1.30;
    print("Novo salário (com 30% de aumento): R\$ ${novoSalario.toStringAsFixed(2)}");
  } else {
    print("O funcionário não tem direito ao aumento.");
  }
}

// 8. Reajuste Salarial (Tabela)
void ex08ReajusteSalarioTabela() {
  print("\n--- Exercício 8: Reajuste Salarial (Tabela) ---");
  double salario = readDouble("Digite o salário: R\$ ");
  if (salario < 0){print("O valor não pode ser negativo");}
  double reajuste;
  if (salario <= 300) {
    reajuste = salario * 0.35;
  } else {
    reajuste = salario * 0.15;
  }
  print("Salário reajustado: R\$ ${(salario + reajuste).toStringAsFixed(2)}");
}

// 9. Crédito Bancário
void ex09CreditoBancario() {
  print("\n--- Exercício 9: Crédito Bancário ---");
  double saldoMedio = readDouble("Digite o saldo médio: R\$ ");
  if (saldoMedio < 0){print("O valor não pode ser negativo");}
  double credito;
  if (saldoMedio > 400) {credito = saldoMedio * 0.30;} 
  else if (saldoMedio > 300) {credito = saldoMedio * 0.25;} 
  else if (saldoMedio > 200) {credito = saldoMedio * 0.20;} 
  else {credito = saldoMedio * 0.10;}
  print("Saldo médio: R\$ ${saldoMedio.toStringAsFixed(2)}");
  print("Valor do crédito: R\$ ${credito.toStringAsFixed(2)}");
}

// 10. Preço do Carro
void ex10PrecoCarro() {
  print("\n--- Exercício 10: Preço do Carro ---");
  double custoFabrica = readDouble("Digite o custo de fábrica: R\$ ");
  if (custoFabrica < 0){print("O valor não pode ser negativo");}
  double dist, imp;
  if (custoFabrica <= 12000) {
    dist = custoFabrica * 0.05;
    imp = 0;
  } else if (custoFabrica <= 25000) {
    dist = custoFabrica * 0.10;
    imp = custoFabrica * 0.15;
  } else {
    dist = custoFabrica * 0.15;
    imp = custoFabrica * 0.20;
  }
  double precoFinal = custoFabrica + dist + imp;
  print("Custo ao consumidor: R\$ ${precoFinal.toStringAsFixed(2)}");
}

// 11. Aumento e Novo Salário (Tabela)
void ex11AumentoSalarioTabela() {
  print("\n--- Exercício 11: Novo Salário (Tabela) ---");
  double salario = readDouble("Digite o salário atual: R\$ ");
  if (salario < 0){print("O valor não pode ser negativo");}
  double aumento;
  if (salario <= 300) {aumento = salario * 0.50;}
  else if (salario <= 500){aumento = salario * 0.40;}
  else if (salario <= 700) {aumento = salario * 0.30;}
  else if (salario <= 800) {aumento = salario * 0.20;}
  else if (salario <= 1000) {aumento = salario * 0.10;}
  else {aumento = salario * 0.05;}
  
  print("Novo salário: R\$ ${(salario + aumento).toStringAsFixed(2)}");
}

// 12. Salário a Receber (Tabela)
void ex12SalarioAReceber() {
  print("\n--- Exercício 12: Salário a Receber (Tabela) ---");
  double salarioBruto = readDouble("Digite o salário bruto: R\$ ");
  if (salarioBruto < 0){print("O valor não pode ser negativo");}
  double grat;
  if (salarioBruto <= 350) {grat = 100;}
  else if (salarioBruto <= 600) {grat = 75;}
  else if (salarioBruto <= 900) {grat = 50;}
  else {grat = 35;}

  double imposto = salarioBruto * 0.07;
  double salReceber = salarioBruto + grat - imposto;
  print("Salário a receber: R\$ ${salReceber.toStringAsFixed(2)}");
}

// 13. Novo Preço e Classificação
void ex13NovoPrecoClassificacao() {
  print("\n--- Exercício 13: Novo Preço e Classificação ---");
  double preco = readDouble("Digite o preço atual: R\$ ");
  if (preco < 0){print("O valor não pode ser negativo");}
  double aumento;
  if (preco <= 50) {aumento = preco * 0.05;}
  else if (preco <= 100) {aumento = preco * 0.10;}
  else {aumento = preco * 0.15;}

  double novoPreco = preco + aumento;
  String classif;

  if (novoPreco <= 80) {classif = "Barato";}
  else if (novoPreco <= 120) {classif = "Normal";}
  else if (novoPreco <= 200) {classif = "Caro";}
  else {classif = "Muito caro";}

  print("Novo preço: R\$ ${novoPreco.toStringAsFixed(2)}");
  print("Classificação: $classif");
}

// 14. Novo Salário 
void ex14NovoSalarioTabela() {
  print("\n--- Exercício 14: Novo Salário (Tabela) ---");

  double salario = readDouble("Digite o salário atual: R\$ ");
  if (salario < 0){print("O valor não pode ser negativo");}
  double aumento;
  if (salario <= 300) {aumento = salario * 0.50;}
  else if (salario <= 500) {aumento = salario * 0.40;}
  else if (salario <= 700) {aumento = salario * 0.30;}
  else if (salario <= 800) {aumento = salario * 0.20;}
  else if (salario <= 1000) {aumento = salario * 0.10;}
  else {aumento = salario * 0.05;}
  
  print("Novo salário: R\$ ${(salario + aumento).toStringAsFixed(2)}");
}

// 15. Investimentos
void ex15Investimentos() {
  print("\n--- Exercício 15: Investimentos ---");
  print("1. Poupança (Rendimento 3%)");
  print("2. Fundos de renda fixa (Rendimento 4%)");
  int tipo = readInt("Digite o tipo de investimento (1 ou 2): ");
  double valor = readDouble("Digite o valor: R\$ ");
  if (valor < 0){print("O valor não pode ser negativo");}
  double rend = 0;

  if (tipo == 1) {
    rend = valor * 0.03;
    print("Valor corrigido (Poupança): R\$ ${(valor + rend).toStringAsFixed(2)}");
  } else if (tipo == 2) {
    rend = valor * 0.04;
    print("Valor corrigido (Renda Fixa): R\$ ${(valor + rend).toStringAsFixed(2)}");
  } else {print("Tipo de investimento inválido.");}
}

// 16. Descontos (Tabela)
void ex16DescontosProduto() {
  print("\n--- Exercício 16: Descontos (Tabela) ---");
  double preco = readDouble("Digite o preço atual: R\$ ");
  if (preco < 0){print("O valor não pode ser negativo");}
  double descPercent;
  
  if (preco <= 30) {descPercent = 0;}
  else if (preco <= 100) {descPercent = 0.10;}
  else {descPercent = 0.15;}

  double valorDesc = preco * descPercent;
  double novoPreco = preco - valorDesc;
  
  print("Desconto: R\$ ${valorDesc.toStringAsFixed(2)}");
  print("Novo Preço: R\$ ${novoPreco.toStringAsFixed(2)}");
}

// 17. Validação de Senha
void ex17ValidacaoSenha() {
  print("\n--- Exercício 17: Validação de Senha ---");
  int senha = readInt("Digite a senha (4531): ");
  if (senha == 4531) {print("Acesso permitido.");} 
  else {print("Acesso negado.");}
}

// 18. Maioridade
void ex18Maioridade() {
  print("\n--- Exercício 18: Maioridade ---");
  int idade = readInt("Digite a idade: ");
  if (idade < 0){print("O valor não pode ser negativo");}
  if (idade >= 18) {print("Maior de idade.");} 
  else {print("Menor de idade.");}
}

// 19. Peso Ideal
void ex19PesoIdeal() {
  print("\n--- Exercício 19: Peso Ideal ---");
  double h = readDouble("Digite a altura (ex: 1.75): ");
  String sexo = readString("Digite o sexo (M/F): ");
  double pesoIdeal = 0;

  if (sexo == 'M') {pesoIdeal = (72.7 * h) - 58;} 
  else if (sexo == 'F') {pesoIdeal = (62.1 * h) - 44.7;} 
  else {
    print("Sexo inválido.");
    return;
  }
  print("Peso ideal: ${pesoIdeal.toStringAsFixed(2)} kg");
}

// 20. Categoria de Nadador
void ex20CategoriaNadador() {
  print("\n--- Exercício 20: Categoria de Nadador ---");
  int idade = readInt("Digite a idade do nadador: ");
  String cat;
  
  if (idade >= 5 && idade <= 7) {cat = "Infantil";}
  else if (idade >= 8 && idade <= 10) {cat = "Juvenil";}
  else if (idade >= 11 && idade <= 15) {cat = "Adolescente";}
  else if (idade >= 16 && idade <= 30) {cat = "Adulto";}
  else if (idade > 30) {cat = "Sênior";}
  else {cat = "Idade inválida para categoria";}
  
  print("Categoria: $cat");
}

// 21. Procedência de Produto
void ex21ProcedenciaProduto() {
  print("\n--- Exercício 21: Procedência de Produto ---");
  double preco = readDouble("Digite o preço: R\$ ");
  int cod = readInt("Digite o código de origem (1-50): ");
  String proc;

  if (cod == 1) {proc = "Sul";}
  else if (cod == 2) {proc = "Norte";}
  else if (cod == 3) {proc = "Leste";}
  else if (cod == 4) {proc = "Oeste";}
  else if (cod == 5 || cod == 6) {proc = "Nordeste";}
  else if (cod >= 7 && cod <= 9) {proc = "Sudeste";}
  else if (cod >= 10 && cod <= 20) {proc = "Centro-oeste";}
  else if (cod >= 21 && cod <= 30) {proc = "Nordeste";}
  else {proc = "Código inválido";}
  
  print("Preço: R\$ ${preco.toStringAsFixed(2)}");
  print("Procedência: $proc");
}

// 22. Grupo de Risco
void ex22GrupoRisco() {
  print("\n--- Exercício 22: Grupo de Risco ---");
  int idade = readInt("Digite a idade: ");
  double peso = readDouble("Digite o peso (kg): ");
  int grupo = 0;

  if (idade < 20) {
    if (peso <= 60) {grupo = 9;}
    else if (peso <= 90) {grupo = 8;}
    else {grupo = 7;}
  } else if (idade <= 50) {
    if (peso <= 60) {grupo = 6;}
    else if (peso <= 90) {grupo = 5;}
    else {grupo = 4;}
  } else {
    if (peso <= 60) {grupo = 3;}
    else if (peso <= 90) {grupo = 2;}
    else {grupo = 1;}
  }
  
  print("Grupo de risco: $grupo");
}

// 23. Nota Fiscal
void ex23NotaFiscal() {
  print("\n--- Exercício 23: Nota Fiscal ---");
  int cod = readInt("Digite o código do produto (1-40): ");
  int qtd = readInt("Digite a quantidade: ");
  double precoUnit;

  if (cod >= 1 && cod <= 10) {precoUnit = 10;}
  else if (cod <= 20) {precoUnit = 15;}
  else if (cod <= 30) {precoUnit = 20;}
  else if (cod <= 40) {precoUnit = 30;}
  else {
    print("Código de produto inválido.");
    return;
  }
  
  double precoTotal = precoUnit * qtd;
  double descPercent;

  if (precoTotal <= 250) {descPercent = 0.05;}
  else if (precoTotal <= 500) {descPercent = 0.10;}
  else {descPercent = 0.15;}
  
  double valorDesc = precoTotal * descPercent;
  double precoFinal = precoTotal - valorDesc;

  print("Preço unitário: R\$ ${precoUnit.toStringAsFixed(2)}");
  print("Preço total da nota: R\$ ${precoTotal.toStringAsFixed(2)}");
  print("Valor do desconto: R\$ ${valorDesc.toStringAsFixed(2)}");
  print("Preço final (com desconto): R\$ ${precoFinal.toStringAsFixed(2)}");
}

// 24. Preço de Produto (Complexo)
void ex24PrecoProdutoComplexo() {
  print("\n--- Exercício 24: Preço de Produto (Complexo) ---");
  double preco = readDouble("Digite o preço: R\$ ");
  print("1-Limpeza, 2-Alimentação, 3-Vestuário");
  int cat = readInt("Digite a categoria (1-3): ");
  String sit = readString("Situação (R-Refrigeração / N-Não): ");

  double aumento;
  if (preco <= 25) {
    if (cat == 1) {aumento = 0.05;}
    else if (cat == 2) {aumento = 0.08;}
    else if (cat == 3) {aumento = 0.10;}
    else { print("Categoria inválida."); return; }
  } else {
    if (cat == 1) {aumento = 0.12;}
    else if (cat == 2) {aumento = 0.15;}
    else if (cat == 3) {aumento = 0.18;}
    else { print("Categoria inválida."); return; }
  }

  double precoAumento = preco + (preco * aumento);
  double imposto;

  if (cat == 2 || sit == 'R') {imposto = 0.05;} 
  else {imposto = 0.08;}

  double valorImposto = precoAumento * imposto;
  double precoFinal = precoAumento - valorImposto;
  String classif;

  if (precoFinal <= 50) {classif = "Barato";}
  else if (precoFinal <= 120) {classif = "Normal";}
  else{ classif = "Caro";}

  print("Valor do aumento: R\$ ${(preco * aumento).toStringAsFixed(2)}");
  print("Valor do imposto: R\$ ${valorImposto.toStringAsFixed(2)}");
  print("Preço final: R\$ ${precoFinal.toStringAsFixed(2)}");
  print("Classificação: $classif");
}

// 25. Gratificação de Natal
void ex25GratificacaoNatal() {
  print("\n--- Exercício 25: Gratificação de Natal ---");
  double heH = readDouble("Digite o N° de horas extras (em horas): ");
  double hfH = readDouble("Digite o N° de horas falta (em horas): ");
  
  // Convertendo H para minutos
  double hMin = (heH * 60) - (2 / 3 * (hfH * 60));
  
  double premio;
  if (hMin > 2400) {premio = 500;}
  else if (hMin > 1800) {premio = 400;}
  else if (hMin > 1200) {premio = 300;}
  else if (hMin >= 600) {premio = 200;}
  else {premio = 100;}

  print("H (Minutos): ${hMin.toStringAsFixed(2)}");
  print("Prêmio de Natal: R\$ ${premio.toStringAsFixed(2)}");
}


// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01MediaAprovacao,
  2: ex02MediaConceito,
  3: ex03MenorNumero,
  4: ex04MaiorNumero,
  5: ex05MenuOperacoes1,
  6: ex06MenuOperacoes2,
  7: ex07AumentoSalario30,
  8: ex08ReajusteSalarioTabela,
  9: ex09CreditoBancario,
  10: ex10PrecoCarro,
  11: ex11AumentoSalarioTabela,
  12: ex12SalarioAReceber,
  13: ex13NovoPrecoClassificacao,
  14: ex14NovoSalarioTabela,
  15: ex15Investimentos,
  16: ex16DescontosProduto,
  17: ex17ValidacaoSenha,
  18: ex18Maioridade,
  19: ex19PesoIdeal,
  20: ex20CategoriaNadador,
  21: ex21ProcedenciaProduto,
  22: ex22GrupoRisco,
  23: ex23NotaFiscal,
  24: ex24PrecoProdutoComplexo,
  25: ex25GratificacaoNatal,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 4 ---");
    print("Por favor, escolha um exercício (1-25) para executar.");
    
    // Lista de exercícios
    print("1. Média e Aprovação");
    print("2. Média e Conceito (Aprov/Exame/Reprov)");
    print("3. Mostrar o Menor (2 números)");
    print("4. Mostrar o Maior (3 números)");
    print("5. Menu de Operações 1 (Média, Dif, Prod, Div)");
    print("6. Menu de Operações 2 (Pot, Raiz Q, Raiz C)");
    print("7. Aumento Salarial 30% (< R\$500)");
    print("8. Reajuste Salarial (Tabela 35%/15%)");
    print("9. Crédito Bancário (Saldo Médio)");
    print("10. Preço do Carro (Impostos/Distribuidor)");
    print("11. Novo Salário (Tabela Múltiplas Faixas)");
    print("12. Salário a Receber (Gratificação/Imposto)");
    print("13. Novo Preço e Classificação (Barato/Caro)");
    print("14. Novo Salário (Tabela p.107 - Idêntico ao 11)");
    print("15. Investimentos (Poupança/Renda Fixa)");
    print("16. Descontos por Preço");
    print("17. Validação de Senha (4531)");
    print("18. Maioridade (>= 18)");
    print("19. Peso Ideal (Altura/Sexo)");
    print("20. Categoria de Nadador (Idade)");
    print("21. Procedência de Produto (Código Origem)");
    print("22. Grupo de Risco (Idade/Peso)");
    print("23. Nota Fiscal (Preço/Desconto)");
    print("24. Preço de Produto (Complexo)");
    print("25. Gratificação de Natal (Horas)");
    
    print("0. Sair");

    int escolha = readInt("\nDigite sua opção: ");
    
    if (escolha == 0) {
      print("Encerrando programa. Até logo!");
      break;
    }
    
    // Verifica se a escolha está no mapa e a executa
    if (exercicios.containsKey(escolha)) {exercicios[escolha]!();} // Chama a função correspondente
    else {print("Opção inválida. Por favor, tente novamente.");}
    
    print("\n----------------------------------------");
    print("Pressione Enter para voltar ao menu...");
    stdin.readLineSync(); // Pausa para o usuário ler a saída
  }
}