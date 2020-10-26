# Anotações da aula sobre visões

## Sintaxe
```
CREATE VIEW vwNomeDaView
AS
	SELECT
		NomeColunas
	FROM
		NomeTabelas
	WHERE
		Condições
	GROUP BY
		Agregação
	HAVING
		CondiçãoAgregação
```

- A cláusula ORDER BY **não pode ser utilizada** no momento da criação da View
- Todas as colunas **devem possuir nome**

## Anotações diversas
- **Não podemos criar uma view com `ORDER BY`**
- **Podemos** criar uma view com WHERE, GROUP BY e HAVING
- Quando criamos uma View (tabela virtual lógica) **não podemos definir colunas com o mesmo nome**, exemplo:
	```
	A.Titulo TituloArtigo
	A.Texto TituloArtigo
	```
- Quando vamos fazer uma consulta usando o **Right Join** ou o **Left Join** e queremos retornar a **quantidade** de determinada agregação, como por exemplo a quantidade de usuários que possuem um artigo escrito, devemos criar o nosso COUNT da seguinte forma:
	`COUNT(TABELA_B.CHAVE)`

- Quando vamos criar uma View, somos **obrigados a definir o nome de todas as colunas** da View (tabela virtual), exemplo:


	**Errado:**

	`AVG(Salario)`

	**Certo:**

	`AVG(Salario) AS MediaSalario`

