# 设计和原理

使用MLSQL完成模型训练后，这个时候，我们肯定想迫不及待的把模型部署然后提供API服务。
通常，模型使用的场景有三个：

1. 批处理。    比如对历史数据做统一做一次预测处理。
2. 流式计算。  希望把模型部署在流式程序里。
3. API服务。  希望通过API 对外提供模型预测服务。（这是一种最常见的形态）
 

在MLSQL中，所以的特征工程ET(Estimator/Transformer)都可以被注册成UDF函数，同时所有的模型也可以被注册UDF函数，
这样只要API Server 支持注册这些函数，我们就可以通过这些函数的组合，完成一个端到端的预测服务了。


下面是原理图：

```


训练阶段： 文本集合   ------  TF/IDF 向量(TFIDFInplace) ----- 随机森林(RandomForest) 

                               |                           |
产出                           model                       model
                               |                           |
                              register                    register
                               |                           |  
预测服务  单文本    -------     udf1     ---------------     udf2   ---> 预测结果
```

所有训练阶段产生的model都可以被API Server注册，然后使用，从而无需开发便可实现端到端的预测了。



            