// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 26/03/2018 | Don Junior  	| Exemplo AxCadastro com valida��es
//            |                 | 
// -----------+-----------------+-----------------------------------------------------------

#include 'totvs.ch'
#include 'parmtype.ch'

User Function TNMT009()   

	Local aRotAdic := {} 
	Local bPre     := {||MsgAlert('Chamada antes da fun��o','Aten��o!')}
	Local bOK      := {||MsgAlert('Chamada ao clicar em OK','Aten��o!'), .T.}
	Local bTTS     := {||MsgAlert('Chamada durante transacao','Aten��o!')}
	Local bNoTTS   := {||MsgAlert('Chamada ap�s transacao','Aten��o!')}    
	Local aButtons := {}//adiciona bot�es na tela de inclus�o, altera��o, visualiza��o e exclusao

	AADD(aButtons,{ "PRODUTO", {|| MsgAlert("Teste",'Aten��o!')},"Teste", "Bot�o Teste"}) //adiciona chamada no aRotina
	AADD(aRotAdic,{ "Adicional","U_Adic009", 0 , 6 })

	AxCadastro("SA1", "Clientes", "U_Del009Ok()", "U_C009OK()", aRotAdic, bPre, bOK, bTTS, bNoTTS, , , aButtons, , )  

Return                        

User Function Del009Ok()  

	MsgAlert("Chamada antes do delete",'Aten��o!') 

Return 

User Function C009OK()    

	MsgAlert("Clicou botao OK",'Aten��o!') 

Return      

User Function Adic009()   

	MsgAlert("Rotina adicional",'Aten��o!') 

Return