# SensediaDesafioQA
Automação de testes na api do Trello

Para rodar o projeto, é necessário ter Ruby instalado na sua máquina. Faça o download aqui:
https://rubyinstaller.org/downloads/

Após a instalação do Ruby, crie uma conta no Trello se você não tiver e após logado, acesse o link abaixo para gerar uma key e token de acesso a api:
https://trello.com/app-key

Você pode encontrar mais instruções sobre a autorização aqui:
https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/#authentication-and-authorization

Após obter a key e token, insira esses dados no arquivo "credentials.yml" na pasta "features\support\config\"
Para evitar problema na primeira execução do projeto, apague o arquivo gemfile.lock, acesse a pasta do projeto pelo terminal ou cmd e digite "bundler install"
Após a instalação das dependências acabar, basta acessar a pasta do projeto pelo cmd ou terminal e digitar "cucumber" para executar o projeto, ou você pode executar 
por tags cada cenário. Ex:

cucumber -t @criar_card_valido

A execução irá criar alguns cards, edita-los e excluí-los, além de alguns cenários alternativos de erro. 

(OBS: se estiver usando o PowerShell como terminal, ele apresenta um problema ao executar o teste por tag, sendo necessário digitar o "-t" junto da tag. 
EX: cucumber -t@criar_card_invalido)
