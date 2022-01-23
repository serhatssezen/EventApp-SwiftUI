//
//  InfoPage.swift
//  Event
//
//  Created by Aydın Serhat Sezen on 19.01.2022.
//

import SwiftUI

struct InfoPage: View {
    @State private var currentIndex: Int = 0

    @GestureState private var translation: CGFloat = 0
    
    let infos = [
        InfoModel(id: 1, image: "image1", title: "Hey \nready for Tonight?", desc: "Let us find you an event for \nyour interest"),
        InfoModel(id: 2, image: "image2", title: "Hey \nready for Tonight?", desc: "Let us find you an event for \nyour interest"),
        InfoModel(id: 3, image: "image3", title: "Hey \nready for Tonight?", desc: "Let us find you an event for \nyour interest"),
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 0) {
                    ForEach(infos) { info in
                        createPage(id: info.id, image: info.image, title: info.title, desc: info.desc)
                            .frame(width: geometry.size.width)
                    }
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
                .offset(x: self.translation)
                .animation(.interactiveSpring())
                .gesture(
                    DragGesture().updating(self.$translation) { value, state, _ in
                        state = value.translation.width
                    }.onEnded { value in
                        let offset = value.translation.width / geometry.size.width
                        let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                        self.currentIndex = min(max(Int(newIndex), 0), self.infos.count - 1)
                    }
                )
            }.edgesIgnoringSafeArea(.all)
        }
    }
    
    private func createPage(id: Int, image: String, title: String, desc: String) -> some View {
        return ZStack {
            Image(image).resizable()
            VStack {
                Text(title)
                    .font(.custom("Oswald-Regular", size: 65))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.leading, 35)
                    .padding(.top, UIScreen.screenHeight * 0.15)
                    .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                Text(desc)
                    .font(.custom("Oswald-Regular", size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.leading, 35)
                    .padding(.top, 2)
                    .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                HStack() {
                    Text("")
                        .padding(.leading, 30)
                    ForEach(infos) { info in
                        Text(info.id == id ? "—" : "·")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }.frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                    .padding(.top, 2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.black.opacity(0.5))
            Text("Skip")
                .font(.custom("Oswald-Regular", size: 16))
                .foregroundColor(.white)
                .fontWeight(.medium)
                .padding(.horizontal, 25)
                .padding(.top, 50)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.screenHeight, alignment: .topTrailing)
            
            ZStack(alignment: .bottom) {
                Color.clear
                VStack {
                    HStack(spacing: 30) {
                        VStack{
                            Text("23")
                                .font(.custom("Oswald-Regular", size: 40))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                            Text("Upcoming")
                                .font(.custom("Oswald-Regular", size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.vertical, 4)
                        }
                        VStack{
                            Text("13")
                                .font(.custom("Oswald-Regular", size: 40))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                            Text("New")
                                .font(.custom("Oswald-Regular", size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.vertical, 4)
                        }
                        VStack{
                            Text("7")
                                .font(.custom("Oswald-Regular", size: 40))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                            Text("Active")
                                .font(.custom("Oswald-Regular", size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.vertical, 4)
                        }
                        VStack{
                            Text("53")
                                .font(.custom("Oswald-Regular", size: 40))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                            Text("All")
                                .font(.custom("Oswald-Regular", size: 16))
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.vertical, 4)
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "location.circle").foregroundColor(Color.white)
                            Text("Find nearest event")
                                .font(.body)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
                        }.frame(width: UIScreen.screenWidth - 75)
                    }
                    .background(RoundedRectangle(cornerRadius: 36).fill(.red)
                                    .shadow(color: Color.red.opacity(0.4), radius: 25, x: 0, y: 10)
                                    .mask(RoundedRectangle(cornerRadius:36).padding(.bottom, -6)))
                    .padding(.vertical, 10)
                }
            }.padding(.bottom, 50)
        }
    }
}

struct InfoModel: Identifiable {
    let id: Int
    let image: String
    let title: String
    let desc: String
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
