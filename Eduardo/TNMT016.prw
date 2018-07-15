// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 12/04/2018 | Don Junior  	| Exemplo de FT_Fuse - Abertura de arquivos
//            |                 |
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'

#define CRLF Char(13) + Char(10)

User Function TNMT016()

	Local cLinha  := ''
	Local aLinha  := {}
	Local aVetor  := {}
	Private lMsErroAuto

	If FT_Fuse(GetTempPath() + 'TESTE.TXT') == 1
	
		While !FT_FEOF()
		
			cLinha := FT_FReadLn()
			
			// Tratando fim do arquivo
			If SubStr(cLinha,1,1) == ""
				Loop
			EndIf
			
			aLinha := StrTokArr(cLinha,";")
			
			aVetor := {{"B1_COD"    , aLinha[1]     , Nil },;
					   {"B1_DESC"   , aLinha[2]     , Nil },;
					   {"B1_TIPO"   , aLinha[3]     , Nil },;
					   {"B1_UM"     , aLinha[4]     , Nil },;
					   {"B1_LOCPAD" , aLinha[5]     , Nil },;
					   {"B1_PRV1"   , Val(aLinha[6]), Nil }}

			MsExecAuto({|x,y|Mata010(x,y)}, aVetor,3)
			
			If lMsErroAuto
				MostraErro()
			Else
				MsgInfo("Produto Incluído com sucesso!")
			EndIf
			
			FT_FSkip()
		EndDo
	Else
		MsgStop("Erro ao abrir arquivo")
	EndIf
		
Return


/*
User Function TNMT016()

	Local nHandle
	Local aTemp   := {}

	If FT_Fuse(GetTempPath() + 'TESTE.TXT') == 1
	
		While !FT_FEOF()
	
			AADD(aTemp,StrTokArr(FT_FReadLn(), ";"))
			
			FT_FSkip()
		EndDo
		
		// Exibe os dados
		TNMT016A(aTemp)
	Else
		MsgStop("Erro ao abrir arquivo")
	EndIf
		
Return

//---------------------------------------------
// Exibe os dados importados
//---------------------------------------------
Static Function TNMT016A(aTemp)
	
	Local nArq
	Local cMsg := ''
	Local aArq := aClone(aTemp)
	
	For nArq := 1 To Len(aArq)
	
		cMsg += aArq[nArq]
		
	Next nArq
	
	
	If !Empty(cMsg)
	
		MessageBox(cMsg)
	EndIf
	
Return
*/