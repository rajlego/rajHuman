//
//  ProgramRun.swift
//  Landmarks4
//
//  Created by Raj Thimmiah on 9/22/21.
//

import SwiftUI
import UniformTypeIdentifiers



struct ProgramRun: View {
    @EnvironmentObject var modelData: ModelData
    var program: Program
    @State var line = Int(0)
    var programIndex: Int {
        modelData.programs.firstIndex(where: { $0.id == program.id})!
    }
    var body: some View {
        ScrollView{
        VStack {
            HStack {
                Text("Goal: " + program.goal)
                .font(.headline)
                .padding()
                FavoriteButton(isSet: $modelData.programs[programIndex].isFavorite)
            }
            Divider()
            //Text(program.code)
            Text(printLine(program.code, line))
                .font(.body)
                .padding()
                .gesture(
                    TapGesture()
                        .onEnded{
                            self.line += 1
                        }
                    )
        }
        .navigationTitle(program.name)
        //.navigationBarTitleDisplayMode(.inline)

            
        }
    }
    

    func printLine(_ code: String,_ line: Int) -> String{
        
        let lines = code.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\r")
        let lineWrap = line % (lines.endIndex)
        if code.isEmpty
        {
            print("EMPTY!!!")
        }
        else
        {
            print("NOT EMPTY!!!")
            print(code)
        }
        print("CAT")
        print(lines[0])
        let linePrint = lines[lineWrap] + "\nLINE: " + String(lineWrap+1) + " / " + String(lines.endIndex)
        return linePrint
        //convert to array
        //loop int by array length
        //return line based on int
    }
}
//if index>= names.startIndex && index< names.endIndex {


struct ProgramRun_Previews: PreviewProvider {
    static var previews: some View {
        ProgramRun(program: ModelData().programs[0])
    }
    
}
