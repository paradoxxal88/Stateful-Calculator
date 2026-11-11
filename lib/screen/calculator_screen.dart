import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
 
  @override
  State<CalculatorScreen> createState() =>
      _CalculatorScreenState();
}
 
class _CalculatorScreenState extends State<CalculatorScreen> {

  final firstNumberController = TextEditingController();
  final secondNumberController = TextEditingController();
 
  String result = '0';
  String operationLabel = 'Enter two numbers';

  void calculate(String operation) {
  final first =
      double.tryParse(firstNumberController.text.trim());
 
  final second =
      double.tryParse(secondNumberController.text.trim());
 
  if (first == null ||
      second == null ||
      !first.isFinite ||
      !second.isFinite) {
    setState(() {
      result = 'Invalid input';
      operationLabel = 'Please enter two valid numbers';
    });
    return;
  }
 
  if (operation == '÷' && second == 0) {
    setState(() {
      result = 'Cannot divide by zero';
      operationLabel = 'Please change the second number';
    });
    return;
  }
 
  double answer;
 
  switch (operation) {
    case '+':
      answer = first + second;
      break;
    case '-':
      answer = first - second;
      break;
    case '×':
      answer = first * second;
      break;
    case '÷':
      answer = first / second;
      break;
    default:
      return;
  }
 
  setState(() {
    result = answer.toString();
    operationLabel = '$first $operation $second';
  });
  }

  void clearCalculator() {
  firstNumberController.clear();
  secondNumberController.clear();
 
  setState(() {
    result = '0';
    operationLabel = 'Enter two numbers';
  });
  }

  @override
  void dispose() {
  firstNumberController.dispose();
  secondNumberController.dispose();
  super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final operationButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF7A42F4),
    foregroundColor: Colors.white,
    elevation: 0,
    minimumSize: const Size(64, 56),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  return Scaffold(
appBar: AppBar(
  title: const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.calculate, color: Color(0xFFC8B6FF)),
      SizedBox(width: 8,),
      Text('My Stateful Calculator'),
      ],
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF2A2A2E),
    foregroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'BASIC CALCULATOR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
 
          TextField(
            controller: firstNumberController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            decoration: const InputDecoration(
              labelText: 'First Number',
              hintText: 'Enter the first number',
              prefixIcon: Icon(Icons.looks_one),
              filled: true,
              fillColor: Color(0xFF2A2A2E),
              labelStyle: TextStyle(color: Color(0xFFC8B6FF)),
              hintStyle: TextStyle(color: Color(0x8AFFFFFF)),
              prefixIconColor: Color(0xFFC8B6FF),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Color(0xFF3A3A40)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Color(0xFF7A42F4), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
 
          TextField(
            controller: secondNumberController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            decoration: const InputDecoration(
              labelText: 'Second Number',
              hintText: 'Enter the second number',
              prefixIcon: Icon(Icons.looks_two),
              filled: true,
              fillColor: Color(0xFF2A2A2E),
              labelStyle: TextStyle(color: Color(0xFFC8B6FF)),
              hintStyle: TextStyle(color: Color(0x8AFFFFFF)),
              prefixIconColor: Color(0xFFC8B6FF),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Color(0xFF3A3A40)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Color(0xFF7A42F4), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 24),
 
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => calculate('+'),
                style: operationButtonStyle,
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () => calculate('-'),
                style: operationButtonStyle,
                child: const Text(
                  '−',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () => calculate('×'),
                style: operationButtonStyle,
                child: const Text(
                  '×',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () => calculate('÷'),
                style: operationButtonStyle,
                child: const Text(
                  '÷',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
 
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFF2A2A2E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFF7A42F4)),
            ),
            child: Column(
              children: [
                Text(
                  operationLabel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xB3FFFFFF)),
                ),
                const SizedBox(height: 12),
                const Text(
                  'RESULT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Color(0xFFC8B6FF),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
 
          OutlinedButton.icon(
            onPressed: clearCalculator,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFFC8B6FF),
              foregroundColor: const Color(0xFF121214),
              side: BorderSide.none,
              minimumSize: const Size(64, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Clear'),
          ),
          const SizedBox(height: 24),

          const Text(
            'Created by: Juna Lei Sionillo \nSection: CCE106 - 3450',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0x99FFFFFF)),
          ),
        ],
      ),
    ),
  );
}
}