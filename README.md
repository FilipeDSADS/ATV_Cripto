# ATV_Cripto

﻿

Informações Gerais:
Desenvolver um aplicativo Flutter que consome 
a API da Coin Market Cap, listando criptomoedas 
com base em critérios definidos. O projeto deverá 
seguir o padrão arquitetural MVVM e as boas práticas 
discutidas em sala.


Requisitos Técnicos do Aplicativo
Estrutura do Projeto:
Use a arquitetura MVVM:
• UI (View): tela de exibição e interação das criptos moedas.
• ViewModel: State Manager com a lógica da UI e gerenciamento de estados.
• Repository: comunicação com o DataSource.
• DataSource: comunicação direta com a API (como mostrado nos exemplos em sala/GitHub, já implementadas).


Funcionalidades Exigidas
Tela Principal (Listagem de Criptomoedas):
• O usuário deve estar conectado à internet.
• Exibir botão (requisitar) ou pull-to-refresh para buscar ou atualizar os dados.
• Campo de pesquisa com múltiplas criptomoedas (separadas por virgula).
• Ao requisitar a API mostre alguma interação visual ao usuário de que esta buscando as informações, tais como, um Progressing Indicator.
• Se nenhum símbolo for informado, usar os valores padrão: BTC, ETH, SOL, BNB, BCH, MKR, AAVE, DOT, SUI,ADA, XRP,TIA, NEO, NEAR, PENDLE, RENDER, LINK, TON, XAI, SEI, IMX,ETHFI,UMA, SUPER, FET, USUAL, GALA, PAAL, AERO.

Listagem:
Mostrar para cada cripto: 
• Sigla
• Nome da moeda
• Cotação atual em USD e BRL, devidamente formatadas.
Detalhamento:
• Ao clicar em uma criptomoeda, exibir uma Tela ou BottomSheet ou Alert Dialog com detalhes adicionais, das propriedades: Name, Symbol, Data Added, preço atual em USD e BRL formatados.

Chamada à API
Endpoint Exemplo:
https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest?symbol-BTC, BNB, ETH
Headers:
{
"Accepts": "application/json",
"X-CMC_PRO_API_KEY": "YOUR_API_KEY_HERE"
}

Para entender os parâmetros e opções adicionais de resposta, consulte a documentação: https://coinmarketcap.com/api/documentation/v1/#section/Quick-Start-Guide
Repository - Regras Importantes:
• Crie uma Entidade (Model) para mapear o retorno da API (não utilize Map direto).
• O método do Repository deve retornar uma lista de Entidades, que será consumida pela ViewModel.
