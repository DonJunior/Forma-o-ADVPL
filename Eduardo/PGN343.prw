// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 15/04/2018 | Don Junior  	| Exemplo de Comsumo do WebService
//            |                 | Apostila P�gina 343
// -----------+-----------------+-----------------------------------------------------------
//            |                 | Inclu�do OBj:cParametro := 'xyz' pois o WS exige um 
//            |                 | par�metro de entrada, caso contr�rio o Alert() retorna 
//            |                 | vazio.
// -----------+-----------------+-----------------------------------------------------------


#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN343()
	Local oBj
	
	oBj := WsServerTime():New()
	OBj:cParametro := 'xyz' // par�metro qualquer de entrada do WebService
	OBj:GetServerTime()
	Alert(oBj:cGetServerTimeResult)
Return