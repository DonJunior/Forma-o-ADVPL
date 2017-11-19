#INCLUDE "RWMAKE.CH"
#INCLUDE "TBICONN.CH"

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 14/08/2017 | Don Carvalho	| Exemplo MsExecAuto para cadastro de produtos.
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
User Function xMata010()

	Local   aVetor      := {}
	private lMsErroAuto := .F.

	//PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "EST" 

	//--- Exemplo: Inclusao --- // 

	aVetor:= {{"B1_COD"       ,"100007604"     ,NIL},;
			  {"B1_DESC"      ,"PRODUTO TESTE" ,NIL},;
			  {"B1_TIPO"      ,"PA"            ,Nil},;
			  {"B1_UM"        ,"UN"            ,Nil},;
			  {"B1_LOCPAD"    ,"01"            ,Nil},;
			  {"B1_PICM"      ,0               ,Nil},;
			  {"B1_IPI"       ,0               ,Nil},;
			  {"B1_CONTRAT"   ,"N"             ,Nil},;
			  {"B1_LOCALIZ"   ,"N"             ,Nil}}

	MSExecAuto({|x,y| Mata010(x,y)},aVetor,3)


	//--- Exemplo: Alteracao ---
	/*
	aVetor:= {{"B1_COD"   ,"9994"                     ,NIL},; 
              {"B1_DESC"  ,"PRODUTO TESTE - ALTERADO" ,NIL}} 

	MSExecAuto({|x,y| Mata010(x,y)},aVetor,4) */

	//--- Exemplo: Exclusao ---
	/*
	aVetor:= {{"B1_COD"  ,"9994"                     ,NIL},;                     
              {"B1_DESC" ,"PRODUTO TESTE - EXCLUIDO" ,NIL}}                     

	MSExecAuto({|x,y| Mata010(x,y)},aVetor,5) */ 

	If lMsErroAuto
		MostraErro()
	Else
		Alert("Produto Incluido com sucesso!!!!")
	Endif

Return