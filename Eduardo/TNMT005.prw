// #########################################################################################
// #                       Forma��o Totvs - Programa��o ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 21/03/2018 | Don Junior  	| Exemplo aClone() - Fun��o para c�pia de Array.
//            |                 | Alterando o aTexto2 (linha 22), altera o aTexto1 pois a  
//            |                 | c�pia realizada na linha 21 � por refer�ncia.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function TNMT005()
	
	Local aTexto1 := {"ABC","XYZ","123"}
	Local aTexto2 := {}
	Local aTexto3 := {}
	
	aTexto2 := aTexto1 // C�pia por refer�ncia 
	aTexto2[3] := "789" 
	aTexto3 := aClone(aTexto2) // Clone do Array
	
	
Return