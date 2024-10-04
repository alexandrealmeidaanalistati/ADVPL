#include "protheus.ch"
#include "totvs.ch"


/*
+====================================================================+
| Fonte: OO | Desenvolvido por: Alexandre Almeida | Data: 01/10/2024 |
+====================================================================+
| Fun��o para testar Orienta��o a Objetos no ADVPL, com as seguintes |
| estruturas:  CLASS                                               |
|              CLASSDATA                                           |
|              CONSTRUCTOR                                         |
|              DATA                                                |
|              ENDCLASS                                            |
|              EXPORT                                              |
|              FROM                                                |
|              HIDDEN                                              |
|              METHOD                                              |
|              PROTECTED                                           |
|              SELF                                                |
|              PARENT ou _Super                                    |
+====================================================================+
| Utilizando os conceitos de orienta��o a objetos em ADVPL, com as   |
| funcionalidades:  Objetos                                        |
|                   Heran�a                                        |
|                   Atributos                                      |
|                   M�todos                                        |
|                   Classes                                        |
|                   Abstra��o                                      |
|                   Generaliza��o                                  |
|                   Encapsulamento                                 |
|                   Polimorfismo (demonstrado no fonte oo.tlpp)    |
+====================================================================+
*/

//Classe: Pessoa

    CLASS Pessoa                                                        // Classes e  Abstra��o e  Generaliza��o
        
        CLASSDATA cEscola AS character INIT 'Tutores'                   // Atributos           
        PROTECTED DATA nHorasTrabalho AS numeric INIT 48                // Atributos 
        EXPORT DATA cNome          // ou DATA cNome                     // Atributos  
        EXPORT DATA nIdade         // ou DATA nIdade                    // Atributos 
        EXPORT DATA dNascimento    // ou DATA dNascimento               // Atributos  
        // deu errado   HIDDEN DATA nTamanhoEscola 

        PUBLIC METHOD Create() CONSTRUCTOR                              // M�todos 
        PUBLIC METHOD SetName()                                         // M�todos 
        PUBLIC METHOD SetNascimento()                                   // M�todos 
        PUBLIC METHOD SetIdade()                                        // M�todos 
        PUBLIC METHOD GetName()                                         // M�todos 
        PUBLIC METHOD GetIdade()                                        // M�todos 
        PUBLIC METHOD GetEscola()                                       // M�todos 
        PUBLIC METHOD GetHoras()                                        // M�todos 
        PRIVATE METHOD CalcIdade()                                      // M�todos  Encapsulamento

    ENDCLASS

    METHOD Create(cNome, dNascimento) CLASS Pessoa
        SELF:SetName(cNome)
        SELF:SetNascimento(dNascimento)

        SELF:CalcIdade(dNascimento)

    RETURN SELF

    METHOD CalcIdade(dNascimento) CLASS Pessoa
        
        SELF:SetIdade(date() - dNascimento)

    RETURN

    METHOD SetName(cNome) CLASS Pessoa
        ::cNome := cNome
    RETURN

    METHOD SetNascimento(nNascimento) CLASS Pessoa
        ::nNascimento := nNascimento
    RETURN
    
    METHOD SetIdade(nIdade) CLASS Pessoa
        ::nIdade := nIdade
    RETURN

    METHOD GetIdade() CLASS Pessoa
    RETURN ::nIdade

    METHOD GetName() CLASS Pessoa
    RETURN ::cNome

    METHOD GetEscola() CLASS Pessoa    
    RETURN ::cEscola

    METHOD getHoras() CLASS Pessoa
    RETURN ::nHorasTrabalho
//Classe: Pessoa fim

//Classe: Aluno
    CLASS Aluno FROM Pessoa                                             // Heran�a e  Classes

        EXPORT DATA nId                                                 // Atributos  
        EXPORT DATA aCursos                                             // Atributos  

        PUBLIC METHOD Create() CONSTRUCTOR                              // M�todos
        PUBLIC METHOD setnId()                                          // M�todos
        PUBLIC METHOD Inscrever()                                       // M�todos
        PUBLIC METHOD Avaliar()                                         // M�todos
        PUBLIC METHOD getNota()                                         // M�todos
        PUBLIC METHOD getStatus()                                       // M�todos
    ENDCLASS

    METHOD Create(cNome,dNascimento,nId) CLASS Aluno                    
        _Super:Create(cNome, dNascimento)
        //PARENT:Create(cNome,dNascimento) // deu errado 
        ::setnId(nId)
    RETURN SELF
    
    METHOD setnId(nId) CLASS Aluno                                     
        ::nId:=nId
    RETURN
//Classe: Aluno fim

*------------------*
 User Function oo()
*------------------*
    u_CadPessoa()
 return

*-------------------------*
 User Function CadPessoa()
*-------------------------*
    Local cNome      :="Alexandre"
    Local dNascimento:=CTOD("11/29/1983")
    Local uAux       :=NIL

    oAluno:=Aluno():Create(cNome,dNascimento,1)                         // Objetos  
    uAux:=oAluno:GetName()

 Return
