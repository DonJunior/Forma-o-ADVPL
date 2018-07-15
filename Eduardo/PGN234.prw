// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 01/04/2018 | Don Junior  	| Exemplo aHeader e aCols
//            |                 | Apostila Página 234
//            |                 | *** CÓDIGO INCOMPLETO ***
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN234()

	Local cChave
	Local aReg      := {}
	Local aCols     := {}
	Local aHeader   := {}
	Local cAliasSB1 := "SB1"

	DbSelectArea("SX3")
	SX3->(DbSetOrder(1))
	
	While !SX3->(EOF()) .And. SX3->X3_CHAVE == cAliasSB1
		
		If X3Uso(SX3->X3_USADO) // .And. cNivel >= SX3->X3_NIVEL
		
		AADD(aHeader,{SX3->X3_CAMPO  ,;
		              SX3->X3_PICTURE,;
		              SX3->X3_TAMANHO,;
		              SX3->X3_DECIMAL,;
		              SX3->X3_VALID  ,;
		              SX3->X3_USADO  ,;
		              SX3->X3_TIPO   ,;
		              SX3->X3_ARQUIVO,;
		              SX3->X3_CONTEXT})  
		EndIf
	
		SX3->(DbSkip())
	EndDo
	
	If nOpc <> 3 // diferente de inclusão
		
		cChave := cAliasSB1->(B1_COD)
		
		DbSelectArea(cAliasSB1)
		cAliasSB1->(DbSetOrder(1))
		
		If DbSeek(xFilial(cAliasSB1) + cChave)
			
			While !cAliasSB1->(EOF()) .And. cAliasSB1->B1_FILIAL == xFilial(cAliasSB1);
			                          .And. cAliasSB1->B1_COD    == cChave
			                          
			    AADD(aReg, cAliasSB1->(Recno()))
			    AADD(aCols,{ Array(Len(aHeader) + 1 )})
			
				For nX := 1 To Len(aHeader)
				
					If aHeader[nX][10] == "V"
						aCols[Len(aCols)][nX] := CriaVar(aHeader[nX][2],.T.)
					Else
						aCols[Len(aCols)][nX] := FieldGet(FieldPos(aHeader[nX][2]))
					EndIf
				Next nX
				
				aCols[Len(aCols),Len(aHeader) + 1) := .F. // campo do delete
				
				cAliasSB1->(DbSkip())
				
			EndDo
		Else
		    AADD(aCols,{ Array(Len(aHeader) + 1 )})

			For nX := 1 To Len(aHeader)
				aCols[1][nX] := CriaVar(aHeader[nX][2],.T.)
			Next nX
			
			aCols[1,aScan(aHeader,{|X| Trim(X[2]) == "B1_ITEM"})] := "01"
			aCols[1,Len(aHeader) + 1) := .F. // campo do delete
		EndIf
	EndIf
	
	
Return
