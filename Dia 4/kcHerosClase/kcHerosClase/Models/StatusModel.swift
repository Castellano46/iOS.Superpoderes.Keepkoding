//
//  StatusModel.swift
//  kcHerosClase
//
//  Created by Pedro on 7/11/23.
//

import Foundation

enum Status {
    case none, loading, loaded,  register, error(error: String)
}
