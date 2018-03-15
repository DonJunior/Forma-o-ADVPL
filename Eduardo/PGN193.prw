// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo estrutura condi��o IF/ELSE.
//            |                 | Apostila P�gina 193.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN193()

	Local dVencto := CToD("31/12/2017")

	If Date() > dVencto
		MsgStop("Vencmento Ultrapassado!","Aten��o!")
	Else
		MsgStop("Dentro do Prazo!","Aten��o!")
	EndIf

Return