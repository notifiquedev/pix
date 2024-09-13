import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String gerarEmailAleatorio(
  String nome,
  String sobrenome,
) {
  // Concatenar o nome e sobrenome e converter para minúsculas
  String nomeCompleto = '${nome.toLowerCase()}${sobrenome.toLowerCase()}';

  // Formatar o email no formato desejado
  String email = '$nomeCompleto@gmail.com';

  // Retornar o email gerado
  return email;
}

String gerarNomeAleatorio(int numero) {
  List<String> nomes = [
    'joao',
    'maria',
    'pedro',
    'ana',
    'carlos',
    'fernanda',
    'gabriel',
    'lucas',
    'julia',
    'rafael',
    'mateus',
    'larissa',
    'vinicius',
    'isabela',
    'ricardo',
    'thais',
    'leonardo',
    'camila',
    'diego',
    'carolina',
    'paulo',
    'bianca',
    'alexandre',
    'mariana',
    'roberto',
    'beatriz',
    'hugo',
    'leticia',
    'sergio',
    'natalia',
    'felipe',
    'vanessa',
    'bruno',
    'luana',
    'anderson',
    'jessica',
    'fabio',
    'amanda',
    'daniel',
    'luiza',
    'renato',
    'patricia',
    'rodrigo',
    'gisele',
    'thiago',
    'aline',
    'gustavo',
    'larissa',
    'eduardo',
    'claudia',
    'andreia',
    'sergio',
    'carla',
    'vincent',
    'silvia',
    'gustavo',
    'nathalia',
    'felix',
    'monica',
    'adriano',
    'valentina',
    'rogerio',
    'helena',
    'junior',
    'raissa',
    'marcelo',
    'emily',
    'thierry',
    'marcia',
    'robinson',
    'juliana',
    'roque',
    'daniela',
    'bernardo',
    'renata',
    'alvaro',
    'elisa',
    'luiz',
    'fabiana',
    'lucas',
    'tatiane',
    'francisco',
    'pamela',
    'gabriela',
    'mario',
    'helena',
    'luan',
    'michelle',
    'brayan',
    'luiza',
    'carlos',
    'ana',
    'paula',
    'joel',
    'ariana',
    'henrique',
    'flavia'
  ];

  if (numero >= 1 && numero <= 99) {
    return nomes[numero - 1];
  } else {
    // Se o número estiver fora do intervalo válido, retorne um valor padrão ou trate conforme necessário
    return 'Gustavo';
  }

  /// MODIFIQUE APENAS O CÓDIGO ACIMA DESTA LINHA
}

String gerarSobrenomeAleatorio(int numero) {
  List<String> sobrenomes = [
    'Silva',
    'Santos',
    'Oliveira',
    'Pereira',
    'Lima',
    'Fernandes',
    'Costa',
    'Sousa',
    'Rodrigues',
    'Almeida',
    'Nascimento',
    'Cavalcanti',
    'Melo',
    'Barbosa',
    'Araujo',
    'Correia',
    'Cardoso',
    'Gomes',
    'Martins',
    'Ribeiro',
    'Carvalho',
    'Freitas',
    'Castro',
    'Lopes',
    'Monteiro',
    'Dias',
    'Reis',
    'Cunha',
    'Mendes',
    'Goncalves',
    'Moura',
    'Ferreira',
    'Sales',
    'Ramos',
    'Vieira',
    'Tavares',
    'Machado',
    'Pinto',
    'Mota',
    'Borges',
    'Rocha',
    'Silva',
    'Santos',
    'Oliveira',
    'Pereira',
    'Lima',
    'Fernandes',
    'Costa',
    'Sousa',
    'Rodrigues',
    'Almeida',
    'Nascimento',
    'Cavalcanti',
    'Melo',
    'Barbosa',
    'Araujo',
    'Correia',
    'Cardoso',
    'Gomes',
    'Martins',
    'Ribeiro',
    'Carvalho',
    'Freitas',
    'Castro',
    'Lopes',
    'Monteiro',
    'Dias',
    'Reis',
    'Cunha',
    'Mendes',
    'Goncalves',
    'Moura',
    'Ferreira',
    'Sales',
    'Ramos',
    'Vieira',
    'Tavares',
    'Machado',
    'Pinto',
    'Mota',
    'Borges',
    'Rocha',
    'Nascimento',
    'Cavalcanti',
    'Melo',
    'Barbosa',
    'Araujo',
    'Correia',
    'Cardoso',
    'Gomes',
    'Martins',
    'Ribeiro',
    'Carvalho',
    'Freitas',
    'Castro',
    'Lopes',
    'Monteiro',
    'Dias',
    'Reis',
    'Cunha',
    'Mendes',
    'Goncalves',
    'Moura',
  ];

  if (numero >= 1 && numero <= 50) {
    return sobrenomes[numero - 1];
  } else {
    // Se o número estiver fora do intervalo válido, retorne um valor padrão ou trate conforme necessário
    return 'Silva';
  }
}

String atualizarQR(String data) {
  // Substituir espaços por %20
  String textoAtualizado = data.replaceAll(" ", "+");

  // Retornar o texto atualizado
  return textoAtualizado;
}

String sorteioV2(int numero) {
  List<String> numerosPremiados = [
    '70674374150',
    '54083374489',
    '63286304506',
    '47539758511',
    '98062272800',
    '57447122165',
    '37041270785',
    '57133870703',
    '19725780736',
    '55147226354',
    '89851691224',
    '63661532642',
    '71774284618',
    '87721284104',
    '66960583381',
    '02725682444',
    '70727853376',
    '18434068109',
    '78215142842',
    '23364696691',
    '37879417702',
    '17254983754',
    '48623927257',
    '54457578703',
    '63609473827',
    '93359964403',
    '21749437945',
    '43474570650',
    '18525173606',
    '19854033660',
    '54133855523',
    '46163860136',
    '24879428787',
    '51614863504',
    '08662638295',
    '54247925881',
    '18448274610',
    '91870205642',
    '62483063381',
    '01886625964',
    '70914517244',
    '60815688571',
    '73381626701',
    '31362856541',
    '57866687110',
    '57444778299',
    '30713586281',
    '37397114008',
    '60561356599',
    '38267586253',
    '14705444310',
    '65748570742',
    '45486783280',
    '50970228317',
    '05828828932',
    '94146847788',
    '85715365970',
    '53116123390',
    '79401945187',
    '13922827136',
    '63580384783',
    '22569698199',
    '42352983487',
    '70406785511',
    '56636898429',
    '67996513333',
    '77004111580',
    '46996439140',
    '43670060340',
    '98204731523',
    '87813566505',
    '18112883408',
    '10179426761',
    '11132734533',
    '57728133403',
    '74757281536',
    '54105838334',
    '69411841325',
    '16323844850',
    '69411841325',
    '16323844850',
    '87813566505',
    '18112883408',
    '10179426761',
    '11132734533',
    '57728133403',
    '74757281536',
    '54105838334',
    '69411841325',
    '16323844850',
    '69411841325',
    '16323844850',
  ];

  if (numero >= 1 && numero <= 99) {
    return numerosPremiados[numero - 1];
  } else {
    return 'Número inválido. Escolha um número de 1 a 99.';
  }

  /// MODIFIQUE APENAS O CÓDIGO ACIMA DESTA LINHA
}

String dataAAAAMMDD(DateTime data) {
  // Formatar a data para o formato desejado (YYYY-MM-DD)
  // Adicionar dias à data original
  // Adiciona um dia à data fornecida
  DateTime proximoDia = data.add(Duration(days: 1));

  // Formata a data para o formato desejado (YYYY-MM-DD)
  String formatoDesejado =
      '${proximoDia.year}-${_doisDigitos(proximoDia.month)}-${_doisDigitos(proximoDia.day)}';

  return formatoDesejado;
}

// Função auxiliar para garantir que os meses e dias tenham dois dígitos
String _doisDigitos(int numero) {
  return numero.toString().padLeft(2, '0');
}

int retornar12Digitos(String numeroReceber) {
  // Se a string já tem 12 dígitos ou mais, retornar os primeiros 12 dígitos como um inteiro
  if (numeroReceber.length >= 12) {
    return int.parse(numeroReceber.substring(0, 12));
  } else {
    // Se a string tem menos de 12 dígitos, preencher os dígitos restantes com zeros à esquerda
    String zerosPreenchidos = '0' * (12 - numeroReceber.length);
    String numeroFormatado = zerosPreenchidos + numeroReceber;

    return int.parse(numeroFormatado);
  }
}

int retornar2Digitos(int numeroReceber) {
  // Converter o número recebido para uma string para obter os dígitos individualmente
  String numeroComoString = numeroReceber.toString();

  // Verificar se o número tem pelo menos dois dígitos
  if (numeroComoString.length >= 2) {
    // Obter os dois primeiros dígitos e convertê-los de volta para um número inteiro
    int doisPrimeirosDigitos = int.parse(numeroComoString.substring(0, 2));

    // Limitar o valor máximo a 50
    return doisPrimeirosDigitos > 50 ? 50 : doisPrimeirosDigitos;
  } else {
    // Se o número não tiver pelo menos dois dígitos, você pode tratar de acordo
    // Neste exemplo, estamos retornando -1 como um indicador de erro
    return 4;
  }
}

int digitosUserID(String userid) {
  // Converte a string userid para inteiro
  int numeroComoInteiro = int.parse(userid);

  // Converte o número para uma string para facilitar a manipulação dos dígitos
  String numeroComoString = numeroComoInteiro.toString();

  // Verifica se o número tem pelo menos dois dígitos
  if (numeroComoString.length >= 2) {
    // Pega os dois últimos dígitos da string e converte de volta para inteiro
    int ultimosDigitos =
        int.parse(numeroComoString.substring(numeroComoString.length - 2));

    // Retorna os dois últimos dígitos
    return ultimosDigitos;
  } else {
    // Caso o número tenha menos de dois dígitos, retorna o próprio número
    return numeroComoInteiro;
  }
}

String textoAtualizado(String textoAntigo) {
  // Substitui os espaços indesejados por quebras de linha
  String textoFormatado = textoAntigo.replaceAllMapped(
    RegExp(r'\s{2,}'), // Encontra 2 ou mais espaços consecutivos
    (match) => '\n', // Substitui por quebra de linha
  );

  return textoFormatado;
}

void main() {
  String textoAntigo =
      "*Dados de Acesso*:     Usuario: 4999087470     Senha: Tplinkeri@1     Vencimento: 02/01/2025          Dados da Compra          Cliente: (49) 9 9833-6074           ID DA COMPRA          d97209f4-028d-4a88-8e1c-8301f93ef112          Para Suporte Entre em contato pelo WhatsApp:          5549998336074";

  String textoFormatado = textoAtualizado(textoAntigo);
  print(textoFormatado);
}

double stringDouble(String string) {
  try {
    // Tenta converter a string para double
    double valorDouble = double.parse(string);

    // Retorna o valor double se a conversão for bem-sucedida
    return valorDouble;
  } catch (e) {
    // Trata a exceção, por exemplo, retornando 0.0
    print("Erro ao converter a string para double: $e");
    return 0.0;
  }
}

bool verificaVencimento(
  DateTime dataAtual,
  String dataVencimento,
) {
  // Converte a data de vencimento em um objeto DateTime
  final dataVencimentoFormatada = DateTime.parse(dataVencimento);

  // Compare a data de vencimento com a data atual
  return dataVencimentoFormatada.isBefore(dataAtual) ||
      dataVencimentoFormatada.isAtSameMomentAs(dataAtual);
}

String ajusteMac(String mac) {
  // Verifica se o MAC já está no formato desejado
  if (mac.contains(':')) {
    return mac;
  }

  // Remova os dois pontos (:) do MAC original
  String macSemPontos = mac.replaceAll(':', '');

  // Adicione os dois pontos no formato desejado
  String macFormatado = '';
  for (int i = 0; i < macSemPontos.length; i += 2) {
    macFormatado += macSemPontos.substring(i, i + 2) + ':';
  }

  // Remova o último caractere ':' adicionado
  macFormatado = macFormatado.substring(0, macFormatado.length - 1);

  return macFormatado;
}
