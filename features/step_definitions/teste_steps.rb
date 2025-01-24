# frozen_string_literal: true

Quando('que realizar uma requisição de cadastro de usuario') do 
  @response = teste_carrefour.criar_usuario
end   

Então('o status code será {string}') do |status|
  expect(@response.code).to eq status.to_i
end     

Então('deverá retornar o numero do ID expecifico daquele novo cadastro') do
  @id = @response.parsed_response['_id']
end

Então('realizo uma requisição para listar o meu usuário') do 
  @response = teste_carrefour.buscar_usuario_por_id_e_admin(@id)
  nome = "Thays QA"

  if @response.code == 200
    usuarios = @response.parsed_response['usuarios']

    if usuarios.any? { |usuario| usuario['nome'] == nome }
      puts "O nome '#{nome}' foi encontrado no response."
    else
      puts "O nome '#{nome}' não foi encontrado no response."
    end
  else
    puts "Erro na requisição. Status Code: #{@response.code}"
  end
end      

E('logo após deleto o meu usuario') do 
  @response = teste_carrefour.deletar_usuario(@id)
  puts @response.parsed_response['message']
end   

Dado('que realizo uma requisição de login na api da serverest') do 
  @response = teste_carrefour.realizar_login('thaystest123e@qa.com.br', 'teste123')
  @token = @response.parsed_response['authorization']
end   

Dado('que realizo uma requisição para editar o nome do usuário') do 
  @response = teste_carrefour.atualizar_usuario("Thays Teste Carrefour", "thaystest123e@qa.com.br", "teste123")
end 

Então('verifico a mensagem de sucesso') do
  if @response.code == 200 && @response.parsed_response['message'] == 'Registro alterado com sucesso'
    puts "Atualização realizada com sucesso! Mensagem: #{@response.parsed_response['message']}"
  else
    puts "Erro ao atualizar registro: #{@response.parsed_response['message'] || 'Mensagem não encontrada no response.'}"
  end
end   