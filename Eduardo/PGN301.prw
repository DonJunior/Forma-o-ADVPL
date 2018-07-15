// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 14/04/2018 | Don Junior  	| Exemplo de rotina autom�tica em MVC (MsExecAuto)
//            |                 | Apostila P�gina 301
// -----------+-----------------+-----------------------------------------------------------
//            |                 | Fonte n�o faz nada e n�o da erro; o oModel fica nulo
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN301()
	
	Local nL
	Local oAux
	Local oModel
	Local aErro     := {}
	Local aCampos   := {}
	Local lRet      := .T.
	Local cAliasSA1 := "SA1" 
	Local cFonte    := "PGN301"
	
	AADD(aCampos,{"A1_COD"   ,"000104"        })
	AADD(aCampos,{"A1_LOJA"  ,"01"            })
	AADD(aCampos,{"A1_NOME"  ,"DON JUNIOR"    })
	AADD(aCampos,{"A1_NREDUZ","D.JR"          })
	AADD(aCampos,{"A1_TIPO"  ,"F"             })
	AADD(aCampos,{"A1_EST"   ,"RJ"            })
	AADD(aCampos,{"A1_MUN"   ,"RIO DE JANEIRO"})
	AADD(aCampos,{"A1_END"   ,"RUA LUCIO 95"  })
	
	// Carrega o modelo
	oModel := FWLoadModel(cFonte)
	
	// Defini��o da opera��o (inclus�o)
	oModel:SetOpertion(MODEL_OPERATION_INSERT)
	
	// Ativa��o do modelo
	oModel:Activate()
	
	// Id do componente AddFields
	oAux := oModel:GetModel("SA1_FIELD"):GetStruct()
	
	// Removendo valida��es modo edi��o dos campos
	oAux:SetProperty("*",MODEL_FIELD_WHEN,FWBuildFeature(STRUCT_FEATURE_WHEN,NIL))
	
	For nL := 1 To Len(aCampos)
		If oAux:HasField(aCampos[nL][1])
			// Atribui��o ao campo do modelo
			If!(oAux := oModel:SetValue("SA1_FIELD",aCampos[nL][1],aCampos[nL][2]))
				// Metodo SetValue retorna .F. caso n�o posso atribuir o dado
				lRet := .F.
				Exit
			EndIf
		EndIf
	Next nL
	
	If lRet
		// Valida��o dos dados
		If lRet := oModel:VldData()
			// Commit dos dados v�lidos
			oModel:CommitData()
		EndIf
	EndIf

	If !lRet
		
		// Grava��o de erros
		aErro := oModel:GetErrorMessage()
		
		AutoGrLog("Id do formul�rio de origem: [" + AllToChar(aErro[1]) + "]")
		AutoGrLog("Id do campo de origem: [" + AllToChar(aErro[2]) + "]")
		AutoGrLog("Id do formul�rio de erro: [" + AllToChar(aErro[3]) + "]")
		AutoGrLog("Id do campo de erro: [" + AllToChar(aErro[4]) + "]")
		AutoGrLog("Id do erro: [" + AllToChar(aErro[5]) + "]")
		AutoGrLog("Mensagem do erro: [" + AllToChar(aErro[6]) + "]")
		AutoGrLog("Mensagem da solu��o: [" + AllToChar(aErro[7]) + "]")
		AutoGrLog("Valor atribu�do: [" + AllToChar(aErro[8]) + "]")
		AutoGrLog("valor anterior: [" + AllToChar(aErro[9]) + "]")
		MostraErro()
	
	Else
		MsgInfo("Registro Gravado com sucesso!")
	EndIf

	// Desativar o modelo
	oModel:DeActivate()


Return
