// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 16/04/2018 | Don Junior  	| Exemplo Importação de arquivo com tamanho delimitado, 
//            |                 | chamando MsExecAuto para gravação de produtos.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'fileio.ch'

User Function TNMT018()
	
	Local cData
	Local nPreco
	Local nHandle 
	Local aRet     := {}
	Local aParam   := {}
	Local aProduto := {}
	Local cLinha   := ''
	Local cArquivo := ''
	Private lMsErroAuto
	
	AADD(aParam,{6,"Selecione um Arquivo","","@!","","",80,.T.,"Arquivos .REM |*.rem","c:\totvs\"})
	
	If ParamBox(aParam,"Importar Produto",@aRet)
		cArquivo := AllTrim(aRet[1])
		
		nHandle := FOpen(cArquivo, FO_READWRITE + FO_SHARED )
	
		If nHandle == -1
			MsgStop('Erro de abertura: ' + MostraErro() )
		Else
			
			While Len(cLinha) = 91
				
				FRead(nHandle, cLinha, 91)
			
				nPreco := Val(SubStr(cLinha,52,14)) / 100
				cData  := SubStr(cLinha,81,02) + "/" + SubStr(cLinha,83,02) + "/" + SubStr(cLinha,85,04)
				
				aProduto := {{"B1_COD"    , SubStr(cLinha,01,15)   , Nil },;
						     {"B1_DESC"   , SubStr(cLinha,16,30)   , Nil },;
						     {"B1_TIPO"   , SubStr(cLinha,46,02)   , Nil },;
						     {"B1_UM"     , SubStr(cLinha,48,02)   , Nil },;
						     {"B1_LOCPAD" , SubStr(cLinha,50,02)   , Nil },;
						     {"B1_PRV1"   , nPreco                 , Nil },; // Val(SubStr(cLinha,52,14))
						     {"B1_CODBAR" , SubStr(cLinha,66,15)   , Nil },;
						     {"B1_DATREF" , CToD(cData)            , Nil }} // Transform(SubStr(cLinha,81,08),"@E 99/99/9999")
				
				MsExecAuto({|x,y|Mata010(x,y)}, aProduto,3)
				
				If lMsErroAuto
					MostraErro()
				Else
					MsgInfo("Produto Incluído com sucesso!")
				EndIf
			
			EndDo
		
			FClose(nHandle) // Fecha arquivo
		Endif	
	
	EndIf
	
Return
