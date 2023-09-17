import 'dart:io';

void main() {
  List<double> valoresRecebidos = [];
  List<double> valoresGastos = [];

  
  while (true) {
    stdout.write("Insira o valor recebido ou -1 para continuar: ");
    String input = stdin.readLineSync()!;
    if (input == "-1") {
      break;
    }
    valoresRecebidos.add(double.parse(input));
  }

  
  while (true) {
    stdout.write("Insira o valor gasto ou -1 para continuar: ");
    String input = stdin.readLineSync()!;
    if (input == "-1") {
      break;
    }
    valoresGastos.add(double.parse(input));
  }

  double saldoFinal = calcularSaldo(valoresRecebidos, valoresGastos);

  
  print("- - - - - - - - -");
  print("EXTRATO");
  print("- - - - - - - - -");
  for (var valor in valoresRecebidos) {
    print("R\$ ${formatarValor(valor)}");
  }
  for (var valor in valoresGastos) {
    print("R\$ ${formatarValor(-valor)}");
  }
  print("- - - - - - - - -");
  print("SALDO FINAL");
  print("- - - - - - - - -");
  print("R\$ ${formatarValor(saldoFinal)}");
}

double calcularSaldo(List<double> recebidos, List<double> gastos) {
  return recebidos.reduce((a, b) => a + b) - gastos.reduce((a, b) => a + b);
}

String formatarValor(double valor) {
  return valor.toStringAsFixed(2);
}