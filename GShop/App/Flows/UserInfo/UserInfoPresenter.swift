//
//  UserInfoPresenter.swift
//  GShop
//
//  Created by Matthew on 12.03.2021.
//  Copyright (c) 2021 Ostagram Inc.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UserInfoPresentationLogic {
    func presentShow(response: UserInfoModel.Show.Response)
    func presentUpdate(response: UserInfoModel.Update.Response)
}

class UserInfoPresenter: UserInfoPresentationLogic {
    weak var viewController: UserInfoDisplayLogic?
    
    // MARK: Do something
    func presentShow(response: UserInfoModel.Show.Response){
        let viewModel = UserInfoModel.ViewModel(
            showModal: false,
            textMessage: "",
            email: response.userInfo.email,
            username: response.userInfo.username,
            gender: response.userInfo.gender,
            bio: response.userInfo.bio
        )
        self.viewController?.updateView(viewModel: viewModel)
    }
    
    func presentUpdate(response: UserInfoModel.Update.Response) {
        DispatchQueue.main.async {
            switch response {
            case .success(let data):
                let viewModel = UserInfoModel.ViewModel(
                    showModal: true,
                    textMessage: "Success",
                    email: data.email,
                    username: data.username,
                    gender: data.gender,
                    bio: data.bio)
                self.viewController?.updateView(viewModel: viewModel)
            case .failure(let data):
                let viewModel = UserInfoModel.ViewModel(
                showModal: true,
                textMessage: "Fail",
                email: data.email,
                username: data.username,
                gender: data.gender,
                bio: data.bio)
                self.viewController?.updateView(viewModel: viewModel)
            }
            
            
        }
    }
}
