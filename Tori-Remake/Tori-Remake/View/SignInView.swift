//
//  SignInView.swift
//  Tori-Remake
//
//  Created by Joao Nascimento on 17.8.2023.
//

import CoreData
import SwiftUI

let kEmail: String = "email key"
let kPassword: String = "password key"
let kIsLoggedIn: String = "is logged in key"

struct SignInView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var viewModel: MainMenuViewModel
    
    @State private var selectedFilter: String = "Newest"
    @State private var selectedTypeOfSale: String = "For Sale"
    @State private var minProductValue: String = ""
    @State private var maxProductValue: String = ""
    @State private var locationSearchBar: String = ""
    @State private var categoryStatus = ""
    
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var isLoggedIn = false
    
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    
    init(
        viewModel: MainMenuViewModel
    ){
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Image("Tori-background2")
                    .resizable()
                    .blur(radius: 7)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack (spacing: 24){
                    
                    Text("Sign In")
                        .customFont(.largeTitle).bold()
                    Text("Tori is the largest and most popular shopping place in Finland. Every month, more than 3 million Finns make good deals and discoveries!")
                        .customFont(.body)
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Email")
                            .customFont(.subheadline)
                            .foregroundColor(.gray)
                        TextField("", text: $email, onEditingChanged: { _ in }, onCommit: {
                                email = email.lowercased() // Convert entered email to lowercase
                            })
                            .customTextField(image: Image(systemName: "envelope"))
                    }
                    
                    VStack(alignment: .leading){
                        Text("Passowrd")
                            .customFont(.subheadline)
                            .foregroundColor(.gray)
                        SecureField("", text: $password)
                            .customTextField(image: Image(systemName: "lock"))
                    }
                    
                    Button {
                        if !email.isEmpty && !password.isEmpty {
                            if isValidEmail(email: email) {
                                let userExists = CoreDataManager.shared.fetchUser(withEmail: email, password: password)
                                if userExists {
                                    UserDefaults.standard.set(email, forKey: kEmail)
                                    UserDefaults.standard.set(password, forKey: kPassword)
                                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                                    isLoggedIn = true
                                } else {
                                    showAlert = true
                                }
                            } else {
                                showAlert = true
                            }
                        } else {
                            showAlert = true
                        }
                    } label: {
                        Label("Sign In", systemImage: "arrow.right")
                            .customFont(.body)
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(Constants.Colors.primaryColor).opacity(0.9)
                            .foregroundColor(.white)
                            .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                            .cornerRadius(8, corners: [.topLeft])
                        .shadow(color: Constants.Colors.primaryColor, radius: 20, x: 0, y: 10)}
                    
                    
                    HStack{
                        Rectangle().frame(height: 1).opacity(0.1)
                        Text("OR").customFont(.subheadline).foregroundColor(.black).opacity(0.3)
                        Rectangle().frame(height: 1).opacity(0.1)
                    }
                    
                    
                    Text("Sign up with Email, Apple or Google")
                        .customFont(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack{
                        Image("Logo Email")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Spacer()
                        Image("Logo Apple")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Spacer()
                        Image("Logo Google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(30)
                .background(.regularMaterial)
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 5, x: 0, y: 3)
                .shadow(radius: 30, x: 0, y: 30)
                .padding(20)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please enter a valid email."),
                    dismissButton: .default(Text("OK"))
                )}
            .onAppear{
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                MainMenuView(viewModel: viewModel,
                             selectedFilter: $selectedFilter,
                             selectedTypeOfSale: $selectedTypeOfSale,
                             minProductValue: $minProductValue,
                             maxProductValue: $maxProductValue,
                             locationSearchBar: $locationSearchBar,
                             categoryStatus: $categoryStatus).navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}


