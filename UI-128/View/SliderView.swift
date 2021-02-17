//
//  SliderView.swift
//  UI-128
//
//  Created by にゃんにゃん丸 on 2021/02/17.
//

import SwiftUI

var gra = LinearGradient(gradient: .init(colors: [.blue,.orange]), startPoint: .bottom, endPoint: .top)

struct SliderView: View {
    @State var maxHigth = UIScreen.main.bounds.height / 3
    @State var sliderHeigth : CGFloat = 0
    @State var sliderprogress : CGFloat = 0
    @State var lastDrag : CGFloat = 0
    var body: some View {
      
            
            VStack{
                
                ZStack(alignment: .bottom, content: {
                    
                    Rectangle()
                        .fill(Color.red.opacity(0.1))
                    
                    Rectangle()
                        .fill(gra)
                        .frame(height: sliderHeigth)
                        
                
                })
                .frame(width: 100, height: maxHigth)
                .cornerRadius(35)
                .overlay(
                
                Text("\(Int(sliderprogress * 100))%")
                    .bold()
                    .foregroundColor(.black)
                    .padding(.vertical,10)
                    .padding(.horizontal,15)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.vertical,25)
                    .offset(y: sliderHeigth < maxHigth - 105 ? -sliderHeigth : -maxHigth + 105)
                    
                    
                    ,alignment: .bottom
                )
               
            
                .gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
                    
                    let translation = value.translation
                    sliderHeigth = -translation.height + lastDrag
                    
                    sliderHeigth = sliderHeigth > maxHigth ? maxHigth : sliderHeigth
                    sliderHeigth = sliderHeigth >= 0 ? sliderHeigth : 0
                    
                    let progress = sliderHeigth / maxHigth
                    sliderprogress = progress <= 1.0 ? progress : 1
                    
                    
                }).onEnded({ (value) in
                    sliderHeigth = sliderHeigth > maxHigth ? maxHigth : sliderHeigth
                    
                    sliderHeigth = sliderHeigth >= 0 ? sliderHeigth : 0
                    
                    lastDrag = sliderHeigth
                    
                }))
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .preferredColorScheme(.dark)
            .navigationBarTitle("DashBoard")
            .navigationBarTitleDisplayMode(.inline)
     
            
            .background(
                
               
                
                Image("nike")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .ignoresSafeArea(.all, edges: .all)
                    .background(BlurView())
                     
        
                    
            
            
            )
        
            
            
            
            
            
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}


