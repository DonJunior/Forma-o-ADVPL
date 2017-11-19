#Include "PROTHEUS.CH"
//--------------------------------------------------------------
/*/{Protheus.doc} TOTA0009
Description                                                     
                                                                
@param xParam Parameter Description                             
@return xRet Return Description                                 
@author  -                                               
@since 16/08/2017                                                   
/*/                                                             
//--------------------------------------------------------------
User Function TOTA0009()

	Local   oButtonOk
	Local   oPainel
	Local   oSay1
	Local   oSay2
	Local   oSay3
	Local   oSayAnoLan
	Local   oSayCod
	Local   oSayCodAut
	Local   oSayDesc
	Local   oSayPreco
	Private oGetAnoLan
	Private oGetCod
	Private oGetCodAut
	Private oGetCodEdt
	Private oGetDesc
	Private oGetNomAut
	Private oGetNomEdi
	Private oGetValor
	Private cGetCod    := GetSxeNum("ZZ1","ZZ1_COD")
	Private cGetAnoLan := Space(4)
	Private cGetCodAut := Space(6)
	Private cGetCodEdt := Space(6)
	Private cGetDesc   := Space(40)
	Private cGetNomAut := Space(40)
	Private cGetNomEdi := Space(40)
	Private cGetValor  := Space(8)
	Static oDlg

  DEFINE MSDIALOG oDlg TITLE "Cadastro de Livros" FROM 000, 000  TO 355, 655 COLORS 0, 16777215 PIXEL

    @ 002, 003 GROUP oPainel TO 174, 326 PROMPT " Cadastro de Livros " OF oDlg COLOR 0, 16777215 PIXEL
    @ 033, 017 MSGET oGetCod VAR cGetCod SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
    @ 026, 017 SAY oSayCod PROMPT "Código:" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 053, 018 SAY oSayDesc PROMPT "Descrição:" SIZE 025, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 060, 017 MSGET oGetDesc VAR cGetDesc SIZE 163, 010 OF oDlg COLORS 0, 16777215 PIXEL
    @ 026, 240 SAY oSayAnoLan PROMPT "Ano Lançamento:" SIZE 046, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 033, 240 MSGET oGetAnoLan VAR cGetAnoLan SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
    @ 083, 017 SAY oSayCodAut PROMPT "Cód. Autor:" SIZE 035, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 091, 017 MSGET oGetCodAut VAR cGetCodAut SIZE 060, 010 OF oDlg COLORS 0, 16777215 F3 "ZZ2" PIXEL
    @ 114, 017 SAY oSay1 PROMPT "Cod. Editora:" SIZE 043, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 122, 017 MSGET oGetCodEdt VAR cGetCodEdt SIZE 060, 010 OF oDlg COLORS 0, 16777215 F3 "ZZ3" PIXEL
    @ 091, 098 MSGET oGetNomAut VAR cGetNomAut SIZE 203, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL
    @ 083, 098 SAY oSay2 PROMPT "Nome Autor:" SIZE 074, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 114, 098 SAY oSay3 PROMPT "Nome Editora:" SIZE 047, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 122, 098 MSGET oGetNomEdi VAR cGetNomEdi SIZE 203, 010 OF oDlg COLORS 0, 16777215 READONLY PIXEL
    @ 053, 240 SAY oSayPreco PROMPT "Preço:" SIZE 037, 007 OF oDlg COLORS 0, 16777215 PIXEL
    @ 060, 240 MSGET oGetValor VAR cGetValor SIZE 060, 010 OF oDlg COLORS 0, 16777215 PIXEL
    @ 152, 263 BUTTON oButtonOk PROMPT "Ok" SIZE 037, 012 OF oDlg ACTION Gravar() WHEN Valida() PIXEL

	ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function Gravar()

	Validar()

Return

Static Function Validar()

	Local lOk := .T.

Return lOk

