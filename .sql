1. // CURSO DE SQL - DEV DOJO //  

    O que e banco de dados? 
        -> Um banco de dados e uma colecao logicamente coerente de dados com algum significado inerente, e projetado, construido e polulado com dados para uma finalidade especifica;


    SGBD - SISTEMA GERENCIADOR DE BANCO DE DADOS / DATABASE MANAGEMENT SYSTEM (DBMS)
        -> Uma colecao de programas que permite criar e manter um banco de dados. E um sistema de software geral que facilita o processo de definicao, construcao, manipulacao e compartilhamento de bancos de dados entre varios usuarios e aplicacoes;


    VANTAGENS DE UM SGBD
        -> Rapida manipulacao e no acesso as informacoes
        -> Compartilhamento de dados
        -> Reducao de esforcos humanos
        -> Maior controle de dados
        -> Evita problemas com integridade de dados
        -> Maior disponibilidade de informacao 
        -> Maior seguranca, backup e recuperacao 
        -> Evita a reduncancia e Inconsistencia de dados








2. // SQL INSTRUCAO SELECT //

    SQL - STRUCTURED QUERY LANGUAGE / LINGUAGEM DE CONSULTA ESTRUTURADA 
        -> linguagem padrao no quais o SGBD se padronizaram para a manipulacao de dados em um banco de dados.

    - porem existe uma forma de dialetos, assim como no ingles -> temos o ingles britanico e o norte americano, que tem as mesmas palavras com pronuncias diferentes, a que iremos trabalhar e chamada de: 

            -> T - SQL (TRANACT SQL) - MICROSOFT SQL SERVER 
                    a linguagem padronizada da microsoft; 


    primeiros comandos: 

        SELECT * FROM nome_da_tabela
            - Comando de selecao(select) de dados, ou consulta de dados, onde o * significa todos os campos da tabela, e from e a tabela que estamos selecionando os dados.
            


    COMAND WHERE 

        SELECT * FROM nome_da_tabela WHERE condicao 
            - Comando where e utilizado para filtrar os dados, ou seja, selecionar apenas os dados que atendem a uma determinada condicao; where = ONDE;



    -> Tudo que comecar com SELECT sera uma query, ou seja uma consulta de dados, e tudo que comecar com CREATE, ALTER, DROP, INSERT, DELETE, UPDATE sera uma instrucao de manipulacao de dados, ou seja, DML (DATA MANIPULATION LANGUAGE) ou DDL (DATA DEFINITION LANGUAGE);


    exemplo de utilizacao select: 

            SELECT BusinessEntityID, PersonType, title
                FROM Person.Person
            WHERE FirstName = 'Ken' AND MiddleName <> NULL

            -> explicacao: esta selecionando as colunas BusinessEntityID, PersonType, title da tabela Person.Person onde o FirstName e igual a Ken e o MiddleName e diferente de nulo;








3. // SQL - INSTRUCAO SELECT(TOP, DISTINCT, ORDER BY) //

    -> Caso tenhamos acesso ao banco de dados da empresa nunca iremos poder deretamente dar um comando como: 

        SELECT * FROM nome_da_tabela;   
            -> porque pode ser que a empresa tenha mais de 1 bilhao de registros causando um bug extremo no pc e tambem um tempo de resposta muito grande, para isso poderiamos utilizar o comando abaixo para conhecer todas as colunas e tuplas;

        SELECT TOP 10 * FROM nome_da_tabela;
            -> isso ira retornar as primeiras 10 linhas da tabela, e todas as colunas;



    -> COMANDO ORDER BY:
        - O comando order by e utilizado para ordenacao dos resultados de forma crescente ou decrescente;

        SELECT TOP 1000 *
            FROM Person.Person
        ORDER BY FirstName ASC, LastName DESC;

        -- ASC: crescente 
        -- DESC: decrescente 

            -> Aqui ele ira selecionar as primeiras 1000 linhas da tupla e ira retornar da tabela Person.Person, ordenando o primeiro nome em ordem alfabetica crescente e o ultimo nome em ordem alfabetica decrescente;



    -> COMANDO AS; 
        - O comando as e utilizado para dar um apelido a uma coluna ou a uma tabela, seguindo o exemplo abaixo: 

        SELECT TOP 1000
            BusinessEntityID AS ID,
            FirstName AS Nome,
            LastName AS Sobrenome 

        FROM Person.Person
        ORDER BY Nome ASC, Sobrenome DESC;

            -> Esta sendo renomeada as colunas descritas, para que fique mais facil a leitura dos dados, lembrando que isso dara o apelido somente na consulta e nao na tabela original, podemos utilizar tambem no order by o apelido que demos na coluna;

            -> Caso tentarmos executar passando os apelidos no where ira dar erro pois ele nao reconhece o apelido, somente no select e no order by;


    -> COMANDO DISTINCT 
        - o que ele faz e remover a duplicacao de conteudo, ou seja, ele ira retornar somente valores unicos, nao ira retornar valores duplicados;

        SELECT DISTINCT FirstName
            FROM Person.Person

            -> Aqui ele ira retornar os distintos nomes da tabela Person.Person, ou seja, nao ira retornar nomes duplicados;b








4. // SQL - INSTRUCAO SELECT (ORDER BY, OFFSET FETCH) //

    -> 
    
    SELECT 
        BusinessEntityID, 
        FirstName,
        LastName,
        Title

    FROM Person.Person
    ORDER BY BusinessEntityID ASC
    OFFSET 5 ROWS 

        -> O offset fara com que juntamente com 5 rows fara com que a selecao pule as cinco primeiras linhas, e ira retornar a partir da sexta linha, ele nao pode ser usado no mesmo select contendo top; 

            exemplo: 
                select top 400 * 
                    from Person.Person
                order by BusinessEntityID ASC
                offset 5 rows;

            "isso ira trazer um erro de execucao, pois o offset nao pode ser usado no mesmo select contendo top"; 
        

    -> e se quisessemos trazer uma quantidade restrita de linhas na minha consulta? ou seja trazer somente 10 linhas a partir da 5 linha? 

        SELECT 
            BusinessEntityID, 
            FirstName,
            LastName,
            Title
        FROM Person.Person
        ORDER BY BusinessEntityID ASC
        OFFSET 5 ROWS
        FETCH NEXT 10 ROWS ONLY;

            -> o fetch next ira trazer as proximas 10 linhas a partir da 5 linha, ou seja, ira trazer da 6 linha ate a 15 linha, ;








5. // OPERADORES ARITIMETICOS //
    
    ->  operadores: 
            + (soma);
            - (subtracao);
            * (multiplicacao);
            / (divisao);
            % (modulo) -> resto da operacao;


    exemplo: 
        SELECT 5 - 10 AS [SUBTRACAO(-1)]
            -> estamos fazendo a operacao aritimetica e estamos colocando o nome da tabela de "SUBTRACAO(-1)";


            - podemos fazer todas as operacoes juntas tambem: 

            SELECT 1 + 3 AS SOMA, 
                   5 - 10 AS SUB, 
                   1700 + (-900) AS NEG,
                   5 * (5 + 1) AS MULTI_SOMA, 
                   -5 * (500 / 40) % 3 AS TUDO


            
        - Operacao com String e Inteiro: 

            SELECT 1 + '1' AS SOMA 
                -> o resultado sera 2, pois o sql server ira converter a string para inteiro e ira fazer a soma;

            SELECT '1' + '1' AS SOMA 
                -> o resultado sera 11, pois ira acontecer o fenomeno de concatenacao, ira juntar as duas Strings, gerando o resultado 11;


            SELECT '1' + '1' + 1 AS SOMA 
                -> aqui ele ira fazer a concatenacao primeiro gerando o resultado 11, e depois ira transformar esse numero em inteiro e ira somar com o 1, gerando o resultado 12;








6. // TIPOS DE DADOS // 

    ->  Tipos de Dados: Numericos Exatos (inteiros ou decimais);

    +-------------|-------------------------------------------------------------------------|------------------------+
    | Tipo        | Intervalo                                                               |     Armazenamento      |   
    |-------------|------------------------------------------------------|------------------|------------------------|
    | bigint      | -2^63 (-9.223.372.036.854.775.808) a 2^63-1 (9.223.372.036.854.775.807) | 8 bytes                |
    | int         | -2^31 (-2.147.483.648) a 2^31-1 (2.147.483.647)                         | 4 bytes                |
    | smallint    | -2^15 (-32.768) a 2^15-1 (32.767)                                       | 2 bytes                |
    | tinyint     | 0 a 255                                                                 | 1 byte                 |
    | money       | -922.337.203.685.477,58 a 922.337.203.685.477,58                        | 8 bytes                |
    | smallmoney  | -214.748,3648 a 214.748,3647                                            | 4 bytes                |
    |-------------|-------------------------------------------------------------------------|------------------------|
    | bit         | 1 (TRUE), 0 (FALSE) OU NULL                                             | 1 byte*                |
    |             | "Se houver 8 ou menos colunas bit em uma tabela, as colunas serão       |                        |
    |             |  armazenadas como 1 byte. Se houver de 9 a 16 colunas bit, as colunas   |                        |
    |             |  serão armazenadas como 2 bytes, e assim por diante."                   |                        |
    |-------------|-------------------------------------------------------------------------|------------------------|                   
    | decimal     | 10^38 +1 a 10^38 -1                                                     | Ambos são equivalentes |
    | numeric     | 10^38 +1 a 10^38 -1                                                     | Ambos são equivalentes |
    +-------------|-------------------------------------------------------------------------|------------------------+



    -> Tipos de dados: Numericos Aproximados;

    +---------+----------------------------------------------------------+-------------------------------+
    |   Tipo  |                        Intervalo                         |        Armazenamento          |
    +---------+----------------------------------------------------------+-------------------------------+
    |  float  | -1,79E+308 a -2,23E-308, 0 e 2,23E-308 a 1,79E+308       | Depende do valor de n         |
    |  real   | -3,40E+38 a -1,18E-38, 0 e 1,18E-38 a 3,40E+38           | 4 bytes                       |
    +---------+----------------------------------------------------------+-------------------------------+



    -> Tipos de Dados: Cadeia de Caracteres;

    +-----------+--------------------------------------------------------------------+
    |   Tipo    |                        Descrição                                   |
    +-----------+--------------------------------------------------------------------+
    | char(n)   | Caracteres de tamanho fixo. Máximo 8000 caracteres                 |
    | varchar(n)| Caracteres de tamanho variável. Máximo 8000 caracteres             |
    | varchar(max) | Caracteres de tamanho variável. Máximo 1.073.741.824 caracteres |
    +-----------+--------------------------------------------------------------------+



    -> Tipos de Dados : Cadeias de Caracteres Unicode;

    +--------------+--------------------------------------------------------------------+
    |   Tipo       |                        Descrição                                   |
    +--------------+--------------------------------------------------------------------+
    | nchar(n)     | Caracteres de tamanho fixo. Máximo 4000 caracteres                 |
    | nvarchar(n)  | Caracteres de tamanho variável. Máximo 4000 caracteres             |
    | nvarchar(max)| Caracteres de tamanho variável. Máximo 536.870.912 caracteres      |
    +-----------+-----------------------------------------------------------------------+




    -> Tipos de Dados: Cadeias de Caracteres Binarios;

    +----------------+-----------------------------------------------------------------------+-----------------------------+
    |   Tipo         |                        Descrição                                      |      Use quando             |
    +----------------+-----------------------------------------------------------------------+-----------------------------+
    | binary(n)      | Dados binarios de comprimento fixo com um tamanho de n bytes, em que  | Os tamanhos das entradas de |
    |                | n e um valorde 1 a 8.000. O tamanho do armazenamento e de n bytes     | dados forem consistentes    |
    +----------------+-----------------------------------------------------------------------+-----------------------------+
    |                |                                                                       | Os tamanhos das entradas de |
    | varbinary(n)   | Dados binarios de tamanho variavel. n pode ser um valor de 1 a 8.000  |  dados de coluna variarem   |
    |                |                                                                       | consideralvemente           |
    +----------------+-----------------------------------------------------------------------+-----------------------------+
    | varbinary(max) | tamaho de armazenamento maximo e de 2^31 - 1 byte                     | Os tamanhos das entradas de |
    +----------------+-----------------------------------------------------------------------+-----------------------------+




    -> Tipos de Dados: Data e Hora

    +-------------------+---------------------------------------+---------------------------+---------------------+
    | Tipo              |                Valores                |          Formato          | Valor Padrão        |
    +-------------------+---------------------------------------+---------------------------+---------------------+
    | date              | 0001-01-01 a 9999-12-31               | AAAA-MM-DD                | 1900-01-01          |
    | datetime          | 1753-01-01 a 9999-12-31               | AAAA-MM-DD hh:mm:ss       | 1900-01-01 00:00:00 |
    |                   | Hora 00:00:00 a 23:59:59.997          |                           |                     |
    | datetime2         | 0001-01-01 a 9999-12-31               | AAAA-MM-DD hh:mm:ss       | 1900-01-01 00:00:00 |
    |                   | Hora 00:00:00 a 23:59:59.9999999      | [Segundos fracionários]   |                     |
    | datetimeoffset    | 0001-01-01 a 9999-12-31               | AAAA-MM-DD hh:mm:ss       | 1900-01-01 00:00:00 |
    |                   | Hora 00:00:00 a 23:59:59.9999999      | [.nnnnnnn] [{+|-}hh:mm]   |                     |
    | smalldatetime     | 1900-01-01 a 2079-06-06               | AAAA-MM-DD hh:mm:ss       | 1900-01-01 00:00:00 |
    |                   | Hora 00:00:00 a 23:59:59              | [Segundos arredondados]   |                     |
    | time              | 00:00:00.0000000 a 23:59:59.9999999   | hh:mm:ss[.nnnnnnn]        | 00:00:00            |
    +-------------------+---------------------------------------+---------------------------+---------------------+








7. // Operadores de Comparacao // 

        ->  = (igual a);
        ->  <> (diferente de);
        ->  > (maior que);
        ->  < (menor que);
        ->  >= (maior ou igual a);
        ->  <= (menor ou igual a);
        


    alguns exemplos:

    SELECT * 
        FROM Person.Person 
    WHERE BusinessEntityID = 10;

        -> ira retornar todos os dados da tabela Person.Person onde o BusinessEntityID for igual a 10;

    
    SELECT * 
        FROM Person.Person
    WHERE BusinessEntityID <> 10;

        -> ira retornar todos os dados da tabela Person.Person onde o BusinessEntityID for diferente de 10;







8. // Operadores Logicos //

    -> serve para testar uma condicao, e normalmente teremos um tipo de retorno sendo true ou false, ou desconhecido, nao temos tipo boolean, trabalhamos com bit que ira retornar 0 ou 1;

    -> ALL (SUBQUERY)
    -> SOME | ANY (SUBQUERY)
    -> EXISTS (SUBQUERY)


    - Logicos: AND, OR, NOT; 

    - BETWEEN <expressao1> AND <espressao2>: testa um intervalo;

    - IN (<lista de valores>): testa presenca na lista; 

    - IS NULL OU IS NOT NULL: Testa nulos;

    - LIKE: Testa conteudo de string de caracteres;


        ex: Selecione os funcionarios do estado de MG ou RJ que ganha uma comissao maior ou igual a 100

            SELECT nome 
                FROM funcionario
            WHERE estado = 'MG' or 'RJ' and comissao >= 100




    BETWEEN:
            -> Permite testar se um intervalo determinado campo assume o valor dentro de um intervalo especificado. E utilizado por ser mais pratico do que o teste de >= e <=

        EX: 
            SELECT * 
                FROM Funcionarios
            WHERE salario BETWEEN 1800 AND 2000

            -> E bem mais legivel que: 

            SELECT *
                FROM funcionarios
            WHERE Salario >= 1800 AND salario <= 2000


        --> exemplo: Selecione os funcionarios que ganham entre 2000 e 3500 no departamento de informatica

            SELECT nome , salario
                FROM funcionario
            WHERE salario BETWEEN 2000 AND 3500 and cod-depto = 1



        IN: 
            -> Verifica se um elemento pertence a um conjunto, isto e, se um campo assume o valor de algum membro de uma lista de valores. E utilizado para substituir grandes exmpressoes de OR para o mesmo campo.


        EX: 
            SELECT *
                FROM Funcionario 
            WHERE cod_depto IN (1,2)

                -> e bem mais legivel que 

            SELECT * 
                FROM Funcionario
            WHERE cod_depto = 1 OR cod_depto = 2 



            --> exemplo selecione os funcionarios cujo cargo e contador ou gerente.

            SELECT nome, cargo
                FROM Funcionario
            WHERE cargo IN ('gerente', 'contador')


    
        IS NULL / IS NOT NULL

            ex: Selecione os funcionarios cujo estado ou cidade e nula 

                SELECT nome 
                    WHERE estado is null or cidade is null Funcionario



    
    LIKE | NOT LIKE  
            -> Operador LIKE e usado quando se deseja obter colunas de um registro que sigam um determinado padrao pre-especificado.

            -> Quando se quer saber os nomes de todos os funcionarios cujo nome comeca com JOAO ou termina com SILVA, usa-se o LIKE.

            -> O caracter % dentro da expressao LIKE tem a mesma funcao do caracter * no windows, assim como o _(undescore) tem a semelhanca com o ? do windows 

        ex: 
            SELECT NOME 
                FROM Funcionario
            where nome like 'JOAO%'


            SELECT * 
                FROM Funcionario
            WHERE NOME LIKE '_ _ R%'

            -> (Obs: a terceira letra do nome do funcionario deve ser R)


        --> exemplo: Selecionar os funcionarios cujo o nome tem a letra u como segundo caractere

            SELECT nome 
                FROM Funcionario
            WHERE nome LIKE '_u%' Funcionario








9. // INFORMATION SHEMA //

    -> O que seria o "Person.Person", o que significa a primeira palavra.segundaPalvra? aqui trabalhase com algo que chama shema, o shema e tambem uma maneira de organizar tabelas, nao temos que pensar que ele seja somente isso, exemplo: se tivermos tabela: pessoa, contanto e endereco, e importante deixarmos isso agrupado, teremos maior manipulacao e controle sobre isso, entao as tabelas: Person.Person, Person.Password, Pessoa.EmailAddress -> isso tudo esta relacionado a um Shema Person;

        ->   SELECT * FROM INFORMATION_SHEMA.TABLES
                - Teremos acessos a todas as tabelas contidas no banco para visualizar melhor, veremos a coluna de catalogo, table schema, table name e table type;


        ->  SELECT * FROM INFORMATION_SCHEMA.COLUMS
                - Teremos acesso a todas as colunas contidas no banco para visualizar melhor, veremos a coluna de table catalog, table schema, table name, column name, data type, character maximum length, is nullable (!! Atencao: se fizermos isso em uma banco de dados com um numero gigantesco de tabelas e colunas teremos um serio bug de consulta, devido o tamanho);



        ->  SELECT * FROM INFORMATION_SCHEMA.COLUMS
                WHERE TABLE_NAME = 'Person.Person'
                    - Teremos acesso a todas as colunas contidas na tabela Person.Person para visualizar melhor, fizemos um filtro para que ele retorne somente as colunas da tabela Person.Person, veremos a coluna 




        -> Vamos supor que no azure estivesse selecionado no master, e tivessemos um banco de dados chamdo AdventureWorks, podiamos selecionar esse banco dentro do script mesmo, exemplo: 

            USE AdventureWorks2019 GO

            SELECT * FROM Person.Person
                WHERE BusinessEntityID > 500


        -> Podemos tambem fazer diretamente no select: 

            SELECT * FROM AdventureWorks2019.Sales.Store;
                --> isso esta selecionando a base de dados, depois esta selecionando o shema e ai sim o nome da tabela;








10. // Inner Join //

    -> O que seria os joins, seria basicamente fazer juncoes, pegarmos uma coluna ou uma tabela e linkar a uma outra coluna ou tabela, ou trazer tudo junto depende do caso e claro;

    SQL - DML: JUNCOES 

            TIPOS DE JUNCOES: 
                
                -> inner join (equivalente a sintaxe tradicional da juncao)

                -> left outer join 

                -> right outer join 

                -> full outer join 

            CONDICOES: 
                -> on <predicado>

        -> teremos na primeira consulta os cinco primeiros registro da tabela Person.Person e na segunda consulta os cinco primeiros registros da tabela Person.EmailAddress, e se quisermos juntar essas duas tabelas?

        -> a teorias dos joins segue o conceito de conujuntos em matematica, ou seja, teremos por exemplo duas tabelas, onde tera o conjunto da esquerda e da direita, notem que no meio dela teremos uma intercecao, teremos elementos que serao comuns para a tabela da esquerda e tabela da direita, e vamos utilizalos para fazer essa juncao, para que monte essa conexao com uma tabela com a outra;

        exemplo:
            
        INNER JOIN 

            1- METODO   SELECT coluna1, coluna2 ...
                            FROM tabela1 INNER JOIN tabela2
                        ON tabela1.coluna = tabela2.colunal;

                obs: pode se usar somente o JOIN, ja que r o join default 

                -> SINTAXE ALTERNATIVA

            2- METODO   SELECT coluna1, coluna2...
                            FROM tabela1, tabela2
                        WHERE tabela1.coluna = tabela1.coluna;

            -> E melhor se utilizar o primeiro metodo poque nele e separado a condicao da juncao, ou seja nele podemos colocar o WHERE e fazer com que nao fique embolado assim como o debaixo.


            --> exemplo: Selecione os nomes dos deptos e de seus funcionarios com os cargos, em ordem alfabetica de nome do depto e do funcionario.

                    SELECT nome_depto, nome, cargo 
                        FROM Depto A JOIN Funcionario B
                    ON A.cod_depto = B.cod_depto 
                    ORDER BY 1,2








11. // Left Join //

        ->  Trara toda a tabela da esquerda e o que for intercessao com a tabela da direita, ou seja, o inner join traz o que for intercessao entre as duas;

        LEFT JOIN 

            -> Vai levar a intercessao como o do INNER JOIN mas tambem o que esta na esquerda.

            --> exemplo: selecione os nomes dos funcionarios e de seus dependentes, exibindo tambem funcionarios sem dependentes, em ordem alfabetica dos nomes.

                SELECT nome, nome_dependente 
                    FROM Funcionario A LEFT OUTER JOIN Dependente B 
                    ON A.matricula = B.matricula
                ORDER BY 1,2

                -> OBS: podemos escrever apenas LEFT JOIN 

            -> explicacao: exemplo no INNER JOIN, quando fizemos a juncao de dependente e funcionario o que acontece so apareceram aqueles funcionarios, so vai aparerecer os funcionarios que tiverem dependente, mas se fizemos um left join teremos a aparicao de todo o conjunto da esquerda, ou seja, nao so a intercessao de funcionario com dependente, mas digamos que basta ser funcionario para poder ser exibido, mas ai caso ele nao tenha dependente, como sera preenchido? Vai aparecer uma ausencia da informacao.

            -> O numero de registros exibidos em um left join e no minimo igual a um INNER JOIN, sendo na maioria das vezes maior, pois o LEFT JOIN engloba o INNER JOIN.









12. // RIGHT JOIN // 

            -> Tem o mesmo conceito que LEFT JOIN, so que e um pouco utilizado. incorpora tambem o inner join so que agora com acrescento de aparicao de quem for a direita tambem. quem manda e a tabela a direita

            --> exemplo: Selecione os nomes dos funcionarios e de seus dependentes exibindo tambem funcionarios sem dependentes, em ordem afabetica dos nomes.

                SELECT nome, nome_dependente 
                    FROM Dependente A RIGHT OUTER JOIN Funcionario B
                    ON A.matricula = B.matricula 
                ORDER BY 1,2









13. // FULL JOIN // 

            -> Ele e a juncao de left e right, ou seja basta estar na esquerda ou direita, ou tambem na intercessao.

            --> exemplo: Selecione os nomes dos departamentos e dos funcionarios exibindo departamentos sem funcionarios e tambem funcionarios sem departamentos, em ordem alfabetica dos nomes.

                SELECT nome_depto, nome 
                    FROM Depto A FULL OUTER JOIN Funcionario B 
                    ON A.cod_depto = B.cod_depto
                ORDER BY 1,2
            
            -> explicacao: primeiro ele pega a intercessao depois, depois departamento sem funcionario e depois funcionario sem departamento.

            RESULTADO: 

                -> Full join e a soma do left join com o right  join

                -> Full join e diferente do produto cartesiano pois nao gera combinacoes aleatorias.









14. // UNION - (UNIAO) //

            -> Agrega resultados de comando SELECT. Deve existir compatibilidade de colunas e linhas duplicadas sao desprezadas.

            -> UNION ALL: nao elimina tuplas duplicadas 

            -> Equivalente a operacao de uniao da teoria dos conjuntos. Pode atuar em tabels diferentes desde que a compatibilidade seja respeitada.

                -> para se fazer a uniao os campos entre elas tem que ser compativeis, e quando faz a uniao ele elimina as linhas duplicadas, exemplo fazer uma uniao de uma tabela de um banco A e de um banco B, entao queremos dar uma UNION nessas duas tabelas entao na base de clientes do banco A e do Banco B, vai eliminar os clientes que estao cadastrados em A e B e vai ter um registro unico daquele cliente.

            --> exemplo: Selecione os nomes e estados dos funcionarios de MG e do RJ, marcando os de MG com asteristico 

            SELECT nome, estado, '*'
                FROM Funcionario 
                WHERE estado = 'MG' UNION 
            SELECT nome, estado, '' 
                FROM Funcionario
                WHERE ESTADO = 'RJ'








15. // Funcoes de Agreagacao // 

        -> COUNT(*): contador de linhas da tabela

        -> COUNT (DISTINCT atributo): contador de linhas com ocorrencias diferentes de um atributo.

        -> AVG : media aritimetica

        -> SUM: soma de valores 

        -> MAX: valor maximo

        -> MIN: valor minimo

        
        AVG: MEDIA 
                
                exemplo: Calcule a media de salario dos funcionarios

                SELECT 
                    AVG(Salario) 
                AS Media


                --> obs: recurso novo que e o a questao do apelido do campo, se nao colocar esse apelido do campo, na maior parte dos bancos de dados, como nao e uma coluna original da tabela aparece com nome vazio, e bom renomear para ficar mais palatavel.



        SUM: SOMATORIO

                exemplo: Calcule o somatorio dos salarios do depto 1

                SELECT 
                    SUM(Salario)
                FROM Funcionario WHERE cod_depto = 1


                --> obs: detalhe aqui que nao colocamos o nome do campo, entao ele apareceu com o nome do campo sendo nulo com resultado abaixo, o bom seria adicionar para que ficasse melhor entendimento.

            

        MIN e MAX: 

                exemplo: selecione os valores do maior e menor salarios do depto 1

            SELECT MAX(Salario), AS Maior
                MIN(Salario) AS Menor
            FROM Funcionario WHERE cod_depto = 1



        COUNT 

            -> Efetua a contagem de resistros de uma tabela, ou seja, contar em nivel de linha ex: quantos registros ou quantas tuplas aquela tabela possui, agora o SUM olha o conteudo da tabela a soma de conteudos.

            -> A sua forma mais usual e o COUNT(*), onde se contam as linhas (ocorrencias) de uma tabela 

            -> Existe tambem a forma COUNT(DISTINCT nome-do-campo) utilizada a contagem de direfentes ocorrencias de um campo. Neste caso, o campo nao e chave primaria, pois esta ja tem as ocorrencias distintas por obrigacao.

                
                exemplo utilizando COUNT: Calcule a quantidade de funcionarios, excluindo os gerentes.

                    SELECT COUNT(*) AS Qtde 
                        From Funcionario 
                    WHERE cargo <> 'gerente'



        DISTINCT

            -> operador DISTINCT nome-do-campo elimina ocorrencias repetidas de um mesmo campo

            -> Nao faz sentido utilizar DISTINCT para um campo que ja seja chave primaria

            
                EX: nomes das cidades ibde se tem clientes, sem repeticoes de cidades

                    SELECT DISTINCT Cidade FROM Clientes


                EX: So sera considerada uma repeticao quando o estado e cidade forem os mesmos

                    SELECT DISTINCT Estado, Cidade FROM Clientes


                -> exemplo: Selecione os distintos cargos existentes 

                    SELECT DISTINCT Cargo 
                        FROM Funcionario

        

        COUNT DISTINCT 

            -> Calcula as diferentes coisas existentes

                -> exemplo: Selecione a quantidade de distintos cargos
            

            SELECT COUNT (DISTINCT Cargo) AS QtdeCargos 
                FROM Funcionario



        ORDER BY (ORDENACAO)

            -> A expressao ORDER BY e utilizada quando se pretende exibir os registros em uma determinada ordem,seja esta crescente (ASC - Default) ou decrescente (DESC).

            -> Caso a expressao ORDER BY nao esteja presente, os registros serao exibidos na ordem em que foram inseridos na tabela.

            -> os campos que constam da expressao ORDER BY devem obrigatoriamente estar presentes na expressao SELECT

            -> Nao e necessario possuir um indice fisicamente criado e composto pelos campos da ordernacao para usar o ORDER BY. No entanto, caso o indice exista o comando sera executado mais rapido.

            -> Pode-se utilizar numeros indicando que a ordenacao sera feita por determinado campo de acordo com a ordem do SELECT.

                --> exemplo: Selecione o codigo de depto e nome do funcionariao, em ordem alfabetica de ambos.

                    SELECT Cod_Depto, Nome 
                        FROM Funcionario
                    ORDER BY Cod_Depto, Nome

                    SELECT Cod_Depto, Nome 
                        FROM Funcionario 
                    ORDER BY 1,2

                    --> PODE SE FAZER DESSAS DUAS FORMAS 

                    
                    --> exemplo - 2: Selecione o codigo do depto, o salario e o nome, em ordem crescente do codgio e decrescente do salario.

                    SELECT Cod_Depto, Salario Nome 
                        FROM Funcionario
                    ORDER BY 1 ASC, 2 DESC

                    SELECT Cod_Depto, Salario, Nome 
                        FROM Funcionario
                    ORDER BY 1,2 DESC 



        GROUP BY ( AGRUPAMENTO )

            -> Em um SELECT tradicional, as linhas da tabela sao exibidas de maneira analitica. Existe a expressao GROUP BY que permite que se faca uma consolidacao, dos registros, fazendo a sintesi dos mesmos por um conjunto de campos.

            -> A funcionalidade do GROUP BY equivale a das informacoes de subtotais usadas em relatorios. Ao se fazer o agrupamento por um determinado campo de quebra, perde-se a informacao detalhada a nivel de registros. Novas informacoes sao geradas a partir da totalizacao dos registros.

            -> Os campos da expressao GROUP BY devem sempre fazer parte da expressao SELECT

                --> exemplo: Selecione a quatidade de funcionarios por cargo;

                SELECT Cargos, COUNT (*) as Qtde
                    FROM Funcionario
                GROUP BY Cargo 


                --> exemplo - 2: Selecione o somatorio de salarios por departamento por depto, em ordem decrescente da soma 

                SELECT Cod_Depto, sum(Salario) as Soma 
                    FROM Funcionario 
                GROUP BY Cod_Depto ORDER BY 2 desc 

                    -> explicacao: selecionamos o codigo do departamento e o somatorio de salarios, agrupado pelo codigo do departamento, em ordem 2 desc que no caso e o salario em ordem decrescente.

        

        HAVING (Filtro por agrupamento)

            -> A expressao HAVING so pode aparecer depois da expressao GROUP BY, funcionando como um filtro para o agrupamento.

            -> Resumidamente, o HAVING e o WHERE do GROUP BY

            -> Atraves do HAVING pode-se selecionar apenas os agrupamentos desejados que atendam determinadas condicoes, Os campos que fazem o filtro do HAVING nao precisam necessariamente estar selecionados.

                --> exemplo: Selecione a quantidade de funcionarios por departamento por depto, mas apenas para os departamentos com mais de 3 funcionarios.

                SELECT Cod_depto, COUNT(*) as Qtde 
                    FROM Funcionario
                GROUP BY Cod_depto HAVING Count(*) > 3

                    -> o having ai tem que ter um count maior que 3, o agupamento de dois funcionarios nao sera exibido


                --> exemplo: Selecione o maior salario por cargo, mas apenas para os cargos com mais de 1 funcionario, em ordem alfabetica do cargo

                    SELECT Cargo, max(Salario) as Maior 
                        FROM Funcionario
                    GROUP BY Cargo having count(*) > 1 Order by Cargo

                    -> o having ai mostra que devemos ter mais de um funcionario para que seja exibido, e tambem depois faz a ordenacao de acordo com cargo, em ordem alfabetica; obs: sempre vem o group by primeiro e depois o order by

                
                // DIFERENCA ENTRE WHERE E HAVING // : 

                WHERE;

                SELECT departament_id, count(*)
                    FROM employees e 
                        WHERE manager_id = 100
                        GROUP BY departament_id
                    ORDER BY departament_id
                
                -> Clausula WHERE restringe as tuplas da relacao 

                -> Posteriormente os grupos sao criados 

                -> Funcao do grupo e aplicada.


                HAVING;

                SELECT departament_id, count(*)
                    FROM employees e 
                    GROUP BY departament_id
                    HAVING count(*) > 1
                ORDER BY departament_id;

                -> Os grupos sao criados 

                -> Funcao de grupo e aplicada 

                -> a clausula HAVING restringe os grupos aos que se enquadram no criterio da clausula HAVING (count (*) > 1)









16. // CASE WHEN THEN ELSE END // 

        -> para concatenacao de Strings podemos utilizar o operador +, como o exemplo abaixo: 

            SELECT BusinessEntityID, 
                PersonType, 
                NameStyle, 
                Title, 
                FirstName, 
                MiddleName, 
                LastName,

                FirstName + ' ' + MiddleName + ' ' + LastName AS [Nome Completo]

            FROM Person.Person


        -> agora para trazer algumas estrituras condicionais utilizaremos o case, suponhamos que o a classe title, ao inves de ser "Mr." ou "Ms.", mudaremos para visualizar do jetio que queremos, exemplo: 

                SELECT BusinessEntityID, 
                        PersonType, 
                        NameStyle, 
                        Title, 
                    
                    CASE TITLE 
                        WHEN 'Ms.' THEN 'Sra.'
                        WHEN 'Mr.' THEN 'Sr'
                        ELSE ' '
                    END AS TITULO  

                FROM Person.Person

                    --> O que esta acontecendo aqui e que caso(case) o titulo(coluna) seja(WHEN) 'Ms.' entao(THEN) sera 'Sra.', caso seja 'Mr.' entao sera 'Sr', caso nao seja nenhum dos dois sera ' '. e portanto o fim(END) que ira renomear a coluna para TITULO.


                outros exemplos: 

                CASE 
                    WHEN Rate < 12.000 THEN 'SALARIO MINIMO'
                    WHEN Rate BETWEEN 12.000 AND 20.000 THEN 'SALARIO MEDIO'
                    WHEN Rate > 20.000 THEN 'SALARIO ALTO'
                END AS Faixa_Salarial

                ------------------------------------------------------

                CASE 
                    WHEN Rate < 12.000 THEN (Rate * 3)
                    WHEN Rate BETWEEN 12.000 AND 20.000 THEN (Rate * 1.1)
                    WHEN Rate > 20.000 THEN (Rate * 1.05)
                END AS [COMPARACAO NUMERAL]








17. // CONVERSOES (CAST, CONVERT, TRY_CAST, TRY_CONVERT) // 


        -> Em operadores aritimeticos vimos que se pegarmos um numero e tentar somar com outro numero teremos uma soma, mas se pegarmos isso com valores do tipo texto temos uma concatenacao, mas suponhamos que o texto e o valor venha desse jeito;

        SELECT '102343'
            ---> Veremos que esse select e do tipo texto, mas se quisersemos fazer alguma adicao ai como fariamos isso? 

        SELECT (SELECT '35') + (SELECT '17')
            -> Isso ira gerar o resultado '3517', ou seja, uma concatenacao, mas se quisermos fazer uma adicao como faria isso? poderiamos fazer um cast passando isso para um tipo numerico 


            1. CAST 

                --> padrao de escrita da funcao: 
                    - CAST(Valor[Nome_da_Coluna] AS [Tipo_de_Dado])

                --------------------------------------------------------------------------

                -> CAST e uma funcao que converte um tipo de dado em outro, e e uma funcao padrao do SQL, e e uma funcao que e mais padronizada

                SELECT (SELECT CAST('35' AS INT)) + (SELECT CAST('17' AS INT)) AS RESULTADO
                    --> Isso que esta acontecendo e que esta passando o texto para um tipo numerico do tipo INTEIRO, e ai sim ele ira fazer a adicao dos valores, e ira gerar o resultado 52;


                SELECT CAST('20210101' AS DATE) AS DATA
                    --> Isso ira passar o resultado para o tipo Data, e ira gerar o resultado 2021-01-01;



            2. CONVERT

                --> padrao de escrita da funcao: 
                    - CONVERT([Tipo_de_Dado], Nome_da_Coluna[], style(opcional))  


                    temos uma funcao no sql chamada de GETDADE() que retorna a data atual do sistema: 

                    SELECT GETDATE()
                        --> usando o padrao brasileira isso nao seria a melhor coisa para gente, teriamos que converter para o nosso padrao, e para isso poderiamos usar o CONVERT

                    SELECT CONVERT(varchar, GETDATE(), 103)
                        --> o que esta acontecendo aqui e que ele esta convertendo a data para o tipo varchar, e o 103 e o estilo que ele esta convertendo, e o estilo 103 e o padrao brasileiro, entao ele ira converter a data para o padrao brasileiro, e ira gerar o resultado 01/01/2021, temos inumeros padroes a serem vistos;

                        -> no tipo explicativo o que esta acontecendo ai e selecione e conveta para mim para tipo de texto, qual segundo parametro? a minha data que queremos receber e o style que sera o padrao que queremos receber;


                    
                
                
            3. TRY CAST / TRY CONVERT 


                -> Utilizando apenas o convert e o cast, teremos um problema caso tenhamos um problema o fluxo inteiro sera intenrrompido, para isso podemos utilizar do try convert igualmente temos o try cast, ou seja, ele tenta fazer a conversao caso nao consiga ele ira continuar o fluxo.


                exemplo: 

                SELECT TRY_CONVERT(DATE, '14/02/2017', 101) AS COLUNA1, 
                SELECT TRY_CONVERT(DATE,'02/14/2017', 101) AS COLUNA2

                    --> ele ira dar o resultado para primeira coluna como Null e a segunda ele ira apresentar na tela, porque ao converter as datas ficaram assim: 

                    /*
                        COLUNA1 = 2017-14-02 -> Isso e uma data invalida 
                        COLUNA2 = 2017-02-14 -> Isso e uma data valida
                    */








18. // CONVERSOES(PARSE, TRY_PARSE) //

        1. Padrao de escrita da funcao:
            - Parse(Nome_da_coluna AS [Tipo_de_Dado] [Using Culture])

            -> Parse e uma funcao que converte uma string em um tipo de dado especifico, e e uma funcao padrao do SQL, e e uma funcao que e mais padronizada. 

            SELECT PARSE('2654' AS INT)
                --> aqui ele esta passando(parse) o numero para o tipo de dado string

            

            -> temos tambem a opcao do try_parse, que ele nao ira interromper o fluxo, ele ira tentar vazer a conversao, caso nao consiga ele ira continuar o fluxo, e ele ira retornar um valor nulo.


            SELECT TRY_PARSE('1015F' AS INT)    
                --> Ele ira tentar passar esse numero para inteiro, mas como ele contem uma letra nao ira conseguir, entao ira retornar null;


        - O que seria o Using Culture
            -> digamos que queremos selecionar um padrao cultural de um pais de como ele ira ser exibido

            exemplo: 
                SELECT PARSE('R$360,00' AS MONEY USING 'pt-br')
                    --> ira retornar o valor 360,00, ou seja, ele ira converter o valor para o padrao brasileiro, e ira retornar o valor 360,00;

                SELECT PARSE('2010/10/01' AS DATE USING 'pt-br')
                    --> ira retornar a data 01/10/2010, ou seja, ele ira converter a data para o padrao brasileiro, e ira retornar a data 01/10/2010;



        -> o try_parse e o parse por propria recomendacao do sql server, nao e recomendado a utilizacao de ambos, e recomendado se utilizar o convert e o cast, como o exemplo abaxio;


        SELECT BusinessEntityID,
               Title,
               FirstName,
               MiddleName,
               LastName,
               ModifiedDate,

               TRY_CAST(ModifiedDate AS DATE) AS [Data Modificada],
               TRY_CONVERT(varchar, ModifiedDate, 103) AS [Data Modificada 2.0]

        FROM Person.Person









19. // FUNCOES DE DATA E HORA DO SISTEMA // 

    -> GETDATE(): retorna a data e hora atual do sistema;

    -> SYSDATETIME(): similar ao getdate(), mas com maior precisao nos segundos;

    -> GETUTCDATE(): retorna a data e hora atual do sistema no formato UTC;

    -> SYSUTCDATETIME(): similar ao getutcdate(), mas com maior precisao nos segundos;

    -> SYSDATETIMEOFFSET(): retorna a data e hora atual do sistema com o fuso horario;

    -> CURRENT_TIMEZONE(): retorna o fuso horario atual do sistema;








20. // FUNCOES DE DATA E HORA (DATEPART, DATENAME, ISDATE) // 

    # DATEPART: retorna uma parte especifica de uma data, como o dia, mes, ano, hora, minuto, segundo, etc;

        Padrao de escrita da funcao: 
            - DATEPART(Parte_da_data, Data) --> retorna um inteiro

        -> poderemos utilizar ele juntamente com as funcoes acima (19.), exemplo:

        SELECT GETDATE() AS [GETDATE], 
               DATEPART(HOUR, GETDATE()) AS HORA

               --> O que esta acontecendo ai e que em uma colunas estamos mostrando a data e hora completa, e na outra coluna estamos pegando uma parte(part) da data(date), que no caso e a hora(hour), e ira retornar somente a hora atual do sistema;

            -> porderiamos fazer isso tambem para: year (ano), month (mes), day (dia), minute (minuto), second (segundo), etc;



        * O sql server da uma possibilidade de fazer uma abreviacao, ou seja, ao inves de colocar o nome completo do mes, poderiamos colocar a abreviacao do mes, e para isso poderiamos utilizar a funcao DATENAME, exemplo:

        exemplo: 

            SELECT 
                YEAR(GETDATE() AS [ANO SOZINHO])
                MONTH(GETDATE() AS [MES SOZINHO])
                DAY(GETDATE() AS [DIA SOZINHO])

        -> se quisessemos trazer algo mais preciso, trazer o microsecond poderiamos usar o systemdatetime, exemplo: 

            SELECT 
                DATEPART(MICROSECOND, SYSDATETIME()) AS MICROSEGUNDO
                DATEPART(MILLISECOND, SYSDATETIME()) AS MILISEGUNDO
                DATEPART(NANOSECOND, SYSDATETIME()) AS NANOSEGUNDO
                 


    # DATENAME: Temos outra funcao que trata para nos os nomes por extenso dos meses, dias, etc, que e a funcao DATENAME(), exemplo: 

    /*podemos setar a linguagem tambem: 
        SET LANGUAGE ENGLISH 
        - ele ira retornar os nomes dos mesese em ingles ou de outra conteudo
    */

            Padrao de escrita da funcao: 
                - DATENAME(Parte_da_data, Data) --> retorna uma cadeia de caracteres

            SELECT 
                DATENAME(DAY, GETDATE()),
                DATENAME(MONTH, GETDATE())



        -> exemplo na utilizacao de uma consulta do dia dia, lembrando que nao e muito recomendando utilizar funcoes dentro da clausula WHERE porque se perde muita performace;
        
             SELECT BusinessEntityID, 
                    Title, 
                    FirstName, 
                    MiddleName, 
                    LastName, 
                    TRY_CAST(ModifiedDate AS DATE) AS [Data Modificada],
                    DATEPART(YEAR, ModifiedDate) AS ANO,
             FROM Person.Person
                WHERE DATEPART(YEAR, ModifiedDate) = 2010 AND
                    DATENAME(MONTH, ModifiedDate) = 'Dezembro'




    # ISDATE: Ele vai avaliar se essa coluna ou campo e do tipo data, se ele for ele ira retornar true(1) ou false(0)

        Padrao de escrita da funcao: 
                - ISDATE(Nome_da_Coluna --> retorna true(1) | false(0)


        - exemplo: 

            SELECT BusinessEntityID, 
                    Title, 
                    FirstName, 
                    MiddleName, 
                    LastName, 
                    TRY_CAST(ModifiedDate AS DATE) AS [Data Modificada],
                    DATEPART(YEAR, ModifiedDate) AS ANO,

                    ISDATE(ModifiedDate) AS [E DATA?]
                    ISDATE(TRY_CONVERT(varchar, ModifiedDate, 103)) AS [E DATA?] 

             FROM Person.Person
                WHERE DATEPART(YEAR, ModifiedDate) = 2010 AND
                    DATENAME(MONTH, ModifiedDate) = 'Dezembro'








21. // FUNCOES DE DATA E HORA (EOMONTH, DATEFROMPARTS, TIMEFROMPARTES, DATETIMEFROMPARTS) // 

    -> EOMONTH: Retorna o ultimo dia do valor que voce passar nele, pode ser um funcao a ser passada ou uma coluna, exemplo: 

        SELECT 
            EOMONTH(GETDATE()) AS ULTIMO_DIA_DO_MES,
                --> ele ira retornar o ultimo dia do mes atual, ou seja, o dia 31;

            EOMONTH('2021-02-01') AS ULTIMO_DIA_DO_MES_2
                --> ele ira retornar o ultimo dia do mes

            EOMONTH('2021-02-01', 3) AS MES 
                -->  segundo paramentro(3) e opcional, se quiserssemos colocar 3 ele ira adicionar 3 meses a mais;

            EOMONTH('2021-02-01', -3) AS MES
                --> Ele ira fazer o mesmo do de cima so que ao contrario 


    -> DATEFROMPARTS: Ele ira criar uma data a partir de partes, ou seja, voce passa o ano, mes e dia e ele ira retornar a data, exemplo:

        --> sintaxe: 
            /*
                DATEFROMPARTS(ano, mes, dia) [TODOS DO TIPO INTEIRO] : RETORNO SERA UM DATE
            */

        SELECT DATEFROMPARTS(2015, 12, 25) AS DATA
            --> ele ira retornar a data 2015-12-25

    

    -> TIMEFROMPARTS: Ele ira criar uma hora a partir de partes, ou seja, voce passa a hora, minuto, segundo e milisegundo e ele ira retornar a hora, exemplo:

        --> sintaxe: 
            /*
                TIMEFROMPARTS(hora, minuto, segundo, milisegundo) [TODOS DO TIPO INTEIRO] : RETORNO SERA UM TIME
            */


        SELECT TIMEFROMPARTS(12, 30, 40 ,0  ) AS HORA 
            --> ele ira retornar a hora 12:30:40



    -> DATETIMEFROMPARTS: Ele ira criar uma data e hora a partir de partes, ou seja, voce passa o ano, mes, dia, hora, minuto, segundo e milisegundo e ele ira retornar a data e hora, exemplo:


        --> sintaxe: 
            /*
                DATETIMEFROMPARTS(ano, mes, dia, hora, minuto, segundo, milisegundo) [TODOS DO TIPO INTEIRO] : RETORNO SERA UM DATETIME
            */

        SELECT DATETIMEFROMPARTS(2015, 12, 25, 12, 30, 40, 0) AS DATA_HORA
            --> ele ira retornar a data e hora 2015-12-25 12:30:40   








22. // FUNCOES DE DATA E HORA (DATEDIFF, DATEDIFF_BIG, DATEADD)  // 

    -> DATEDIFF: Retorna a diferenca entre duas datas, ou seja, voce passa duas datas e ele ira retornar a diferenca entre elas, exemplo:

        --> sintaxe: 
            /*
                DATEDIFF(Parte_da_data, Data1, Data2) : RETORNO SERA UM INTEIRO
            */

        SELECT DATEDIFF(DAY, '2005-08-15', GETDATE()) AS DIAS
            --> ele ira retornar a diferenca de dias entre a data passada e a data  atual;



    -> DATEDIFF_BIG: Similiar ao DATEDIFF(), a diferenca que esse tem uma precisao maior, porque assim ele consegue retornar nanosecond;

        --> sintaxe: 
            /*
                DATEDIFF_BIG(Parte_da_data, Data1, Data2) : RETORNO SERA UM BIG   INT            
            */

        SELECT DATEDIFF_BIG(NANOSECOND, '2005-08-15', GETDATE()) AS DIAS
            --> ele ira retornar a diferenca de dias entre a data passada e a data atual;



    -> DATEADD(): Adiciona uma quantidade de tempo a uma data, ou seja, voce passa uma data e uma quantidade de tempo e ele ira retornar a data, exemplo:

        --> sintaxe: 
            /*
                DATEADD(Parte_da_data, Quantidade, Data) : RETORNO SERA UM DATE
            */

        SELECT DATEADD(DAY, 10, GETDATE()) AS DATA
            --> ele ira retornar a data atual mais 10 dias;

        SELECT DATEADD(MONTH, 2, GETDATE()) AS DATE
            --> ele ira retornar a data atual mais 2 meses;

        SELECT DATENAME(MONTH, DATEADD(MONTH, 2, GETDATE())) AS MES
            --> ele ira retornar o nome do mes atual mais 2 meses; 








23. // CONCATENACAO (CONCAT E CONCAT_WS) // 

    - vamos para um exemplo, que se tentarmos executar isso abaixo teriamos um erro, porque ele ira tentar somar os valores, e nao ira concatenar:  

        -- SELECT 'Kayque' + 'Allan' + 12345

        CONCAT(): temos uma funcao que sera bastante util chamada concat, e o bom dela e que ela recebe inumeros argumentos, e ela ira concatenar todos eles, exemplo:

            SELECT CONCAT('Kayque', 'Allan', 12345)
                --> ele ira retornar o valor 'KayqueAllan12345'


        CONCAT_WS(): temos a funcao tambem de concatenacao passando como o primeiro argumento o separador, e os demais argumentos serao concatenados, exemplo:

            SELECT CONCAT_WS(' ', 'Kayque', 'Allan', 12345, 'Ribeiro')
                --> ele ira retornar o valor 'Kayque Allan 12345 Ribeiro'









24. // TRATANDO NULL (ISNULL, COALESCE) // 

    -> Quando mostrarmos isso a pessoas superiores seria mutio feio mostrar dessa forma, porque apareceria um tanto de null na tela, poderiamos utilizar a funcao: 

    ISNULL(): Essa funcao ira substituir os valores nulos por um valor padrao, exemplo: 

        /* 
            ISNULL(Nome_da_Coluna, Valor_Padrao) : RETORNO SERA O VALOR PADRAO
        */
        
        SELECT BusinessEntityID, 
                PersonType, 
                NameStyle,
                ISNULL(Title, ' ') AS Title,
                FirstName,
                MiddleName,
                LastName,
                AdditionalContactInfo,
                TRY_CONVERT(varchar, ModifiedDate, 103) AS [Data Modificada],
        FROM Person.Person
            WHERE Suffix IS NOT NULL 

        

    COALESCE(): Essa funcao recebe varias colunas/ valores ou paramentros, e vai fazer algumas verificacoes, o primeiro e nulo o segundo e nulo o terceiro e nulo... ele ira ficar pulando os valores que sao nulos ate achar alguem que nao seja null, ja sabemos que title tem coisas do tipo null, entao olha o que podemos fazer: 

        SELECT * ,
                COALESCE(Tile, MiddleName, Suffix, FirstName) AS [COALESCE]
        FROM Person.Person

            -> Vejam ele ira passando por cada argumento, e ira retornar o que nao seja nulo, para que serve isso? pode lhe ser util caso queiramos trazer varias colunas e saber quem nao e nulo, e depender do que seja podemos tomar uma decisao;   








25. // ORDEM DE PROCESSAMENTO LOGICO DA QUERY // 

    -> SELECT SalesOrderID,
              SalesOrderDetailID,
              CarrierTrackingNumber,
              MAX(OrderQty) AS COL,
              ProductID,
              UnitPrice,
              LineTotal,
              TRY_CAST(ModifiedDate AS DATE) AS [DataModificada]

        FROM Sales.SalesOrderDetail
        WHERE DataModicada = 2011-05-31

        -> Se tentarmos executar isso, ira dar um erro, porque no sql server temos uma coisa chamada de ordem de processamento logico da query, e a ordem que a query sera executada, a maneira que nos seres humanos lemos a query, nao e maneira como o sql ira executala, e a ordem de processamento logico e a seguinte:

            1. FROM
            2. WHERE
            3. GROUP BY
            4. HAVING
            5. SELECT 
            6. ORDER BY
            7. OFFSET FETCH | TOP



        -> Porque ele nao da erro de sintaxe "MAX(OrderQty) AS COL", mas quando executarmos ele ira dar erro de compilacao, porque ele ira executar primeiro o "FROM" depois o "WHERE" , quando chegar no "SELECT" por nao termos o GROUP BY, ele vai estar "crente", que teremos um grop by abaixo que ira tratar esse agrupamento de linhas, so que isso nao ira acontecer, quando executarmos isso ira dar um erro pois nao tratamos no group by;


        exemplos: 

            SELECT SalesOrderID [Primeira Coluna],
                CarrierTrackingNumber,
                MAX(UnitPrice) AS TOTAL,
                TRY_CAST(ModifiedDate AS DATE) AS [DataModificada]

                FROM Sales.SalesOrderDetail
            WHERE DataModicada = 2011-05-31   
            GROUP BY SalesOrderID, 
                     CarrierTrackingNumber,
                     ModifiedDate   
            HAVING MAX(UnitPrice) > 750.000
            ORDER BY [Primeira Coluna] ASC

                -> Primero ele esta pegando da tabela SalesOrderDetail, depois ele esta fazendo um filtro, depois ele esta agrupando, depois ele esta fazendo um filtro, e depois ele esta ordenando, e isso e a ordem de processamento logico da query, o interessante que podemos fazer e que podemos colocar ao inves do nome principal da coluna, podemos utilzar o apelido em ORDER BY, porque ele entende, mas por qual motivo? porque ele e executado depois do select 








26. // OPERADORES UNION E UNION ALL // 

    -> exemplo abaixo: 

        SELECT 
            'DevDojo' AS [NOME]
            'Java' AS [LINGUAGEM]

        SELECT 
            'GOOGLE' AS [EMPRESA]
            'KOTLIN' AS [LINGUAGEM]

            
            -> Vimos antes que o join relaciona tabelas, relacionamos colunas com outras colunas de outras tabelas, ao inves de fazer essa juncao quisermos fazer uma UNION, ao inves de nos fazermos duas consultas tivessemos apenas uma, pensando nisso temos o comand UNION: 

        # UNION: Ele ira juntar os resultados de duas consultas, e ira retornar um unico resultado, mas ele ira remover os valores duplicados, ou seja, ele ira retornar apenas um valor, exemplo:

            SELECT 
                'DevDojo' AS [NOME]
                'Java' AS [LINGUAGEM]

            UNION

            SELECT 
                'GOOGLE' AS [EMPRESA]
                'KOTLIN' AS [LINGUAGEM]

                -> ele ira retornar o resultado: 

                    /*
                        NOME    | LINGUAGEM
                        DevDojo | Java
                        GOOGLE  | KOTLIN
                    */

            exemplo: 

                SELECT PersonType [COLUNA 4],
                       FirstName [COLUNA 5],
                       MiddleName [COLUNA 6]
                FROM Person.Person
                WHERE MiddleName IS NOT NULL AND FirstName = 'Aaron'
            1 - ORDER BY FirstName

                    UNION

                SELECT PersonType AS [COLUNA 1]
                       FirstName AS [COLUNA 2],
                       MiddleName AS [COLUNA 3]
                FROM Person.Person 
                WHERE MiddleName IS NOT NULL AND FirstName = 'Abigail'
                ORDER BY FirstName

                    -> Se tentarmos executar isso ele ira dar erro, mas se comentarmos o primeiro order by o problema acaba, mas porque o problema acaba? porque o order by vem apos o select 

                

                    ... continuando o exemplo:


                SELECT PersonType [COLUNA 4],
                       FirstName [COLUNA 5],
                       MiddleName [COLUNA 6]
                FROM Person.Person
                WHERE MiddleName IS NOT NULL AND FirstName = 'Aaron'

                    UNION

                SELECT PersonType AS [COLUNA 1]
                       FirstName AS [COLUNA 2],
                       MiddleName AS [COLUNA 3]
                FROM Person.Person 
                WHERE MiddleName IS NOT NULL AND FirstName = 'Abigail'

                ORDER BY --[COLUNA 4] / [COLUNA 5] / [COLUNA 6]


                    -> Se retiramos e o primeiro order by e deixar somente o segundo, o auto complit dele aparece somente as colunas 4,5,6 como descrito acima, ou seja, ao termino do union esse order by, ele vai trazer a ordenacao do primeiro bloco, ou seja, do primeiro select, coluna 1,2 ,3 foram concatenadas  entao regras de ordenacao serao para o primeiro bloco 


        # UNION ALL : Ele ira juntar os resultados de duas consultas, e ira retornar um unico resultado, mas ele ira retornar os valores duplicados, ou seja, ele ira retornar todos os valores, exemplo:

            SELECT 
                'DevDojo' AS [NOME]
                'Java' AS [LINGUAGEM]

            UNION ALL

            SELECT 
                'DevDojo' AS [EMPRESA]
                'Java' AS [LINGUAGEM]

                -> ele ira retornar o resultado: 

                    /*
                        NOME    | LINGUAGEM
                        DevDojo | Java
                        DevDojo | Java
                    */








27. // OPERADORES EXCEPT E INTERSECT // 

    -> EXCEPT: Retornara os valores da primeira tabela / consulta que nao estarao na segunda consulta / tabela 

        SELECT 
                'DevDojo' AS [NOME]
                'Java' AS [LINGUAGEM]

            EXCEPT

        SELECT 
            'GOOGLE' AS [EMPRESA]
            'KOTLIN' AS [LINGUAGEM]

                -> ele ira retornar o resultado, porque vejamos que o nome devdojo e java nao existem na consulta debaixo, entao ele esta trazendo o que tem na primeira e nao tem na segunda :

                    /*
                        NOME    | LINGUAGEM
                        DevDojo | Java
                    */




        -> INTERSECT: Retornara a intersecao dos valores / o que for de comum: 

            SELECT BusinessEntityID AS [COL2],
                FROM Person.Person -- 19.972 rows

              INTERSECT 

            SELECT BusinessEntityID AS [COL1]
                FROM HumanResources.Employee -- 290 rows 



        !! lembrando que temos que ter a mesma quantidade de colunas quando for fazer a selecao, caso contrario teremos um erro de compilacao;









28. // FUNCOES DO TIPO TEXTO (SUBSTRING) // 

    # SUBSTRING(): Retorna uma parte de uma string, ou seja, voce passa a string, o inicio e o tamanho, e ele ira retornar a parte da string, exemplo:

        /* 
            SUBSTRING(Nome_da_Coluna, Inicio, Tamanho) : 
                retorna sempre sera texto, nchar, char, varchar, nvarchar, ntext, text 
        */

        SELECT 'O melhor canal do youtube e o DevDojo, Brabo demais!' AS COLUNA

        -> se quisessemos pegar apenas um pedaco do texto, como poderiamos resolver isso? poderiamos utilizar a funcao substring, exemplo:

            SUBSTRING('O melhor canal do youtube e o DevDojo, Brabo demais!', 3 , 5) AS SUBSTRING

            --> ele ira retornar o valor "melho", ou seja, ele ira pegar a partir do terceiro caractere e ira pegar 5 caracteres a frente, e ira retornar o valor "melho";


        ... outros exemplos: 

            SELECT BusinessEntityID,
                   SUBSTRING(BusinessEntityID, 1, 2) as [SUBSTRING INT]
                   PersonType,
                   Title,
                   FirstName,
                   MiddleName,
                   LastName,
                   ModifiedDate,
            FROM Person.Person

                -> Se tentarmos fazer isso e executar ja iremos dar um erro de compilacao porque coluna do tipo inteiro nao podemos passar no substring, ele e uma funcao para tratar texto;


            
            * Como seria a tratativa caso passariamos uma data dentro do susbstring? 

                SELECT 
                    SUBSTRING(ModifiedDate, 1, 4) AS [ANO]
                    
                    -> Teriamos um problema, o susbtring trata somente valores do tipo texto, entao nao podemos passar valores que nao sejam do tipo texto para ele;








29. // FUNCOES DO TIPO TEXTO (CHARINDEX, PATINDEX) // 

    # CHARINDEX(): Retorna a posicao de uma expressao em uma string, ou seja, voce passa a expressao e a string, e ele ira retornar a posicao da expressao, e uma expressao do tipo texto que ira retornar um inteiro, exemplo:

        /*
            CHARINDEX('expressaoAprocurar', Nome_da_Coluna)
        */

        SELECT BusinessEntityID,
               EmailAddress,
               CHARINDEX('@', EmailAddress) AS [POSICAO ARROBA]
               ModifiedDate
        FROM Person.EmailAddress

            --> Ira retornar o numero da posicao da arroba na string, ou seja, ele;


        -> vamos para outro exemplo bem especifico, onde temos a coluna EmailAddress, ondem contem os enderecos de email, e no caso precisaremos de apenas o nome da pessoa ou sua indentificacao que ira ficar antes do '@', nesse caso poderiamos utilizar o substring  e tamebm o charindex: 

            SELECT BusinessEntityID,
                EmailAddress,
                SUBSTRING(EmailAddress, 1, CHARINDEX('@', EmailAddress) -1) [PESSOA NAME]
            FROM Person.EmailAddress

                --> Vamos entender o que ele esta fazendo aqui antes de executar, o charindex ira retornar algo do tipo inteiro, o terceiro argumento do tipo substring() e algo do tipo inteiro, sera o tamanho / comprimento que queremos retornar, entao estamos pegando a posicao do '@', e dentro de charindex ele esta retornando um numero inteiro que onde esta o '@', e estamos passando isso para o substring, e ele ira retornar o nome da pessoa antes do '@';   



    # PATINDEX(): Retorna a posicao de uma expressao em uma string, ou seja, voce passa a expressao e a string, e ele ira retornar a posicao da expressao, e uma expressao do tipo texto que ira retornar um inteiro, exemplo:

        /*
            PATINDEX('%padrao%', Nome_da_Coluna)
        */             


        SELECT CHARINDEX('Y', 'O melhor canal do youtube e o DevDojo, brabo demais')
               PATINDEX('%e_o__e%', 'O melhor canal do youtube e o DevDojo, brabo demais')

               --> Eles sao bastante iguais, e parecido com o LIKE, onde podemos passar um padrao, e ele ira retornar a posicao do padrao;








30. // FUNCOES DO TIPO TEXTO (LEN, DATALENGTH, LEFT & RIGHT) // 

    # LEN(): Retorna o tamanho da minha coluna de algo que estou passando para ele

        /*
            LEN(Nome_da_Coluna) : RETORNO SERA UM INTEIRO
        */

        SELECT LEN(' DevDojo   ') AS [TAMANHO]
            --> ele ira retornar o valor 8, ou seja, ele ira retornar o tamanho da string que estamos passando para ele, OBS: os espacoes a direita ele nao ira contar, mas os espacos a minha esquerda ele conta;


    # DATALENGTH(): Retorna o tamanho da minha coluna de algo que estou passando para ele,  a quantidade de bytes | tipo int 

        /*
            DATALENGTH(Nome_da_Coluna) : RETORNO SERA UM INTEIRO
        */

        SELECT DATALENGTH(' DevDojo   ') AS [TAMANHO]
            --> ele ira retornar o valor 11, ou seja, ele ira retornar o tamanho da string que estamos passando para ele, OBS: ele ira contar os espacos a direita e a esquerda;



    # LEFT(): Retorna uma parte da string a partir do inicio, ou seja, voce passa a string e o tamanho, e ele ira retornar a parte da string, exemplo:

        /*
            LEFT(Nome_da_Coluna, Tamanho) : RETORNO SERA UM TEXTO
        */

        SELECT LEFT('O melhor canal do Youtube e o DevDojo, brabo demais!', 5) AS [LEFT]
            --> ele ira retornar o valor "O mel", ou seja, ele ira pegar os 5 primeiros caracteres da string;


    # RIGHT(): Retorna uma parte da string a partir do final, ou seja, voce passa a string e o tamanho, e ele ira retornar a parte da string, exemplo:

        /*
            RIGHT(Nome_da_Coluna, Tamanho) : RETORNO SERA UM TEXTO
        */

        SELECT RIGHT('O melhor canal do Youtube e o DevDojo, brabo demais!', 5) AS [RIGHT]
            --> ele ira retornar o valor "mais!", ou seja, ele ira pegar os 5 ultimos caracteres da string;









31. // FUNCOES DO TIPO TEXTO (REPLACE, REPLICATE, STUFF) // 

    # REPLACE(): Substitui uma expressao por outra em uma string, ou seja, voce passa a string, a expressao que deseja substituir e a expressao que ira substituir, exemplo:

        /*
            REPLACE(Nome_da_Coluna / Expressao, 'textoParaProcurar', 'textoQueSubstituira')
        */

        SELECT 'DevDojo brabo demais!' AS [devdojo]
            REPLACE('DevDojo brabo demais!', 'brabo', 'bolado') AS [REPLACE]

                --> ele ira retornar o valor "DevDojo bolado demais!", ou seja, ele ira substituir a palavra "brabo" por "bolado";


    # REPLICATE(): Repete uma string um numero especifico de vezes, ou seja, voce passa a string e o numero de vezes que deseja repetir:

        /*
            REPLICATE(Expressao_a_repllicar, Numero de vezes) : RETORNO SERA UM TEXTO
        */

        SELECT REPLICATE('0', 10) AS [REPLICATE]
            --> ele ira retornar o valor "0000000000", ou seja, ele ira repetir o "0" 10 vezes;
    

    # STUFF(): Substitui uma parte de uma string por outra, ou seja, voce passa a string, a posicao de inicio, o tamanho e a expressao que ira substituir:

        /*
            STUFF(Expressao / Nome_da_Coluna, posicaoIncio, tamanho, 'substituicao)
        */

        SELECT STUFF('DevDojo brabo demais!', 9, 5, 'bolado') AS [STUFF]
            --> ele ira retornar o valor "DevDojo bolado demais!", ou seja, ele ira substituir a partir do 9 caractere, 5 caracteres pela palavra "bolado";
    



    exemplo utilizando AdventureWorks:

        -> Vamos supor que precisamos substituir o'@' por qualquer outra expressao, suponhamos tambem que antes de cada numero da coluna BusinessEntityID colocar a quantidade de zeros respectivos;

        SELECT BusinessEntityID, 
               CONCAT( REPLICATE('0', LEN( (SELECT MAX(BusinessEntityID) FROM Person.Person) ) - LEN(BusinessEntityID) ),
               PersonType,
               Title,
               FirstName,
               MiddleName,
               LastName,

               REPLACE(EmailAddress, '@', '\|/') AS [REPLACE]


        FROM Person.Person AS PP 
        JOIN Person.EmailAddress AS PEA ON PP.BusinessEntityID = PEA.BusinessEntityID



     PT2 UTILIZANDO ESSAS FUNCOES: 

        -> Vamos supor que nossa coluna de name temos alguns nomes que contem o Nome/espaco/traco, quanto a outros tem numero traco e letra, e queremos substituir colando um espaco poderiamos utilizar o replace

        SELECT SalesOrderDetailID,
               CarrierTrackingNumber,
               SSDD.ProductID,
               ProductNumber,
               REPLACE(PP.Name,'-', ' - ') AS [REPLACE1],
                    --> alguns ja contem esses espacos ao adicionar mais esse hifem, ele ira adicionar mais espaco ainda nos que contem
               UnitPrice,
               LineTotal,
               SSDD.ModifiedDate,
            FROM Sales.SalesOrderDetail AS SSDD LEFT JOIN Prodution.ProductID
            ON SSDD.ProductID = PP.ProductID
        ORDER BY SalesOrderDetailID


        - nesse caso podemos solucionar da seguinte forma, utilizando o patindex e case when e then:


    Atualizando...

            SELECT SalesOrderDetailID,
               CarrierTrackingNumber,
               SSDD.ProductID,
               ProductNumber,
               --REPLACE(PP.Name,'-', ' - ') AS [REPLACE1],

            CASE 
                WHEN PATINDEX('%[0-9A-z]-[0-9A-z]%', PP.Name) > 0
                THEN STUFF(PP.Name, (PATINDEX('%[0-9A-z]-[0-9A-z]%', 1, PP.Name) + 1), 1, ' - '),
                    ELSE PP.Name
            END AS [STUFF_2],

                --> explicacao: podemos pegar a linha 32 para visualizar melhor, o que nos fizemos? aqui na minha posicao(patindex) o que ele esta retornarndo? a ocorrencia que passamos para ele? me traz o  que tiver o traco no meio qualquer numero ou letra que estiver na minha esquerda e qualquer numero ou letra que estiver na minha direita deste caracter no meio, entao case -> quando essa posicao 'PATINDEX...' for maior que zero me faca isso aqui -> STUFF, O stuff seria, a coluna - posicaoInicial - tamanhoQueIraPegar - OqueEleIraSubstituir, a posicao que ele esta retornando e de um caracter antes do meu traco, so que queremos manipular especificamente o traco, entao adicionamos +1, porque a posicao inicial sera o espaco em branco ou a letra, nao queremos isso queremos que seja +1 e pegue o hifen, e logo apos vem o caracter que queremos pegar dali para frente que no caso seria 1, porque queremos pegar apenas o hifen e depois vem pelo o que queremos substituir;


              ...








32. // FUNCOES DO TIPO TEXTO (LTRIM, RTRIM, TRIM, UPPER, LOWER, SPACE, FORMAT) //

    -> vamos supor que algum usuario que quando ele passa algum dado em algum sistema ele de um monte de espaco no inicio e um monte de espaco no final: 

        SELECT '              DevDojo e o Melhor          ' AS DevDojo
            --> temos algumas funcoes que podem ajudar a tratar isso 



    # LTRIM(): Remove os espacos a esquerda de uma string, ou seja, voce passa a string e ele ira remover os espacos a esquerda, exemplo:

        /*
            LTRIM(Nome_da_Coluna) : RETORNO SERA UM TEXTO
        */

        SELECT LTRIM('              DevDojo e o Melhor          ') AS [LTRIM]
            --> ele ira retornar o valor "DevDojo e o Melhor          ", ou seja, ele ira remover os espacos a esquerda;
    


    # RTRIM(): Remove os espacos a direita de uma string, ou seja, voce passa a string e ele ira remover os espacos a direita, exemplo:

        /*
            RTRIM(Nome_da_Coluna) : RETORNO SERA UM TEXTO
        */

        SELECT RTRIM('              DevDojo e o Melhor          ') AS [RTRIM]
            --> ele ira retornar o valor "              DevDojo e o Melhor", ou seja, ele ira remover os espacos a direita;



    # TRIM(): Remove os espacos a esquerda e a direita de uma string, ou seja, voce passa a string e ele ira remover os espacos a esquerda e a direita, exemplo:

        /*
            TRIM(Nome_da_Coluna) : RETORNO SERA UM TEXTO
        */

        SELECT TRIM('              DevDojo e o Melhor          ') AS [TRIM]
            --> ele ira retornar o valor "DevDojo e o Melhor", ou seja, ele ira remover os espacos a esquerda e a direita;



    # UPPER(): Converte uma string para maiuscula, ou seja, voce passa a string e ele ira converter para maiuscula, exemplo:

        /*
            UPPER(Nome_da_Coluna) : RETORNO SERA UM TEXTO
        */

        SELECT UPPER('DevDojo e o Melhor') AS [UPPER]
            --> ele ira retornar o valor "DEVDOJO E O MELHOR", ou seja, ele ira converter para maiuscula;
    



    # LOWER(): Converte uma string para minuscula, ou seja, voce passa a string e ele ira converter para minuscula, exemplo:

        /*
            LOWER(Nome_da_Coluna) : RETORNO SERA UM TEXTO
        */

        SELECT LOWER('DevDojo e o Melhor') AS [LOWER]
            --> ele ira retornar o valor "devdojo e o melhor", ou seja, ele ira converter para minuscula;  


    # SPACE(): Retorna uma string com o numero especifico de espacos, ou seja, voce passa o numero de espacos e ele ira retornar a string com o numero de espacos, exemplo:

        /*
            SPACE(Numero_de_Espacos) : RETORNO SERA UM TEXTO
        */

        SELECT SPACE(10) AS [SPACE]
            --> ele ira retornar o valor "          ", ou seja, ele ira retornar 10 espacos;


    # FORMAT(): Formata um valor com o formato especifico, ou seja, voce passa o valor e o formato e ele ira retornar o valor formatado, exemplo:

        /*
            FORMAT(Nome_da_Coluna, Formato) : RETORNO SERA UM TEXTO
        */

        SELECT FORMAT(GETDATE(), 'dd/MM/yyyy') AS [FORMAT]
            --> ele ira retornar o valor "dd/MM/yyyy", ou seja, ele ira retornar a data formatada;

    

        exemplo: 

            SELECT PP.BusinessEntityID
                   Title,
                   UPPER(FirstName) AS [FirstName],
                   LOWER(MiddleName) AS [MiddleName],
                   lastName,
                   UPPER(EmailAddress) AS [EmailAddress],
                   FirstName + SPACE(10) + LastName AS [NOME_COMPLETO],
                   CONCAT_WS(SPACE(2), FirstName, MiddleName, PP.ModifiedDate) AS  [CONCAT_WS]
                   FORMAT(GETDATE(), 'dd/MM/yyyy', 'pt-BR') AS [FORMAT] 
            FROM Person.Person AS PP JOIN Person.EmailAddress AS PEA 
                ON PP.BusinessEntityID = PEA.BusinessEntityID









33. // FUNCOES DO TIPO TEXTO (CHAR, NCHAR, UNICODE, ASCII, SOUNDEX, DIFFERENCE, REVERSE) // 

    # CHAR(): Alem de tipo de dado ele tambem tem o nome de uma funcao, voce passara um numero e ele ira retornar um caracter de 1 bite correspondente ao codigo ASCII, e util caso queiramos fazer um tipo de operacao muito especifica, exemplo:

        /*
            CHAR(Codigo_ASCII) : RETORNO SERA UM TEXTO
        */

        SELECT CHAR(65) AS [CHAR]
            --> ele ira retornar o valor "A", ou seja, ele ira retornar o caractere correspondente ao codigo ASCII;



    # NCHAR(): Alem de tipo de dado ele tambem tem o nome de uma funcao, voce passara um numero e ele ira retornar um caracter de 2 bites correspondente ao codigo UNICODE, e util caso queiramos fazer um tipo de operacao muito especifica, exemplo:

        /*
            NCHAR(Codigo_UNICODE) : RETORNO SERA UM TEXTO
        */

        SELECT NCHAR(200) AS [NCHAR]
            --> ele ira retornar o valor "È", ou seja, ele ira retornar o caractere correspondente ao codigo UNICODE;
    


    # ASCII(): Retorna o codigo ASCII do primeiro caractere de uma string, ou seja, voce passa a string e ele ira retornar o codigo ASCII do primeiro caractere, podemos passar tambem um numero e ele retornara um numero tambem, exemplo:

        /*
            ASCII(Nome_da_Coluna) : RETORNA O VALOR DA TABELA ASCII
        */

        SELECT ASCII('A') AS [ASCII]
            --> ele ira retornar o valor 65, ou seja, ele ira retornar o codigo ASCII do caractere;



    # UNICODE(): Temos que passar algo do tipo texto tambem, ele vai retornar um ponto de codigo UNICODE(TF16), ou seja, voce passa a string e ele ira retornar o ponto de codigo UNICODE, exemplo:

        /*
            UNICODE(Nome_da_Coluna) : RETORNA O VALOR DA TABELA UNICODE
        */

        SELECT UNICODE('A') AS [UNICODE]
            --> ele ira retornar o valor 65, ou seja, ele ira retornar o ponto de codigo UNICODE do caractere;



    # SOUNDEX(): Pode ser util na comparacao de algum caracter ou expressao, ele ira retornar um codigo de 4 caracteres que representa o som da string, ou seja, voce passa a string e ele ira retornar o codigo de 4 caracteres, exemplo:

        /*
            SOUNDEX(Nome_da_Coluna) : RETORNA UM CODIGO DE 4 CARACTERES
        */

        SELECT SOUNDEX('DevDojo') AS [SOUNDEX]
            --> ele ira retornar o valor "D130", ou seja, ele ira retornar o codigo de 4 caracteres que representa o som da string;



    # DIFFERENCE(): recebera dois argumentos, podemos passar dois argumentos como se fossem soundex, esta comparando a primeira expressao com a segunda expressao, ele retornara o valor de 0 a 4, onde zero significa pouca ou nenhuma semelhanca e o 4 indica forte semelhanca; 

        /*
            DIFFERENCE(Nome_da_Coluna1, Nome_da_Coluna2) : RETORNA UM INTEIRO
        */

        SELECT DIFFERENCE('Fabricio', 'Fabrycyo') AS [DIFFERENCE]
            --> ele ira retornar o valor 4, ou seja, ele ira retornar o valor de 0 a 4, onde zero significa pouca ou nenhuma semelhanca e o 4 indica forte semelhanca;
    



    # REVERSE(): Inverte a ordem dos caracteres de uma string, ou seja, voce passa a string e ele ira inverte a ordem dos caracteres, exemplo:

        /*
            REVERSE(Nome_da_Coluna) : RETORNA UM TEXTO
        */

        SELECT REVERSE('DevDojo') AS [REVERSE]
            --> ele ira retornar o valor "ojoveD", ou seja, ele ira inverter a ordem dos caracteres;









34. // FUNCOES DO TIPO TEXTO (TRANSLATE, STR) // 

    -> vamos supor que temos uma seguinte expressao onde queriamos trocar alguns caracteres, para isso poderiamos utilizar o replace, so que ele nao daria conta de fazer a troca varios caracteres em uma unica vez, para isso temos a funcao translate: 


    # TRANSLATE(): Substitui varios caracteres em uma string, ou seja, voce passa a string, os caracteres que deseja substituir e os caracteres que ira substituir, exemplo:

        /*
            TRANSLATE(Expressao / Nome_da_Coluna, 'CaracteresParaSubstituir', 'CaracteresQueSubstituirao')
        */


        - exemplo:

            SELECT TRANSLATE('A melhor seleção do mundo é o Brasil', 'çã é ?', 'ca e !') AS [TRANSLATE]
                --> ele ira retornar o valor "A melhor selecao do mundo e o Brasil", ou seja, ele ira substituir os caracteres que estao na primeira string pelos caracteres que estao na segunda string;
    


    # STR(): Converte um valor numerico em uma string, ou seja, voce passa o valor numerico e ele ira converter para string, exemplo:


        /*
            STR(Valor_Numerico) : RETORNA UM TEXTO
        */

         - exemplo: 

            SELECT BusinessEntityID,
                   TRY_CAST(Rate AS varchar(10)) AS [RateChangeDate],
                   STR(Rate, 8, 4)
                       --> o primeiro argumento passamos a coluna, o segundo argumento e o tamanho total que queremos, e o terceiro argumento e a quantidade de casas decimais que queremos, ele ira retornar o valor "0.0000", ou seja, ele ira converter o valor numerico para string;
                   PayFrequency
            FROM HumanResources

                --> Podemos fazer a conversao atraves do try_cast, mas o problema e que algumas vezes os zeros a direita pode ser omitido, utilizando o str se faz com que fique visualmente identica ao numero









35. // FUNCOES DO TIPO TEXTO (STRING_AGG E STRING_SPLIT) // 

    # STRING_AGG(): Concatena os valores de uma coluna em uma string, ou seja, voce passa a coluna e ele ira concatenar os valores em uma string, exemplo:

        /*
            STRING_AGG(Nome_da_Coluna, 'Separador') : RETORNA UM TEXTO
        */

        SELECT STRING_AGG(Title, ', ') AS [STRING_AGG]
            --> ele ira retornar o valor "Mr., Mrs., Ms., Miss", ou seja, ele ira concatenar os valores da coluna separando por virgula;

            exemplo: 

            SELECT STRING_AGG(FirstName, ' ') AS [STRING_AGG]
                    --> se executarmos dessa forma ira dar um erro pois ira exceder o numeros de bits;

                    -> para concertar esse erro podemos fazer da seguinte forma: 

                    SELECT STRING_AGG(TRY_CAST(FirstName AS VARCHAR(MAX), ' ')) AS [STRING_AGG]
                        --> ele ira retornar o valor "Mr., Mrs., Ms., Miss", ou seja, ele ira concatenar os valores da coluna separando por ESPACO; 
    


    # STRING_SPLIT(): Divide uma string em linhas com base em um delimitador, ou seja, voce passa a string e o delimitador e ele ira dividir a string em linhas,ao inves de passarmos uma tabela ou coluna que queiramos o STRING_SPLIT ele vai estar dentro do from, porque? porque ele ira gerar uma coluna de uma subtabela, exemplo:

        /*
            STRING_SPLIT(Nome_da_Coluna, 'Delimitador') : RETORNA UMA TABELA
        */

        SELECT value AS DevDojo
            FROM STRING_SPLIT('William Suane grande mestre Jedi do DevDojo', ' ')

            /*
                ira retorar: 
                    William
                    Suane
                    grande
                    mestre
                    Jedi
                    do
                    DevDojo
            */
        
        -> usado para quando passarmos uma expressao ou String que queremos que ela fique quebrada por linhas, tambem podemos utilizar String_Split, isso ja gera uma tabel de uma unica coluna



    EXERCICIO DE AULA: 

        -> fazer com que o inicio de cada letra dessa expressao fique em maiusculo, 'willian suane grande mestre jedi do devdojo'


            SELECT value,
                1 --LEFT(value, 1) AS[PRIMEIRA LETRA],
                2 --UPPER(LEFT(value, 1)) AS[PRIMEIRA LETRA UPPER]
                3 --RIGHT(value, LEN(value) -1 ) [RESTANTE]
                   
                CONCAT(UPPER(LEFT(value, 1)) AS[PRIMEIRA LETRA UPPER], RIGHT(value, LEN(value) -1 ) [RESTANTE]) AS [NOME MAIUSCULO]

                   -> caos quiramos apresentar isso somente em uma linha 

                STRING_AGG(CONCAT(UPPER(LEFT(value, 1)), RIGHT(value, LEN(value) -1 ), ' ') AS [NOME MAIUSCULO EM UMA LINHA]

                FROM STRING_SPLIT('willian suane grande mestre jedi do devdojo', ' ') 


            -> Primeiro estamos vendo que cada palavra esta sendo separada por espaco, e esta retornando em uma unica coluna que se chama value, depois pegamos o left para que consigamos resgatar a primeira letra de cada palavra, so que queremos ela em maiuscula, depois utilizamos o right para pegar o restante da palavra, toda palavra ira vir em minusculo para isso podemos colocar o -1, que ele ira deixar de trazer a primeira letra, e ira trazer o restante da palavra, exemplo -> 'illian', agora vamos ter a direita nossas letras minuscula, para juntar isso podemos utilizar a funcao concat, onde ela ira juntar as funcoes aninhadas;








36. // SUBQUERY (SUBCONSULTA) - PARTE 1 // 

    -   SELECT  BusinessEntityID,
                NationalIDNumber,
                LoginID,
                OrganizationLevel, 
                JobTitle,
                BirthDate,
                MaritalStatus,
                Gender,
                HireDate,
                YEAR(HireDate) AS [Ano de Contratacao],
                VacationHours,
                SickLeaveHours,
                ModifiedDate

                FROM HumanResources.Employee
        WHERE [Ano de Contratacao]

            -> Nao podemos fazer dessa forma pois o compilador nao aceita, porque primeiro e executado o from depois o where e depois o select, para isso podemos utilizar o subquery, onde podemos fazer a subconsulta dentro do where, exemplo:

                SELECT  BusinessEntityID,
                        NationalIDNumber,
                        LoginID,
                        OrganizationLevel, 
                        JobTitle,
                        BirthDate,
                        MaritalStatus...
                FROM HumanResources.Employee

                    -> isso tudo ai e uma consulta se quisessemos que isso vire um fonte de dados para mim? a partir desse momento estamos olhando uma tabela Employee, mas se eu quiser que essas colunas sejam "tabelas" para mim? 

                
        -> exemplo: 

            SELECT * 
                FROM (
                    SELECT  BusinessEntityID,
                            BusinessEntityID,
                            NationalIDNumber,
                            LoginID,
                            OrganizationLevel, 
                            JobTitle,
                            BirthDate,
                            MaritalStatus,
                            Gender,
                            HireDate,
                            YEAR(HireDate) AS [Ano de Contratacao],
                            VacationHours,
                            SickLeaveHours,
                            ModifiedDate
                    FROM HumanResources.Employee
                ) AS DevDojo

            -> Se executarmos iremos ter o mesmo resultado com uma pequena diferenca, tudo dentro das aspas esta sendo executado em primeiro, lembram-se minha consuta vai selecionar tudo que esta dentro do from;


            atualizando...

            SELECT * 
                FROM (
                    SELECT  BusinessEntityID,
                            BusinessEntityID,
                            NationalIDNumber,
                            LoginID,
                            OrganizationLevel, 
                            JobTitle,
                            BirthDate,
                            MaritalStatus,
                            Gender,
                            HireDate,
                            YEAR(HireDate) AS [Ano de Contratacao],
                            VacationHours,
                            SickLeaveHours,
                            ModifiedDate
                    FROM HumanResources.Employee
                ) AS DevDojo

            WHERE [Ano de Contratacao] = 2008

                -> agora poderiamos utilizar o apelido que demos para a subconsulta, e poderiamos utilizar o [Ano de Contratacao] para fazer a comparacao, e ele ira retornar somente os valores que foram contratados em 2008;


        -> atencao: as colunas que nao estiverem dentro do bloco interno nao conseguimos trazer para o bloco externo, exemplo: 

            SELECT  BusinessEntityID,
                    NationalIDNumber,
                    LoginID,
                    OrganizationLevel, 
                    [Titulo de Trabalho]

                FROM (
                    SELECT  BusinessEntityID,
                            BusinessEntityID,
                            NationalIDNumber,
                            LoginID,
                            OrganizationLevel, 
                            JobTitle [Titulo de Trabalho]
                            BirthDate,
                            MaritalStatus,
                            Gender,
                            HireDate,
                            YEAR(HireDate) AS [Ano de Contratacao],
                            VacationHours,
                            SickLeaveHours,
                            ModifiedDate
                    FROM HumanResources.Employee
                ) AS DevDojo

            WHERE [Ano de Contratacao] = 2008


                --> tudo que estiver na consulta externa sera herdado da consulta interna, lembrando que dentro do for estamos criando uma consulta que apelidamos de DevDojo que esta vindo da tabela HumanResources.Employee, entao na tabela que apelidamos de DevDojo temos essas colunas (que esta dentro dos parenteses);


        !! Atencao: e se quisessemos fazer uma ordenacao na consulta mais interna? 

            -> SELECT  BusinessEntityID,
                        NationalIDNumber,
                        LoginID,
                        OrganizationLevel, 
                        [Titulo de Trabalho]

                    FROM (
                        SELECT  BusinessEntityID,
                                BusinessEntityID,
                                NationalIDNumber,
                                LoginID,
                                OrganizationLevel, 
                                JobTitle [Titulo de Trabalho]
                                BirthDate,
                                MaritalStatus,
                                Gender,
                                HireDate,
                                YEAR(HireDate) AS [Ano de Contratacao],
                                VacationHours,
                                SickLeaveHours,
                                ModifiedDate
                        FROM HumanResources.Employee
                        ORDER BY BusinessEntityID
                    ) AS DevDojo

                WHERE [Ano de Contratacao] = 2008


            --> se executarmos isso ira dar um erro, pois o order by nao pode ser utilizado dentro de uma subconsulta;


            

            




 





















































































































































             

       










































































































// BANCO DE DADOS - FACULDADE PUC //


    --> // DDL = DATA DEFINITION LANGUAGE // <--

    // CRIACAO DE TABELA (CREATE TABLE) //


        - Metadadados sao inseridos no dicionario de dados(catalogo)
        
        - Sao especificados o nome da tabela e a lista de colunas com os respectivos TIPOS
        
        - Ha restricoes (constraint) particulares para algumas coluna e tambem para a tabela 
        
        - Constraints garante que as tregras sejam aplicadas aos dados de uma tabela quando as linhas sao inseridas, apagadas ou modificadas.

                CREATE TABLE nome_tabela 
                    (nome_coluna tipo_colna [DEFAULT valor])
                CONSTRAINT nome_contraint tipo_Constraint,




    // TIPOS DE CAMPOS NO MICROSOFT SQL SERVER //


        Logicos: bit (aceita 0 ou 1);

        inteiros: tinyint (0 a 255), smallint (32.767), int (ate 2 bilhoes), bigint (2³³)ç

        Reais: numeric ou  decimal ;

        financeiros: 2 casas decimais (smallmoney ate 215 mil);

        alfanumericos char e varchar onde vai ate 800 caracteres: 
            -> vale a pena usar o varchar para n >= 50, pois o ganho de armazenamento comeca a compensar a ligeiridade perda em desempenho;

        texto: text 2³³ caracteres;

        tempo: smalldatetime ; precisao de 1 minuto, datetime : precisao de milisegundos; 




    // EXEMPLO PRINCIPAL //

            -> primeiro declaramos os campos e depois viemos com as restricoes para estes campos.

        ex: 

        CREATE TABLE Funcionario{
        Matric INT NOT NULL, Nome CHAR(30) NOT NULL,
        Salario MONEY NOT NULL, Cargo CHAR(15) DEFAULT 'Analista',
        Estado CHAR(2) NOT NULL, Cod_Depto SMALLINT NULL,

        CONSTRAINT PK_Funcionario PRIMARY KEY (Matric),  
        CONSTRAINT UQ_Nome UNIQUE(Nome),  
        CONSTRAINT FK_Func_Depto FOREIGN KEY(Cod_Depto) REFERENCES Departamento (Cod_Depto) ON DELETE RESTRICT,
        CONSTRAINT checkestado CHECK (ESTADO IN('MG', 'RJ', 'SP'))
        }


        -> Constraint e depois seu nome que e padronizado utilizar seu tipo antes, e sua restricao de chave primaria;

        -> Constraint UQ_Nome, restricao de unicidade pois nao vamos permitir repeticoes em nome tambem, ou seja, e uma chave alternativa caso nao deseja utilizar a PK, que no caso seria o numero de matricula;

        {
        
        -> nunca ira permitir um valor inexistente de chave primaria, ou e nula ou tem um valor de chave primaria da tabela referenciada, sempre aponta para chave primaria, precisamos dizer a qual chave primaria ela referencia. 

        Restricao do tipo FK o campo cod depto ele referncia a tabela departamento onde o codigo depto e uma chave primaria, os campos possui o mesmo nome, mas possui o dominio, e colocou uma opcao ON DELETE RESTRICT ou seja nao vamos conseguir excluir departamento se existir funcinarios dentro dele, uma opcao mais restrita.|
        
        } 




    // RESTRICAO DE CHAVE PRIMARIA //


        PRIMARY KEY constraint: garante a integridade de entidade: 

            -> Todas as colunas participantes de uma chave primaria devem ser NOT NULL
            -> Alguns dos SGBDs criam automaticamente um indice unico (UNIQUE) para a chave primaria.

            EX: 

                Matric INT NOT NULL, 

                CONSTRAINT PK_Funcionario PRIMARY KEY (Matric),  
        



    // RESTRICAO DE UNICIDADE //


            UNIQUE constraint: como uma tabela que possui somente uma chave primaria, as chaves alternativas ou candidatas que sejam unicas ou sao implementadas por meio desta restricao: 

                -> Alguns SGBDs criam automaticamente um indice unico (UNIQUE) para restricao UNIQUE.


                EX: 
        
                    Nome CHAR(30) NOT NULL,

                    CONSTRAINT UQ_Nome UNIQUE(Nome), 




    // RESTRICAO DE CHAVES ESTRANGEIRAS (FK) //


            FOREIGN KEY constraint: a chave estrangeira pode admitir valores nulos ou valores validos de uma chave primaria da tabela referenciada

                -> A restricao de chave estrangeira nunca permitira o cadastramento de um valor inexistente de chave primaria 

                -> Tabela referenciada deve ter a chave primaria ja criada 

                -> A restricao de chave estrangeira usualmente nao cria indices automaticamente.




    // INTEGRIDADE REFERENCIAL DECLARATIVA //


        [ON DELETE referencia_opcao]
        [ON UPDATE referencia_opcao]

            referencia_option: 

                RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT

        --> Quando criamos as tabelas com restricoes de chaves estrangeira, podemos colocar as questoes da integridade referencial declarativa no sentido que na exclusao de um registro o que vou fazer: exemplo vou fazer um restrict, vou fazer um cascade...

        ex: 

            CONSTRAINT FK_Func_Depto FOREIGN KEY(Cod_Depto) REFERENCES Departamento (Cod_Depto) ON DELETE RESTRICT

            -> explicacao:  
            temos o nome da constraint, temos aos uma restricao do tipo FK, onde o campo cod_depto da tabela funcionario, refenrecia qual tabela? a tabela departamento onde o Cod_Depto e chave primaria, e temos a opcao ON DELETE... onde a restricao diz que nao vamos conseguir excluir departamento se ouver funcionarios no departamento 




    // RESTRICAO DE DEFAULT // 


        DEFAULT constraint: especifica o valor default que sera gravado em uma coluna quando o valor do campo nao for informado no momento do insert.

            -> Pode ser feito na frente do campo ou atraves de Constraint. 

                ex: 

                    Cargo CHAR(15) DEFAULT 'Analista',


                    explicacao: se nao falarmos nada p default do carro sera 'Analista'




    // RESTRICAO DE VERIFICACAO // 


        CHECK constraint: define a condicao do que cada coluna deve satisfazer: 

            padrao: CONSTRAINT constraint name
                        CHECK (expression)


            ex:     CONSTRAINT checkestado CHECK (ESTADO IN('MG', 'RJ', 'SP'))


                    explicacao -> supomos que tenha uma empresa que opera sao paulo, rio, e mg, caso tentamos dar um insert e adicionar ES , ira dar erro e recusar a insercao dizendo que uma restricao de verificacao esta sendo violada.




    // ALTER TABLE //


        * usado para fazer alteracao da definicao de uma tabela Acoes de alteracao de tabela: 

                -> Acrescentar coluna:

                        - a coluna e adicionada no final da tabela

                        - Quando a tabela ja possui registros incluidos, essa nova coluna deve aceitar valores nulos ou ser preenchida com default

                -> Excluir coluna 

                -> Alterar definicao de coluna 

                -> Acrecentar constraint (retricao)

                -> Excluir constraint 


        COMMAND ALTER TABLE{
        --> alteracao de definicao de coluna: 

        ALTER TABLE empregado
            MODIFY email varchar2(50);

                modificando na tabela empregado a coluna email para varchar2(50);


        --> acrescentar coluna 
            ALTER TABLE empregado 
                ADD email varchar2(40);
        
                adicionando nova coluna a tabela empregado

        
        --> Excluir coluna 
        ALTER TABLE empregado
            DROP COLUMN (email);

                excluindo da tabela empregado a coluna email}




    // DROP TABLE //


            O comando DROP TABLE e bastante radical, pois elimina a estrutura da tabela e os registros da mesma.

            -> em alguns SGBDs, ao se eliminar uma tabela, todas as estruturas relacionadas a mesma (visoes, indices) sao tambem excluidos automaticamente.

            Quais as diferencas entre DROP TABLE E DELETE ? 

                - Delete e comando DML, DROP TABLE e DDL
                - Delete excluir o conteudo da tabela
                - Drop table exclui todo o conteudo e tambem a estrutura 

            ex: DROP TABLE Funcionarios.




    // INDICES (CREATE INDEX) //

        Uma estrutura fisica opcionais de banco de dados criadas para melhorar a performace no acesso.

        -> Cabera ao otimizador do SGBD optar ou nao pelo uso do indice (DML nao-procedural no SQL).

        -> na falta de indices, o SGBD faz uma varredura completa da tabela (full table scan)

        -> Os comandos SELECT que envolvem ORDER BY (ordenacao) tentem a ficar mais rapidos apos a criacao de indices pelos campos de ordenacao.

        -> Os indices devem ser criados com prudencia 


        # Para escolher bem os indices, analisa-se quais campos da tabela participam das expressoes WHERE de comandos de SELECT, UPDATE e DELETE. (indice e como se fosse um ponteiro).

        # No entanto, o uso excessivo de indice pode ser prejudicial ao desempenho, pois todo comando que atualiza a tabela origem (INSERT, UPDATE, DELETE) pode gerar uma alteracao no indice.

        # os indicies geralmente sao definidos em conjunto pelo DBA e pelo desenvolvedor / engenheiro de software, que conhecem quais sao as consultas mais criticas que sao mais frequentes e envolvem um maior volume de acesso a dados. 

        # Quando as linhas sao adicionadas, alteradas ou apagadas, todos os indices sao atualizados sem necessidade de acao externa alguma, indices sao partes importantes do "tuning" do SGBD.

        # Os indices sao criados usualmente para as chaves primarias e para chaves estrangeiras, visando agilizar os comandos que envolvem juncao de tabelas.

        - O indice deve ser o mais seletivel possivel: 
        
            -> exemplo: nosso sistema de representacao comercial, sua empresa atua em MG principalmente, onde temos 10k de clientes, onde temos 9500 em MG, e o resto em outros estados, ai resolvemos criar um indice por estado !! entao o que vai acontecer e que sera um indice pouco seletivo, pois a grande parte esta alocada em minas, filtra pouco, (e bom criar indices em colunas que variam muito);


        # Colunas muito usadas em clausulas WHERE tambem sao boas candidatas para indice;

        # Os indices podem ou nao ser unicos (UNIQUE)

        # O indice e unico quando nao se permite repeticoes no conjunto de campos que compoe o indice. Assim sendo, o indice pela chave primaria e sempre UNIQUE.

        # Em alguns SGBDs, este indice pela chave primaria ja e gerado automaticamente.



        SINTAXE: 

            CREATE [UNIQUE] [CLUSTERED | NONCLUSTERED] INDEX
                Nome-do-indice ON tabela (coluna ou lista-de-colunas)
            
            -> Se quiser que o indice seja unico devemos escrever UNIQUE na frente dele, colocamos o nome do incice, apos colocamos ON para se referenciar em qual tabela criar o indice ( em alguns SGBDs existe a clusterizacao que quer dizer ordenacao fisica, ou seja se criarmos um indice clusterizado ele vai buscar fazendo com que a tabela original os registros estejam fisicamente na ordem que deseja, caso seja nao clusterizado iremos ter uma estrutura paralela que e o indice que aponta para minha tabela original );

            ex: 

                CREATE INDEX IX_salario ON Funcionarios (CodDepto, Salario)  -> nao clusterizado 

                CREATE UNIQUE INDEX CLUSTERED IX_Funcionarios ON Funcionario (Matricula) -> Clusterizado


            Quando criamos um indice podemos tambem dizer se eles estao em ordem ascendente ou drecescente, no exemplo abaixo primeiro ordena por extado e depois por cidade:

            CREATE INDEX Ind_Regional ON Clientes (Estado Asc, Cidade Asc);


            caso nao queiremos mais o indice podemos tambem dar o comando de exclusao: 

            DROP INDEX Nome-do-indice




    //  VISOES (CREATE VIEW)  //


        -> A visao e uma estritura logica que e montada dinamicamente a partir de um SELECT.

        -> Atraves da visao, consegue-se selecionar linhas e colunas desejadas de uma tabela ou mais tabelas e dar um nome logico (nome da visao) para o resultado.

            -> exemplo: Imagina que temos uma tabela funcionario, onde temos mais de 50 campos, incluindo nome, endereco, telefone, salario, codigo do cardo do funcionario... e queremos produzir uma lista que contem o nome, nome do departamento e tambem o numero do ramal, vamos obter informacoes da tabela funcionario, mas nao precisamos saber o salario para colocar na lista da empresa e uma informacao confidencial, entao podemos criar uma visao que faz a juncao da tabela departamento e tabela funcionario, e da tabela funcionario nao precisamos ver todas as colunas para saber o ramal dela.

        # Utiliza - se visao para armazenar os selects mais frequentes no proprio banco de dados. 

        # SGBD nao armazena as linhas resultantes da execucao da visao.

        # A seguranca  e uma das vantagens, pois pode-se dar permissao de acesso para a visao e nao para a tabela inteira.

        # Com isso, os programas aplicativos ou usuario finais podem acessar a visao, simplificando a sintaxe de comando.

        # As visoes podem ser encadeadas, mas isto provoca uma queda de performace.

            SINTAXE : 
                --> So para reforcar, a visao e um comando de DDL uma estrutura logica do banco de dados, mas toda visao tem que ser associada ha um comando de SELECT que e um comando de DML.

                CREATE VIEW nome-da-visao (apelidos para os campos - opcional)
                    AS SELECT 

                    exemplo: 
                        CREATE VIEW SalarioDepto (Depto, Media_Salarial, Numero)
                            AS SELECT Depto, AVG(Salario), COUNT(*)
                            FROM funcionarios
                        GROUP BY Depto

                        -> AS SELECT ele faz basicamente agrupa os  funcionarios por departamento calculando a media e a quantidade de funcionarios


            PODE SE CRIAR UMA VISAO DE UMA VISAO: 

                        CREATE VIEW MaioresSalarios
                            AS SELECT * FROM SalarioDepto
                        WHERE Media_Salarial > 8000

                        --> explicacao: criamos uma view de outra, essa dai seleciona de SalarioDepto que e uma view, para quem tem uma media salarial acima de 8000 mil reais

            
            REMOCAO DA VISAO:
                    DROP VIEW staff;






    --> // DML = DATA MANIPULATION LANGUAGE // <--


    // OPERADORES SQL - DML (DATA MANIPULATION LANGUAGE) //


        -> operacoes basicas: INSERT , SELECT , UPDATE e DELETE 

        -> DML possui o uso muito mais frequente do que a DDL, uso de DML por SQL embutido em aplicacoes ou via janelas de acesso ao banco de dados.




        INSERT:

        SINTAXE 1: 

            INSERT INTO <tabela>
                (<lista-de-colunas>)
            VALUES (<lista-de-valores>)

            --> vamos colocar primeiro o nome da tabela, apos a lista de colunas, e depois a lista de valores que as colunas vao assumir

            # os valores dos atributos devem ser informados na mesma ordem de criacao das tabelas ou os nome dos atributos devem ser informados

            # As regras de integridade sao observadas no momento da inclusao da linha na tabela.nao existe meio insert, se temos um total de cinco campos se um dos campos esta com um tipo inadequado ou um dos campos e obrigatorio e nao foi fornecido o SQL nao ira fazer o servico pela metade ( ou inclui a linha ou nao inclui a linha ) 

            # Sao observados os campos que aceitam nulos ou que tem default.


            exemplo aplicado:

            CREATE TABLE Projeto
                (numero number(5) constraint projeto_numdep_pk primary key,
                Nome varchar(40) constraint projeto_nome_uk unique,
                Localizacao varchar2(50),
                Depresponsavel number(2) constraint projeto_dep_responsavel_fk
                references departamento(numero));

            INSERT INTO projeto
                VALUES (22, 'Rede WI-FI corporativa', 'PredioP1', 10);

                --> como nao colocamos a lista de colunas, devemos obrigatoriamente seguir a lista de criacao da tabela.
        
        SINTAXE 2: 

            INSERT INTO <tabela1>
                (<lista-de-colunas)
            SELECT ...

            --> insercao em massa: e quando vamos inserir em uma nova tabela, dados a partir de um select, de uma consulta que eu fiz a partir de uma consulta existente isso pode acontecer quando eu tenho que fazer uma mudanca mais radical de layout de uma tabela para outra e eu preciso exportar dados que estao cadastrados em uma tabela previamente.
        



        SELECT:

        -> Caracteristica nao procedural
        -> Filtros de colunas e/ou linhas


            SINTAXE: 
                
                SELECT <lista de atributos>
                    FROM <nome das tabelas>
                WHERE <condicao de pesquisa / filtro >

            --> explicacao: colocamos o select e depois a lista de atributos de quais sao as colunas que deseja exibir, depois o from nome das tabelas as quais vamos obter o nome das tabelas as quais vamos obter as informacoes, e o where que e o filtro paralelo ao if de outras linguagens de programacao.


            -> ex: selecionar matricula e o nome dos funcionarios com comissao menor do que 150

            SELECT matricula, nome 
                FROM Funcionario
            WHERE comissao < 150


            -> Selecionar todas informacoes de todos os funcionarios: 

            SELECT * 
                FROM Funcionario




        SQL - DML: OPERADORES


        - Comparacao: = , < >, > , <, >= , <=;

        - Logicos: AND, OR, NOT; 

        - BETWEEN <expressao1> AND <espressao2>: testa um intervalo;

        - IN (<lista de valores>): testa presenca na lista; 

        - IS NULL OU IS NOT NULL: Testa nulos;

        - LIKE: Testa conteudo de string de caracteres;


            ex: Selecione os funcionarios do estado de MG ou RJ que ganha uma comissao maior ou igual a 100

                SELECT nome 
                    FROM funcionario
                WHERE estado = 'MG' or 'RJ' and comissao >= 100




        BETWEEN:
                -> Permite testar se um intervalo determinado campo assume o valor dentro de um intervalo especificado. E utilizado por ser mais pratico do que o teste de >= e <=

            EX: 
                SELECT * 
                    FROM Funcionarios
                WHERE salario BETWEEN 1800 AND 2000

                -> E bem mais legivel que: 

                SELECT *
                    FROM funcionarios
                WHERE Salario >= 1800 AND salario <= 2000


            --> exemplo: Selecione os funcionarios que ganham entre 2000 e 3500 no departamento de informatica

                SELECT nome , salario
                    FROM funcionario
                WHERE salario BETWEEN 2000 AND 3500 and cod-depto = 1



            IN: 
                -> Verifica se um elemento pertence a um conjunto, isto e, se um campo assume o valor de algum membro de uma lista de valores. E utilizado para substituir grandes exmpressoes de OR para o mesmo campo.


            EX: 
                SELECT *
                    FROM Funcionario 
                WHERE cod_depto IN (1,2)

                    -> e bem mais legivel que 

                SELECT * 
                    FROM Funcionario
                WHERE cod_depto = 1 OR cod_depto = 2 



                --> exemplo selecione os funcionarios cujo cargo e contador ou gerente.

                SELECT nome, cargo
                    FROM Funcionario
                WHERE cargo IN ('gerente', 'contador')


        
            IS NULL / IS NOT NULL

                ex: Selecione os funcionarios cujo estado ou cidade e nula 

                    SELECT nome 
                        WHERE estado is null or cidade is null Funcionario



        
        LIKE 
                -> Operador LIKE e usado quando se deseja obter colunas de um registro que sigam um determinado padrao pre-especificado.

                -> Quando se quer saber os nomes de todos os funcionarios cujo nome comeca com JOAO ou termina com SILVA, usa-se o LIKE.

                -> O caracter % dentro da expressao LIKE tem a mesma funcao do caracter * no windows, assim como o _(undescore) tem a semelhanca com o ? do windows 

            ex: 
                SELECT NOME 
                    FROM Funcionario
                where nome like 'JOAO%'


                SELECT * 
                    FROM Funcionario
                WHERE NOME LIKE '_ _ R%'

                -> (Obs: a terceira letra do nome do funcionario deve ser R)


            --> exemplo: Selecionar os funcionarios cujo o nome tem a letra u como segundo caractere

                SELECT nome 
                    FROM Funcionario
                WHERE nome LIKE '_u%' Funcionario




        UPDATE 

                EX: 
                    UPDATE <tabela>
                        SET <coluna1> = <expressao>,
                        <coluna 2> = <expressao2>, ...
                    WHERE <condicao-de-alteracao>


                --> Coloque primeiro o nome da tabela, depois set - para selecionar as colunas as quais estamos alterando e o WHERE sendo opcional, se nao colocar vamos atualizar todos os registros da tabela; 


                - Dica 1: para maiores atualizacoes faca o SELECT antes do UPDATE para visualizar os registros;

                - Dica 2: se quiser atualizar um unico registro, informe a chave primaria no filtro WHERE




        DELETE

            ex: DELETE 
                    FROM <tabela>
                WHERE <condicao - de - exclusao>

            --> colocamos delete from a tabela e colocamos o WHERE que e opciona mas geralmente aparece que e para colocar a condicao de exclusao onde vamos selecionar quais linhas serao excluidas




    // AGRUPAMENTO (GROUP BY), ORDENACAO (ORDER BY) //


        Funcoes agregadas: 

            -> AVG : media aritimetica

            -> SUM: soma de valores 

            -> MAX: valor maximo

            -> MIN: valor minimo

            -> COUNT(*): contador de linhas da tabela

            -> COUNT (DISTINCT atributo): contador de linhas com ocorrencias diferentes de um atributo.



        AVG: MEDIA 
                
                exemplo: Calcule a media de salario dos funcionarios

                SELECT 
                    AVG(Salario) 
                AS Media


                --> obs: recurso novo que e o a questao do apelido do campo, se nao colocar esse apelido do campo, na maior parte dos bancos de dados, como nao e uma coluna original da tabela aparece com nome vazio, e bom renomear para ficar mais palatavel.



        SUM: SOMATORIO

                exemplo: Calcule o somatorio dos salarios do depto 1

                SELECT 
                    SUM(Salario)
                FROM Funcionario WHERE cod_depto = 1


                --> obs: detalhe aqui que nao colocamos o nome do campo, entao ele apareceu com o nome do campo sendo nulo com resultado abaixo, o bom seria adicionar para que ficasse melhor entendimento.

            

        MIN e MAX: 

                exemplo: selecione os valores do maior e menor salarios do depto 1

            SELECT MAX(Salario), AS Maior
                MIN(Salario) AS Menor
            FROM Funcionario WHERE cod_depto = 1



        COUNT 

            -> Efetua a contagem de resistros de uma tabela, ou seja, contar em nivel de linha ex: quantos registros ou quantas tuplas aquela tabela possui, agora o SUM olha o conteudo da tabela a soma de conteudos.

            -> A sua forma mais usual e o COUNT(*), onde se contam as linhas (ocorrencias) de uma tabela 

            -> Existe tambem a forma COUNT(DISTINCT nome-do-campo) utilizada a contagem de direfentes ocorrencias de um campo. Neste caso, o campo nao e chave primaria, pois esta ja tem as ocorrencias distintas por obrigacao.

                
                exemplo utilizando COUNT: Calcule a quantidade de funcionarios, excluindo os gerentes.

                    SELECT COUNT(*) AS Qtde 
                        From Funcionario 
                    WHERE cargo <> 'gerente'



        DISTINCT

            -> operador DISTINCT nome-do-campo elimina ocorrencias repetidas de um mesmo campo

            -> Nao faz sentido utilizar DISTINCT para um campo que ja seja chave primaria

            
                EX: nomes das cidades ibde se tem clientes, sem repeticoes de cidades

                    SELECT DISTINCT Cidade FROM Clientes


                EX: So sera considerada uma repeticao quando o estado e cidade forem os mesmos

                    SELECT DISTINCT Estado, Cidade FROM Clientes


                -> exemplo: Selecione os distintos cargos existentes 

                    SELECT DISTINCT Cargo 
                        FROM Funcionario

        

        COUNT DISTINCT 

            -> Calcula as diferentes coisas existentes

                -> exemplo: Selecione a quantidade de distintos cargos
            

            SELECT COUNT (DISTINCT Cargo) AS QtdeCargos 
                FROM Funcionario



        ORDER BY (ORDENACAO)

            -> A expressao ORDER BY e utilizada quando se pretende exibir os registros em uma determinada ordem,seja esta crescente (ASC - Default) ou decrescente (DESC).

            -> Caso a expressao ORDER BY nao esteja presente, os registros serao exibidos na ordem em que foram inseridos na tabela.

            -> os campos que constam da expressao ORDER BY devem obrigatoriamente estar presentes na expressao SELECT

            -> Nao e necessario possuir um indice fisicamente criado e composto pelos campos da ordernacao para usar o ORDER BY. No entanto, caso o indice exista o comando sera executado mais rapido.

            -> Pode-se utilizar numeros indicando que a ordenacao sera feita por determinado campo de acordo com a ordem do SELECT.

                --> exemplo: Selecione o codigo de depto e nome do funcionariao, em ordem alfabetica de ambos.

                    SELECT Cod_Depto, Nome 
                        FROM Funcionario
                    ORDER BY Cod_Depto, Nome

                    SELECT Cod_Depto, Nome 
                        FROM Funcionario 
                    ORDER BY 1,2

                    --> PODE SE FAZER DESSAS DUAS FORMAS 

                    
                    --> exemplo - 2: Selecione o codigo do depto, o salario e o nome, em ordem crescente do codgio e decrescente do salario.

                    SELECT Cod_Depto, Salario Nome 
                        FROM Funcionario
                    ORDER BY 1 ASC, 2 DESC

                    SELECT Cod_Depto, Salario, Nome 
                        FROM Funcionario
                    ORDER BY 1,2 DESC 
        


        GROUP BY ( AGRUPAMENTO )

            -> Em um SELECT tradicional, as linhas da tabela sao exibidas de maneira analitica. Existe a expressao GROUP BY que permite que se faca uma consolidacao, dos registros, fazendo a sintesi dos mesmos por um conjunto de campos.

            -> A funcionalidade do GROUP BY equivale a das informacoes de subtotais usadas em relatorios. Ao se fazer o agrupamento por um determinado campo de quebra, perde-se a informacao detalhada a nivel de registros. Novas informacoes sao geradas a partir da totalizacao dos registros.

            -> Os campos da expressao GROUP BY devem sempre fazer parte da expressao SELECT

                --> exemplo: Selecione a quatidade de funcionarios por cargo;

                SELECT Cargos, COUNT (*) as Qtde
                    FROM Funcionario
                GROUP BY Cargo 


                --> exemplo - 2: Selecione o somatorio de salarios por departamento por depto, em ordem decrescente da soma 

                SELECT Cod_Depto, sum(Salario) as Soma 
                    FROM Funcionario 
                GROUP BY Cod_Depto ORDER BY 2 desc 

                    -> explicacao: selecionamos o codigo do departamento e o somatorio de salarios, agrupado pelo codigo do departamento, em ordem 2 desc que no caso e o salario em ordem decrescente.

        

        HAVING (Filtro por agrupamento)

            -> A expressao HAVING so pode aparecer depois da expressao GROUP BY, funcionando como um filtro para o agrupamento.

            -> Resumidamente, o HAVING e o WHERE do GROUP BY

            -> Atraves do HAVING pode-se selecionar apenas os agrupamentos desejados que atendam determinadas condicoes, Os campos que fazem o filtro do HAVING nao precisam necessariamente estar selecionados.

                --> exemplo: Selecione a quantidade de funcionarios por departamento por depto, mas apenas para os departamentos com mais de 3 funcionarios.

                SELECT Cod_depto, COUNT(*) as Qtde 
                    FROM Funcionario
                GROUP BY Cod_depto HAVING Count(*) > 3

                    -> o having ai tem que ter um count maior que 3, o agupamento de dois funcionarios nao sera exibido


                --> exemplo: Selecione o maior salario por cargo, mas apenas para os cargos com mais de 1 funcionario, em ordem alfabetica do cargo

                    SELECT Cargo, max(Salario) as Maior 
                        FROM Funcionario
                    GROUP BY Cargo having count(*) > 1 Order by Cargo

                    -> o having ai mostra que devemos ter mais de um funcionario para que seja exibido, e tambem depois faz a ordenacao de acordo com cargo, em ordem alfabetica; obs: sempre vem o group by primeiro e depois o order by

                
                // DIFERENCA ENTRE WHERE E HAVING // : 

                WHERE;

                SELECT departament_id, count(*)
                    FROM employees e 
                        WHERE manager_id = 100
                        GROUP BY departament_id
                    ORDER BY departament_id
                
                -> Clausula WHERE restringe as tuplas da relacao 

                -> Posteriormente os grupos sao criados 

                -> Funcao do grupo e aplicada.


                HAVING;

                SELECT departament_id, count(*)
                    FROM employees e 
                    GROUP BY departament_id
                    HAVING count(*) > 1
                ORDER BY departament_id;

                -> Os grupos sao criados 

                -> Funcao de grupo e aplicada 

                -> a clausula HAVING restringe os grupos aos que se enquadram no criterio da clausula HAVING (count (*) > 1)




    // DML - JUNCOES DE TABELAS (JOIN) //

            -> Utilizados em consultas (SELECT) que combinam linhas de duas ou mais tabelas ou visoes

            -> As tabelas e/ou visoes sao especificadas na clausula FROM 

            -> As condicoes de ligacao sao especificadas na clausula WHERE. A ligacao e usualmente feita atraves do relacionamento da chave primaria com a chave estrangeira e e denominada condicao de juncao 

            -> A juncao e um subconjunto do produto cartesiano.


        
        JUNCOES: NOMES DE ATRIBUTOS AMBIGUOS

            -> Duas colunas podem ter o mesmo nome desde que sejam em tabelas diferentes 

            -> O nome da coluna e entrao prefixado com o nome da tabela 

                ex:     SELECT empregado.nome, departamento.nome
                            FROM funcionario, departamento 
                        WHERE funcionario.dep_id = departamento.id;

                        explicacao: queremos ai entao o nome da tabela empregado, e o nome da tabela departamento.


        
        JUNCOES: APELIDOS 

            -> Nas consultas com JOIN, colunas de quaisquer tabelas podem ser selecionadas. Pode-se utilizar apelidos (ALIAS) para nomes das tabelas. Se um campo aparece nas 2 tabelas e e selecionado, e preciso informar de qual tabela o mesmo sera exibido.

            -> Apelidos podem ser criados em qualquer consulta SQL, mesmo que a tabela nao seja referenciada mais de uma vez

            -> Facilita a escrita da consulta

                EX:     SELECT F.Pnome, D.Dnome
                            FROM funcionario F, departamento D
                        WHERE D.Dnome = 'Pesquisa' AND D.Dnumero = F.Dnr;



        SQL - DML: JUNCOES 

            {--> exemplo: Selecione os nomes dos deptos e de seus funcionarios com os cargos, em ordem alfabetico do nome do depto e do funcionario

                SELECT nome_depto, nome, cargo 
                    FROM Depto A, Funcionario B
                WHERE A.cod_depto = B.cod_depto order by 1,2

                -> explicacao: selecionamos os nomes dos departamentos e de seus funcionarios, com os cargos em ordem alfabetico do nome do departamento e o nome do funcionario, quando estamos remetendo em questao da funcao, estamos fazendo uma intercessao entre as tabelas.
            }


            { --> exemplo: Selecione a media de salarios dos funcionarios do depto de informatica (sem considerar o gerente)

                SELECT avg(salario) as Media 
                    FROM Depto A, Funcionario B
                WHERE A.cod_depto = B.cod_depto and nome_depto = 'Informatica' and cargo <> 'gerente'

                    -> explicacao: vai selecionar a media de salario , tendo que puxar informacoes de duas tabelas , o cod_depto tem que ser igual e o nome do departamento tem que ser informatica, e o cargo tem que ser diferente de gerente. 
            }


            {
            --> exemplo: Selecione o somatorio de salarios por nome do departamento, em ordem decrescente do somatorio. (teremos que utiliar o group by porque e uma somatorio POR NOME do departamento)

                SELECT nome_depto, sum (salario) as Soma 
                    FROM Depto A, Funcionario B
                    where A.cod_depto = B.cod_depto   <- CONDICAO DE JUNCAO 
                GROUP BY nome_depto ORDER BY 2 desc 

                    -> explicacao: vai selecionar o nome_depto e a somatoria de salario por departamento, fazemos o from indicando as duas tabelas, depois fazemos a condicao de juncao entre as chaves, e depois agrupamos o salario pelo nome do departamento.


                CONDICAO DE JUNCAO = CHAVE PRIMARIA CASANDO COM A CHAVE ESTRANGEIRA, SE ESQUERCERMOS IRA DAR ERRADO.
            } 
        


        SQL - DML: JUNCOES COM 3 TABELAS

            {
                --> exemplo: Selecionar os nomes dos deptos e de seus funcionarios que tenham dependentes, em ordem alfabetica do nome do depto, do funcionario e do nome do dependente.

                    SELECT nome_depto, nome, nome_dependente 
                        FROM Depto A, Funcionario B, Dependente C
                        WHERE A.cod_depto = B.cod_depto AND B.matricula = C.matricula  
                    ORDER BY 1,2,3 

                -> explicacao: selecionamos os campos desejados, e depois ligamos a tabela depto a tabela funcionario (onde tem o campo FK apontando para a tabela depto), e depois temos a ligacao entre funcionario e dependente(onde a chave primaria da tabela funcionario e a matricula e depentente possui uma FK apontando para funcionario, entao ligamos tabela A com B e tabela B com C, e depois ordenamos)
            }



        SQL - DML: JUNCOES 

            TIPOS DE JUNCOES: 
                
                -> inner join (equivalente a sintaxe tradicional da juncao)

                -> left outer join 

                -> right outer join 

                -> full outer join 

            CONDICOES: 

                -> on <predicado>


            
        INNER JOIN 

            1- METODO   SELECT coluna1, coluna2 ...
                            FROM tabela1 INNER JOIN tabela2
                        ON tabela1.coluna = tabela2.colunal;

                obs: pode se usar somente o JOIN, ja que r o join default 

                -> SINTAXE ALTERNATIVA

            2- METODO   SELECT coluna1, coluna2...
                            FROM tabela1, tabela2
                        WHERE tabela1.coluna = tabela1.coluna;

            -> E melhor se utilizar o primeiro metodo poque nele e separado a condicao da juncao, ou seja nele podemos colocar o WHERE e fazer com que nao fique embolado assim como o debaixo.


            --> exemplo: Selecione os nomes dos deptos e de seus funcionarios com os cargos, em ordem alfabetica de nome do depto e do funcionario.

                    SELECT nome_depto, nome, cargo 
                        FROM Depto A JOIN Funcionario B
                    ON A.cod_depto = B.cod_depto 
                    ORDER BY 1,2
        


        LEFT JOIN 

            -> Vai levar a intercessao como o do INNER JOIN mas tambem o que esta na esquerda.

            --> exemplo: selecione os nomes dos funcionarios e de seus dependentes, exibindo tambem funcionarios sem dependentes, em ordem alfabetica dos nomes.

                SELECT nome, nome_dependente 
                    FROM Funcionario A LEFT OUTER JOIN Dependente B 
                    ON A.matricula = B.matricula
                ORDER BY 1,2

                -> OBS: podemos escrever apenas LEFT JOIN 

            -> explicacao: exemplo no INNER JOIN, quando fizemos a juncao de dependente e funcionario o que acontece so apareceram aqueles funcionarios, so vai aparerecer os funcionarios que tiverem dependente, mas se fizemos um left join teremos a aparicao de todo o conjunto da esquerda, ou seja, nao so a intercessao de funcionario com dependente, mas digamos que basta ser funcionario para poder ser exibido, mas ai caso ele nao tenha dependente, como sera preenchido? Vai aparecer uma ausencia da informacao.

            -> O numero de registros exibidos em um left join e no minimo igual a um INNER JOIN, sendo na maioria das vezes maior, pois o LEFT JOIN engloba o INNER JOIN.


        
        RIGHT JOIN 

            -> Tem o mesmo conceito que LEFT JOIN, so que e um pouco utilizado. incorpora tambem o inner join so que agora com acrescento de aparicao de quem for a direita tambem. quem manda e a tabela a direita

            --> exemplo: Selecione os nomes dos funcionarios e de seus dependentes exibindo tambem funcionarios sem dependentes, em ordem afabetica dos nomes.

                SELECT nome, nome_dependente 
                    FROM Dependente A RIGHT OUTER JOIN Funcionario B
                    ON A.matricula = B.matricula 
                ORDER BY 1,2 

        

        FULL JOIN 

            -> Ele e a juncao de left e right, ou seja basta estar na esquerda ou direita, ou tambem na intercessao.

            --> exemplo: Selecione os nomes dos departamentos e dos funcionarios exibindo departamentos sem funcionarios e tambem funcionarios sem departamentos, em ordem alfabetica dos nomes.

                SELECT nome_depto, nome 
                    FROM Depto A FULL OUTER JOIN Funcionario B 
                    ON A.cod_depto = B.cod_depto
                ORDER BY 1,2
            
            -> explicacao: primeiro ele pega a intercessao depois, depois departamento sem funcionario e depois funcionario sem departamento.

            RESULTADO: 

                -> Full join e a soma do left join com o right  join

                -> Full join e diferente do produto cartesiano pois nao gera combinacoes aleatorias.


        
        UNION - (UNIAO)

            -> Agrega resultados de comando SELECT. Deve existir compatibilidade de coluynas e linhas duplicadas sao desprezadas.

            -> UNION ALL: nao elimina tuplas duplicadas 

            -> Equivalente a operacao de uniao da teoria dos conjuntos. Pode atuar em tabels diferentes desde que a compatibilidade seja respeitada.

                -> para se fazer a uniao os campos entre elas tem que ser compativeis, e quando faz a uniao ele elimina as linhas duplicadas, exemplo fazer uma uniao de uma tabela de um banco A e de um banco B, entao queremos dar uma UNION nessas duas tabelas entao na base de clientes do banco A e do Banco B, vai eliminar os clientes que estao cadastrados em A e B e vai ter um registro unico daquele cliente.

            --> exemplo: Selecione os nomes e estados dos funcionarios de MG e do RJ, marcando os de MG com asteristico 

            SELECT nome, estado, '*'
                FROM Funcionario 
                WHERE estado = 'MG' UNION 
            SELECT nome, estado, '' 
                FROM Funcionario
                WHERE ESTADO = 'RJ' 




    // DML - CONSULTAS ALINHADAS SEM CORRELACAO (SUBSELECTs) //


        -> SELECT dentro de outro SELECT. Os resultados de um SELECT sao utilizados como valores pelo SELECT mais externo.

        -> Usados em consultas que precisam que valores existentes no banco de dados sejam buscados e depois usados em uma condicao de comparacao.

            -> usualmente em situacoes que possui dois passos,  exemplo: eu quero saber os funcionarios que ganham mais que a media de salario da empresa

        -> USO: Consultas que precisam que valores existentes no banco de dados sejam buscados e depois usados em questao de comparacao.


        SUBSELECT SEM CORRELACAO: 

            -> E o caso mais simples onde nao existe ligacao de colunas SELECT mais externo com o SELECT mais interno.

            -> O SELECT interno e executado primeiro, retornado valores para o SELECT externo. E como se fosse uma rotina de dois passos.

            -> As juncoes que nao exibem colunas de tabelas diferentes podem ser substituidas por SUBSELECTs.


                --> exemplo: Selecione os nomes e cargos dos funcionarios que ganham acima da media geral da empresa:

                1 Passo - Calcular a media (RESULTADO: R$ 2733,33)
                2 Passo - Verificar quem ganha acima da media.


                    SELECT nome, cargo, salario from funcionario
                    WHERE salario > ( select avg (salario) from funcionario )

                    -> explicacao: calculo da media colocamos ele no select interno, a prioridade sera a tiver dentro dos parenteses, onde sera passado para o select de cima onde veremos a comparacao de como se fosse uma funcao que o valor interno retornou,




                --> exemplo: Selecione o nome do funcionario que ganha o maior salario 

                    SELECT nome, max(salario) from Funcionario 
                    
                    -> nao funciona pois mistura informacoes  analiticas com sinteticas, pois vamos supor que temos um valor de salario maximo onde seja 4000k mas possa ser que diversos funcionarios tenha, mas isso nao sera retornado, pois nao seria somente um nome;

                    SELECT max(salario) FROM Funcionario (Funciona mas nao traz o nome)

                    CORRETO: 

                    SELECT nome, salario FROM Funcionario 
                        WHERE salario = (SELECT max(salario) FROM Funcionario)
                    

                        -> Explicar: primeiro calculamos qual vai ser o maior salario, fizemos isso no select interno, e depois uma vez que essa funcao retorna o valor faz a comparacao com o salario




                --> exemplo: Selecione os nomes dos funcionarios que trabalham no depto de contabilidade 

                WHERE cod_depto = (SELECT cod_depto FROM Depto WHERE nome_depto = 'Contabilidade')

                Tambem pode ser resolvido atraves de juncao:

                SELECT nome FROM Funcionario A, Depto Banco
                    WHERE A.cod_depto = B.cod_depto AND nome_depto = 'Contabilidade'
                SELECT nome from Funcionario A JOIN Depto B  
                    ON A.cod_depto = B.cod_depto WHERE nome_depto = 'Contabilidade'


                

                --> exemplo: Selecione os nomes dos departamentos que tem funcionario que trabalham no estado de MG

                Select nome_depto FROM depto
                    WHERE cod_depto IN (select cod_depto FROM Funcionario WHERE estado 'MG')

                    -> Explicacao: o resultado do comando interior sera retornar uma lista com valores do cod_depto onde seja igual a MG. 



                
                --> explicacao: Selecione os nomes dos departamentos e os nomes dos funcionarios que trabalham no estado de MG

                    A solucao utilizando o SUBSELECT nao e mais interessante, porque queremos exibir no select de fora o nome do funcionario, se fazermos utilizando dessa forma ira resultar da mesma forma, so que o erro que vai gerar e que nao tem o nome na tabela de departamento, ah mais temos ele na tabela funcionario? nao mais pois foi executado e retornado ja o resultado, ja trabalhamos na tabela funcionario agora estamos trabalhando na tabela departamento, quando precisamos acessar campos de duas ou mais tabelas o interessante e utilizar a juncao, porque ja casa as tabelas e podemos pegar campos de umas e outras, agora se fizermos o SUBSELECT com uma tabela numero 1 e tabela externa numero 2, no select de fora nao conseguimos mais acessar os campos da tabela numero 1.

                SELECT nome_depto, nome FROM Funcionario 
                    WHERE cod_depto IN (SELECT cod_depto FROM Funcionario WHERE estado = 'MG')

                
                -> SOLUCAO CORRETA: 

                    SELECT nome_depto, nome FROM FUNCIONARIO A, Depto B
                        WHERE A.cod_depto = B.cod_depto AND estado = 'MG'
                    SELECT nome_depto, nome FROM Funcionario A JOIN Depto B




                -> Existem consultas que podem ser resolvidas tanto por subselect quanto por juncao, mas ...

                -> Existem consultas que so podem ser resolvidas atraves de SUBSELECT 
                    - Ex: quem ganha mais do que a media, maior salario 
                    - Sao consultas que envolvem dois passos 
                
                -> Existem consultas que devem ser resolvidas atraves de juncoes pois envolvem campos de multiplas tabelas.



        
        SUBCONSULTA DE LINHA UNICA 

            -> retorna um unico valor 

            -> usada em comparacao que use operador de comparacao:
                = , <> , > , <, >= , <=;

                    SELECT Pnome FROM Funcionario F
                        WHERE salario > (SELECT salario FROM Funcionario WHERE cpf = '12345678966')



        SUBCONSULTA DE MULTIPLAS LINHAS 

            -> Retorna uma lista de valores que sao comparados com uma linha unica da tabela externa.

            -> Usada em comparacao que use operador de comparacao de multiplas linhas

            Operadores: 

            - IN
            - NOT IN 
            - ANY = qualquer 
            - ALL = Todos 
            - EXISTS
            - NOT EXISTS

            EX: Uilizando o operador IN 

                SELECT Pnome , Unome 
                    FROM Funcionario 
                WHERE salario IN (SELECT salario FROM Funcionario WHERE pnome IN ('joao', 'joice'));

                    -> explicacao: retorna o nome e sobrenome dos funcionarios que tem salarios iguais o do joao ou joice 


            EX: Utilizando o operador ALL

                SELECT Pnome, Unome
                    FROM FUNCIONARIO
                WHERE salario > ALL (SELECT salario FROM Funcionario WHERE dnr = 5);

                    -> Retorna o nome e sobrenome dos funcionarios que tem salarios maiores do que de todos funcionarios do departamento 5.



            EX: Utilizando o operador ANY

                SELECT Pnome, Unome 
                    FROM Funcionario 
                WHERE sexo = 'F' AND salario > ANY (SELECT salario FROM Funcionario WHERE sexo = 'M');

                    -> Retorna o nome e sobrenome das funcionarias que tenham o salario maior qdo que algum funcionario do sexo masculino 




    // DML - SUBSELECT COM CORRELACAO // 

        -> E o caso mais complexo onde existe ligacao (correlacoes) de colunas do SELECT mais externo com o SELECT mais interno, ou seja o select interno depende do select externo para ser executado, eu nao consigo rodar o select que esta dentro do parenteses sozinho.

        -> O select interno depende do externo para ser executado.

        -> O select externo seleciona um registro e o SELECT interno e executado.

        -> O SELECT externo seleciona o proximo registro e o select interno e executado novamente. Isso se repete ate o SELECT externo chegar ao fim dos registros.

        -> Quando a condicao na clausula WHERE de uma consulta alinhada referencia algum atributo de uma relacao declarada na consulta externa, as duas consultas sao consideradas correlacionadas.

        -> A consulta aninhada e avaliada uma vez para cada linha na consulta externa.

        -> Muito usado na comparacao de elementos em relacao ao seu grupo 

        -> Evita comparacoes distorcidas

        -> Usualmente e mais caro em termos de performace, mas em determinados casos e a unica solucao possivel.


            EX: SELECT Pnome, dnr 
                    FROM funcionario F 
                WHERE salario > (SELECT AVG(salario)
                                    FROM Funcionario 
                                WHERE dnr = F.dnr)

            explicacao: 

            1) Pega a linha candidata (da consulta externa)

            2) Executa a consulta interna usando o valor da linha candidata

            3) Usa o valor resultante da consulta interna para qualificar ou desqualificar a linha candidata 

            4) Repetir enquanto houver linhas candidatas 

                -> retorna os funcionarios que possuem salario maior que a media dos salarios do seu departamento.

            

            --> Exemplo: Selecione os nomes dos funcionarios que ganham mais do que a media do seu respectivo departamento 

            SELECT nome, salario, cod_depto FROM Funcionario A 
                WHERE salario  > (SELECT avg(salario) FROM Funcionario B WHERE A.cod_depto = B.cod_depto)



            --> Exemplo: Selecione os nomes dos funcionarios que ganham o maior salario do seu respectivo departamento.


            SELECT nome, salario, cod_depto FROM Funcionario A 
                WHERE salario = (SELECT max(SALARIO) FROM Funcionario B WHERE A.cod_depto = B.cod_depto)

            -> onde temos a correlacao? entao no select de dentro ele nao consegue rodar sozinho pois estamos apontando aqui A.cod_depto a tabela funcionario que esta do lado de fora, ele vai trabalhar como se fosse um ponteiro temos um ponteiro A para a tabela, entao o poteiro A, vai apontar por exemplo para "Ana ", A.cargo = " Analista", A.cod_depto = "1", agora vai rodar o select de dentro Funcionario B onde B.cod_depto e igual a A.cod_depto, quanto e A.cod_depto? = 1, entao qual e o maior salario? vai ir um ponteiro B no codigo de departamento sendo = 1, e vai varrer os registro e retornar o valor do salario, so que o select de fora vai retornar o valor diferente do que o de dentro, entao o que ira acontecer, o ponteiro A ira apontar para outro nome, salario e cod_depto , exemplo "Jose", cod_depto = "1", salario = salario.interno , entao o resgistro jose sera exibido, pois salario interno e= salario externo, e continua o processo  para achar o maior salario do departamento 2 , e assim por diante...



        SUBSELECT com correlacao: EXITS e NOT EXISTS:


            -> Usados para verificar se o resultado de uma consulta aninhada correlacionada e vazio (nao contem tuplas), quando tivermos trabalhando com estes dois termos e sempre subselect com correlacao.

            EXISTS 
                Resultado: 
                    -> TRUE: quando a consulta aninhada retorna pelo menos uma tupla
                    -> FALSE: quando a consulta aninhada nao retorna tuplas.

            NOT EXISTS 
                Resultado: 
                    -> TRUE: quando a consulta aninhada nao retorna tupla.
                    -> FALSE: quando a consulta aninhada retorna pelo menos uma tupla



            EXISTS 
                -> testa a existencia de linhas que resultariam do subselect. Pode - ser substituido pelo IN 

                -> EXISTS exige subselect com correlacao pois testa a existencia da linha inteira no subselect 

                    O resultado de um subselect que sucede um EXISTS e tratado da seguinte forma: 
                        - Falso, se nao encontrou registros 
                        - Verdadeiro, se encontrou um ou mais registros 

                -> Os campos selecionados no select interno nao sao tao relevantes quando se usa EXISTS.

                -> Usado para verificar se elementos de mesmo tipo pertencem ou nao a conjuntos distintos.



                --> exemplo: Selecicone os distintos cargos que existem no departamento mas nao existem no depto 2

                    (Exists e Not Exists pode ser substuidos por IN e NOT IN, dispensando a correlacao na maioria das vezes)

                    ex: SELECT distinct cargo FROM Funcionario A 
                            WHERE cod_depto = 1 and cargo NOT IN 
                        (SELECT distinct cargo FROM Funcionario B 
                            WHERE cod_depto = 2)

                
                --> exemplo: Selecione os distintos extados que existem entre os funcionarios do departamento de informatica e tambem existem no depto de contabilidade.

                    ex: 
                    
                    SELECT distinct estado FROM Funcionario A, Depto B 
                        WHERE A.cod_depto = B.cod_depto and nome_depto = 'Informatica' and exists (SELECT distinct estado FROM Funcionario C, Depto D 
                            WHERE C.Cod_Depto = D.cod_depto and nome_depto = 'Contabilidade' AND  C.estado = A.Estado)


                
                

        ANY E IN: 


                - Any possui efeito bastante semelhante ao IN, diferenciando - se apenas na sintaxe 

                - EX: Selecione os nomes dos departamentos que tem funcionarios que trabalham no estado de MG 

                IN;     
                    SELECT nome_depto FROM Depto WHERE cod_depto IN (SELECT cod_depto FROM  Funcionario WHERE estado = 'MG')

                ANY; 
                    SELECT nome_depto FROM Depto WHERE cod_depto = ANY (SELECT cod_depto FROM Funcionario WHERE estado = 'MG')



        ALL 

            -> Compara um elemento com todos do seu conjunto.

            -> Pode ser usado em substituicao ao MAX em consultas analiticas 

            -> Em consultas sinteticas (uso de Group By) , deve-se usar o ALL quando se quer obter o maior ou menor de todos, pois nao se aplica MAX(sum(salario)), MAX(count(*))

                    SELECT DEPTO, AVG(salario)
                        FROM funcionarios
                            GROUP BY Depto
                    HAVING AVG (salario) >= ALL 
                        (SELECT AVG(SALARIO)
                            FROM Funcionarios
                        GROUP BY Depto)


            --> exemplo: Selecione o nome do funcionario que tem o maior salario dentre todos os funcionarios 

                    SELECT nome, salario FROM Funcionario 
                        WHERE salario >= ALL (Select salario FROM Funcionario)

                        -> Tambem pode ser solucionado da seguinte forma 

                    SELECT nome, salario FROM Funcionario 
                        WHERE salario >= (SELECT max(salario) FROM Funcionario)



            --> exemplo: Selecione o codigo do departamento que tem o maior numero de funcionarios

                    SELECT cod_depto, COUNT(*) AS QtdeFunc FROM Funcionario 
                        GROUP BY cod_depto HAVING COUNT(*) >= ALL (SELECT count(*) FROM Funcionario GROUP BY cod_depto)
                    
                -> OBS: Nesse casi, sao gerados dois grupos (select externo e interno) que sao comparados entre si. Por isso, existe a necessidade do >= porque o elemento e comparado com os outros e com ele mesmo

                -> OBS: Reparar que o select interno tem apenas uma coluna para que seja possivel a comparacao. No select interno, e feito um groupy by pelo codigo depto, que e exibido apenas no select externo.




    // SEGURANCA E AUTORIZACAO EM BANCO DE DADOS //

        -> DCL - (DATA CONTROL LANGUAGE)   
        
        -> O banco de dados envolve armazenamento de informacoes estrategicas. e as vezes sigilosa, da organização.

        -> Cabe ao DBA em conjunto com o anlista de sistemas e o usuario gestor do sistema estabelecer a politica de privilegios.

        -> DCL / DML: o aspecto seguranca de dados relaciona qual usuario ou grupo de usuarios tem privilegio de INSERT, DELETE, SELECT ou UPDATE em uma tabela ou visao. 


            TIPOS DE PRIVILEGIO: 
                -> podem ter dois tipos de privilegios podem ser de dados aos usuarios:

                    - PRIVILEGIO DE SISTEMA: habilita o usuario a realizarem açoes particulares no banco de dados.

                    - PRIVILEGIO DE OBJETO: Habilita usuarios acessarem e manipularem um objeto especifico.


            PRIVILEGIOS DE SISTEMA: EXEMPLOS -> 

            - CREATE SESSION 
            - UNLIMITED TABLESPACE 
            - CREATE TABLE 
            - CREATE TRIGGER 
            - CREATE USER 
            - CREATE VIEW 
            - DELETE ANY TABLE 
            - DROP ANY TABLE 
            - DROP USER


            CONCESSAO DE PRIVILEGIOS DE OBJETO: 

            ->  Usuarios que podem conceder privilegio em um determinado objeto: 
                    
                    - Dono do objeto 
                    - DBA 
                    - Qualquer usuario que tenha sido dado explicitamente permissao de conceder o privilegio no objeto 


                -> TIPOS DE PRIVILEGIOS DE OBJETO: EXEMPLO: 

                    TABLES: 
                        - SELECT , INSERT , UPDATE, DELETE, ALTER 
                    
                    VIEWS: 
                        - SELECT, INSERT, UPDATE, DELETE
                    
                    PACKAGES, PROCEDURES, FUNCTIONS: 
                        - EXECUTE, DEBUG 
            
        
        -> SEGURANCA EM BD: 

            - O privilegio de SELECT e o mais usual, sendo os outros mais restritos 

            - Quando se deseja conceder todos os privilegios, a palavra chave ALL e utilizada. Quando se deseja conceder privilegios para todos os usuarios a palavra chave PUBLIC e utilizada.


            PRIVELEGIOS, GRANT vs REVOKE: 


            GRANT: A mao que da, a mao que concede o privilegio, no ingles significa conceder, maior parte das vezes e utilizado esse comando 

            REVOKE: A mao que retira, elimina os privilegios que anteriormente foram concedidos aos usuarios especificos. E utilizado quando certo usuario algum usuario nao deveria estar tendo privilegio naquela situacao. 


            -> COMANDO GRANT 

                A sintaxe do comando e: 
                    GRANT <privilegios> ON <objeto> TO <usuario, grupo de usuarios ou PUBLIC>

                -> explicacao: colocamos primeiramente o que sera concedido depois onde e depois a quem esses privilegios estao sendo concedidos.

                    --> exemplos: 

                1   GRANT SELECT , INSERT ON FUNCIONARIOS TO RAQUEL 

                        -> no mesmo comando estamos concedendo duas permissoes, na tabela funcionario para o usuario raquel 

                2   GRANT ALL ON FUNCIONARIOS TO CARLOS, ANTONIO 

                        -> aqui estamos concedendo todos os privilegios da tabela funcionario para os usuarios carlos e antonio
                
                3   GRANT SELECT ON ORGANIZACAO TO PUBLIC 

                        -> estamos concedendo permissao para o comando select da tabela organizacao para todos os usuarios 

                4   GRANT ALL ON FUNCIONARIOS TO PUBLIC 

                        -> aqui estamos concedendo todas as permissoes para tabela funcionario, e tambem dando permissao para que todos usuarios possam mexer.


                
                -> GRANT with GRANT OPTION 

                    - Concede o direito ao usuario de reepassar a permissao para frente. Deve ser usada com muito criterio.

                    - Nao e a opcao default 

                        ex: 
                            GRANT SELECT, INSERT ON Funcionarios TO RAQUEL with GRANT OPTION 

                                -> apos esse comando, a usuario raquel podera repassar para quem quiser  os privilegios de SELECT e INSERT na tabela Funcionarios. 




            -> COMANDO REVOKE: 

                - O comando REVOKE tem efeito revogar uma permissao (GRANT) pois revoga os privilegios proibicoes ja concedidos.

                - A sintaxe do comando: 
                    REVOKE <privilegios> ON <objeto> FROM <usuario, grupos de usuarios ou public>

                    -> temos o que, onde esses privilegios serao revogados e a quais usuarios estao perdendo esses privilegios.


                
                1   REVOKE SELECT, INSERT ON Funcionarios FROM Maria, Carlos 

                        -> Aqui esta sendo revogado os comandos de select e insert da tabela funcionarios, para os usuarios Maria, Carlos.


                2   REVOKE ALL ON Funcionarios FROM PUBLIC

                        -> Aqui retira todos os privilegios de todos na tabela funcionario.


                3   REVOKE GRANT OPTION FOR SELECT, INSERT ON Funcionarios FROM Raquel 

                        -> Esse comando de revoke mantem os direitos da usuario Raquel, mas cancela a possibilidade de passa-lo adiante , ou seja ela pode continuar utilizando os comandos, mas perdeu o direito de passar esses privilegios a diante.



            
            -> ROLE (PAPEL) 

                - E grupo nomeado de privilegios relacionados que sao concedidos para usuarios ou outras roles.

                - E util para facilitar a administracao de privilegios no banco de dados e portanto melhorar a seguranca: 

                        CREATE ROLE nome_role;

                        DROP ROLE nome_role;


                1) Concessao de privilegios para role 

                    GRANT <privilegios> TO <nome_role>

                2) Concessao de role a usuario

                    GRANT <nome_role>
                        TO <usuario>
                    [WITH ADMIN OPTION] ;



            -> PROFILE (PERFIL)

                - E um conjunto de limites de recursos e senha 

                - O banco de dados Oracle cria automaticamente o perfil DEFAULT que nao possui nenhum limite.

                    MOTIVACOES PARA O USO DO PERFIL: 

                        - Imperdir que os usuarios executem operacoes que requeiram uso excessivo de recursos do sistema.

                        - Garantir que usuarios desconectem do banco de dados depois de deixar suas sessoes sem uso por algum tempo.

                        - Possibilitar o agrupamento de recursos e atribuicao a um grupo de usuario.

                        - Controlar o uso de senhas.
                        

                    CRIACAO  / REMOCAO DE PERFIL: 

                        CREATE PROFILE <perfil> LIMIT 
                            (parametro_recurso  | parametro_senha)
                            (parametro_recurso | parametro senha) ...;


                        DROP PROFILE <perfil> [CASCADE];

                            obs: o perfil e retirado de todos os usuarios aos quais o perfil havia sido definido e o profile default e definido para tais usuario.


