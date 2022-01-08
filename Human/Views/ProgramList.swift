//
//  ProgramList.swift
//  Landmarks4
//
//  Created by Raj Thimmiah on 9/22/21.
//

import SwiftUI

struct ProgramList: View {
    @EnvironmentObject var modelData: ModelData
        @State private var showFavoritesOnly = false

        var filteredPrograms: [Program] {
	            modelData.programs.filter { program in
                (!showFavoritesOnly || program.isFavorite)
            }
        }

    var body: some View {
        
        
        #if os(watchOS)
        NavigationView{
        List {
            Toggle(isOn: $showFavoritesOnly)
            {
                Text("Favorites only")
                
            }
            ForEach(filteredPrograms) {program in
                NavigationLink(destination: ProgramRun(program: program)) {
                    ProgramRow(program: program)
                }
            }
        }
        .navigationTitle("Human")
    }
        #else
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly)
                {
                    Text("Favorites only")
                    
                }
                ForEach(filteredPrograms) {program in
                    NavigationLink(destination: ProgramRun(program: program)) {
                        ProgramRow(program: program)
                    }
                }
            }
            .navigationTitle("Human")
           }
            
        #endif
            
    }
}

    func timeDay(_ time: Int?) -> String {
        if var timeD = time {
            timeD = timeD % 24
            if timeD > 0 && timeD < 12 {
                return "Morning"
            } else if timeD > 12 && timeD <  17 {
                return "Afternoon"
             } else if timeD > 17 {
                 return "Evening"
             }
        }
        else {
            return "Other"
        }
        return "Other"
    }
    func color(_ timeDay: String) -> Color {
        
            if timeDay == "Morning" {
                return Color.yellow
            } else if timeDay == "Afternoon" {
                return Color.orange
             } else if timeDay == "Evening" {
                 return Color.red
             }
        else{
            return Color.black
        }
    }


struct ProgramList_Previews: PreviewProvider {
    static var previews: some View {
        ProgramList()
            }
    }
