//
//  NextButton.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/15/22.
//

import SwiftUI

struct NextButton: View {
	@State var active: Bool = false
    var body: some View {
		if active == true {
			Text("NEXT")
				.bold()
				.frame(width: 300, height: 15, alignment: .center)
				.padding()
				.background(Color("activeButtonColor"))
				.foregroundColor(Color.black)
				.cornerRadius(30)
		} else {
			Text("NEXT")
				.bold()
				.frame(width: 300, height: 15, alignment: .center)
				.padding()
				.background(Color("inactiveButtonColor"))
				.foregroundColor(Color.white)
				.cornerRadius(30)
		}
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
		NextButton(active: true)
    }
}
