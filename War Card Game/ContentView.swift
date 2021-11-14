//
//  ContentView.swift
//  War Card Game
//
//  Created by Ioannis Loudaros on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    var body: some View {
        
        ZStack{
            Image("background").ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Button("Reset")
                {
                    print("Reset")
                    playerCard = "card14"
                    cpuCard = "card14"
                    playerScore = 0
                    cpuScore = 0
                }
                Spacer()
                
                
                //Cards
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                
                //Deal Button
                Button {
                    print("Deal")
                    
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    if playerRand > cpuRand {
                        playerScore+=1
                    }
                    else if playerRand < cpuRand {
                        cpuScore+=1
                    }
                    else {
                        print("Draw")
                    }
                    
                } label: {
                    Image("dealbutton")
                }
                Spacer()
                
                //Scores
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, -3.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .padding(.bottom, -3.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                        
                    }
                    Spacer()
                }
                
                Spacer()
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
