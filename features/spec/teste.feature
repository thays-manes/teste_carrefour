# language: pt
# encoding: UTF-8

@smoke
Funcionalidade: Validar requisições na API da serverest
  Como um usuario do sistema
  quero realizar requisições na API


@cadastrar_buscar_deletar_usuario
  Cenário: realizar o cadastro de um novo usuário
  Dado que realizar uma requisição de cadastro de usuario
  E o status code será "201"
  E deverá retornar o numero do ID expecifico daquele novo cadastro
  Quando realizo uma requisição para listar o meu usuário
  Então o status code será "200"
  E logo após deleto o meu usuario

@login_serverest
  Cenário: Realizar login
  Dado que realizo uma requisição de login na api da serverest
  Então o status code será "200"

@editar_usuario
  Cenário: Editar Nome do usuario
  Dado que realizo uma requisição para editar o nome do usuário
  Então verifico a mensagem de sucesso
  E o status code será "200"

@deletar_usuario
  Cenário: Editar Nome do usuario
  Dado que realizo uma requisição para editar o nome do usuário
  Então verifico a mensagem de sucesso
  E o status code será "200"