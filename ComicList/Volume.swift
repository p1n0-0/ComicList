//
//  Volume.swift
//  ComicList
//
//  Created by Guillermo Gonzalez on 02/10/2016.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import Foundation

/// A comic volume
struct Volume {

    /// Unique identifier
    let identifier: Int

    /// Volume title
    let title: String

    /// Cover image URL
    let coverURL: URL?

    /// Publisher name
    let publisherName: String?
}
