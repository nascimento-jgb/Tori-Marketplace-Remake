//
//  AdInfoView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 13.8.2023.
//

import SwiftUI

struct AdInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack{
            
            ZStack{
                Image("Shirt")
                    .resizable()
                    .scaledToFit()
                    
                HStack {
                    Spacer()
                    
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                            .padding(4)
                            .padding(.trailing, 3)
                        
                        Image(systemName: "heart")
                            .padding(.trailing, 18)
                            .padding(.bottom, -6)
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                }
                .padding(.top, -200)
                .padding(.trailing, 14)
            } //ZStack
            
            Spacer()
            
            ScrollView(.vertical)
            {
                VStack{
                    
                        Text("Cool T-Shirt")
                            .font(.title).bold()
                            .padding(.leading, -160)
                            .padding(.bottom, 2)
                            .padding(.top, 2)
                    
                        Text("$ 200")
                          .font(.title2.weight(.semibold))
                            .padding(.leading, -160)
                            .padding(.bottom, 12)
                    
                    HStack{
                        Spacer()
                        HStack{
                            Image(systemName: "calendar")
                                .foregroundColor(Constants.Colors.primaryColor)
                            Text("Date")
                                .font(.title3)
                                .padding(.bottom, 2)
                                
                                
                            
                        }
//                        .padding(.leading, 36)
                    
                        Spacer()
                        
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(Constants.Colors.primaryColor)
                            Text("Location")
                                .font(.title3)
                                .padding(.bottom, 2)
                        }
                        .padding(.leading, -90)
                        Spacer()
                    }
                    .padding(.bottom, 8)
                        
                        HStack{
                            Text("Clothing")
                                .padding(.leading, 25)
                            Spacer()
                            Image(systemName: "circle.fill")
                                .font(.system(size: 4))
                                .foregroundColor(Constants.Colors.primaryColor)
                            Spacer()
                            Text("For Sale")
                            Spacer()
                            Image(systemName: "circle.fill")
                                .font(.system(size: 4))
                                .foregroundColor(Constants.Colors.primaryColor)
                            Spacer()
                            Text("Size M")
                                .padding(.trailing, 25)
                        }
                        .font(.title3.weight(.semibold))
                        .padding(.bottom, 15)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Sed sit amet sollicitudin quam. Vivamus euismod arcu sed erat fermentum, vel interdum neque pharetra. Fusce consequat nisl eget lectus hendrerit lacinia. Quisque fringilla turpis eu velit tincidunt, et hendrerit sapien ultricies. Ut scelerisque lorem ut ante accumsan, id volutpat urna cursus. Suspendisse eget eros non lectus mattis mattis. Proin rhoncus elit in dui tristique viverra. Aenean ac justo in justo interdum feugiat a a magna. Donec auctor, ligula in consectetur tincidunt, nunc tellus elementum libero, eu efficitur nulla purus vel augue.")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 25)
                        .padding(.trailing, 15)
                        .padding(1)
                    

                        Text("Information of the seller:")
                            .font(.title3.weight(.semibold))
                            .padding(1)
     
                        Text("John Nascimento")
                            .font(.title2.weight(.regular))
                            .multilineTextAlignment(.leading)
                    
                        Text("Account created in Nov 2022")
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 6)
                    
                    Button(action: {
                        
                    })
                    {
                        HStack {
                            Text("Show all adds")
                                .underline()
                            Image(systemName: "arrow.up.left.and.arrow.down.right")
                        }
                        .foregroundColor(.black)
                       
                    }
                }
                //VStack
                
//                List{
//                    Button(action: {
//                                        // Action for the first button in the list
//                        }) {
//                            HStack {
//                                Image(systemName: "hand.thumbsup")
//                                Text("Button 1")
//                                    .foregroundColor(.red)
//                            }
//                        }
//
//                    Button(action: {
//                                        // Action for the second button in the list
//                        }) {
//                            HStack {
//                                Image(systemName: "hand.point.right")
//                                Text("Button 2")
//                                    .foregroundColor(.red)
//                            }
//                        }
//
//                }//ist
                
            }//Scrollview
            
            VStack {
                    Spacer()
                    Button(action: {
                               // Action for the new button
                    }) {
                        Text("Send Message")
                            .frame(maxWidth: .infinity)
                            .frame(height: 45) // Adjust the height as needed
                            .background(Constants.Colors.primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding()
            }
            .frame(height: 50)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {
            presentationMode.wrappedValue.dismiss()
            }))
    }
}

struct BackButton: View {
            
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                Text("")
            }
        }
    }
}


struct AdInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AdInfoView()
    }
}
