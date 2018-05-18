//
//  Usuario.swift
//  ProjetoApp
//
//  Created by Aluno on 16/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import Foundation

class Usuario{
    
    var nome = ""
    var senha = ""
    var saldo = 0.0
    
    var listOperacoes: [String] = []
    var listValores: [Double] = []
    
    func size() -> Int{
        return listOperacoes.count
    }
    
    func insert(op: String, value: Double) -> Bool{
        
        if op == "Saque"{
            if value <= getSaldo(){
                listValores.append(value * -1)
                saldo += value * -1
            }else{
                return false
            }
        }else{
            listValores.append(value)
            saldo += value
        }
        
        listOperacoes.append(op)
        return true
    }
    
    func remove(at index: Int) -> String{
        return listOperacoes.remove(at: index)
    }
    
    func getOperacao(at index: Int) -> String{
        return listOperacoes[index]
    }
    
    func getValor(at index: Int) -> Double{
        return listValores[index]
    }
    
    func setNome(_ nome: String){
        self.nome = nome
    }
    
    func getNome() -> String{
        return nome
    }
    
    func setSenha(_ senha: String){
        self.senha = senha
    }
    
    func getSenha() -> String{
        return senha
    }
    
    func setSaldo(_ saldo: Double){
        self.saldo = saldo
        listOperacoes.append("Saldo Inicial")
        listValores.append(saldo)
    }
    
    func getSaldo() -> Double{
        return saldo
    }
    
}
