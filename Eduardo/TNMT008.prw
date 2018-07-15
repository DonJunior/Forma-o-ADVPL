// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 21/03/2018 | Don Junior  	| Exemplo Consulta ao banco de dados
//            |                 | Foi Comentado as includes protheus.ch e parmtype.ch (Erro)
// -----------+-----------------+-----------------------------------------------------------

// #include 'protheus.ch'
// #include 'parmtype.ch'
#include 'tbiconn.ch'

#Define CLRF Chr(13) + Chr(10)

User Function TNMT008()

	Local cMsg := ''
	
	Prepare Environment Empresa "99" Filial "01"
	
	DbSelectArea("SA3")
	DbSetOrder(1)
	SA3->(DbGoTop())
	
	While !SA3->(EOF())
	
		cMsg += SA3->A3_COD + " - " + SA3->A3_NOME + CLRF
		
		SA3->(DbSkip())  
	
	EndDo
	
	MsgInfo("Vendedore: " + CLRF + CLRF + cMsg)
	 
	
Return