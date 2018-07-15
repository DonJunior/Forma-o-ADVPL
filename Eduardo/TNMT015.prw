// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 12/04/2018 | Don Junior  	| Exemplo de FCreate - Geração de arquivos
//            |                 |
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'

#define CRLF Char(13) + Char(10)

User Function TNMT015()

	Local nHandle

	nHandle := FCreate( GetTempPath() + 'TESTE.TXT')

	If nHandle = -1
		MsgStop('Erro ao criar o arquivo')
		Return
	Else
		FWrite(nHandle,'001;CREAM CRACKER;PA;CX;01;23.67' + CRLF)
		FWrite(nHandle,'002;RECHEADO ABACAXI;PA;CX;01;45.50' + CRLF)
		FWrite(nHandle,'003;ROLADINHO;PA;CX;01;78.23' + CRLF)
	
		FClose(nHandle)
		
		If MsgYesNo("Deseja abrir o arquivo gerado ?")
			ShellExecute("Open", "C:\Windows\System32\notepad.exe", GetTempPath() + 'TESTE.TXT' , "C:\", 1 )
		EndIf
		
	EndIf

Return