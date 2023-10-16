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
        CreateAccount()
        //Confirmation()
    }
}

//Create show/hide Password Toggle Button
struct SecureTextField: View {
    
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        HStack {
            if isSecureField {
                SecureField("Password", text: $text)
                    .font(Font.custom("Poppins-Regular", size: 14))
            } else {
                TextField("Password"/*text*/, text: $text)
                    .font(Font.custom("Poppins-Regular", size: 14))
            }
        }.overlay(alignment: .trailing) {
                Image(systemName: isSecureField ? "eye.slash.fill": "eye.fill")
                    .onTapGesture {
                        isSecureField.toggle()
                    }
                    .foregroundColor(ButtonColor)
            }
        }
    }

//Create number only field input
class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct Login: View {
    
    
    @State var username : String = ""
    @State var password : String = ""
    
    var body: some View {
        ZStack {
            Color(Utama)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 164, height: 132)
                    .foregroundColor(ButtonColor)
                ZStack {
                    Rectangle()
                        .frame(width: 346,height: 497)
                        .foregroundColor(Kedua)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Masuk")
                                .bold()
                                .font(Font.custom("Poppins-Bold", size: 20))
                                .padding(.top, 40)
                        }
                        
                        Text("Silahkan memasukkan email dan kata sandi untuk masuk ke aplikasi")
                            .font(Font.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.secondary)
                            .padding(.bottom, 5)
                        
                        //Field Username
                        Text("Email \(Text("*").foregroundColor(.red)) :")
                            .font(Font.custom("Poppins-Regular", size: 16))
                        
                        TextField("Email", text: $username)
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .padding()
                            .background(Utama)
                            .cornerRadius(5.0)
                        
                        //Field Password
                        Text("Kata Sandi \(Text("*").foregroundColor(.red)) :")
                            .font(Font.custom("Poppins-Regular", size: 16))
            
                        ZStack {
                            SecureTextField(text: $password)
                                .padding()
                                .background(Utama)
                                .cornerRadius(5.0)
                        }
//                        TextField("Kata Sandi", text: $password)
//                            .padding()
//                            .background(Utama).cornerRadius(5.0)
                        
                        //Lupa Password Button
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("Lupa Password ?")
                                    .font(Font.custom("Poppins-Regular", size: 10))
                                    .foregroundColor(ButtonColor)
                                    .padding([.top, .bottom], 10)
                            }
                            
                        }
                        
                        Spacer()
                        
                        //Login Button
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("Login")
                                    .font(Font.custom("Poppins-Regular", size: 12))
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
                                .font(Font.custom("Poppins-Regular", size: 12))
                            
                            Button(action: {}) {
                                Text("Daftar")
                                    .font(Font.custom("Poppins-Regular", size: 12))
                                    .foregroundColor(ButtonColor)
                            }
                            Spacer()
                        }
                        .padding()
                        .padding(.bottom, 20)
                        
                            
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
                
                Text("PT Bank Digi telah berlisensi oleh Bank Indonesia dan diawasi oleh Otoritas Jasa Keuangan (OJK) serta merupakan peserta dari Lembaga Penjamin Simpanan (LPS).").font(Font.custom("Roboto-Regular", size: 8)).multilineTextAlignment(.center).padding(.top, 10).foregroundColor(.secondary)
            }
        }
    }
}

struct CreateAccount : View {
    
    @ObservedObject var NIK = NumbersOnly()
    @State var Name : String = ""
    @State var Phone : String = ""
    @State var Email : String = ""
    @State var Password : String = ""
    @State private var isToggled: Bool = false
    @State private var isPasswordVisible = false
    
    
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
                            .font(Font.custom("Poppins-Regular", size: 16))
                        Text("Masukkan informasik data diri untuk proses pembuatan akun.")
                            .font(Font.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.secondary)
                        Divider()
                            .padding(.bottom, 16)
                        Text("NIK \(Text("*").foregroundColor(.red)) : ")
                            .font(Font.custom("Poppins-Regular", size: 14))
                        TextField("NIK", text: $NIK.value)
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .padding()
                            .keyboardType(.numberPad)
                            .background(Utama).cornerRadius(5.0)
                        
                        Text("Nama Lengkap \(Text("*").foregroundColor(.red)) :")
                            .font(Font.custom("Poppins-Regular", size: 14))
                        TextField("Nama Lengkap", text: $Name)
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .padding()
                            .background(Utama).cornerRadius(5.0)
                        
                        Text("No. Telepon \(Text("*").foregroundColor(.red)) :")
                            .font(Font.custom("Poppins-Regular", size: 14))
                        TextField("No. Telepon", text: $Phone)
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .padding()
                            .background(Utama).cornerRadius(5.0)
                        
                        Text("Email \(Text("*").foregroundColor(.red)) :")
                            .font(Font.custom("Poppins-Regular", size: 14))
                        TextField("Email", text: $Email)
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .padding()
                            .background(Utama).cornerRadius(5.0)
                        
    
                        //PASSWORD
                        
                        Text("Password \(Text("*").foregroundColor(.red)) :")
                            .font(Font.custom("Poppins-Regular", size: 14))
                        ZStack {
                            SecureTextField(text: $Password)
                                .padding()
                                .background(Utama)
                                .cornerRadius(5.0)
                        }
                        Spacer()
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
                            .font(Font.custom("Poppins-Regular", size: 14))
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
    
    //@State var NIK : String = ""
    @ObservedObject var NIK = NumbersOnly()
    @ObservedObject var Rekening = NumbersOnly()
    //@State var Rekening : String = ""
    
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
                        .font(Font.custom("Poppins-Regular", size: 20))
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                
                
                ZStack {
                    VStack() {
                        Rectangle()
                            .frame(height: 601)
                            .foregroundColor(Kedua)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding([.leading, .trailing], 15)
                            
                        Spacer()
                        Spacer()
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Data akun")
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .padding(.top, 25)
                        Text("Masukkan informasi mengenai NIK dan Nomor Rekening yang sudah ada.")
                            .font(Font.custom("Poppins-Regular", size: 12))
                            .foregroundColor(.secondary)
                            .padding(.bottom, 10)
                        Divider()
                        Text("NIK \(Text("*").foregroundColor(.red)) : ")
                            .font(Font.custom("Poppins-Regular", size: 14))

                        TextField("NIK", text: $NIK.value)
                            .padding()
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .keyboardType(.numberPad)
                            .background(Utama).cornerRadius(5.0)
                        
                        Text("Nomor Rekening \(Text("*").foregroundColor(.red)) : ")
                            .font(Font.custom("Poppins-Regular", size: 14))
                        TextField("Nomor Rekening", text: $Rekening.value)
                            .padding()
                            .font(Font.custom("Poppins-Regular", size: 14))
                            .keyboardType(.numberPad)
                            .background(Utama).cornerRadius(5.0)
                        
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
                        .font(Font.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.white)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
