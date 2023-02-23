//
//  ProfileViewModel.swift
//  TheMovie-iOS
//
//  Created by Diego David Rodríguez Reyna on 21/02/23.
//

import Foundation

final class ProfileViewModel {
    var api: ProfileAPI
    var profileList: [ProfileList] = []
    @ViewModelState var state: APIState?
    var errorMessage: String?
    
    init(api: ProfileAPI) {
        self.api = api
    }
    
    func requestProfiles() {
       state = .loading
       api.load(.profile) { (result: Result<ProfileResults, Error>) in
          switch result {
             case .success(let profile):
              print(profile.username)
                //self.perfilList(with: profileResults)
                self.state = .success
              print(profile.user)
             case .failure(let error):
                let error = error as? APIError
                switch error {
                   case .internalServer:
                      print("error")
                   default:
                      self.errorMessage = "Something went wrong"
                      fatalError()
                }
                self.state = .failure

          }
       }
    }
    
    /** private func perfilList(with profile: [ProfileResults]) {
        profileList = profile.map { perfil in
          ProfileList(from: perfil)
       }
    } **/
}
