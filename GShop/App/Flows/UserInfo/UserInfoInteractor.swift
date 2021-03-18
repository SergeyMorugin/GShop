//
//  UserInfoInteractor.swift
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

protocol UserInfoBusinessLogic {
    func showUserInfo(request: UserInfoModel.Show.Request)
    func updateUserInfo(request: UserInfoModel.Update.Request)
}

protocol UserInfoDataStore {
    var userInfo: UserInfo? { get set }
}

class UserInfoInteractor: UserInfoBusinessLogic, UserInfoDataStore {
    var userInfo: UserInfo?
    var presenter: UserInfoPresentationLogic?
    private let updateUserInfo = RequestFactory().makeChangeUserDataRequestFatory()
    // MARK: Do something
    func showUserInfo(request: UserInfoModel.Show.Request) {
        guard let userInfo = self.userInfo else { return }
        self.presenter?.presentShow(response: .init(userInfo: userInfo))
    }
    // MARK:
    func updateUserInfo(request: UserInfoModel.Update.Request) {
        updateUserInfo.changeUserData(
            id: "1",
            username: request.username,
            password: "",
            email: request.email,
            gender: request.gender,
            creditCard: "",
            bio: request.bio,
            completionHandler: { resp in
                switch resp.result {
                case .success(let model):
                    guard
                        let _ = self.userInfo
                    else { return }
                    self.userInfo = UserInfo(
                        email: request.email,
                        username: request.username,
                        gender: request.gender,
                        bio: request.bio)
                    self.presenter?.presentUpdate(
                        response: .success(UserInfo(
                            email: request.email,
                            username: request.username,
                            gender: request.gender,
                            bio: request.bio)))
                case .failure:
                    guard
                        let userInfo = self.userInfo
                    else { return }
                    self.presenter?.presentUpdate(response:
                        .failure(UserInfo(
                            email: userInfo.email,
                            username: userInfo.username,
                            gender: userInfo.gender,
                            bio: userInfo.bio)))
                }
            }
        )
    }
}