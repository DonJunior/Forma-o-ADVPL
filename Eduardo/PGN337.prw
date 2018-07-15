// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 15/04/2018 | Don Junior  	| Exemplo de WebService
//            |                 | Apostila Página 337
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'apwebsrv.ch'
#include 'tbiconn.ch'

WsService ServerTime Description "Veja o Horário"

	WsData Horario    As String
	WsData Parametro  As String
	
	WsMethod GetServerTime Description "Método de Visualização do Horário"

EndWsService

WsMethod GetServerTime WsReceive Parametro WsSend Horario WsService ServerTime
	::Horario := Time()
	
	ConOut("Horario " + ::Horario)
Return .T.
