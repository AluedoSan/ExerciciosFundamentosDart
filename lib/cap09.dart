import 'dart:io';

import 'package:dart_teste/cap03.dart';
import 'package:dart_teste/cap04.dart';

// --- EXERCÍCIOS PROPOSTOS (Capítulo 9 - Pág. 330-332) ---

// 1. Criptografar (Inverter e trocar vogais por #)
void ex01() {
  print("\n--- Exercício 1: Criptografar (Inverter/Vogais) ---");
  String frase = readString("Digite a frase: ");
  
  // 1. Inverter
  String invertida = frase.split('').reversed.join('');
  
  // 2. Trocar vogais (case-insensitive) por #
  String cripto = invertida.replaceAll(RegExp(r'[AEIOU]', caseSensitive: false), '#');
  
  print("Frase original: $frase");
  print("Frase criptografada: $cripto");
}

// 2. Palavra por linha
void ex02() {
  print("\n--- Exercício 2: Palavra por Linha ---");
  String frase = readString("Digite a frase: ");
  
  // trim() remove espaços no início/fim igual o sprit do Python
  // split(RegExp(r'\s+')) divide por um ou MAIS espaços
  List<String> palavras = frase.trim().split(RegExp(r'\s+')); 
  
  print("--- Palavras ---");
  for (String p in palavras) {
    print(p);
  }
}

// 3. Retirar espaços excessivos
void ex03() {
  print("\n--- Exercício 3: Retirar Espaços Excessivos ---");
  String frase = readString("Digite a frase (com espaços extras): ");
  
  String corrigida = frase.trim().replaceAll(RegExp(r'\s+'), ' ');
  
  print("Frase original: '$frase'");
  print("Frase corrigida: '$corrigida'");
}

// 4. Contar palavras
void ex04() {
  print("\n--- Exercício 4: Contar Palavras ---");
  String frase = readString("Digite a frase: ");
  
  if (frase.trim().isEmpty) {
    print("A frase está vazia. Contagem: 0 palavras.");
    return;
  }
  
  List<String> palavras = frase.trim().split(RegExp(r'\s+'));
  print("A frase tem ${palavras.length} palavras.");
}

// 5. Verificar permutação (Anagrama)
void ex05() {
  print("\n--- Exercício 5: Verificar Permutação (Anagrama) ---");
  String s1 = readString("Digite a primeira cadeia: ");
  String s2 = readString("Digite a segunda cadeia: ");
  
  // Helper para ordenar os caracteres da string
  String sortString(String s) => (s.split('')..sort()).join('');
  
  if (sortString(s1) == sortString(s2)) {
    print("'$s1' é uma permutação de '$s2'.");
  } else {
    print("'$s1' NÃO é uma permutação de '$s2'.");
  }
}

// 6. Duplicar caracteres
void ex06() {
  print("\n--- Exercício 6: Duplicar Caracteres ---");
  String frase = readString("Digite a frase: ");
  
  String novaFrase = frase.split('').map((c) => c * 2).join('');
  
  print("Original: $frase");
  print("Nova Frase: $novaFrase");
}

// 7. Contar letras
void ex07() {
  print("\n--- Exercício 7: Contar Letras ---");
  String frase = readString("Digite a frase (com números e símbolos): ");
  
  // Remove tudo que NÃO é letra e conta o resto
  int contagem = frase.replaceAll(RegExp(r'[^A-Za-z]'), '').length;
  
  print("A frase contém $contagem letras.");
}

// 8. Verificar se caractere existe
void ex08() {
  print("\n--- Exercício 8: Verificar Caractere ---");
  String frase = readString("Digite a frase: ");
  String char = readString("Digite o caractere a buscar: ");
  
  if (char.isEmpty) {
    print("Nenhum caractere digitado.");
    return;
  }
  
  if (frase.contains(char[0])) {
    print("O caractere '${char[0]}' FOI encontrado na frase.");
  } else {
    print("O caractere '${char[0]}' NÃO foi encontrado.");
  }
}

// 9. Posição do primeiro caractere (após a primeira vez)
void ex09() {
  print("\n--- Exercício 9: Posição do Primeiro Caractere ---");
  String frase = readString("Digite a frase: ");
  
  if (frase.isEmpty) {
    print("Frase vazia.");
    return;
  }
  
  String primeiroChar = frase[0];
  // Começa a busca a partir do índice 1 (ignora a primeira ocorrência)
  int pos = frase.indexOf(primeiroChar, 1); 
  
  if (pos != -1) {
    print("O caractere '$primeiroChar' aparece novamente no índice $pos.");
  } else {
    print("O caractere '$primeiroChar' não se repete.");
  }
}

// 10. Posição da última aparição
void ex10() {
  print("\n--- Exercício 10: Última Posição do Caractere ---");
  String frase = readString("Digite a frase: ");
  String char = readString("Digite o caractere a buscar: ");
  
  if (char.isEmpty) {
    print("Nenhum caractere digitado.");
    return;
  }
  
  int pos = frase.lastIndexOf(char[0]);
  
  if (pos != -1) {
    print("A última aparição de '${char[0]}' foi no índice $pos.");
  } else {
    print("O caractere '${char[0]}' não foi encontrado.");
  }
}

// 11. Contar ocorrência de palavras
void ex11() {
  print("\n--- Exercício 11: Contar Ocorrência de Palavras ---");
  String frase = readString("Digite a frase: ");
  
  if (frase.trim().isEmpty) {
    print("Frase vazia.");
    return;
  }

  List<String> palavras = frase.trim().split(RegExp(r'\s+'));
  Map<String, int> contagem = {};

  for (String p in palavras) {
    contagem[p] = (contagem[p] ?? 0) + 1;
  }

  print("--- Contagem ---");
  contagem.forEach((palavra, qtd) {
    print("'$palavra' apareceu $qtd vez(es).");
  });
}

// 12. Data por extenso
void ex12() {
  print("\n--- Exercício 12: Data por Extenso ---");
  String data = readString("Digite a data (DD/MM/AAAA): ");
  
  // Lista de meses (índice 0 = null, para facilitar 1=Jan, 2=Fev...)
  const List<String> meses = [
    "", "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
  ];
  
  try {
    List<String> partes = data.split('/');
    int dia = int.parse(partes[0]);
    int mes = int.parse(partes[1]);
    int ano = int.parse(partes[2]);

    if (mes < 1 || mes > 12) {
      print("Mês inválido!");
    } else {
      print("$dia de ${meses[mes]} de $ano");
    }
  } catch (e) {
    print("Formato de data inválido. Use DD/MM/AAAA.");
  }
}

// 13. Repetir subcadeia
void ex13() {
  print("\n--- Exercício 13: Repetir Subcadeia ---");
  String cadeia = readString("Digite a cadeia: ");
  int n = readInt("Digite o número de repetições (ex: 3): ");
  
  String novaCadeia = List.filled(n, cadeia).join(' ');
  print("Nova cadeia: $novaCadeia");
}

// 14. Vogais Maiúsculas, Consoantes Minúsculas
void ex14() {
  print("\n--- Exercício 14: Vogais (Caps) e Consoantes (Low) ---");
  String frase = readString("Digite a frase: ");
  const String vogais = "AEIOU";

  String novaFrase = frase.replaceAllMapped(RegExp(r'[A-Za-z]'), (match) {
    String char = match.group(0)!; // O caractere encontrado
    if (vogais.contains(char.toUpperCase())) {
      return char.toUpperCase();
    } else {
      return char.toLowerCase();
    }
  });

  print("Nova frase: $novaFrase");
}

// 15. Algarismos por extenso
void ex15() {
  print("\n--- Exercício 15: Algarismos por Extenso ---");
  String frase = readString("Digite a frase com números (ex: EU ESTOU NA POLTRONA 5): ");
  
  String novaFrase = frase
    .replaceAll('0', 'zero')
    .replaceAll('1', 'um')
    .replaceAll('2', 'dois')
    .replaceAll('3', 'três')
    .replaceAll('4', 'quatro')
    .replaceAll('5', 'cinco')
    .replaceAll('6', 'seis')
    .replaceAll('7', 'sete')
    .replaceAll('8', 'oito')
    .replaceAll('9', 'nove');
    
  print("Saída: $novaFrase");
}

// 16. Contar letras, números e espaços
void ex16() {
  print("\n--- Exercício 16: Contar Letras, Números e Espaços ---");
  String frase = readString("Digite a frase: ");
  
  int letras = frase.replaceAll(RegExp(r'[^A-Za-z]'), '').length;
  int numeros = frase.replaceAll(RegExp(r'[^0-9]'), '').length;
  // Conta espaços (incluindo múltiplos)
  int espacos = RegExp(r' ').allMatches(frase).length; 
  
  print("Letras: $letras");
  print("Números: $numeros");
  print("Espaços: $espacos");
}

// 17. Criptografia de palavras em pares
void ex17() {
  print("\n--- Exercício 17: Criptografia em Pares ---");
  String frase = readString("Digite a frase (ex: Aula com bola): ");
  List<String> palavras = frase.trim().split(RegExp(r'\s+'));
  List<String> novaLista = [];
  
  // Itera sobre os pares de palavras
  for (int i = 0; i < palavras.length - 1; i += 2) {
    String p1 = palavras[i];
    String p2 = palavras[i + 1];
    
    // Criptografa o par
    String novaP1 = p1[0] + p2[p2.length - 1]; // 1ª letra de P1 + Última de P2
    String novaP2 = p2[0] + p1[p1.length - 1]; // 1ª letra de P2 + Última de P1
    
    novaLista.add(novaP1);
    novaLista.add(novaP2);
  }
  
  // Se houver uma palavra ímpar no final, inverte
  if (palavras.length % 2 != 0) {
    String ultima = palavras.last;
    novaLista.add(ultima.split('').reversed.join(''));
  }
  
  print("Saída: ${novaLista.join(' ')}");
}

// 18. Criptografar 2ª metade com ?
void ex18() {
  print("\n--- Exercício 18: Criptografar 2ª Metade (?) ---");
  String frase = readString("Digite a frase: ");
  List<String> palavras = frase.trim().split(RegExp(r'\s+'));
  List<String> novaLista = [];
  
  for (String p in palavras) {
    int metade = (p.length / 2).ceil(); // Arredonda para cima
    String p1 = p.substring(0, metade);
    String p2 = '?' * (p.length - metade); // O resto
    novaLista.add(p1 + p2);
  }
  
  print("Saída: ${novaLista.join(' ')}");
}

// 19. Criptografia Vogais (a=1, e=2, ...)
void ex19() {
  print("\n--- Exercício 19: Criptografia Vogais (a=1) ---");
  String frase = readString("Digite a frase: ");
  
  // Assume case-sensitive (só minúsculas)
  String cripto = frase
    .replaceAll('a', '1')
    .replaceAll('e', '2')
    .replaceAll('i', '3')
    .replaceAll('o', '4')
    .replaceAll('u', '5');
    
  print("Frase Criptografada: $cripto");
}

// 20. Criptografia ASCII + 1
void ex20() {
  print("\n--- Exercício 20: Criptografia (ASCII + 1) ---");
  String frase = readString("Digite a frase: ");
  String cripto = '';
  
  // Criptografa
  for (int i = 0; i < frase.length; i++) {
    if (frase[i] == ' ') {
      cripto += ' '; // Mantém espaços
    } else {
      cripto += String.fromCharCode(frase.codeUnitAt(i) + 1);
    }
  }
  print("Frase Criptografada: $cripto");

  // Decriptografa
  String decripto = '';
  for (int i = 0; i < cripto.length; i++) {
    if (cripto[i] == ' ') {
      decripto += ' ';
    } else {
      decripto += String.fromCharCode(cripto.codeUnitAt(i) - 1);
    }
  }
  print("Frase Decriptografada: $decripto");
}

// 21. Trocar caractere A por B
void ex21() {
  print("\n--- Exercício 21: Trocar Caractere A por B ---");
  String frase = readString("Digite a frase: ");
  String charA = readString("Digite o caractere a ser trocado: ");
  String charB = readString("Digite o caractere substituto: ");
  
  if (charA.isEmpty || charB.isEmpty) {
    print("É preciso digitar os caracteres.");
    return;
  }
  
  String novaFrase = frase.replaceAll(charA[0], charB[0]);
  print("Nova frase: $novaFrase");
}

// 22. Maior subsequência
void ex22() {
  print("\n--- Exercício 22: Maior Subsequência ---");
  String str = readString("Digite a string (ex: aaaabbbbaaa): ");
  String letra = readString("Digite a letra (ex: b): ");
  
  if (letra.isEmpty) {
    print("Letra inválida.");
    return;
  }

  // Divide a string por qualquer coisa QUE NÃO SEJA a letra
  List<String> subsequencias = str.split(RegExp('[^${letra[0]}]'));
  
  String maior = '';
  for (String s in subsequencias) {
    if (s.length > maior.length) {
      maior = s;
    }
  }
  
  print("Saída: maior $maior, tamanho ${maior.length}");
}

// 23. Contar subcadeia
void ex23() {
  print("\n--- Exercício 23: Contar Subcadeia ---");
  String cadeia = readString("Digite a cadeia (ex: aaassdfffghssiiii): ");
  String sub = readString("Digite a subcadeia (ex: ss): ");
  
  if (sub.isEmpty) {
    print("Subcadeia vazia.");
    return;
  }
  
  int count = RegExp(sub).allMatches(cadeia).length;
  
  print("Saída: a subcadeia aparece $count vez(es) na cadeia.");
}

// 24. Conjugar verbo terminado em ER
void ex24() {
  print("\n--- Exercício 24: Conjugar Verbo (ER) ---");
  String verbo = readString("Digite um verbo regular terminado em ER: ");
  
  if (!verbo.toUpperCase().endsWith('ER')) {
    print("Não é um verbo regular terminado em ER.");
    return;
  }
  
  // Pega o radical (tudo, menos os 2 últimos caracteres)
  String radical = verbo.substring(0, verbo.length - 2);
  
  print("--- Conjugação (Presente) ---");
  print("Eu ${radical}o");
  print("Tu ${radical}es");
  print("Ele ${radical}e");
  print("Nós ${radical}emos");
  print("Vós ${radical}eis");
  print("Eles ${radical}em");
}

// 25. Criptografar (retirar vogais) e Descriptografar
void ex25() {
  print("\n--- Exercício 25: Criptografar (Retirar Vogais) ---");
  String frase = readString("Digite a frase: ");
  
  List<String> vogais = [];
  List<int> posicoes = [];
  String fraseCripto = '';
  const String vogaisCheck = "AEIOUaeiou";

  // 1. Criptografar
  for (int i = 0; i < frase.length; i++) {
    String char = frase[i];
    if (vogaisCheck.contains(char)) {
      vogais.add(char);     // Armazena a vogal
      posicoes.add(i);    // Armazena a posição
      fraseCripto += '*'; // Adiciona um placeholder
    } else {
      fraseCripto += char; // Adiciona a consoante/símbolo
    }
  }
  
  print("\n--- Criptografia ---");
  print("Frase criptografada: $fraseCripto");
  print("Vogais removidas: $vogais");
  print("Posições originais: $posicoes");

  // 2. Descriptografar
  List<String> chars = fraseCripto.split('');
  for (int i = 0; i < vogais.length; i++) {
    chars[posicoes[i]] = vogais[i];
  }
  
  print("\n--- Descriptografia ---");
  print("Frase original: ${chars.join('')}");
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
    print("\n--- MENU DE EXERCÍCIOS - CAPÍTULO 9 (Strings) ---");
    print("Por favor, escolha um exercício (1-25) para executar.");

    // Lista de exercícios
    print("1.  Cripto (Inverter/#)      | 14. Vogal(CAPS)/Consoante(low)");
    print("2.  Palavra por Linha        | 15. Algarismos por Extenso");
    print("3.  Retirar Espaços          | 16. Contar Letras/Números/Espaços");
    print("4.  Contar Palavras          | 17. Cripto (Pares de Palavras)");
    print("5.  Verificar Permutação     | 18. Cripto (2ª Metade com ?)");
    print("6.  Duplicar Caracteres      | 19. Cripto (Vogais por Números)");
    print("7.  Contar Letras            | 20. Cripto (ASCII + 1)");
    print("8.  Verificar Caractere      | 21. Trocar Caractere A por B");
    print("9.  Posição 1º Char (Repete) | 22. Maior Subsequência");
    print("10. Última Posição Char      | 23. Contar Subcadeia");
    print("11. Contar Ocorrência Palavra| 24. Conjugar Verbo (ER)");
    print("12. Data por Extenso         | 25. Cripto (Retirar Vogais)");
    print("13. Repetir Subcadeia");

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