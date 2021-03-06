load libsvm.`sample_libsvm_data.txt` as data;

train data as SKLearn.`/tmp/model`
where `kafkaParam.bootstrap.servers`="127.0.0.1:9092"
and `kafkaParam.topic`="test"
and `kafkaParam.group_id`="g_test-1"
and  `fitParam.0.batchSize`="1000"
and  `fitParam.0.labelSize`="2"
and  `fitParam.0.alg`="MultinomialNB"
and  `fitParam.1.batchSize`="1000"
and  `fitParam.1.labelSize`="2"
and  `fitParam.1.alg`="SVC"
and  `fitParam.2.batchSize`="1000"
and  `fitParam.2.labelSize`="2"
and  `fitParam.2.alg`="RandomForestClassifier"
and validateTable="data"
and `systemParam.pythonPath`="python"
and `systemParam.pythonVer`="2.7"
;