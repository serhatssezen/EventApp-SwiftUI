//
//  InfoPage.swift
//  Event
//
//  Created by Aydın Serhat Sezen on 19.01.2022.
//

import SwiftUI

struct InfoPage: View {

    let infos = [
        InfoModel(id: 1, image: "image1", title: "Hey\nready for\nTonight?", desc: "Let us find you an event for \nyour interest"),
//        InfoModel(id: 2, image: "image2", title: "Hey \nready for Tonight?", desc: "Let us find you an event for \nyour interest"),
//        InfoModel(id: 3, image: "image3", title: "Hey \nready for Tonight?", desc: "Let us find you an event for \nyour interest"),
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 0) {
                    createPage(id: infos[0].id, image: infos[0].image, title: infos[0].title, desc: infos[0].desc)
                        .frame(width: geometry.size.width)
                }
                .frame(width: geometry.size.width, alignment: .leading)
            }.edgesIgnoringSafeArea(.all)
        }
    }
    
    private func createPage(id: Int, image: String, title: String, desc: String) -> some View {
        return ZStack {
            Image(image).resizable()
            VStack {
                HStack {
                    VStack {
                        Text(title)
                            .font(.system(size: 65, design: .default))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.top, UIScreen.screenHeight * 0.15)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        Text(desc)
                            .font(.system(size: 20, design: .default))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 2, leading: 20, bottom:0, trailing: 20))
    
                    }
                    Spacer()
                }
                
                HStack() {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 35, height: 6, alignment: .leading)
                        .cornerRadius(10)
                        .padding(.leading, 20)
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 8, height: 8, alignment: .leading)
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 8, height: 8, alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                .padding(.top, 2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.black.opacity(0.5))

            Text("Skip")
                .font(.system(size: 16, design: .default))
                .foregroundColor(.white)
                .fontWeight(.medium)
                .padding(.horizontal, 25)
                .padding(.top, 50)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.screenHeight, alignment: .topTrailing)

            bottomView()
        }
    }
    
    func bottomView() -> some View {
        return ZStack(alignment: .bottom) {
            Color.clear
            VStack {
                bottomInfoView()
                Button(action: {
                }) {
                    HStack(alignment: .center) {
                        Image(systemName: "location.circle").foregroundColor(Color.white)
                        Text("Find nearest event")
                            .font(.system(size: 16, design: .default))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                    }.frame(width: UIScreen.screenWidth - 75)
                }
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.red)
                        .shadow(color: Color.red.opacity(0.4), radius: 25, x: 0, y: 10)
                        .mask(RoundedRectangle(cornerRadius:20).padding(.bottom, -6))
                )
                .padding(.vertical, 10)
            }
        }.padding(.bottom, 50)
    }
    
    func bottomInfoView() -> some View {
        return HStack(spacing: 30) {
            VStack{
                Text("23")
                    .font(.system(size: 40, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Text("Upcoming")
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
            }
            VStack{
                Text("13")
                    .font(.system(size: 40, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Text("New")
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
            }
            VStack{
                Text("7")
                    .font(.system(size: 40, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Text("Active")
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
            }
            VStack{
                Text("53")
                    .font(.system(size: 40, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Text("All")
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
            }
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
