// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 15/04/2018 | Don Junior  	| Exemplo de ExecAuto - Rotina Automática
//            |                 | Apostila Página 312
// -----------+-----------------+-----------------------------------------------------------
//            |                 | Apresentando erro de gatilho no campo B1_DESC, a solição
//            |                 | de contorno foi comentar a DisarmTransaction. Mesmo com a
//            |                 | mensagem de erro, o produto é criado!
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'tbiconn.ch'

User Function PGN312()
	
	Local   nOpc        := 3
	Local   aRotAuto    := {}
	Private lMsHelpAuto := .T.
	Private lMsErroAuto := .F.
	
	Prepare Environment Empresa "99" Filial "01" Modulo "FAT"
	
	Begin Transaction

		aRotAuto := {{"B1_COD","1011",NIL},;
		             {"B1_DESC","EXECAUTO",NIL},;
		             {"B1_TIPO","PA",NIL},;
		             {"B1_UM","UN",NIL},;
		             {"B1_LOCPAD","01",NIL},;
		             {"B1_PICM",0,NIL},;
		             {"B1_IPI",0,NIL},;
		             {"B1_PRV1",100,NIL},;
		             {"B1_LOCALIZ","N",NIL},;
		             {"B1_CODBAR","789888800001",NIL}}
		             
        MsExecAuto({|x,y|MATA010(x,y)},aRotAuto,nOpc)
        If lMsErroAuto
        	// DisarmTransaction()
        	MostraErro()
        Else
        	MsgInfo("Produto incluído com sucesso!")
        EndIf
	
	End Transaction
Return
