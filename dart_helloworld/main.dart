import 'dart:math';

printInteger(int aNumber) {
  print('The number is $aNumber'); // Print to console
}

void main() {

  // call funcion
  {
    var number = 42; // Declare and initialize a variable.
    printInteger(number);
  }

  // Variables
  {
    var name = 'Bob';
    dynamic name1 = 'Bob';
    String name2 = 'Bob';
  }

  // Default value
  {
    int lineCount;
    assert(lineCount == null);
  }

  // Final and const
  {
    final name = 'Bob'; // Without a type annotation
    final String nickname = 'Bobby';

    //name = 'Alice'; // Error: a final variable can only be set once/

    const bar = 1000000; // Unit of pressure (dynes/cm2)
    const double atm = 1.01325 * bar; // Standard atmosphere

    var foo = const [];
    final bar1 = const [];
    const baz = [];

    foo = [1,2,3];
    // baz = [42]; // Error: Constant variables can't be assigned a value.
  }

  // Built-in types;
  {
    // Numbers
    // int // 64 bits, -2^63 to 2^63-1, Javascript - -2^53 to 2^53-1
    // double // 64 bit, IEEE 754 standard

    var x = 1;
    var hex = 0xDEADBEEF;
    var y = 1.1;
    var exponents = 1.42e5;
    double z = 1;
    print('x is $x, hex is $hex');
    print('y is $y, exponents is $exponents');

    // String -> int
    var one = int.parse('1');
    assert(one == 1);

    // String -> double
    var onePointOne = double.parse('1.1');
    assert(onePointOne == 1.1);

    // int -> String
    String oneAsString = 1.toString();
    assert(oneAsString == '1');

    // double -> String
    String piAsString = 3.14159.toStringAsFixed(2);
    assert(piAsString == '3.14');

    // bitwise shift (<<, >>), AND (&), OR (|)
    assert((3 << 1) == 6); // 0011 << 1 == 0110
    assert((3 >> 1) == 1); // 0011 >> 1 == 0001
    assert((3 | 4) == 7); // 0011 | 0100 == 0111

    const msPerSecond = 1000;
    const secondsUntilRetry = 5;
    const msUntilRetry = secondsUntilRetry * msPerSecond;

    // Strings
    var s1 = 'Single quotes work well for string literals.';
    var s2 = "Double quotes work just as well.";
    var s3 = 'It\'s easy to escape the string delimiter.';
    var s4 = "It's even easier to use the other delimiter.";

    var s = 'string interpolation';
    assert('Dart has $s, which is very handy.' == 
      'Dart has string interpolation, ' +
      'which is very handy.');
    assert('That deserves all caps. ' +
      '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' +
      'STRING INTERPOLATION is very handy!');

    var s5 = 'String '
      'concatenation'
      " works even over line breaks.";
    assert(s5 ==
      'String concatenation works even over '
      'line breaks.');
    
    var s6 = 'The + operator ' + 'works, as well.';
    assert(s6 == 'The + operator works, as well.');

    var s7 = '''
    You can create
    multi-line strings like this one.
    ''';

    var s8 = """This is also a
    multi-line string.""";

    var s9 = r'In a raw string, not even \n gets special treatment.';

    // These work in a const string.
    const aConstNum = 0;
    const aConstBool = true;
    const aConstString = 'a constant string';

    // These do NOT work in a const string.
    var aNum = 0;
    var aBool = true;
    var aString = 'a string';
    const aConstList = [1, 2, 3];

    const validConstString = '$aConstNum $aConstBool $aConstString';
    // const invalidConstString = '$aNum $aBool $aString $aConstList';
  }
}