// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 15/04/2018 | Don Junior  	| Exemplo de Comsumo do WebService
//            |                 | Apostila Página 343
// -----------+-----------------+-----------------------------------------------------------
//            |                 | Incluído OBj:cParametro := 'xyz' pois o WS exige um 
//            |                 | parâmetro de entrada, caso contrério o Alert() retorna 
//            |                 | vazio.
// -----------+-----------------+-----------------------------------------------------------


#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN343()
	Local oBj
	
	oBj := WsServerTime():New()
	OBj:cParametro := 'xyz' // parâmetro qualquer de entrada do WebService
	OBj:GetServerTime()
	Alert(oBj:cGetServerTimeResult)
Return