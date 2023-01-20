//
// Created by unicred on 19/01/23.
//

import Foundation

func formattedNumber(number: String, mask: String) -> String {
    let cleanNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    var result = ""
    var index = cleanNumber.startIndex
    for ch in mask where index < cleanNumber.endIndex {
        if ch == "#" {
            result.append(cleanNumber[index])
            index = cleanNumber.index(after: index)
        } else {
            result.append(ch)
        }
    }
    return result
}
