// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 28/03/2018 | Don Junior  	| Exemplo da função DlgToExcel 
//            |                 |
// -----------+-----------------+-----------------------------------------------------------

#include "protheus.ch"

User Function TNMT011()

	Local aCabExcel   :={}
	Local aItensExcel :={}

	AADD(aCabExcel, {"A3_FILIAL" ,"C", 02, 0})
	AADD(aCabExcel, {"A3_COD"    ,"C", 06, 0})
	AADD(aCabExcel, {"A3_NOME"   ,"C", 40, 0})
	AADD(aCabExcel, {"A3_BAIRRO" ,"C", 20, 0})
	AADD(aCabExcel, {"A3_MUN"    ,"C", 15, 2})

	MsgRun("Favor Aguardar.....", "Selecionando os Registros", {|| TNMT011A(@aItensExcel)})

	MsgRun("Favor Aguardar.....", "Exportando os Registros para o Excel",;
	       {||DlgToExcel({{"GETDADOS", "POSIÇÃO DE TÍTULOS DE VENDOR NO PERÍODO",;
	       aCabExcel,aItensExcel}})})

Return


//----------------------------------------------
// Inclusão de dados no array de itens 
//----------------------------------------------
Static Function TNMT011A(aItensExcel)
	
//	DbSelectArea("SA3")
//	SA3->(DbSetOrder(1)) 
	SA3->(DbGoTop())
	
	While !SA3->(EOF())
	
		AADD(aItensExcel,{SA3->A3_FILIAL,SA3->A3_COD,SA3->A3_NOME,SA3->A3_BAIRRO,SA3->A3_MUN,Nil})// ultima posição com nulo

		SA3->(DbSkip())
	EndDo
	
Return
