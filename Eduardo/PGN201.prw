// #########################################################################################
// #                       Formação Totvs - Programação ADVPL 2018/1                       # 
// #########################################################################################
// -----------+-----------------+-----------------------------------------------------------
// Data:      | Autor:          | Descrição:
// -----------+-----------------+-----------------------------------------------------------
// 11/03/2018 | Don Junior      | Exemplo Bloco de Código - EVAL().
//            |                 | Apostila Página 201.
// -----------+-----------------+-----------------------------------------------------------

#include 'protheus.ch'
#include 'parmtype.ch'

User Function PGN201()

	Local bCodBloc
	Local xValor
	Local nInt

	// Exemplo 1
	nInt := 2
	bCodBloc := {| nNumero | nNumero * 2}
	xValor := Eval(bCodBloc,nInt)
	MsgAlert("Exemplo 1 - xValor:" + cValToChar(xValor) )

	// Exemplo 2
	bCodBloc := {| x,y | If(x > y, "Maior","Menor")}
	xValor := Eval(bCodBloc,2,4)
	MsgAlert("Exemplo 2 - xValor: " + xValor )
	
	// Exemplo 3
	nInt := 10
	bCodBloc := {| N | x := 10, y := x * N, z := y / (x * N)}
	//          {|10 | x := 10, y := 10*10, z := 100/(10*10)}   
	xValor := Eval(bCodBloc,nInt) // xValor = 1
	MsgAlert("Exemplo 3 - xValor: " + cValToChar(xValor) )
	
	
Return