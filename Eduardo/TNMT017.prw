// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 12/04/2018 | Don Junior  	| Exemplo de ParamBox
//            |                 |
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#Include 'tbiconn.ch'

User Function TNMT017()

	Local aRet    := {}
	Local aParam  := {}
	Local cCodRec := space(08)

	// Prepare Environment Empresa "99" Filial "01"

	AADD( aParam ,{1,"Recurso : ",cCodRec,"@!",'.T.',,'.T.',40,.F.})   
	AADD( aParam ,{2,"Recurso Para",1, {"Projeto", "Tarefa"}, 50,'.T.',.T.})   
	AADD( aParam ,{3,"Considera Sabado/Domingo",1, {"Sim", "Nao"}, 50,'.T.',.T.})   
	AADD( aParam ,{4,"Enviar e-mail",.T., "usuario@totvs.com.br", 80,'.T.',.F.})   
	AADD( aParam ,{5,"Recurso Bloqueado",.T., 90,'.T.',.T.})   
	AADD( aParam ,{6,"Selecione o arquivo","","@!","","",80,.T.,"Arquivos .CSV |*.CSV","c:\totvs\"})
	AADD( aParam ,{7,"Filtro", "SA3", "!empty(A3_EMAIL)"})
	AADD( aParam ,{8,"Senha ", Space(80),"","","","",80,.F.}) 
	AADD( aParam ,{9,"-----------------", 30, 30, .T.}) 
	AADD( aParam ,{10,"Range", Space(30), "", 250, "C", 50, ""})
	AADD( aParam ,{11,"MEMO ","","","",.f.})
	AADD( aParam ,{12,"Filtro User", "SA3", "A3_EMAIL <> ''",""})

	If ParamBox(aParam ,"Parametros ",aRet)      
		MsgStop("Pressionado OK")      
	Else      
		MsgStop("Pressionado Cancel")      
	EndIf

Return

