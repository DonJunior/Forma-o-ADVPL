#include "totvs.ch"
#include "protheus.ch"

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo importa��o de arquivo *.CSV e grava��o dos 
//		      |                 | registros no banco de dados.
// -----------+-----------------+-----------------------------------------------------------
User Function IMPTOCSV()

	Local cDir     := "C:\TEMP\"
	Local cArq    := "livros.csv"
	Local cLinha  := ""
	Local lPrim   := .T.
	Local aCampos := {}
	Local aDados  := {}
 
	Private aErro := {}
 
	If !File(cDir+cArq)
		MsgStop("O arquivo " +cDir+cArq + " n�o foi encontrado. A importa��o ser� abortada!","[IMPCSV] - ATENCAO")
		Return
	EndIf
 
	FT_FUSE(cDir+cArq)
	ProcRegua(FT_FLASTREC())
	FT_FGOTOP()
	While !FT_FEOF()
 
		IncProc("Lendo arquivo texto...")
 
		cLinha := FT_FREADLN()
 
		If lPrim
			aCampos := Separa(cLinha,";",.T.)
			lPrim := .F.
		Else
			AADD(aDados,Separa(cLinha,";",.T.))
		EndIf
 
		FT_FSKIP()
	EndDo
 
	Begin Transaction
		ProcRegua(Len(aDados))
		For i:=1 To Len(aDados)
 
			IncProc("Importando Livros...")
 
			dbSelectArea("ZZ1")
			dbSetOrder(1)
			dbGoTop()
			// Codigo � incremental gerando falha no seek rever �ndice
			If !dbSeek(xFilial("ZZ1")+aDados[i,1])
				Reclock("ZZ1",.T.)
				ZZ1->ZZ1_FILIAL := xFilial("ZZ1")
				For j:=1 to Len(aCampos)
					cCampo  := "ZZ1->" + aCampos[j]
					&cCampo := aDados[i,j]
				Next j
				SZ1->(MsUnlock())
			EndIf
		Next i
	End Transaction
 
	FT_FUSE()
 
	ApMsgInfo("Importa��o dos Clientes conclu�da com sucesso!","[IMPCSV] - SUCESSO")
 
Return
