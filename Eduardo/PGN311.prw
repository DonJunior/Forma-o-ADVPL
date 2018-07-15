// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 15/04/2018 | Don Junior  	| Exemplo de ParamBox
//            |                 | Apostila P�gina 311
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN311()
	
	Local   nI        := 0
	Local   aRet      := {}
	Local   aParam    := {}
	Local   aCombo    := {}
	Private cCadastro := "Exemeplo ParamBox"
	
	AADD(aCombo,"Janeiro")	
	AADD(aCombo,"Fevereiro")	
	AADD(aCombo,"Mar�o")	
	AADD(aCombo,"Abril")	
	AADD(aCombo,"Maio")	
	AADD(aCombo,"Junho")	
	AADD(aCombo,"Julho")	
	AADD(aCombo,"Agosto")	
	AADD(aCombo,"Setembro")	
	AADD(aCombo,"Outubro")	
	AADD(aCombo,"Novembro")	
	AADD(aCombo,"Dezembro")
	
	AADD(aParam,{1,"Produto",Space(15),"","","SB1","",0,.F.})	
	AADD(aParam,{2,"Tipo de Cliente",1,aCombo,50,"",.F.})	
	AADD(aParam,{3,"Mostrar Deletados",IIf(Set(_SET_DELETED),1,2),{"SIM","N�O"},50,"",.F.})	
	AADD(aParam,{4,"Marca Todos ?",.F.,"Marque Todos",50,"",.F.})	
	AADD(aParam,{5,"Marca Todos ?",.F.,50,"",.F.})	
	AADD(aParam,{6,"Arquivo ?",Space(50),"","","",50,.F.,"Arquivo .DBF |*.DBF"})	
	AADD(aParam,{7,"Monte o Filtro","SX5","X5_FILIAL==xFilial('SX5')"})	
	AADD(aParam,{8,"Digite a Senha",Space(15),"","","","",80,.F.})
	
	If ParamBox(aParam,cCadastro,@aRet)
		For nI := 1 To len(aParam)
			MsgInfo(aRet[nI],"Op��o Escolhida")
		Next nI
	EndIf	
	
Return
