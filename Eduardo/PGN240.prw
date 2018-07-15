// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 14/04/2018 | Don Junior  	| Exemplo TcSqlExec - Executa senten�as SQL
//            |                 | Apostila P�gina 240
// -----------+-----------------+-----------------------------------------------------------
//            |                 | A senten�a SQL dever ser constru�da conforme o SGBD 
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
