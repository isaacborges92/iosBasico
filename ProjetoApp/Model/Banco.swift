//
//  Banco.swift
//  ProjetoApp
//
//  Created by Aluno on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import Foundation

class Banco{
    
    var listUsuarios: [Usuario] = []
    var usuarioLogado = ""
    
    private static var singleton: Banco?
    
    static var instance: Banco{
        get{
            if singleton == nil{
                singleton = Banco()
            }
            return singleton!
        }
    }
    
    func insertUsuario(u: Usuario){
        listUsuarios.append(u)
    }
    
    func getUsuario(_ nome: String) -> Usuario{
        var u = Usuario()
        
        for lu in listUsuarios{
            if(lu.getNome() == nome){
                u = lu
                usuarioLogado = nome
                break
            }
        }
        return u
    }
    
    func setNomeUsuario(_ nome: String){
        usuarioLogado = nome
    }
    
    func getNomeUsuario() -> String{
        return usuarioLogado
    }
    
}
