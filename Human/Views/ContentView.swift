//
//  ContentView.swift
//  Landmarks4
//
//  Created by Raj Thimmiah on 9/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ProgramList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
