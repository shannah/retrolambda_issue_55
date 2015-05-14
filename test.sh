#!/bin/sh
cd input_classes
javap -verbose ./com/codename1/issue1156/WaitTest.class | grep Error -A 10 | grep InvocationTarget -A 10
cd ..
java -Dretrolambda.inputDir=input_classes \
    -Dretrolambda.outputDir=output_classes \
    -Dretrolambda.bytecodeVersion=49 \
    -Dretrolambda.classpath=input_classes:CodenameOne.jar \
    -jar retrolambda-2.0.2.jar
cd output_classes
javap -verbose ./com/codename1/issue1156/WaitTest.class | grep Error -A 10 | grep InvocationTarget -A 10