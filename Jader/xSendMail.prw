#Include "Rwmake.ch"
#INCLUDE "TBIConn.CH"
#Include "AP5Mail.ch"
#Include "MSOLE.ch"
#Include "FILEIO.ch"

/*
// PARÂMETROS DE CONFIGURAÇÃO DO GMAIL
MV_RELTIME = 120
MV_RELAUTH = .T.
MV_RELAUSR = xxxxx.yyyyy@gmail.com.br
MV_RELAPSW = abc@123
MV_RELACNT = xxxxx.yyyyy@gmail.com.br
MV_RELPSW  = abc@123
MV_RELSERV = smtp.gmail.com:465
*/

User Function xSendMail(cAccount,cPassword,cServer,cFrom,cEmail,cAssunto,cMensagem,cAttach,cEmailCCC,lMsg1)

	Local cEmailTo := ""
	Local cEmailBcc:= ""
	Local lOk  := .F.
	Local cError   := ""

	Private nTimeOut    := 120                        //Tempo de Espera antes de abortar a Conexão
	Private lAutentica  := .T.                        //Determina se o Servidor de Email necessita de Autenticação
	Private cUserAut    := "seu_email_aqui@gmail.com" //Usuário para Autenticação no Servidor de Email
	Private cPassAut    := "sua_senha_aqui"           //Senha para Autenticação no Servidor de Email
	Private floga		:= 0

	// Verifica se serao utilizados os valores padrao.
	cAccount		    := cUserAut
	cPassword	        := cPassAut
	cServer		        := "smtp.gmail.com:465"
	cAttach 		    := ""
	lMsg      	        := .T.
	cFrom			    := cUserAut

	cEmailTo := Alltrim(cEmail)
	cEmailcc := Alltrim(cEmailccc)
	cEmailBcc:= cUserAut

	CONNECT SMTP SERVER cServer ACCOUNT cAccount PASSWORD cPassword TIMEOUT nTimeOut Result lOk
	
	If lOk
		If lAutentica
			If !MailAuth(cUserAut,cPassAut)
				If lMsg ; MSGINFO("Falha na Autenticação do Usuário","Atenção") ; Endif
				
				DISCONNECT SMTP SERVER RESULT lOk
				
				IF !lOk
					GET MAIL ERROR cErrorMsg
					If lMsg ; MSGINFO("Erro na Desconexão: "+cErrorMsg,"Atenção") ; Endif
				ENDIF
				
				Return(.F.)
			EndIf
		EndIf
		
		If !Empty(cEmailcc)
			SEND MAIL FROM cFrom TO cEmailTo ;
			CC          cEmailcc ;
			BCC     	cEmailBcc ;
			SUBJECT 	ACTxt2Htm( cAssunto, cEmail ) ;
			BODY    	ACTxt2Htm( cMensagem, cEmail ) ;
			ATTACHMENT  cAttach  ;
			Result lOk
		Else
			SEND MAIL FROM cFrom TO cEmailTo ;
			BCC     	cEmailBcc ;
			SUBJECT 	ACTxt2Htm( cAssunto, cEmail ) ;
			BODY    	ACTxt2Htm( cMensagem, cEmail ) ;
			ATTACHMENT  cAttach  ;
			Result lOk
		EndIf

		If !lOk
			GET MAIL ERROR cErrorMsg
			If lMsg ; Help("",1,"AVG0001056",,"Error: "+cErrorMsg,2,0) ; Endif
		Else
		//	If lMsg ; MsgBox("Email enviado com Sucesso !!","Informação","INFO") ; Endif
		EndIf
	Else
		GET MAIL ERROR cErrorMsg
		If lMsg ; Help("",1,"AVG0001057",,"Error: "+cErrorMsg,2,0) ; Endif
	EndIf
	
	DISCONNECT SMTP SERVER RESULT lOk
	
	IF !lOk
		GET MAIL ERROR cErrorMsg
		If lMsg ; MSGINFO("Erro na Desconexão: "+cErrorMsg,"Atenção") ; Endif
	ENDIF
	
Return(lOk)
