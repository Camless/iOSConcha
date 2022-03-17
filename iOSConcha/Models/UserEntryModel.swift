//
//  FinalResponse.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/16/22.
//

import Foundation

struct UserEntry: Identifiable {
	let id = UUID()
	let sliderNumber: Int
	let tickIndex: Int
	let tickValue: Double
}
