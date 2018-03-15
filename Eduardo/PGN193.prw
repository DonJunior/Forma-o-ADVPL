// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Carvalho	| Exemplo estrutura condição IF/ELSE.
//            |                 | Apostila Página 193.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN193()

	Local dVencto := CToD("31/12/2017")

	If Date() > dVencto
		MsgStop("Vencmento Ultrapassado!","Atenção!")
	Else
		MsgStop("Dentro do Prazo!","Atenção!")
	EndIf

Return