//
//  ContentView.swift
//  watchHuman WatchKit Extension
//
//  Created by Raj Thimmiah on 9/22/21.
//

import SwiftUI
import AVKit




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
