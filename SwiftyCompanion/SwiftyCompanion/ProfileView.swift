//
//  ProfileView.swift
//  SwiftyCompanion
//
//  Created by Thomas Meyer on 23/12/2024.
//

import SwiftUI


@MainActor class ProfileViewModel: ObservableObject {
    @Published var isAlert = false
    @Published var user: User
    @ObservedObject var contentVM: ContentViewModel
    
    init(contentVM: ContentViewModel) {
        self.contentVM = contentVM
        
        #if DEBUG
        self.user = User(id: 1, email: "omg@gmail.com", login: "thmeyer", firstName: "Thomas", lastName: "Meyer", image: UserImage(link: "www.caexistepas.com"), correctionPoint: 3, wallet: 1064, location: nil, active: true)
        #else
        self.user = contentVM.user
        #endif
    }
}


struct ProfileView: View {
    @ObservedObject var contentVM: ContentViewModel
    @StateObject var vm: ProfileViewModel
    
    init(contentVM: ContentViewModel) {
        self._contentVM = ObservedObject(wrappedValue: contentVM)
        self._vm = StateObject(wrappedValue: ProfileViewModel(contentVM: contentVM))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: URL(string: vm.user.image.link)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .scaleEffect(5)
                }
                .frame(width: 250, height: 250)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.secondary.opacity(0.8))
                        .frame(width: 200, height: 75)
                    
                    VStack {
                        HStack {
                            Text("₳ \(vm.user.wallet)")
                                .font(.title)
                            Text(vm.user.login)
                                .font(.title2.bold())
                        }
                        .foregroundStyle(.white)
                        
                        HStack {
                            Text(vm.user.firstName)
                            Text(vm.user.lastName)
                        }
                        .foregroundStyle(.secondary)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.isAlert = true
                    } label: {
                        Image(systemName: "person.crop.circle.badge.xmark.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .tint(.red)
                    }
                }
            }
        }
        .alert("Are you sure?", isPresented: $vm.isAlert) {
            Button("Yes") {
                contentVM.isLogged = false
                contentVM.isSheet = true
            }
            Button("No", role: .cancel) {}
        }
    }
}

#Preview {
    ProfileView(contentVM: ContentViewModel())
}
