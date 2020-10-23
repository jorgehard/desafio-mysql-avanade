SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
/***** Quantas pessoas alugaram carros no último ano *****/
--
-- TOTAL DE ALUGUEIS
--
SELECT COUNT(*)
FROM cliente_veiculos_servicos AS A 
INNER JOIN clientes AS B 
ON A.id_cliente = B.id 
WHERE A.id_tipo_servico = '1' AND year(A.data_servico) = '2020' 
--
-- TOTAL PESSOAS DIFERENTES QUE ALUGARAM (UNITARIAS)
--
SELECT COUNT(*), B.nome
FROM cliente_veiculos_servicos AS A 
INNER JOIN clientes AS B 
ON A.id_cliente = B.id 
WHERE A.id_tipo_servico = '1' AND year(A.data_servico) = '2020' 
GROUP BY A.id_cliente
/***** Quantas pessoas compraram carros no último mês *****/
--
-- TOTAL PESSOAS DIFERENTES QUE COMPRARAM CARROS (UNITARIAS AGRUPADO)
--
SELECT COUNT(*), B.nome
FROM cliente_veiculos_servicos AS A 
INNER JOIN clientes AS B 
ON A.id_cliente = B.id 
WHERE A.id_tipo_servico = '2' AND MONTH(A.data_servico) = '10' 
GROUP BY A.id_cliente

/***** Quantas pessoas alugaram e depois compraram o mesmo carro *****/
--
/***** Qual modelo é o mais procurado? (Quesito usado para classificar esse ponto?) *****/
--