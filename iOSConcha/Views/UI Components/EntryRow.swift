//
//  ResponseRow.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/16/22.
//

import SwiftUI

struct EntryRow: View {
	var entry: UserEntry
    var body: some View {
		HStack {
			Spacer()
			Text("Slider \(entry.sliderNumber):")
				.font(.system(size: 16, weight: .regular).italic())
			Spacer()
			Text("\(entry.tickIndex)")
				.font(.system(size: 16, weight: .bold))
			
			Spacer()
			Text(String(format: "%.2f", entry.tickValue))
				.font(.system(size: 16, weight: .bold))
			Spacer()
		}
		.multilineTextAlignment(.center)
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
		EntryRow(entry: UserEntry(sliderNumber: 1, tickIndex: 0, tickValue: -78.0))
    }
}
