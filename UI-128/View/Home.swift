//
//  Home.swift
//  UI-128
//
//  Created by にゃんにゃん丸 on 2021/02/16.
//

import SwiftUI

struct Home: View {
    @State var with = UIScreen.main.bounds.width
    @State var read = false
    @State var gender = "Male"
    @State var size = 6
    var sizes = [6,7,8,9,10]
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var added = false
    
    @State var issmall = UIScreen.main.bounds.height < 750
    
    var body: some View {
        VStack{
            
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    
                })
                
                Spacer(minLength: 0)
                
                NavigationLink(
                    destination: SliderView(),
                    label: {
                        
                        Image(systemName: "heart.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        
                        
                    })
              
                    
           
                
            }
            .overlay(
            Image("nike")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
            )
            .padding(.horizontal)
            
            Image("s")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: with - (read ? 200 : 100))
                .padding(.top,25)
            
            ScrollView(issmall ? .vertical : .init(), showsIndicators: false, content: {
               
                
                VStack{
                    
                    HStack(spacing:5){
                        
                        Text("Nike Air Haurache for Women")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        Text("$168")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        
                        
                        
                    }
                    .padding(.top,25)
                    .padding(.trailing)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Nike Air Max is a line of shoes produced by Nike, Inc., with the first model released in 1987. Air Max shoes are identified by their midsoles incorporating flexible urethane pouches filled with pressurized gas, visible from the exterior of the shoe and intended to provide cushioning underfoot. Air Max was conceptualized by Tinker Hatfield, who initially worked for Nike designing stores.")
                            .font(.callout)
                            .lineLimit(read ? nil : 3)
                            .foregroundColor(.black)
                            
                        
                        Button(action: {
                            
                            withAnimation{read.toggle()}
                        }, label: {
                            Text("Read More")
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        })
                            
                        
                        
                                
                    })
                    .padding([.vertical,.horizontal])
                    
                    
                    HStack{
                        
                        Text("Gender")
                            
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(width: 75,alignment: .leading)
                        
                        
                        GenderButton(gender: $gender, title: "Male")
                        
                        GenderButton(gender: $gender, title: "Female")
                        
                        Spacer(minLength: 0)
                    }
                
                    .padding(.trailing)
                    .padding(.top,10)
                    
                    
                    HStack(spacing:10){
                        
                        Text("Size")
                           
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(width: 75,alignment: .leading)
                        
                        
                        ForEach(sizes,id:\.self){size in
                            
                            
                            SizeButton(size: $size, title: size)
                            
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.trailing)
                    .padding(.top,10)
                    
                    
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        added.toggle()
                    }, label: {
                        Label(
                            title: { Text(added ? "Added" :  "Add to Cart")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                
                            },
                            icon: { Image(systemName: added ? "checkmark.circle.fill" : "cart.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                                
                                
                                
                            })
                            .padding(.vertical,12)
                            .frame(width: with - 75)
                            .background(added ? Color.green : Color.red)
                            .clipShape(Capsule())
                            .padding(.leading, -45)
                            .padding(.top)
                            .padding(.bottom,edges!.bottom == 0 ? 15 : edges!.bottom)
                    })
                   
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.leading,45)
                
                
                
                
            })
          
            .background(Color.white)
            .shadow(radius: 0)
            .clipShape(CustomShape())
            .padding(.top,30)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -10)
            
        }
        .background(Color.white.ignoresSafeArea(.all, edges: .all)
        .ignoresSafeArea(.all, edges: .bottom))
        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: 85, height: 85))
        return Path(path.cgPath)
    }
}

struct GenderButton : View {
    @Binding var gender : String
    var title : String
    var body: some View{
        
        Button(action: {
            
            gender = title
        }, label: {
            
            Text(title)
                .font(.caption)
                .foregroundColor(gender == title ? .white : Color.black.opacity(0.3))
                .padding(.vertical,15)
                .frame(width: 80)
                .background(gender == title ? Color.red : Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            
        })
        
    }
}

struct SizeButton : View {
    @Binding var size : Int
    var title : Int
    var body: some View{
        
        Button(action: {
            
            size = title
        }, label: {
            
            Text("\(title)")
                .font(.caption)
                .foregroundColor(size == title ? .white : Color.black.opacity(0.3))
                .frame(width: 35,height: 35)
                .background(size == title ? Color.red : Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            
        })
        
    }
}
