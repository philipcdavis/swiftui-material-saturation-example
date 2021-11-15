//
//  ContentView.swift
//  MaterialSaturation
//
//  Created by Philip Davis on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    var materials: [Material] = [.ultraThinMaterial, .thinMaterial, .regularMaterial, .thickMaterial, .ultraThickMaterial]
    @State private var saturation = 1.0
    @State private var isDarkMode = true
    @State private var materialIndex = 0
    var body: some View {
        
        ZStack {
            Color(.black)
            VStack {
                ZStack {
                    TabView {
                        Image("bg").resizable().scaledToFill()
                        Color(.black)
                        Color(.white)
                        HStack(spacing: 0) {
                            Color(.white)
                            Color(.black)
                            Color(.white)
                            Color(.black)
                            Color(.white)
                            Color(.black)
                            Color(.white)
                            Color(.black)
                            Color(.white)
                        }
                        Color(.systemGray3)
                        Color(.red)
                        Color(.yellow)
                        Color(.blue)
                        
                        
                    }.tabViewStyle(PageTabViewStyle())
                    
                    
                    HStack(spacing: 20) {
                        Image(systemName: "backward.fill")
                        Image(systemName: "play.fill")
                        Image(systemName: "forward.fill")
                        
                    }.font(.title)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .background(materials[materialIndex])
                        .saturation(saturation)
                        .foregroundStyle(.primary)
                        .preferredColorScheme(isDarkMode ? .dark : .light)
                        .cornerRadius(100)
                }
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(String(format: "Saturation: %.1f", saturation)).foregroundColor(.white)
                            Slider(
                                value: $saturation,
                                in: 0...7
                            )
                        }
                        
                    }
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Material").foregroundColor(.white)
                        Picker("Select Material", selection: $materialIndex) {
                            Text("xThin").tag(0)
                            Text("Thin").tag(1)
                            Text("Regular").tag(2)
                            Text("Thick").tag(3)
                            Text("xThick").tag(4)
                        }
                        .pickerStyle(.segmented)
                        .colorScheme(.dark)
                    }
                    
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode").foregroundColor(.white)
                    }.toggleStyle(SwitchToggleStyle(tint: Color.blue))
                    Toggle(isOn: $isDarkMode) {
                        Text("Invert Foreground").foregroundColor(.white)
                    }.toggleStyle(SwitchToggleStyle(tint: Color.blue))
                    
                }.padding()
                
                
                
                
            }
        }.ignoresSafeArea()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
