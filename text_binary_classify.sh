#!/bin/bash


java weka.core.converters.TextDirectoryLoader -dir $1

# convert to arff 

java weka.core.converters.TextDirectoryLoader -dir $1 > $2

# word to vector
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector  -i $2 -o $3 -M 2
java -Xmx1024m  weka.classifiers.meta.ClassificationViaRegression -W weka.classifiers.trees.M5P -num-decimal-places 4  -t  $3
