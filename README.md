# SensediaDesafioQA
Automação de testes na api do Trello

Para rodar o projeto, é necessário ter Ruby instalado na sua máquina. Faça o download aqui:
https://rubyinstaller.org/downloads/

Se estiver usando ubuntu ou derivados, aconselho seguir esse passo a passo para instalação segura:
https://gorails.com/setup/ubuntu/22.04

Após instalar, abra um terminal ou cmd e execute o comando "gem install bundler"

Depois crie uma conta no Trello se você não tiver e após logado na plataforma, acesse o link abaixo para gerar uma key e token de acesso a api:
https://trello.com/app-key

Você pode encontrar mais instruções sobre a autorização aqui:
https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/#authentication-and-authorization

Após obter a key e token, insira esses dados no arquivo "credentials.yml" na pasta "features\support\config\"
O arquivo deve ficar desta forma com os dados da key e token:

![image](https://user-images.githubusercontent.com/95726001/169714021-53112ce8-3314-4a04-a560-9d5f8d9866c0.png)
------------------------------------------------------------------------------------------

Para evitar problema com dependêcias na primeira execução do projeto, apague o arquivo Gemfile.lock, acesse a pasta do projeto pelo terminal e execute "bundler install"
Após a instalação das dependências acabar, basta digitar "cucumber" (pelo terminal ou cmd na pasta do projeto) para executar todos os cenários, ou você pode executar 
por tags cada cenário. Ex:

cucumber -t @criar_card_valido

A execução irá criar alguns cards, edita-los e excluí-los, além de alguns cenários alternativos de erro e autenticação.

(OBS: se estiver usando o PowerShell no windows como terminal, ele apresenta um problema ao executar o teste por tag, sendo necessário digitar o "-t" junto da tag. 
EX: cucumber -t@criar_card_invalido)
