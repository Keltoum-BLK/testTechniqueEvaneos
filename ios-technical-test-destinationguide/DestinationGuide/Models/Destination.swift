//
//  Destination.swift
//  DestinationGuide
//
//  Created by Alexandre Guibert1 on 02/08/2021.
//

import Foundation

struct Destination : Hashable, Identifiable {
    let id: String
    let name: String
    var picture: URL
    let tag: String?
    let rating: Int
}
