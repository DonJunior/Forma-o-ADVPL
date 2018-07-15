// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 16/04/2018 | Don Junior  	| Exemplo Importação de arquivo com tamanho delimitado, 
//            |                 | chamando MsExecAuto para gravação de produtos.
// -----------+-----------------+-----------------------------------------------------------

// +---------------------------------------------------------------------------------------+
// |                           LAYOUT PARA IMPORTAÇÃO PRODUTOS                             |
// +-------------+------------+------------------------------------------------------------+
// |  CAMPO      |  TAMANHO   |  TIPO        | DESCRIÇÃO                                   |
// +-------------+------------+--------------+---------------------------------------------+
// | B1_COD      |  15        |  CHARACTER   | Código do Produto                           |
// | B1_DESC     |  30        |  CHARACTER   | Descrição do Produto                        |
// | B1_TIPO     |  02        |  CHARACTER   | Tipo do Produto                             |
// | B1_UM       |  02        |  CHARACTER   | Unidade de Medida                           |
// | B1_LOCPAD   |  02        |  CHARACTER   | Armazem Padrão                              |
// | B1_PRV1     |  14        |  CHARACTER   | Preço de Venda                              |
// | B1_CODBAR   |  15        |  CHARACTER   | Código de Barras                            |
// | B1_DATREF   |  08        |  CHARACTER   | Data de Referência                          |
// +-------------+------------+------------------------------------------------------------+

#include 'protheus.ch'

#define CRLF Char(13) + Char(10)

User Function TNMT019()
	
	Local cData
	Local nPreco
	Local aRet          := {}
	Local aParam        := {}
	Local aProduto      := {}
	Local cMsg          := ''
	Local cLinha        := ''
	Local cArquivo      := ''
	Private lMsErroAuto := .F.
	
	AADD(aParam,{6,"Selecione um Arquivo","","@!","","",80,.T.,"Arquivos .REM |*.rem","c:\totvs\"})
	
	If ParamBox(aParam,"Importar Produto",@aRet)
		cArquivo := AllTrim(aRet[1])
		
		//Definindo o arquivo a ser lido
		oFile := FWFileReader():New(cArquivo)
     
		//Se o arquivo pode ser aberto
		If (oFile:Open())
     
			//Se não for fim do arquivo
			If !(oFile:EoF())
         
				//Enquanto houver linhas a serem lidas
				While (oFile:HasLine())
				
					cLinha := oFile:GetLine()
                 
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
						cMsg += MostraErro()
					EndIf
				EndDo
			EndIf
 
			//Fecha o arquivo e finaliza o processamento
			oFile:Close()
		EndIf

	EndIf
	
	If Empty(cMsg)
		MsgInfo("Arquivo processado com sucesso!")
	Else
		MessageBox(cMsg)
	EndIf
	
Return

