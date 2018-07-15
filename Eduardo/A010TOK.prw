// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 28/03/2018 | Don Junior  	| Exemplo ponto de entrada na confirmação do cadastro de
//            |                 | produtos (MATA010)
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function A010TOK()

	Local lRet := .T.
	
	If Len(AllTrim(M->B1_DESC)) < 5
		MsgStop("Favor detalhar melhor a descrição do produto!")
		lRet := .F.
	EndIf
	
Return lRet

