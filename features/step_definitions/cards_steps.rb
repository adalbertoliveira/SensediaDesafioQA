###################################################### Key e Token ######################################################

Dado('obter key e token trello') do
  @response = CREDENTIALS['credentials'] # carregando os dados das credenciais
  @token = @response['token'] # armazenando o token na variável
  @key = @response['key']   # armazenando a key na variável
end

Dado('obter key inválida') do
  @response = CREDENTIALS['credentials'] 
  @token = @response['token'] 
  @key = @response['key-invalida'] 
end

Dado('obter token inválido') do
  @response = CREDENTIALS['credentials'] 
  @token = @response['token-invalido'] 
  @key = @response['key'] 
end

Dado('que eu tenho informações de {string} inválidas') do |string|
  if string.eql?('key')
    step 'obter key inválida'
  else 
    step 'obter token inválido'
  end
end

Então('a api retorna {int} com a mensagem {string} inválida') do |int, string|
  if string.eql?("token")
    expect(@response.body).to eql "invalid token"
    expect(@response.code).to eql 401
  else
    expect(@response.body).to eql "invalid key"
    expect(@response.code).to eql 401
  end
end

###################################################### Cards ##########################################################

Quando('envio uma requisição GET para o endpoint boards') do
  @response = cards.get_board(@key, @token) # requisitando o shortLink do board
end

Quando('envio uma requisição GET para o endpoint lists') do
  step 'envio uma requisição GET para o endpoint boards'
  @board = @response[0]['shortLink']
  @response = cards.get_lists(@board, @key, @token) # requisitando um idList do board
end

Dado('que eu tenho informações válidas para criar um card') do
  @body = YAML.load_file(PAYLOAD_PATH['trello']['post_card']) # payload
  @body['name'] = Faker::DcComics.hero # nome de heroi aleatório
  step 'envio uma requisição GET para o endpoint lists'
  @list = @response[0]['id']
  @body['idList'] = @list # idList válido
end

Quando('envio a requisição POST para o endpoint cards') do
  @response = cards.post_card(@key, @token, @body) # requisição passando os parâmetros
  @idCard = @response['id'] # id do card criado
end

Então('a api retorna {int} e as informações do card criado') do |int|
  expect(@response.body).not_to be_nil 
  expect(@response.code).to eql 200
  step 'envio a requisição DELETE para o endpoint cards'
end

Dado('que eu tenho informações para criar um novo card com {string} inválido') do |string|
  @body = YAML.load_file(PAYLOAD_PATH['trello']['post_card'])
  @body['name'] = Faker::DcComics.hero # nome de heroi aleatório
  @body['idList'] = "321" # idList inválido
end

Então('a api retorna {int} e {string} inválido') do |int, string|

    expect(@response.body).to include "invalid"
    expect(@response.code).to eql 400

end

Dado('que eu tenho informações válidas para editar um card') do
  @body = YAML.load_file(PAYLOAD_PATH['trello']['put_card'])
  # essa condição abaixo é para a tag @editar_card_valido poder ser executada isolada, nos casos que a variável @idCard esteja com valor nulo.
  if @idCard.eql?(nil)
    step 'que eu tenho informações válidas para criar um card'
    step 'envio a requisição POST para o endpoint cards'
  end
  @body['name'] = Faker::DcComics.hero # nome de heroi aleatório
  @body['desc'] = Faker::Lorem.paragraph # gerador de parágrafo pequeno
end

Dado('que eu tenho informações para alterar a lista do card') do
  @body = YAML.load_file(PAYLOAD_PATH['trello']['put_card'])
  # essa condição abaixo é para a tag @editar_card_lista poder ser executada isolada, nos casos que a variável @idCard esteja com valor nulo.
  if @idCard.eql?(nil)
    step 'que eu tenho informações válidas para criar um card'
    step 'envio a requisição POST para o endpoint cards'
  end
  step 'envio uma requisição GET para o endpoint lists'
  @list = @response[1]['id']
  @body['idList'] = @list
end

Quando('envio a requisição PUT para o endpoint cards') do
  @response = cards.put_card(@idCard, @key, @token, @body)
end

Então('a api retorna {int} e as informações do card atualizado') do |int|
    expect(@response.body).not_to be_nil
    expect(@response.code).to eql 200
    expect(@response['name']).to eql @body['name']
    step 'envio a requisição DELETE para o endpoint cards'
end

Dado('que eu tenho informações para editar um card com {string} inválido') do |string|
  @body = YAML.load_file(PAYLOAD_PATH['trello']['put_card'])
  @body['name'] = Faker::DcComics.hero # nome de heroi aleatório
  @body['desc'] = Faker::Lorem.paragraph # gerador de parágrafo pequeno
  @idCard = "321" # id do card inválido
end

Dado('que eu tenho informações válidas para excluir um novo card') do
    # essa condição abaixo é para a tag @excluir_card_existente poder ser executada isolada, nos casos que a variável @idCard esteja com valor nulo.
  if @idCard.eql?(nil)
    step 'que eu tenho informações válidas para criar um card'
    step 'envio a requisição POST para o endpoint cards'
  end 
end

Quando('envio a requisição DELETE para o endpoint cards') do
  @response = cards.delete_card(@idCard, @key, @token)
end

Dado('que eu tenho informações para excluir um card com {string} inválido') do |string|
  @idCard = "321" # id do card inválido
end

Então('a api retorna {int}') do |int|
  expect(@response.body['limits']).to eql "limits"
  expect(@response.code).to eql 200
end