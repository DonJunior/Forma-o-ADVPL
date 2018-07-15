// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 14/04/2018 | Don Junior  	| Exemplo TcSqlExec - Executa sentenças SQL
//            |                 | Apostila Página 240
// -----------+-----------------+-----------------------------------------------------------
//            |                 | A sentença SQL dever ser construída conforme o SGBD 
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN240()

	Local nStatus := 0

	nStatus := TcSqlExec("UPDATE SA1990 SET A1_MSBLQL = '1'")
	
	If nStatus < 1
		ConOut("Erro TcSqlExec " + TcSqlError())
	EndIf
Return
