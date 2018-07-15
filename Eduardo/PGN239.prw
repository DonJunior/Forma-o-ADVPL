// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 08/04/2018 | Don Junior  	| Exemplo TcSqlExec - Executa uma 
//            |                 | sentença SQL diretamente no banco
//            |                 | Apostila Página 239
//            |                 | *** CÓDIGO INCOMPLETO ***
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

User Function PGN239()

	Local nStatus := 0
	Local cSql      := "UPDATE " + RetSqlName("SA1") + " SET A1_MSBLQL = '1' "

	nStatus := TcSqlExec(cSql)

	If(nStatus <0)
		ComOut("TcSqlError() " + TcSqlError() )
	EndIf

Return