//
//  ContentView.swift
//  SwiftUIGrid
//
//  Created by Apple on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var imageArr = ["download1","download1","download1","download1","download1","download1","download1","download1","download1"]
     let columns = [
           GridItem(.adaptive(minimum: 150))]
   
    @State var selections: [Int] = []
    @State var select:Bool = false

     var body: some View {
         let data = imageArr.map{$0}
      
         ScrollView() {
             LazyVGrid(columns: columns,spacing: 20){
                 ForEach(0..<data.count){ index in
                     Button(action:{
                         if self.selections.contains(index){
                             self.selections.removeAll { item in
                                 return item == index
                             }
                         }else{
                             self.selections.append(index)
                         }
//                         self.select = !self.select
                        
                     })
                     {
                         Image("\(imageArr[1])")
                             .resizable()
                            .scaledToFit()
                             .overlay {
                                 if selections.contains(index) {
                                       Image("transparent")
                                            .resizable()
                                            .frame(width: 50,height: 50)
                                            .offset(x:60,y:-60)
                                      }
                                 else
                                  {
                                      Image("")
                                     .resizable()
                                     .frame(width: 50,height: 50)
                                     .offset(x:60,y:-60)
                                  }
                             }
                          }
                     }
                   }
             
                .padding(.vertical)
               }
         .frame(maxHeight: UIScreen.main.bounds.height)
         .padding()
         .background(.red)
     }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
