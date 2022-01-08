import SwiftUI

struct ProgramRow: View {
    var program: Program
    var body: some View {
        HStack {
                Text(program.name)
                    .font(.headline)
            Spacer()
            if program.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            //.frame(width: 300, height: 70, alignment: .leading)
        
            }
    }
}

struct ProgramRow_Previews: PreviewProvider {
    static var programs = ModelData().programs
    
    static var previews: some View {
        Group{
            ProgramRow(program: programs[3])
        }

    }
}
