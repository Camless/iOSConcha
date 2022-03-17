//
//  NetworkService.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/15/22.
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
	@Published var completion: Bool = false // Dictated by the given json
	@Published var selectedValue: Float = 0.0 // Dictated by the slider
	@Published var currentTick: Int = -1 // Dictated by the slider
	@Published var responses = [Response]() // Dictated by the given json
	@Published var userEntries = [UserEntry]()
	var userTicks = [Int]()
	
	init() {
		if let url = URL(string: "https://iostestserver-su6iqkb5pq-uc.a.run.app/test_start") {
			let jsonDictionary: [String: String] = [
				"choice": "start"
			]
			var jsonData: Data
			
			do {
				jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
			} catch {
				fatalError(String(describing: error))
			}
			
			var request = URLRequest(url: url)
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			request.httpMethod = "POST"
			
			URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
				guard error == nil else {
					fatalError(String(describing: error))
				}
				
				guard let _ = response else {
					fatalError(String(describing: error))
				}
				
				guard let data = data else {
					return
				}
				
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				
				let userResponse = try! decoder.decode(Response.self, from: data)
				DispatchQueue.main.async {
					self.responses.append(userResponse)
					print("Initial: \(userResponse)")
				}
			}.resume()
		} else {
			fatalError("Invalid initial URL")
		}
	}
	
	public func decrementTick() {
		if currentTick >= 0 {
			currentTick -= 1
		}
	}
	
	public func incrementTick() {
		if currentTick < 14 {
			currentTick += 1
		}
	}
	
	public func fetchCurrentTickValue() -> Double {
		guard let currentResponse = responses.last else {
			return 0
		}
		
		if currentTick == -1 { // We're just gonna return the first available value, since design specifies this
			return currentResponse.ticks[0]
		} else {
			// We're guaranteed in the setup process to have at least one JSON response (otherwise fatalError in decoding)
			return currentResponse.ticks[currentTick]
		}
	}
	
	public func submitNextButton() async -> Bool {
		
		// Await for another JSON payload
		await sendUserResponse(tickChoice: currentTick, sessionId: responses.last!.sessionId)
		if completion {
			print(userTicks)
			print(responses)
			for sliderNumber in 0..<responses.count {
				userEntries.append(UserEntry(sliderNumber: sliderNumber + 1, tickIndex: userTicks[sliderNumber], tickValue: responses[sliderNumber].ticks[userTicks[sliderNumber]]))
			}
			return true
		}
		return false
	}

	public func sendUserResponse(tickChoice: Int?, sessionId: Int?) async {
		var url: URL?
		var jsonData: Data
		
			
		if let tickChoice = tickChoice, let sessionId = sessionId {
			if let validURL = URL(string: "https://iostestserver-su6iqkb5pq-uc.a.run.app/test_next") {
				url = validURL
			} else {
				fatalError("Invalid follow-up URL; check the server status")
			}
			
			let jsonDictionary: [String: Int] = [
				"session_id": sessionId,
				"choice": tickChoice
			]
			
			jsonData = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
				
		} else {
			fatalError(
			"""
			Expected values for:
			tickChoice: \(String(describing: tickChoice)),
			sessionId: \(String(describing: sessionId))
			"""
			)
		}
		
		var request = URLRequest(url: url!)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		
		do {
			let (dataResponse, _) = try await URLSession.shared.upload(for: request, from: jsonData)
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase
			
			if let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse) as? [String: Any] {
				// We have arrived at our final JSON response and are looking to loop the app after this
				if let _ = jsonResponse["complete"] {
					completion = true
				} else {
					let response = try decoder.decode(Response.self, from: dataResponse) as Response // Here we expect the usual response
					print("Incoming response: \(response)")
					print("Current responses: \(responses)\n")
					responses.append(response)
				}
				userTicks.append(tickChoice!)
			}
		} catch {
			fatalError(String(describing: error))
		}
	}
}
