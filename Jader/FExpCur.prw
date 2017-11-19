#include 'protheus.ch'
#include 'parmtype.ch'
#INCLUDE "RWMAKE.CH"

// -----------+-----------------+-----------------------------------------------------------
// Data       | Autor: 	        | Descricao
// -----------+-----------------+-----------------------------------------------------------
// 09/08/2017 | Don Carvalho	| Exemplo da função MsgRun() + MsExecAuto()
//		      |                 | 
// -----------+-----------------+-----------------------------------------------------------
user function fExpCur()
	Local   aAutoCab:={}
	Private lMsErroAuto:=.F.

     AADD(aAutoCab,{"RA_FILIAL"     , xFilial("SRA")            , Nil})
     AADD(aAutoCab,{"RA_MAT"        , GETSXENUM("SRA","RA_MAT") , Nil}) //"00001", Nil})
     AADD(aAutoCab,{"RA_NOME"     	, "ZZ0->ZZ0_NOME"  			, Nil})
     AADD(aAutoCab,{"RA_SEXO"    	, "M"                       , Nil})
     AADD(aAutoCab,{"RA_NASC"     	, StoD("19800524")          , Nil}) 
     AADD(aAutoCab,{"RA_ESTCIVI"    , "C"                       , Nil})
     AADD(aAutoCab,{"RA_ADMISSA"    , Date()		            , Nil})
     AADD(aAutoCab,{"RA_EMAIL"     	, "ZZ0->ZZ0_EMAIL"          , Nil})
     AADD(aAutoCab,{"RA_ENDEREC"    , "ZZ0->ZZ0_LOGRAD"         , Nil})
     AADD(aAutoCab,{"RA_BAIRRO"     , "ZZ0->ZZ0_BAIRRO"         , Nil})                               
     AADD(aAutoCab,{"RA_ESTADO"     , "RJ"                      , Nil})  
     AADD(aAutoCab,{"RA_MUNICIP"    , "Rio de Janeiro"          , Nil})    
     AADD(aAutoCab,{"RA_CEP"     	, "21863430"                , Nil})        
     AADD(aAutoCab,{"RA_TELEFON"    , "44445555"                , Nil})        
     AADD(aAutoCab,{"RA_NUMCELU"    , "999988888"               , Nil})
     AADD(aAutoCab,{"RA_NACIONA"    , "10"                   	, Nil}) 
     AADD(aAutoCab,{"RA_NATURAL"    , "RJ"                   	, Nil}) 
     AADD(aAutoCab,{"RA_HRSDIA"     , 10                   		, Nil})
     AADD(aAutoCab,{"RA_TIPOPGT"    , "M"                   	, Nil})
     AADD(aAutoCab,{"RA_CATFUNC"    , "A"                   	, Nil})
     AADD(aAutoCab,{"RA_VIEMRAI"    , "15"                   	, Nil})
     AADD(aAutoCab,{"RA_COMPSAB"    , "1"                   	, Nil})
     AADD(aAutoCab,{"RA_NUMCP"    	, "14521"                   , Nil})
     AADD(aAutoCab,{"RA_SERCP"      , "1"                   	, Nil})
                    
		
	MsgRun("MsgRun","Exportando funcionário...",{|| MSExecAuto({|x,y,z,w| Gpea010(x,y,z,w)},,,aAutoCab,3) })
	
	If lMsErroAuto
	     MostraErro()
	Else
	     MsgInfo("Currículo exportado para Cadastro de Funcionários com sucesso!","SUCESSO")
	EndIf
return