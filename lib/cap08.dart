import 'dart:io';
import 'dart:math';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';
import 'package:dart_teste/cap07.dart';

// Lista de meses para Ex 24
const List<String> meses = [
  "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
  "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
];

// --- FUNÇÕES AUXILIARES (Sub-rotinas) DO CAPÍTULO 8 ---

/// Ex 1: Retorna a soma dos N primeiros números.
int cap8CalcularSoma(int n) {
  if (n <= 0) return 0;
  int soma = 0;
  for (int i = 1; i <= n; i++) {
    soma += i;
  }
  return soma;
}

/// Ex 2: Retorna o total de segundos.
int cap8ConverterSegundos(int h, int m, int s) {
  return (h * 3600) + (m * 60) + s;
}

/// Ex 3: Retorna 1 se o primeiro for divisível pelo segundo, 0 c.c.
int cap8VerificarDivisivel(int n1, int n2) {
  if (n2 == 0) return 0; // Evita divisão por zero
  return (n1 % n2 == 0) ? 1 : 0;
}

/// Ex 4: Retorna o volume da esfera.
double cap8CalcularVolume(double raio) {
  return (4 / 3) * pi * pow(raio, 3);
}

/// Ex 5: Retorna P se positivo, N se negativo.
String cap8VerificarPositivoNegativo(int n) {
  return (n >= 0) ? "P" : "N"; // Considerando 0 como Positivo
}

/// Ex 6: Retorna o peso ideal.
double cap8CalcularPesoIdeal(double altura, String sexo) {
  if (sexo == 'M') {
    return (72.7 * altura) - 58;
  } else if (sexo == 'F') {
    return (62.1 * altura) - 44.7;
  } else {
    print("Sexo inválido. Use 'M' ou 'F'.");
    return 0.0;
  }
}

/// Ex 7: Lê N números e retorna a média.
double cap8CalcularMediaNValores(int n) {
  if (n <= 0) return 0;
  double soma = 0;
  for (int i = 1; i <= n; i++) {
    soma += readDouble("  Digite o $iº valor: ");
  }
  return soma / n;
}

/// Ex 8: Retorna o Fatorial de N.
int cap8CalcularFatorial(int n) {
  if (n < 0) return -1; // Erro
  if (n == 0) return 1;
  int fatorial = 1;
  for (int i = 1; i <= n; i++) {
    fatorial *= i;
  }
  return fatorial;
}

/// Ex 9: Retorna a soma dos divisores de N.
int cap8SomaDivisores(int n) {
  int soma = 0;
  for (int i = 1; i <= n; i++) { // Inclui o próprio N
    if (n % i == 0) {
      soma += i;
    }
  }
  return soma;
}

/// Ex 10: Retorna a soma da série S = 1 + 1/2 + 1/3...
double cap8CalcularSerie1(int n) {
  double soma = 0;
  for (int i = 1; i <= n; i++) {
    soma += 1 / i;
  }
  return soma;
}

/// Ex 11: Retorna a soma da série S = 2/4 + 5/5 + 10/6...
double cap8CalcularSerie2(int n) {
  double soma = 0;
  for (int i = 1; i <= n; i++) {
    double numerador = (i * i) + 1;
    double denominador = i + 3;
    soma += numerador / denominador;
  }
  return soma;
}

/// Ex 12: Retorna X^Z (potência manual).
int cap8PotenciaManual(int x, int z) {
  if (z == 0) return 1;
  int resultado = 1;
  for (int i = 1; i <= z; i++) {
    resultado *= x;
  }
  return resultado;
}

/// Ex 13: Lê 15 salários/filhos e retorna as médias.
Map<String, double> cap8Analisar15Habitantes() {
  double somaSal = 0;
  int somaFilhos = 0;
  int numHabitantes = 15;

  for (int i = 1; i <= numHabitantes; i++) {
    print("--- Habitante $i ---");
    somaSal += readDouble("  Salário: R\$ ");
    somaFilhos += readInt("  N° de Filhos: ");
  }

  return {
    'mediaSal': somaSal / numHabitantes,
    'mediaFilhos': somaFilhos / numHabitantes,
  };
}

/// Ex 14: Separa vetor de 30 em A (<= 0), B (> 0), O (== 0).
void cap8SepararVetores(List<int> vet, List<int> A, List<int> B, List<int> O) {
  A.clear(); B.clear(); O.clear(); // Limpa vetores (caso reutilizados)
  for (int n in vet) {
    if (n < 0) {
      A.add(n);
    } else if (n > 0) {
      B.add(n);
    } else { // n == 0
      O.add(n);
    }
  }
}

/// Ex 15: Retorna a quantidade de pares em um vetor.
int cap8ContarPares(List<int> vet) {
  int count = 0;
  for (int n in vet) {
    if (n % 2 == 0) {
      count++;
    }
  }
  return count;
}

/// Ex 16: Retorna a soma dos elementos de um vetor real.
double cap8SomarVetorReais(List<double> vet) {
  double soma = 0;
  for (double n in vet) {
    soma += n;
  }
  return soma;
}

/// Ex 17: Retorna o MDC (Algoritmo de Euclides).
int cap8CalcularMDC(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

/// Ex 18: (Helper) Verifica se N é primo.
bool cap8VerificarPrimo(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) return false;
  }
  return true;
}

/// Ex 18: (Sub-rotina) Mostra os 3 primeiros primos > 100.
void cap8Mostrar3Primos100() {
  int count = 0;
  int num = 101; // Começa a checar do 101
  print("Os 3 primeiros primos acima de 100 são:");
  while (count < 3) {
    if (cap8VerificarPrimo(num)) {
      print("  $num");
      count++;
    }
    num++;
  }
}

/// Ex 19: Retorna a intersecção de dois vetores.
List<int> cap8Interseccao(List<int> v1, List<int> v2) {
  // Usar Set é a forma mais eficiente em Dart
  Set<int> set1 = v1.toSet();
  Set<int> set2 = v2.toSet();
  return set1.intersection(set2).toList();
}

/// Ex 20: (Sub-rotina) Lê dados da pesquisa (N indeterminado).
Map<String, double> cap8ExecutarPesquisa() {
  double somaSal = 0;
  int somaFilhos = 0;
  int countPessoas = 0;
  double maxSal = 0;
  int countSal380 = 0; // PDF usa 380, não 580

  print("--- Iniciando Pesquisa (Digite salário 0 ou negativo para parar) ---");
  while (true) {
    double sal = readDouble("  Digite o salário: R\$ ");
    if (sal <= 0) break;
    int filhos = readInt("  Digite o N° de filhos: ");

    somaSal += sal;
    somaFilhos += filhos;
    countPessoas++;

    if (sal > maxSal) {
      maxSal = sal;
    }
    if (sal < 380) { // Conforme o print Ex 20 (R$ 380)
      countSal380++;
    }
  }

  if (countPessoas == 0) {
    return { 'mediaSal': 0, 'mediaFilhos': 0, 'maxSal': 0, 'perc380': 0, 'count': 0 };
  }

  double mediaSal = somaSal / countPessoas;
  double mediaFilhos = somaFilhos / countPessoas;
  double perc380 = (countSal380 / countPessoas) * 100;

  return {
    'mediaSal': mediaSal,
    'mediaFilhos': mediaFilhos,
    'maxSal': maxSal,
    'perc380': perc380,
    'count': countPessoas.toDouble()
  };
}

/// Ex 21: (Sub-rotina) Retorna o maior elemento ACIMA da diagonal principal.
double cap8MaiorAcimaDiagonal(List<List<double>> m) {
  if (m.isEmpty) return 0;
  double maxVal = m[0][1]; // Inicia com o primeiro [0][1]
  for (int i = 0; i < m.length; i++) {
    for (int j = 0; j < m[i].length; j++) {
      if (j > i && m[i][j] > maxVal) { // j > i = Acima
        maxVal = m[i][j];
      }
    }
  }
  return maxVal;
}

/// Ex 22: (Sub 1) Lê matriz 10x5.
List<List<double>> cap8LerMatriz10x5() {
  return readDoubleMatrix(10, 5, "Digite os 50 valores da matriz (10x5):");
}

/// Ex 22: (Sub 2) Calcula soma da LINHA 6 (índice 5).
double cap8SomaLinha6(List<List<double>> m) {
  int linha = 5; // Linha 6 é o índice 5
  double soma = 0;
  for (int j = 0; j < 5; j++) { // Percorre as 5 colunas
    soma += m[linha][j];
  }
  return soma;
}

/// Ex 23: (Sub 1) Verifica se forma um triângulo.
bool cap8EhTriangulo(double a, double b, double c) {
  return (a < b + c) && (b < a + c) && (c < a + b);
}

/// Ex 23: (Sub 2) Determina o tipo do triângulo.
String cap8TipoTriangulo(double a, double b, double c) {
  if (a == b && b == c) {
    return "Equilátero";
  } else if (a == b || b == c || a == c) {
    return "Isósceles";
  } else {
    return "Escaleno";
  }
}

/// Ex 24: (Sub 1) Lê as 12 temperaturas.
List<double> cap8LerTemperaturas() {
  List<double> temps = [];
  print("--- Digite as Temperaturas Médias ---");
  for (int i = 0; i < 12; i++) {
    temps.add(readDouble("  Mês ${i + 1} (${meses[i]}): "));
  }
  return temps;
}

/// Ex 24: (Sub 2) Calcula e mostra os resultados (Observação do Ex 24).
void cap8AnalisarTemperaturas(List<double> temps) {
  double soma = 0;
  double maxT = temps[0]; int maxM = 0;
  double minT = temps[0]; int minM = 0;

  for (int i = 0; i < 12; i++) {
    soma += temps[i];
    if (temps[i] > maxT) { maxT = temps[i]; maxM = i; }
    if (temps[i] < minT) { minT = temps[i]; minM = i; }
  }
  double media = soma / 12;

  print("\n--- Resultados da Análise ---");
  print("Média da temperatura anual: ${media.toStringAsFixed(1)}°C");
  print("Maior temperatura: $maxT°C (Mês: ${meses[maxM]})");
  print("Menor temperatura: $minT°C (Mês: ${meses[minM]})");
}

/// Ex 25: (Sub 1) Lê as 4 notas de 10 alunos e retorna as médias.
List<double> cap8LerNotasAlunos() {
  List<double> mediasFinais = [];
  for (int i = 1; i <= 10; i++) {
    print("--- Aluno $i ---");
    double soma = 0;
    for (int j = 1; j <= 4; j++) {
      soma += readDouble("  Digite a $jª nota: ");
    }
    mediasFinais.add(soma / 4);
  }
  return mediasFinais;
}

/// Ex 25: (Sub 2) Calcula a média da classe (vetor de médias).
double cap8CalcularMediaClasse(List<double> mediasFinais) {
  double soma = 0;
  for (double m in mediasFinais) {
    soma += m;
  }
  return soma / mediasFinais.length;
}

/// Ex 25: (Sub 3) Retorna os números dos alunos em recuperação.
List<int> cap8AlunosRecuperacao(List<double> mediasFinais) {
  List<int> alunosRec = [];
  for (int i = 0; i < mediasFinais.length; i++) {
    if (mediasFinais[i] < 6.0) { // Média inferior a 6
      alunosRec.add(i + 1); // Aluno 1, 2, 3...
    }
  }
  return alunosRec;
}


// --- EXERCÍCIOS PROPOSTOS (Capítulo 8 - Pág. 298-300) ---

void ex01() {
  print("\n--- Exercício 1: Soma N Primeiros Números ---");
  int n = readInt("Digite um número N inteiro e positivo: ");
  int soma = cap8CalcularSoma(n);
  print("A soma dos $n primeiros números inteiros é: $soma");
}
void ex02() {
  print("\n--- Exercício 2: Tempo em Segundos ---");
  int h = readInt("  Digite as horas: ");
  int m = readInt("  Digite os minutos: ");
  int s = readInt("  Digite os segundos: ");
  int total = cap8ConverterSegundos(h, m, s);
  print("O total em segundos é: $total s");
}
void ex03() {
  print("\n--- Exercício 3: Verificar Divisível ---");
  int n1 = readInt("  Digite o 1º número: ");
  int n2 = readInt("  Digite o 2º número (divisor): ");
  int res = cap8VerificarDivisivel(n1, n2);
  print("Resultado (1=Divisível, 0=Não): $res");
}
void ex04() {
  print("\n--- Exercício 4: Volume da Esfera ---");
  double raio = readDouble("Digite o raio da esfera: ");
  double volume = cap8CalcularVolume(raio);
  print("O volume da esfera é: ${volume.toStringAsFixed(2)}");
}
void ex05() {
  print("\n--- Exercício 5: Positivo (P) ou Negativo (N) ---");
  int n = readInt("Digite um número inteiro: ");
  String res = cap8VerificarPositivoNegativo(n);
  print("Resultado: $res");
}
void ex06() {
  print("\n--- Exercício 6: Peso Ideal ---");
  double altura = readDouble("Digite a altura (ex: 1.75): ");
  String sexo = readString("Digite o sexo (M/F): ");
  double pesoIdeal = cap8CalcularPesoIdeal(altura, sexo);
  if (pesoIdeal > 0) {
    print("O peso ideal é: ${pesoIdeal.toStringAsFixed(2)} kg");
  }
}
void ex07() {
  print("\n--- Exercício 7: Média de N Valores ---");
  int n = readInt("Quantos valores você vai digitar? ");
  double media = cap8CalcularMediaNValores(n);
  print("A média dos $n valores é: ${media.toStringAsFixed(2)}");
}
void ex08() {
  print("\n--- Exercício 8: Fatorial ---");
  int n = readInt("Digite um número N para o fatorial: ");
  int fat = cap8CalcularFatorial(n);
  if (fat != -1) {
    print("O fatorial de $n é: $fat");
  }
}
void ex09() {
  print("\n--- Exercício 9: Soma dos Divisores ---");
  int n = readInt("Digite um número N: ");
  int soma = cap8SomaDivisores(n);
  print("A soma dos divisores de $n é: $soma");
}
void ex10() {
  print("\n--- Exercício 10: Série S = 1 + 1/2 + 1/3 ... ---");
  int n = readInt("Digite a quantidade de termos (N): ");
  double soma = cap8CalcularSerie1(n);
  print("A soma da série é: ${soma.toStringAsFixed(4)}");
}
void ex11() {
  print("\n--- Exercício 11: Série S = 2/4 + 5/5 + 10/6 ... ---");
  int n = readInt("Digite a quantidade de termos (N): ");
  double soma = cap8CalcularSerie2(n);
  print("A soma da série é: ${soma.toStringAsFixed(4)}");
}
void ex12() {
  print("\n--- Exercício 12: Potência Manual (X^Z) ---");
  int x = readInt("  Digite a base (X): ");
  int z = readInt("  Digite o expoente (Z): ");
  int res = cap8PotenciaManual(x, z);
  print("Resultado: $res");
}
void ex13() {
  print("\n--- Exercício 13: Pesquisa (15 Habitantes) ---");
  Map<String, double> res = cap8Analisar15Habitantes();
  print("Média Salarial: R\$ ${res['mediaSal']!.toStringAsFixed(2)}");
  print("Média de Filhos: ${res['mediaFilhos']!.toStringAsFixed(1)}");
}
void ex14() {
  print("\n--- Exercício 14: Vetor 30 -> A (<=0), B (>0), O (==0) ---");
  List<int> vet = [];
  print("Digite 30 números inteiros:");
  for (int i = 1; i <= 30; i++) {
    vet.add(readInt("  $iº número: "));
  }
  List<int> A = [], B = [], O = [];
  cap8SepararVetores(vet, A, B, O);
  print("Vetor A (<= -1): $A"); // Print diz A (<=0) mas O (==0). Assumindo A (<0)
  print("Vetor B (> 0): $B");
  print("Vetor O (== 0): $O");
}
void ex15() {
  print("\n--- Exercício 15: Contar Pares (Vetor 15) ---");
  List<int> vet = [];
  print("Digite 15 números inteiros:");
  for (int i = 1; i <= 15; i++) {
    vet.add(readInt("  $iº número: "));
  }
  int qtd = cap8ContarPares(vet);
  print("O vetor $vet possui $qtd números pares.");
}
void ex16() {
  print("\n--- Exercício 16: Soma Vetor (Vetor 20 Reais) ---");
  List<double> vet = [];
  print("Digite 20 números reais:");
  for (int i = 1; i <= 20; i++) {
    vet.add(readDouble("  $iº número: "));
  }
  double soma = cap8SomarVetorReais(vet);
  print("A soma dos elementos do vetor é: ${soma.toStringAsFixed(2)}");
}
void ex17() {
  print("\n--- Exercício 17: MDC de 2 Números ---");
  int n1 = readInt("  Digite o 1º número: ");
  int n2 = readInt("  Digite o 2º número: ");
  int mdc = cap8CalcularMDC(n1, n2);
  print("O MDC de $n1 e $n2 é: $mdc");
}
void ex18() {
  print("\n--- Exercício 18: 3 Primos > 100 ---");
  cap8Mostrar3Primos100();
}
void ex19() {
  print("\n--- Exercício 19: Intersecção de Vetores (10x10) ---");
  List<int> v1 = [], v2 = [];
  print("--- Vetor 1 ---");
  for (int i = 1; i <= 10; i++) { v1.add(readInt("  $iº número: ")); }
  print("--- Vetor 2 ---");
  for (int i = 1; i <= 10; i++) { v2.add(readInt("  $iº número: ")); }

  List<int> vI = cap8Interseccao(v1, v2);
  print("Vetor 1: $v1");
  print("Vetor 2: $v2");
  print("Intersecção: $vI");
}
void ex20() {
  print("\n--- Exercício 20: Pesquisa da Prefeitura (N Indet.) ---");
  Map<String, double> res = cap8ExecutarPesquisa();
  print("\n--- Resultados da Pesquisa ---");
  if (res['count'] == 0) {
    print("Nenhum dado inserido.");
  } else {
    print("a) Média de salário: R\$ ${res['mediaSal']!.toStringAsFixed(2)}");
    print("b) Média de filhos: ${res['mediaFilhos']!.toStringAsFixed(1)}");
    print("c) Maior salário: R\$ ${res['maxSal']!.toStringAsFixed(2)}");
    print("d) Percentual (Salário < R\$ 380,00): ${res['perc380']!.toStringAsFixed(1)}%");
  }
}
void ex21() {
  print("\n--- Exercício 21: Maior Acima da Diagonal (10x10) ---");
  var m = readDoubleMatrix(10, 10, "Digite os 100 valores da matriz (10x10):");
  double maior = cap8MaiorAcimaDiagonal(m);
  print("O maior elemento ACIMA da diagonal principal é: $maior");
}
void ex22() {
  print("\n--- Exercício 22: Soma Linha 6 (Matriz 10x5) ---");
  var m = cap8LerMatriz10x5(); // Sub 1
  double soma = cap8SomaLinha6(m); // Sub 2
  print("A soma dos elementos da 6ª linha (índice 5) é: $soma");
}
void ex23() {
  print("\n--- Exercício 23: Análise de Triângulo ---");
  double a = readDouble("  Digite o lado A: ");
  double b = readDouble("  Digite o lado B: ");
  double c = readDouble("  Digite o lado C: ");
  
  if (cap8EhTriangulo(a, b, c)) { // Sub 1
    String tipo = cap8TipoTriangulo(a, b, c); // Sub 2
    print("Os lados formam um triângulo do tipo: $tipo");
  } else {
    print("As medidas informadas NÃO formam um triângulo.");
  }
}
void ex24() {
  print("\n--- Exercício 24: Análise de Temperaturas (12 meses) ---");
  List<double> temps = cap8LerTemperaturas(); // Sub 1
  cap8AnalisarTemperaturas(temps); // Sub 2
}
void ex25() {
  print("\n--- Exercício 25: Notas da Sala (10 Alunos) ---");
  List<double> medias = cap8LerNotasAlunos(); // Sub 1
  double mediaClasse = cap8CalcularMediaClasse(medias); // Sub 2
  List<int> rec = cap8AlunosRecuperacao(medias); // Sub 3
  
  print("\n--- Resultados da Turma ---");
  print("Médias individuais: $medias");
  print("a) Média aritmética da turma: ${mediaClasse.toStringAsFixed(1)}");
  if (rec.isEmpty) {
    print("b) Nenhum aluno em recuperação.");
  } else {
    print("b) Alunos em recuperação (média < 6): $rec");
  }
}


// --- MENU PRINCIPAL ---

// Mapa ligando o número do exercício à sua função
final exercicios = <int, Function>{
  1: ex01,  2: ex02,  3: ex03,  4: ex04,  5: ex05,
  6: ex06,  7: ex07,  8: ex08,  9: ex09,  10: ex10,
  11: ex11, 12: ex12, 13: ex13, 14: ex14, 15: ex15,
  16: ex16, 17: ex17, 18: ex18, 19: ex19, 20: ex20,
  21: ex21, 22: ex22, 23: ex23, 24: ex24, 25: ex25,
};

// Função principal que exibe o menu e gerencia a execução
void main() {
  while (true) {
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 8 (Sub-rotinas) ---");
    print("Por favor, escolha um exercício (1-25) para executar.");

    // Lista de exercícios
    print("1.  Soma N Números              | 14. Vetor 30 -> A, B, O");
    print("2.  Tempo -> Segundos           | 15. Contar Pares (Vetor 15)");
    print("3.  Verificar Divisível         | 16. Soma Vetor (Vetor 20 Reais)");
    print("4.  Volume da Esfera            | 17. MDC de 2 Números");
    print("5.  Positivo (P) ou Negativo (N)| 18. 3 Primos > 100");
    print("6.  Peso Ideal (Sexo/Altura)    | 19. Intersecção de Vetores");
    print("7.  Média de N Valores          | 20. Pesquisa Prefeitura (N Indet.)");
    print("8.  Fatorial                    | 21. Matriz 10x10 (Maior Acima Diag.)");
    print("9.  Soma dos Divisores          | 22. Matriz 10x5 (Soma Linha 6)");
    print("10. Série S = 1 + 1/2...        | 23. Análise Triângulo");
    print("11. Série S = 2/4 + 5/5...      | 24. Análise de Temperaturas (12 meses)");
    print("12. Potência Manual (X^Z)       | 25. Notas da Sala (10 Alunos)");
    print("13. Pesquisa (15 Habitantes)");

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