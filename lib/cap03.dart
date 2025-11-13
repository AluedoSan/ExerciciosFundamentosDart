import 'dart:io';
import 'dart:math';

// --- FUNÇÕES AUXILIARES PARA LEITURA ---

// Função auxiliar para ler um número decimal (double) do console
double readDouble(String prompt) {
  while (true) {
    try {
      stdout.write(prompt);
      String? input = stdin.readLineSync();
      return double.parse(input ?? '0');
    } catch (e) {
      print("Valor inválido. Por favor, digite um número (ex: 12.5).");
    }
  }
}

// Função auxiliar para ler um número inteiro (int) do console
int readInt(String prompt) {
  while (true) {
    try {
      stdout.write(prompt);
      String? input = stdin.readLineSync();
      return int.parse(input ?? '0');
    } catch (e) {
      print("Valor inválido. Por favor, digite um número inteiro (ex: 10).");
    }
  }
}

// --- EXERCÍCIOS PROPOSTOS (Capítulo 3) ---

// 1. Faça um programa que receba dois números, calcule e mostre a subtração.
void ex01Subtracao() {
  print("\n--- Exercício 1: Subtração ---");
  double n1 = readDouble("Digite o primeiro número: ");
  double n2 = readDouble("Digite o segundo número: ");
  print("Resultado da subtração (n1 - n2): ${n1 - n2}");
}

// 2. Faça um programa que receba três números, calcule e mostre a multiplicação.
void ex02Multiplicacao() {
  print("\n--- Exercício 2: Multiplicação ---");
  double n1 = readDouble("Digite o primeiro número: ");
  double n2 = readDouble("Digite o segundo número: ");
  double n3 = readDouble("Digite o terceiro número: ");
  print("Resultado da multiplicação: ${n1 * n2 * n3}");
}

// 3. Faça um programa que receba dois números, calcule e mostre a divisão.
void ex03Divisao() {
  print("\n--- Exercício 3: Divisão ---");
  double n1 = readDouble("Digite o dividendo: ");
  double n2 = readDouble("Digite o divisor: ");
  if (n2 == 0) {
    print("Erro: Divisão por zero não é permitida.");
  } else {
    print("Resultado da divisão (n1 / n2): ${n1 / n2}");
  }
}

// 4. Faça um programa que receba duas notas, calcule e mostre a média ponderada.
void ex04MediaPonderada() {
  print("\n--- Exercício 4: Média Ponderada (Pesos 2 e 3) ---");
  double nota1 = readDouble("Digite a nota 1 (peso 2): ");
  double nota2 = readDouble("Digite a nota 2 (peso 3): ");
  double media = (nota1 * 2 + nota2 * 3) / (2 + 3);
  print("Média Ponderada: ${media.toStringAsFixed(2)}");
}

// 5. Faça um programa que receba o preço de um produto, calcule e mostre o novo preço com 10% de desconto.
void ex05Desconto() {
  print("\n--- Exercício 5: Desconto de 10% ---");
  double preco = readDouble("Digite o preço original: R\$ ");
  double novoPreco = preco * 0.90;
  print("Novo preço com 10% de desconto: R\$ ${novoPreco.toStringAsFixed(2)}");
}

// 6. Um funcionário recebe um salário fixo mais 4% de comissão sobre as vendas.
void ex06Comissao() {
  print("\n--- Exercício 6: Salário com Comissão ---");
  double salarioFixo = readDouble("Digite o salário fixo: R\$ ");
  double valorVendas = readDouble("Digite o valor das vendas: R\$ ");
  double comissao = valorVendas * 0.04;
  double salarioFinal = salarioFixo + comissao;
  print("Comissão (4%): R\$ ${comissao.toStringAsFixed(2)}");
  print("Salário Final: R\$ ${salarioFinal.toStringAsFixed(2)}");
}

// 7. Faça um programa que receba o peso de uma pessoa, calcule e mostre o novo peso.
void ex07Peso() {
  print("\n--- Exercício 7: Novo Peso ---");
  double peso = readDouble("Digite o seu peso (kg): ");
  double pesoEngordar = peso * 1.15; // 15% a mais
  double pesoEmagrecer = peso * 0.80; // 20% a menos
  print("Peso se engordar 15%: ${pesoEngordar.toStringAsFixed(2)} kg");
  print("Peso se emagrecer 20%: ${pesoEmagrecer.toStringAsFixed(2)} kg");
}

// 8. Faça um programa que receba o peso de uma pessoa em quilos, calcule e mostre esse peso em gramas.
void ex08PesoGramas() {
  print("\n--- Exercício 8: Quilos para Gramas ---");
  double pesoKg = readDouble("Digite o peso em quilos (kg): ");
  double pesoG = pesoKg * 1000;
  print("Peso em gramas: ${pesoG.toStringAsFixed(0)} g");
}

// 9. Faça um programa que calcule e mostre a área de um trapézio.
void ex09AreaTrapezio() {
  print("\n--- Exercício 9: Área do Trapézio ---");
  double baseMaior = readDouble("Digite a base maior: ");
  double baseMenor = readDouble("Digite a base menor: ");
  double altura = readDouble("Digite a altura: ");
  double area = ((baseMaior + baseMenor) * altura) / 2;
  print("Área do trapézio: $area");
}

// 10. Faça um programa que calcule e mostre a área de um quadrado.
void ex10AreaQuadrado() {
  print("\n--- Exercício 10: Área do Quadrado ---");
  double lado = readDouble("Digite o lado do quadrado: ");
  double area = lado * lado;
  print("Área do quadrado: $area");
}

// 11. Faça um programa que calcule e mostre a área de um losango.
void ex11AreaLosango() {
  print("\n--- Exercício 11: Área do Losango ---");
  double dMaior = readDouble("Digite a diagonal maior: ");
  double dMenor = readDouble("Digite a diagonal menor: ");
  double area = (dMaior * dMenor) / 2;
  print("Área do losango: $area");
}

// 12. Faça um programa que receba o valor do salário mínimo e o salário de um funcionário.
void ex12SalariosMinimos() {
  print("\n--- Exercício 12: Quantidade de Salários Mínimos ---");
  double salMinimo = readDouble("Digite o valor do salário mínimo: R\$ ");
  double salFunc = readDouble("Digite o salário do funcionário: R\$ ");
  double qtd = salFunc / salMinimo;
  print("O funcionário ganha ${qtd.toStringAsFixed(1)} salários mínimos.");
}

// 13. Faça um programa que calcule e mostre a tabuada de um número digitado.
void ex13Tabuada() {
  print("\n--- Exercício 13: Tabuada ---");
  int num = readInt("Digite um número para ver a tabuada: ");
  print("Tabuada do $num:");
  for (int i = 0; i <= 10; i++) {
    print("$num x $i = ${num * i}");
  }
}

// 14. Faça um programa que receba o ano de nascimento e o ano atual.
void ex14IdadeDetalhada() {
  print("\n--- Exercício 14: Idade Detalhada ---");
  int anoNasc = readInt("Digite o ano de nascimento: ");
  int anoAtual = readInt("Digite o ano atual: ");
  int idadeAnos = anoAtual - anoNasc;
  int idadeMeses = idadeAnos * 12;
  // Usando 365.25 para uma aproximação melhor dos dias
  int idadeDias = (idadeAnos * 365.25).toInt();
  int idadeSemanas = (idadeDias / 7).floor();

  print("a) Idade em Anos: $idadeAnos");
  print("b) Idade em Meses: $idadeMeses");
  print("c) Idade em Dias (aprox.): $idadeDias");
  print("d) Idade em Semanas (aprox.): $idadeSemanas");
}

// 15. João recebeu seu salário e precisa pagar duas contas atrasadas.
void ex15ContasAtrasadas() {
  print("\n--- Exercício 15: Salário Restante (Contas Atrasadas) ---");
  double salario = readDouble("Digite o salário de João: R\$ ");
  double conta1 = readDouble("Digite o valor da conta 1: R\$ ");
  double conta2 = readDouble("Digite o valor da conta 2: R\$ ");
  
  // Multa de 2% sobre cada conta
  double conta1Multa = conta1 * 1.02;
  double conta2Multa = conta2 * 1.02;
  
  double totalPagar = conta1Multa + conta2Multa;
  double restante = salario - totalPagar;
  
  print("Total a pagar (com multas de 2%): R\$ ${totalPagar.toStringAsFixed(2)}");
  print("Restará do salário: R\$ ${restante.toStringAsFixed(2)}");
}

// 16. Faça um programa que receba o valor dos catetos de um triângulo.
void ex16Hipotenusa() {
  print("\n--- Exercício 16: Hipotenusa ---");
  double c1 = readDouble("Digite o cateto 1: ");
  double c2 = readDouble("Digite o cateto 2: ");
  double hip = sqrt(pow(c1, 2) + pow(c2, 2));
  print("A hipotenusa é: ${hip.toStringAsFixed(2)}");
}

// 17. Faça um programa que receba o raio, calcule e mostre (usando as fórmulas do livro).
void ex17Esfera() {
  print("\n--- Exercício 17: Esfera (Usando fórmulas do livro) ---");
  double raio = readDouble("Digite o raio: ");
  double comp = 2 * pi * raio; 
  double area = pi * pow(raio, 2);
  double vol = (3 / 4) * pi * pow(raio, 3);
  
  print("a) Comprimento (C=2*pi*R): ${comp.toStringAsFixed(2)}");
  print("b) Área (A=pi*R^2): ${area.toStringAsFixed(2)}");
  print("c) Volume (V=3/4*pi*R^3): ${vol.toStringAsFixed(2)}");
  
  print("\n(Nota: As fórmulas de 'área' e 'volume' de esfera");
  print("O código usa as fórmulas *exatamente* como pedidas.)");
}

// 18. Faça um programa que receba uma temperatura em Celsius, calcule e mostre em Fahrenheit.
void ex18Temperatura() {
  print("\n--- Exercício 18: Celsius para Fahrenheit ---");
  double c = readDouble("Digite a temperatura em Celsius (°C): ");
  double f = (c * 1.8) + 32;
  print("Temperatura em Fahrenheit: ${f.toStringAsFixed(1)}°F");
}

// 19. Sabe-se que para iluminar ... 18 W por m².
void ex19Iluminacao() {
  print("\n--- Exercício 19: Potência de Iluminação ---");
  double dim1 = readDouble("Digite a primeira dimensão (metros): ");
  double dim2 = readDouble("Digite a segunda dimensão (metros): ");
  double area = dim1 * dim2;
  double potencia = area * 18;
  print("Área do cômodo: ${area.toStringAsFixed(2)} m²");
  print("Potência de iluminação necessária: ${potencia.toStringAsFixed(0)} W");
}

// 20. Faça um programa que receba o ângulo e a distância da parede.
void ex20Escada() {
  print("\n--- Exercício 20: Medida da Escada ---");
  print("Calcular a medida da escada (hipotenusa).");
  double anguloGraus = readDouble("Digite o ângulo (em graus): ");
  double distParede = readDouble("Digite a distância da escada à parede (cateto adjacente): ");
  double anguloRadianos = anguloGraus * (pi / 180);
  double medidaEscada = distParede / cos(anguloRadianos);
  
  print("A medida da escada necessária é: ${medidaEscada.toStringAsFixed(2)}");
}

// 21. Faça um programa que receba ... e calcule o salário a receber.
void ex21SalarioHorasExtras() {
  print("\n--- Exercício 21: Salário com Horas Extras ---");
  double salMinimo = readDouble("Digite o salário mínimo: R\$ ");
  int horasTrab = readInt("Digite o N° de horas trabalhadas: ");
  int horasExt = readInt("Digite o N° de horas extras: ");
  
  double vlrHoraTrab = salMinimo / 8;
  double vlrHoraExt = salMinimo / 4; 
  
  double salBruto = horasTrab * vlrHoraTrab;
  double valReceberExt = horasExt * vlrHoraExt;
  double salReceber = salBruto + valReceberExt; 
  
  print("Valor da Hora Trabalhada: R\$ ${vlrHoraTrab.toStringAsFixed(2)}");
  print("Valor da Hora Extra: R\$ ${vlrHoraExt.toStringAsFixed(2)}");
  print("Salário Bruto: R\$ ${salBruto.toStringAsFixed(2)}");
  print("Valor Horas Extras: R\$ ${valReceberExt.toStringAsFixed(2)}");
  print("Salário Total a Receber: R\$ ${salReceber.toStringAsFixed(2)}");
}

// 22. Faça um programa que receba o número de lados de um polígono convexo.
void ex22DiagonaisPoligono() {
  print("\n--- Exercício 22: Diagonais de um Polígono ---");
  int n = readInt("Digite o número de lados (N): ");
  int nd = (n * (n - 3)) ~/ 2; // ~/ divisão com retorno de número inteiro
  print("Um polígono de $n lados possui $nd diagonais.");
}

// 23. Faça um programa que receba a medida de dois ângulos de um triângulo.
void ex23AngulosTriangulo() {
  print("\n--- Exercício 23: Terceiro Ângulo do Triângulo ---");
  double a1 = readDouble("Digite o primeiro ângulo (graus): ");
  double a2 = readDouble("Digite o segundo ângulo (graus): ");
  double a3 = 180 - a1 - a2;
  print("O terceiro ângulo é: $a3 graus.");
}

// 24. Faça um programa que receba a quantidade de dinheiro em reais.
void ex24ConversaoMoeda() {
  print("\n--- Exercício 24: Conversão de Moeda ---");
  const double cotDolar = 5.20;
  const double cotLibra = 7.90;
  
  double reais = readDouble("Digite o valor em Reais (R\$): ");
  
  double valDolar = reais / cotDolar;
  double valLibra = reais / cotLibra;
  
  print("Valor em Dólar (cotação R\$5.20): \$ ${valDolar.toStringAsFixed(2)}");
  print("Valor em Libra Esterlina (cotação R\$7.90): £ ${valLibra.toStringAsFixed(2)}");
}

// 25. Faça um programa que receba uma hora (uma variável para hora e outra para minutos).
void ex25ConversaoTempo() {
  print("\n--- Exercício 25: Conversão de Tempo ---");
  int h = readInt("Digite as horas: ");
  int m = readInt("Digite os minutos: ");
  
  int horaEmMin = h * 60;
  int totalMin = horaEmMin + m;
  int totalSeg = totalMin * 60; 
  
  print("a) Hora digitada convertida em minutos: $horaEmMin min");
  print("b) Total de minutos: $totalMin min");
  print("c) Total de minutos convertidos em segundos: $totalSeg seg");
}

// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01Subtracao,
  2: ex02Multiplicacao,
  3: ex03Divisao,
  4: ex04MediaPonderada,
  5: ex05Desconto,
  6: ex06Comissao,
  7: ex07Peso,
  8: ex08PesoGramas,
  9: ex09AreaTrapezio,
  10: ex10AreaQuadrado,
  11: ex11AreaLosango,
  12: ex12SalariosMinimos,
  13: ex13Tabuada,
  14: ex14IdadeDetalhada,
  15: ex15ContasAtrasadas,
  16: ex16Hipotenusa,
  17: ex17Esfera,
  18: ex18Temperatura,
  19: ex19Iluminacao,
  20: ex20Escada,
  21: ex21SalarioHorasExtras,
  22: ex22DiagonaisPoligono,
  23: ex23AngulosTriangulo,
  24: ex24ConversaoMoeda,
  25: ex25ConversaoTempo,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 3 ---");
    print("Por favor, escolha um exercício (1-25) para executar.");
    
    // Mostra os títulos dos exercícios de forma organizada
    print("1. Subtração");
    print("2. Multiplicação");
    print("3. Divisão");
    print("4. Média Ponderada");
    print("5. Desconto 10%");
    print("6. Salário com Comissão");
    print("7. Engordar / Emagrecer");
    print("8. Quilos para Gramas");
    print("9. Área do Trapézio");
    print("10. Área do Quadrado");
    print("11. Área do Losango");
    print("12. Qtd. Salários Mínimos");
    print("13. Tabuada");
    print("14. Idade Detalhada");
    print("15. Contas Atrasadas");
    print("16. Hipotenusa");
    print("17. Esfera (Fórmulas do Livro)");
    print("18. Celsius p/ Fahrenheit");
    print("19. Potência de Iluminação");
    print("20. Medida da Escada");
    print("21. Salário com Horas Extras");
    print("22. Diagonais do Polígono");
    print("23. Terceiro Ângulo");
    print("24. Conversão de Moeda");
    print("25. Conversão de Tempo");
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