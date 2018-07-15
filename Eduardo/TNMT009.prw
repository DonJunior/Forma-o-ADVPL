// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 26/03/2018 | Don Junior  	| Exemplo AxCadastro com validações
//            |                 | 
// -----------+-----------------+-----------------------------------------------------------

#include 'totvs.ch'
#include 'parmtype.ch'

User Function TNMT009()   

	Local aRotAdic := {} 
	Local bPre     := {||MsgAlert('Chamada antes da função','Atenção!')}
	Local bOK      := {||MsgAlert('Chamada ao clicar em OK','Atenção!'), .T.}
	Local bTTS     := {||MsgAlert('Chamada durante transacao','Atenção!')}
	Local bNoTTS   := {||MsgAlert('Chamada após transacao','Atenção!')}    
	Local aButtons := {}//adiciona botões na tela de inclusão, alteração, visualização e exclusao

	AADD(aButtons,{ "PRODUTO", {|| MsgAlert("Teste",'Atenção!')},"Teste", "Botão Teste"}) //adiciona chamada no aRotina
	AADD(aRotAdic,{ "Adicional","U_Adic009", 0 , 6 })

	AxCadastro("SA1", "Clientes", "U_Del009Ok()", "U_C009OK()", aRotAdic, bPre, bOK, bTTS, bNoTTS, , , aButtons, , )  

Return                        

User Function Del009Ok()  

	MsgAlert("Chamada antes do delete",'Atenção!') 

Return 

User Function C009OK()    

	MsgAlert("Clicou botao OK",'Atenção!') 

Return      

User Function Adic009()   

	MsgAlert("Rotina adicional",'Atenção!') 

Return