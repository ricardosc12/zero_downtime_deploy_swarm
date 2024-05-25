#!/bin/bash

# URL para a solicitação GET
URL="http://localhost/teste"

# Função para fazer a solicitação HTTP GET
function make_request() {
  # Utiliza o curl para fazer a solicitação HTTP GET com timeout de 5ms
  response=$(curl -s --max-time 0.005 -w "%{http_code}" "$URL")
  
  # Extrai o código de status HTTP (os últimos 3 caracteres da resposta)
  http_code="${response: -3}"
  
  # Extrai o corpo da resposta (todos menos os últimos 3 caracteres)
  body="${response:0:${#response}-3}"

  # Verifica o código de resposta HTTP
  if [ "$http_code" -eq 200 ]; then
    echo "ok $body"
  else
    echo "false"
  fi
}

# Loop infinito para fazer a solicitação a cada 50ms
while true; do
  make_request
  # Aguarda 50ms antes de fazer a próxima solicitação
  sleep 0.05
done