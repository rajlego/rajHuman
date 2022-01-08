//
//  ProgramData.swift
//  Landmarks4
//
//  Created by Raj Thimmiah on 9/22/21.
//

import Foundation
//var programs: [Program] = load("Programs.json")ack

//var file: Program = loadFile("c")
final class ModelData:ObservableObject {
    @Published var programs: [Program] = loadAllFiles()
}
func load<T: Decodable>() -> T {
    let data: Data
    let filename = "programs.json"
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
func loadAllFiles<T: Decodable>() -> T {
    print("begins")
    var programList:Array<Program> = Array()
    var routineList:Array<Program> = Array()
    var fileNames: Array<String> = []
    //get name of all files ending in .human
    if let files = try? FileManager.default.contentsOfDirectory(atPath: Bundle.main.bundlePath ){
            for file in files {
                if(file.hasSuffix(".human"))
                {
                    fileNames.append(file)
                    //print(file)
                }
            }
    }
    //iterate through filenames to get all file data into programList
    var id = 0
    for file in fileNames
    {
        let tempProgram = loadFile(file, id: id)
        if tempProgram.goal.contains("NOWATCH")
        {
            print("BAD: " + file)
        }
        else
        {
            print(tempProgram.name)
            if tempProgram.name.localizedCaseInsensitiveContains("routine")
            {
                routineList.append(tempProgram)
            }
            else
            {
                programList.append(tempProgram)
            }
        }
        id += 1
    }
    programList.sort {
        $0.name.localizedStandardCompare($1.name) == .orderedAscending
    }
    var json: Data
    do {
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    json = try jsonEncoder.encode(routineList + programList)
    } catch {
        fatalError("No")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: json)
    } catch {
        fatalError("Couldn't parse")
    }
}
func loadFile(_ filename: String, id: Int) -> Program {
    var program: Program = Program()
        //program.name = "cat"
    let path = Bundle.main.path(forResource: filename, ofType: nil)!
    let myStringText = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
    let lines = myStringText.components(separatedBy: "\n")
    var goal = ""
    var code = ""
    lines.forEach{
        if($0.hasPrefix("HOW TO"))
        {
            goal = goal + $0
        }
        if(!$0.isEmpty || $0 == "\r" || $0 == "\n")
        {
            if(!$0.hasPrefix("HOW TO") && !$0.hasPrefix("#"))
            {
                code = code + $0
            }
        }
    }

    program.name = filename.replacingOccurrences(of: "_", with: " ").replacingOccurrences(of: ".human", with: "").capitalized.replacingOccurrences(of: "Ir", with: "IR")
    program.goal = goal.replacingOccurrences(of: "HOW TO ", with: "").replacingOccurrences(of: ":", with: "")
    program.id = id
    program.code = code
    //print("CODE:" + code)
    return program
}

