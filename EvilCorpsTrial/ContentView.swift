//
//  ContentView.swift
//  EvilCorpsTrial
//
//  Created by Cecep on 12/10/23.
//

import SwiftUI

let Utama = Color(#colorLiteral(red: 0.9520882964, green: 0.9689558148, blue: 0.9943284392, alpha: 1))
let Kedua = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
let ButtonColor = Color(#colorLiteral(red: 0.424377799, green: 0.3887372613, blue: 0.9981479049, alpha: 1))

//

struct ContentView: View {
    //@EnvironmentObject var userAuth : AuthUser
    
    var body: some View {
//        if !userAuth.isLoggedin {
//            return AnyView(Login())
//        } else {
//            return AnyView(CreateAccount())
//        }
        //Login()
        //CreateAccount()
        Confirmation()
    }
}

struct SecureTextField: View {
    
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        HStack {
            if isSecureField {
                SecureField("Password", text: $text)
            } else {
                TextField(text, text: $text)
            }
        }.overlay(alignment: .trailing) {
                Image(systemName: isSecureField ? "eye.slash": "eye")
                    .onTapGesture {
                        isSecureField.toggle()
                    }
            }
        }
    }

struct Login: View {
    
    //@EnvironmentObject var userAuth : AuthUser
    
    @State var username : String = ""
    @State var password : String = ""
    
//    func cekLogin() {
//        if(username == "Admin" && password == "123") {
//            userAuth.isLoggedin = true
//        } else {
//            userAuth.isLoggedin = false
//            userAuth.isCorrect = false
//        }
//    }
    
    let lightGreyColor = Color(red : 239.0/255.0, green: 243.0/255.0, blue: 244.0/255/0, opacity: 1.0)
    
    var body: some View {
        ZStack {
            Color(Utama)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 164)
                    .foregroundColor(ButtonColor)
                ZStack {
                    Rectangle()
                        .frame(height: 500)
                        .foregroundColor(Kedua)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Masuk")
                                .font(.title2)
                                //.padding(.bottom, 5)
                        }
                        //.padding()
                        
                        Text("Silahkan memasukkan username dan password terdaftar anda untuk melakukan login")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        .padding([.top, .bottom], 5)
                        
                        //Field Username
                        Text("Email \(Text("*").foregroundColor(.red)) :")
                        
                        TextField("Email", text: $username)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                        
                        //Field Password
                        Text("Kata Sandi \(Text("*").foregroundColor(.red)) :")
            
                        TextField("Kata Sandi", text: $password)
                            .padding()
                            .background(lightGreyColor).cornerRadius(5.0)
                        
                        //Lupa Password Button
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("Lupa Password ?")
                                    .font(.callout)
                                    .foregroundColor(ButtonColor)
                                    .padding([.top, .bottom], 10)
                            }
                            
                        }
                        
                        //tampilakn notif salah password/user
//                        if(!userAuth.isCorrect) {
//                            Text("username dan password salah!").foregroundColor(.red)
//                        }
                        
                        //Login Button
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("Login")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(ButtonColor)
                        .cornerRadius(15)
                        
                        
                        //Register Button
                        HStack {
                            Spacer()
                            Text("Belum punya akun?")
                            
                            Button(action: {}) {
                                Text("Daftar")
                                    .foregroundColor(ButtonColor)
                            }
                            Spacer()
                        }
                        .padding()
                        
                            
                    }
                    .padding([.leading, .trailing], 40)
                    
                    
                }
                HStack {
                    Spacer()
                    Image("ojk")
                        .padding(.horizontal, 5)
                    Image("bi")
                        .padding(.horizontal, 5)
                    Image("lps")
                    Spacer()
                }
                
                Text("PT Bank Digi telah berlisensi oleh Bank Indonesia dan diawasi oleh Otoritas Jasa Keuangan (OJK) serta merupakan peserta dari Lembaga Penjamin Simpanan (LPS).").font(.system(size: 8)).multilineTextAlignment(.center).padding().foregroundColor(.secondary)
            }
        }
    }
}

struct CreateAccount : View {
    
    @State var NIK : String = ""
    @State var Password : String = ""
    @State private var isToggled: Bool = false
    @State private var isPasswordVisible = false
    
    let lightGreyColor = Color(red : 239.0/255.0, green: 243.0/255.0, blue: 244.0/255/0, opacity: 1.0)
    
    var body: some View {
        ZStack {
            Color(Utama)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    HStack {
                        Button(action: {}) {
                            ZStack {
                                Circle()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(ButtonColor)
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        
                        Spacer()
                        
                        
                        
                    }
                    Text("Buat Akun")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                }
                
                //.padding()
                
                ZStack {
                    VStack{
                        Rectangle()
                            .frame(height: 600)
                            .foregroundColor(Kedua)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        Spacer()
                        Spacer()
                    }
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Informasi Data Diri")
                            .font(.title2)
                        Text("Masukkan informasik data diri untuk proses pembuatan akun.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Divider()
                        Text("NIK : ")
                            
                        TextField("NIK", text: $NIK)
                            .padding()
                            .background(lightGreyColor).cornerRadius(5.0)
                        
                        Text("Nama Lengkap \(Text("*").foregroundColor(.red)) :")
                        TextField("Nama Lengkap", text: $NIK)
                            .padding()
                            .background(lightGreyColor).cornerRadius(5.0)
                        
                        Text("No. Telepon \(Text("*").foregroundColor(.red)) :")
                        TextField("No. Telepon", text: $NIK)
                            .padding()
                            .background(lightGreyColor).cornerRadius(5.0)
                        
                        Text("Email \(Text("*").foregroundColor(.red)) :")
                        TextField("Email", text: $NIK)
                            .padding()
                            .background(lightGreyColor).cornerRadius(5.0)
                        
    
                        //PASSWORD
                        
                        Text("Password \(Text("*").foregroundColor(.red)) :")
                        ZStack {
                            TextField("Password", text: $Password)
                                .padding()
                                .background(lightGreyColor)
                                .cornerRadius(5.0)
                                //.isSecureTextEntry(!isToggled)
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                            self.isToggled.toggle() // Toggle the state when the button is pressed
                                }) {
                                    Image(systemName: isToggled ? "eye.slash" : "eye")
                                        .bold()
                                        .foregroundColor(ButtonColor)
                                        .padding()
                                }
                            }
                            
                        }
                        
                    }
                    .padding()
                }
                
                Button(action: {}) {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .foregroundColor(ButtonColor)
                            .cornerRadius(20)
                            
                        
                        Text("Lanjut")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                Spacer()
                
                
            }
            .padding()
        }
    }
}


struct Confirmation : View {
    
    @State var NIK : String = ""
    @State var Rekening : String = ""
    
    let lightGreyColor = Color(red : 239.0/255.0, green: 243.0/255.0, blue: 244.0/255/0, opacity: 1.0)
    
    var body: some View {
        ZStack {
            Color(Utama)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    HStack {
                        Button(action: {}) {
                            ZStack {
                                Circle()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(ButtonColor)
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        
                        Spacer()
                        
                        
                    }
                    .padding()
                    
                    Text("Rekening")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                
                
                ZStack {
                    VStack() {
                        Rectangle()
                            .frame(height: 600)
                            .foregroundColor(Kedua)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding([.leading, .trailing], 15)
                            //.shadow(radius: 10)
                            
                        Spacer()
                        Spacer()
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Data akun")
                            .font(.title2)
                            .padding(.top, 25)
                        Text("Masukkan informasi mengenai NIK dan Nomor Rekening yang sudah ada.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding([.top, .bottom], 2)
                        Divider()
                        Text("NIK \(Text("*").foregroundColor(.red)) : ")
                            //.bold()
                        TextField("NIK", text: $NIK)
                            .padding()
                            .background(lightGreyColor).cornerRadius(5.0)
                        
                        Text("Nomor Rekening \(Text("*").foregroundColor(.red)) : ")
                            //.bold()
                        TextField("Nomor Rekening", text: $Rekening)
                            .padding()
                            .background(lightGreyColor).cornerRadius(5.0)
                        
                        Spacer()
                    }
                    .padding([.leading, .trailing], 35)
                    
                    
                }
                
                ZStack {
                    Button(action: {}) {
                        Rectangle()
                            .foregroundColor(ButtonColor)
                            .frame(height: 50)
                            .cornerRadius(20)
                            .padding([.leading, .trailing], 15)
                    }
                    
                    Text("Lanjut")
                        .bold()
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
