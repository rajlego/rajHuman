//
//  FileToJSON.swift
//  Human
//
//  Created by Raj Thimmiah on 9/23/21.
//

import Foundation

func convertJSON() {
    print("Cat)")
    // Determine the file name
    let filename = "main.swift"

    // Read the contents of the specified file
    let contents = try! String(contentsOfFile: filename)

    // Split the file into separate lines
    let lines = contents.split(separator:"\n")

    // Iterate over each line and print the line
    for line in lines {
        print("\(line)")
    }

}
