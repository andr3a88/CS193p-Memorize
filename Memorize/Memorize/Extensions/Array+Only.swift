//
//  Array+Only.swift
//  Memorize
//
//  Created by Andrea Stevanato on 08/06/2020.
//  Copyright © 2020 Andrea Stevanato. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
