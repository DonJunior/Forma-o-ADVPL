// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 21/03/2018 | Don Junior  	| Exemplo Bloco de Código
//            |                 | 
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

#Define CLRF Chr(13) + Chr(10)

User Function TNMT007()

	Local cMsg
	Local bCodBloc := {|nNumero|nNumero*6}
	Local bBloco   := {|x,y|If(x>y,"Maior","Menor")}

	cMsg := 'Teste 01 => ' + 'If(x>y,"Maior","Menor")' + CLRF + "Resultado " + EVal(bBloco, 2, 4) + CLRF

	cMsg += 'Teste 02 => ' + "{|nNumero|nNumero*6}" + CLRF + "Resultado " + cValToChar(Eval(bCodBloc,2)) + CLRF

	MsgInfo(cMsg, "Exemplo de Code Block")
	
Return