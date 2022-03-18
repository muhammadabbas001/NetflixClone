//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Muhammad Abbas on 15/03/2022.
//

import Foundation

extension String{
    func captitalizeFirstLetter() -> String{
        return self.prefix(1).capitalized + self.lowercased().dropFirst()
    }
}
