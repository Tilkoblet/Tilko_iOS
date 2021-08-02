//
//  ContentView.swift
//  sample
//
//  Created by Dong-Wook Kim on 2020/11/20.
//  010-8790-4386, 카이져닷컴
//

import SwiftUI

struct ContentView: View {
    
    
   @ObservedObject var hubManager:HubManager 
    
    var body: some View {
    
        
        VStack {
            Spacer(minLength: 100)
            Button(action: startFetch, label: {
                Text("인증서 가져오기")
            })
            Text(hubManager.code)
                .font(.largeTitle)
                .padding(.top)
            Spacer(minLength: 100)

            List {
                ForEach(hubManager.certificates) { info in
                    Button(info.cn, action: {

                        hubManager.fetchDrug(info: info)
                        
                    })
                }
            }
        }
        
    }
    
    func startFetch() {
        hubManager.startConnection()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let hubManager = HubManager()
        
        ContentView(hubManager: hubManager)
    }
}
