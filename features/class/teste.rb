# frozen_string_literal: true
require_relative 'classe_comum'

class Teste < ClasseComum
BASE_URL = 'https://serverest.dev'

  def criar_usuario
    # Configurando os headers
    headers = {
      'accept' => 'application/json',
      'Content-Type' => 'application/json'
    }

    # Configurando o payload (dados enviados)
    email = "testethays.#{Faker::Number.number(digits: 5)}@gmail.com"
    payload = {
      nome: 'Thays QA',
      email: email,
      password: 'teste123',
      administrador: 'true'
    }

    # Realizando a requisição POST
    response = HTTParty.post("#{BASE_URL}/usuarios", headers: headers, body: payload.to_json)
  end

  def buscar_usuario_por_id_e_admin(id)
    # Configurando os headers
    headers = {
      'accept' => 'application/json'
    }

    # Configurando os parâmetros da URL
    query_params = {
      _id: id,
      administrador: true
    }

    # Realizando a requisição GET
    response = HTTParty.get("#{BASE_URL}/usuarios", headers: headers, query: query_params)
  end

  def deletar_usuario(id)
    id = id
    headers = {
      'accept' => 'application/json'
    }

    response = HTTParty.delete("#{BASE_URL}/usuarios/#{id}", headers: headers)
  end   


  def realizar_login(email, password)
    # Configurando os headers
    headers = {
      'accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  
    # Configurando o payload (dados enviados)
    payload = {
      email: email,
      password: password
    }
  
    # Realizando a requisição POST
    response = HTTParty.post("#{BASE_URL}/login", headers: headers, body: payload.to_json)
  end   

  def atualizar_usuario(nome, email, senha)
    # Configurando os headers
    headers = {
      'accept' => 'application/json',
      'Content-Type' => 'application/json'
    }

    # Configurando o payload (dados enviados)
    payload = {
      nome: nome,
      email: email,
      password: senha,
      administrador: "true"
    }

    # Realizando a requisição PUT
    id = 'LZcTzPjrM701rHBE'
    response = HTTParty.put("#{BASE_URL}/usuarios/#{id}", headers: headers, body: payload.to_json)
  end   
end