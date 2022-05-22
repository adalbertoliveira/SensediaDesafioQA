#language: pt
# force_encoding("UTF-8")
# force_encoding(Encoding::UTF_8)

@cards
Funcionalidade: Cards

  Contexto: Obter key e token para autenticação das requisições
    * obter key e token trello

  @criar_card_valido
  Esquema do Cenário: Requisição POST para criar um novo card com dados válidos
    Dado que eu tenho informações válidas para criar um card
    Quando envio a requisição POST para o endpoint cards
    Então a api retorna 200 e as informações do card criado

  @criar_card_invalido
  Esquema do Cenário: Requisição POST para criar um novo card com dados inválidos
    Dado que eu tenho informações para criar um novo card com "<dado>" inválido
    Quando envio a requisição POST para o endpoint cards
    Então a api retorna 400 e "<dado>" inválido

  @editar_card_valido
  Esquema do Cenário: Requisição PUT para editar um card com dados válidos
    Dado que eu tenho informações válidas para editar um card
    Quando envio a requisição PUT para o endpoint cards
    Então a api retorna 200 e as informações do card atualizado

  @editar_card_invalido
  Esquema do Cenário: Requisição PUT com id inválido
    Dado que eu tenho informações para editar um card com "<card>" inválido
    Quando envio a requisição PUT para o endpoint cards
    Então a api retorna 400 e "<card>" inválido

  @excluir_card_existente
  Esquema do Cenário: Requisição DELETE para excluir um card existente
    Dado que eu tenho informações válidas para excluir um novo card
    Quando envio a requisição DELETE para o endpoint cards
    Então a api retorna 200

  @editar_card_invalido
  Esquema do Cenário: Requisição DELETE com id inválido
    Dado que eu tenho informações para excluir um card com "<card>" inválido
    Quando envio a requisição DELETE para o endpoint cards
    Então a api retorna 400 e "<card>" inválido

  Exemplos:
      | dado     | card     |
      | idList   | id       |
