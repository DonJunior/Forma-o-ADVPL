// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 01/04/2018 | Don Junior  	| Exemplo MarkBrow
//            |                 | Apostila Página 224
//            |                 | *** ERRO - FONTE NÃO FAZ NADA! ***
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN224()

	Local nTit        := 0 
	Local aCpos       := {}
	Local aCampos     := {}
	Local cAliasSA2   := 'SA2'
	Private aRotina   := {}
	Private aRecDel   := {}
	Private cCadastro := 'Cadastro de Fornecedores'

	AADD(aRotina,{"Pesquisar"    , "AxPesqui"  ,0 ,1})
	AADD(aRotina,{"Visualizar"   , "AxVisual"  ,0 ,2})
	AADD(aRotina,{"Excluir Lote" , "U_DELLOTE" ,0 ,6})

	AADD(aCpos,{"A2_OK"    })
	AADD(aCpos,{"A2_FILIAL"})
	AADD(aCpos,{"A2_COD"   })
	AADD(aCpos,{"A2_LOJA"  })
	AADD(aCpos,{"A2_NOME"  })
	AADD(aCpos,{"A2_TIPO"  })

	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	
	For nTit :=1 To Len(aCpos)
		If DbSeek(aCpos[nTit])
			AADD(aCampos,{X3_CAMPO,"",IIf(nTit == 1,"",Trim(X3_TITULO)),Trim(X3_PICTURE)})
		EndIf
	Next nTit


	DbSelectArea(cAliasSA2)
	DbsetOrder(1)
	MarkBrow(cAliasSA2,aCpos[1],"A2_TIPO == ''",aCampos,.F.,GetMark(,"SA2","A2_OK"))
	
Return

//-------------------------------
// Função de exclusão em lote
//-------------------------------
User Function DELLOTE()

	Local nDel     := 0
	Local cMarca   := ThisMark()
	Local lInverte := ThisInv()
	
	DbSelecrArea("SA2")
	SA2->(DbGoTop())
	
	While !SA2->(EOF())
		If SA2->A2_OK == cMarca .And. !lInverte
			AADD(aRecDel,SA2->(Recno()))
		ElseIf SA2->A2_OK != cMarca .And. lInverte 
			AADD(aRecDel,SA2->(Recno()))
		EndIf
		SA2->(DbSkip())
	EndDo
	
	If Len(aRecDel) > 0 .And. MsgYesNo("Deseja Excluir os: " + cValToChar(Len(aRecDel)) + " Fornecedores Selecionados ?")
	
		For nDel := 1 To Len(aRecDel)
			SA2->(DbGoTo(aRecDel[nDel]))
			RecLock("SA2",.F.)
			SA2->(DbDelete())
			SA2->(MsUnlock())
		Next nDel
	EndIf
	
	
Return