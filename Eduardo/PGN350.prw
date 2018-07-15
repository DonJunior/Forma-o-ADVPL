// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 15/04/2018 | Don Junior  	| Exemplo de TWsdlManager - tratamento de arquivos WSDL
//            |                 | Apostila Página 350
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'apwebsrv.ch'
#include 'tbiconn.ch'

User Function PGN350()

	Local lOk
	Local oWsdl
	Local cResp
	Local aOps     := {}
	Local aSimple  := {}
	Local aComplex := {}

	// Cria o objeto da classe TWsdlManager
	oWsdl := TWsdlManager():New()

	// Faz o parse de uma URL
	lOk := oWsdl:ParseURL( "http://127.0.0.1:8090/SERVERTIME.apw?WSDL" )
	If lOk == .F.
		MsgStop(oWsdl:cError,"ParseURL()Error" )
		Return
	EndIf

	// Lista os métodos do serviço
	aOps := oWsdl:ListOperations()

	// Define a operação
	lOk := oWsdl:SetOperation(aOps[1][1]) // "GETSERVERTIME" // case sensitive
	If lOk == .F.
		MsgStop(oWsdl:cError,"SetOperation(ConversionRate)Error" )
		Return
	EndIf
	
	// Retorno dos parâmetros e respectivos tipos
	aComplex := oWsdl:NextComplex()
	aSimple  := oWsdl:SimpleInput()

	// Define o valor do(s) parâmeto(s) necessário(s)
	lOk := oWsdl:SetValue(0, "000")
	
	// Grava mensagem enviada no console.log
	ConOut(oWsdl:GetSoapMsg())

	// Envia requisição ao webservice
	lOk := oWsdl:SendSoapMsg()
	If lOk == .F.
		MsgStop(oWsdl:cError,"SendSoapMsg()Error" )
		Return
	EndIf

	// Recupera o retorno processado
	cResp := oWsdl:GetParsedResponse()

	// Monta um array com a resposta
	aRet := StrTokArr(cResp,Chr(10))
	MsgInfo(SubStr(aRet[2],At(":",aRet[2]) + 1 ))
	

Return