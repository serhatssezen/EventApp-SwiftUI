//
//  ColorUtil.swift
//  Event
//
//  Created by Aydın Serhat Sezen on 19.01.2022.
//

import SwiftUI

let primary = Color(#colorLiteral(red: 0.1410247684, green: 0.144975543, blue: 0.1532749236, alpha: 1))
let secondary = Color(#colorLiteral(red: 0.2313431799, green: 0.2313894629, blue: 0.2313401997, alpha: 1))
let ternary = Color(#colorLiteral(red: 0.09396985918, green: 0.09791258723, blue: 0.1062180027, alpha: 1))
let lightGray = Color(#colorLiteral(red: 0.681789577, green: 0.6977746487, blue: 0.7185279727, alpha: 1))


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
