# language: pt

Funcionalidade: Pesquisar Funcionarios 
    Para averiguar informçoes 
    O usuario do sistema
    Deseja poder consutar informaçoes dos funcionarios 

Cenario: Buscar informaçoes de funcionario 
        Dado que o usuario consulte informaçoes de funcionario 
        Quando ele realizar a pesquisa 
        Entao uma lista de funcionarios deve retornar 

@cenario_dois 
Cenario: Cadstrar funcionario
        Dado que o usuario cadastre um novo funcionario 
        Quando ele enviar as informaçoes do funcionario
         Entao esse funcionario sera cadastrado 
@cenario_tres
Cenario: Alterar informaçoes cadastrais 
        Dado que o usuario altere uma informaçao do funcionario 
        Quando ele enviar as novas informaçoes 
        Entao as informaçoes serao alteradas

@cenario_quatro
Cenario: Deletar cadastro de funcionario
    Dado que o usuario queira deletar um funcionario 
    Quando ele enviar a identificação unica 
    Então esse funcionario sera deletado do sistema 


