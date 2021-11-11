//
//  ContentView.swift
//  newProject
//
//  Created by Sajal Suhane on 11/10/21.
//

import SwiftUI
import CodeScanner


struct ContentView: View{
    @State var firstName = ""
    @State var lastName = ""
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code"
    //scannedCode.components(separatedBy: ",")[0]
    var scannerSheet: some View{
        CodeScannerView(
            codeTypes: [.qr],
                        completion: {result in
                        if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false}
                    }
            
        )
    }
    func updateValues(string: String) -> Array<Any>{
        let array1 = scannedCode.components(separatedBy: ",")
        return array1
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section{
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }
                }
            }
            Text(updateValues((string: scannedCode)[0]))
            .navigationTitle("Create Account")}
        
        VStack(spacing: 10){
            Text(scannedCode)
            Button("Scan QR"){
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner){
                self.scannerSheet
                
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
