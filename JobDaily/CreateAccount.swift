import SwiftUI

struct CreateAccount: View {
    let title: String = "Create an Account"
    let subtitle: String = "Just a few quick things to get started"
    let currentStep: Int = 1
    let totalSteps: Int = 4
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConf: String = ""
    
    @State private var passwordHiding: Bool = true
    @State private var passwordConfHiding: Bool = true
    @State private var showAlert = false
    @State private var isLoading = false
    @State private var nextScreen = false
    @State private var complete = false
    
    var body: some View {
        NavigationView {
            VStack{
                ProgressHeader(title: title, subtitle: subtitle, currentStep: currentStep, totalSteps: totalSteps)
                
                Text("Sign up with")
                    .padding(.top, 20)
                
                HStack(spacing: 125) {
                    Button("Google"){
                        showAlert = true
                    }
                    .padding(.top, 10)
                    .foregroundColor(.black)
                    .alert("TODO: IMPLEMENT GOOGLE AUTH", isPresented: $showAlert) {
                        Button("OK", role: .cancel){}
                    } message: {
                        Text("GOOGLE AUTH NOT IMPLEMENTED AT THIS TIME")
                    }
                    
                    Button("Apple"){
                        showAlert = true
                    }
                    .padding(.top, 10)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .alert("TODO: IMPLEMENT GOOGLE AUTH", isPresented: $showAlert) {
                        Button("OK", role: .cancel){}
                    } message: {
                        Text("APPLE AUTH NOT IMPLEMENTED AT THIS TIME")
                    }
                }
                .padding(.bottom, 10)
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("First Name*").padding(.horizontal)
                    TextField("", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    
                    Text("Last Name*").padding(.horizontal)
                    TextField("", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    
                    Text("Email*").padding(.horizontal)
                    TextField("", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                        .textContentType(.emailAddress)
                        .autocorrectionDisabled(true)
                    
                    Text("Password*").padding(.horizontal)
                    HStack {
                        Group {
                            if passwordHiding {
                                SecureField("Enter Password", text: $password)
                            } else {
                                TextField("Enter Password", text: $password)
                            }
                        }
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .textContentType(.newPassword)
                        
                        Button(action: { passwordHiding.toggle() }) {
                            Image(systemName: passwordHiding ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color(.systemBackground))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .padding(.horizontal)
                    
                    // Password Confirmation reverts to plain text upon clicking on the field
                    Text("Confirm Password*").padding(.horizontal)
                    HStack {
                        Group {
                            if passwordConfHiding {
                                SecureField("Password Confirmation", text: $passwordConf)
                            } else {
                                TextField("Password Confirmation", text: $passwordConf)
                            }
                        }
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .textContentType(.newPassword)
                        
                        Button(action: { passwordConfHiding.toggle() }) {
                            Image(systemName: passwordConfHiding ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color(.systemBackground))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                
                NavigationLink(destination: ResumeUpload()){
                    Text("Continue->")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(allFieldsFilled() ? Color.gray : Color.black)
                        .cornerRadius(10)
                        .padding()
                }
                .disabled(allFieldsFilled())
            }
        }
        
    }
    private func allFieldsFilled() -> Bool {
        return firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || passwordConf.isEmpty
    }
}

#Preview {
    CreateAccount()
}
