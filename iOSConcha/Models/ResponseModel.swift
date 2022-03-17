//
//  ResponseModel.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/15/22.
//

import Foundation

struct Response: Codable, CustomStringConvertible {
	/*
	 Not necessary to use coding keys since we expect these value types as they are.
	 Decoder() has a property which handles snake case from backend.
	 */
	
	var ticks: [Double]
	var sessionId: Int
	var stepCount: Int
	
	var description: String { return
	"""
	Response Object:
	Ticks: \(ticks),
	sessionID: \(sessionId),
	stepCount: \(stepCount)
	"""
	}
}
