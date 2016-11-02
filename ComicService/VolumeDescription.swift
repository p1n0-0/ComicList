//
//  VolumeDescription.swift
//  ComicList
//
//  Created by Francisco Solano Gómez Pino on 09/10/2016.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import Foundation

public struct VolumeDescription {
	
	public let description: String?
	
}

extension VolumeDescription: JSONDecodable {
	
	public init?(dictionary: JSONDictionary) {
		
		guard let description:String = dictionary["description"] as? String else {
			self.description = nil
			return
		}
		
		self.description = description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
	}
	
}
