#include 'protheus.ch'
#include 'parmtype.ch'

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 14/08/2017 | Don Carvalho	| Exemplo MsExecAuto para inclusão de pedido de venda.
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
USER FUNCTION fPEDEXEC()

	LOCAL nY       := 0
	Local aItem    := {}
	Local aItens   := {}
	Local aCab     := {}
	Local _aErro   := {}
	Local _cErro   := ""
	Local lRetorno := .F.
	Local cNumPV   := GETSXENUM("SC5","C5_NUM")
	Dbselectarea("SA1")
	SA1->(DbGoBottom())
                    
	aAdd(aCab,{"C5_NUM"   ,cNumPV         ,Nil})
	aadd(aCab,{"C5_TIPO"   ,"N"           ,Nil})
	aadd(aCab,{"C5_CLIENTE",SA1->A1_COD   ,Nil})
	aadd(aCab,{"C5_LOJACLI",SA1->A1_LOJA  ,Nil})
	aadd(aCab,{"C5_LOJAENT",SA1->A1_LOJA  ,Nil})
	aadd(aCab,{"C5_CONDPAG","001"         ,Nil})
	aadd(aCab,{"C5_TIPOCLI",SA1->A1_TIPO  ,Nil})

	DbSelectArea("SB1")
	SB1->(DbGoTop())
	
	//ITEM 1 do Pedido
	//aAdd(aItem,{"C6_NUM"    ,cNumPV     ,Nil})
	aAdd(aItem,{"C6_ITEM"   ,"01"       ,Nil})
	aAdd(aItem,{"C6_PRODUTO",SB1->B1_COD,Nil})
	aAdd(aItem,{"C6_QTDVEN" ,9          ,Nil})
	aAdd(aItem,{"C6_PRCVEN" ,12         ,Nil})
	aAdd(aItem,{"C6_TES"    ,"501"      ,Nil})
	aAdd(aItem,{"C6_TES"    ,"501"      ,Nil})

	aAdd(aItens, aItem)

	DbSelectArea("SB1")
	SB1->(DbGoBottom())

	aItem := {}
	//ITEM 2 do Pedido
	//aAdd(aItem,{"C6_NUM"    ,cNumPV     ,Nil})
	aAdd(aItem,{"C6_ITEM"   ,"02"       ,Nil})
	aAdd(aItem,{"C6_PRODUTO",SB1->B1_COD,Nil})
	aAdd(aItem,{"C6_QTDVEN" ,10         ,Nil})
	aAdd(aItem,{"C6_PRCVEN" ,50         ,Nil})
	aAdd(aItem,{"C6_TES"    ,"501"      ,Nil})

	aAdd(aItens, aItem)
               
	lMsErroAuto    := .F.
	lMsHelpAuto    := .T.
	lAutoErrNoFile := .T.

Begin Transaction
                      
	MsExecAuto({|x,y,z| MATA410(x,y,z)}, aCab, aItens, 3)
     
	If lMsErroAuto
		_aErro := GetAutoGRLog()
		Conout( cValToChar(Len(_aErro)) )
		_cErro := ""
     
		For nY := 1 To Len(_aErro)
			_cErro += _aErro[nY] + CHR(13) + CHR(10)
		Next nY
     
		Alert("Erro na inclusao do Pedido de Venda: " + _cErro)
     
		DisarmTransaction()
     
		lRetorno := .F.
		Return(lRetorno)
	Else
		Alert("Item do pedido incluído com sucesso!")
		ConfirmSx8()
	EndIf

End Transaction

Return(.T.)

