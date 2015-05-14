Test to accompany issue https://github.com/orfjackal/retrolambda/issues/55

To run the test:

~~~~
sh test.sh
~~~~

Output:

~~~~
Steves-iMac-2:retrolambda_issue_55 shannah$ sh test.sh
Retrolambda 2.0.2
Bytecode version: 49 (Java 5)
Default methods:  false
Input directory:  input_classes
Output directory: output_classes
Classpath:        input_classes:CodenameOne.jar
Saving lambda class: com/codename1/issue1156/LambdaTest$$Lambda$1
Error: java.lang.reflect.InvocationTargetException
        StackMap: length = 0x7
         00 02 59 07 00 1A 04 

  public void start();
    descriptor: ()V
    flags: ACC_PUBLIC
    Code:
      stack=7, locals=4, args_size=1
         0: aload_0       
         1: getfield      #64                 // Field current:Lcom/codename1/ui/Form;
--
Error: java.lang.reflect.InvocationTargetException
        StackMap: length = 0x3
         00 01 0F 

  public void stop();
    descriptor: ()V
    flags: ACC_PUBLIC
    Code:
      stack=2, locals=1, args_size=1
         0: aload_0       
         1: invokestatic  #103                // Method com/codename1/ui/Display.getInstance:()Lcom/codename1/ui/Display;
~~~~


The test basically runs javap -verbose on a class from the input classes  
(A class was chosen at random amongst several classes that exhibit this behaviour) and shows
that it doesn't produce a line like `Error: java.lang.reflect.InvocationTargetException`.

It then runs retrolambda and checks the corresponding output class with `javap` to show that it 
includes a line like `Error: java.lang.reflect.InvocationTargetException`