//
//  CalculatorBrain.swift
//  Calcluator-Stanford
//
//  Created by Ben Smith on 16/06/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import Foundation
class CalculatorBrain {
    private var accumulator = 0.0
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
        "-" : Operation.BinaryOperation({ $0 - $1}),
        "+" : Operation.BinaryOperation({ $0 + $1}),
        "pi" : Operation.Constant( M_PI ),
        "Cos" : Operation.UnaryOperation(cos),
        "=" : Operation.Equals

    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function): pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
                    pending = nil
                }
            }
            
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}