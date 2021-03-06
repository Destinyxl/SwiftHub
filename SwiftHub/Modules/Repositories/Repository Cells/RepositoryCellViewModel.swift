//
//  RepositoryCellViewModel.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 6/30/18.
//  Copyright © 2018 Khoren Markosyan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RepositoryCellViewModel {

    let title: Driver<String>
    let detail: Driver<String>
    let secondDetail: Driver<String>
    let imageUrl: Driver<URL?>

    let repository: Repository

    init(with repository: Repository) {
        self.repository = repository
        title = Driver.just("\(repository.fullName ?? "")")
        detail = Driver.just("\(repository.descriptionField ?? "")")
        secondDetail = Driver.just("★ \(repository.stargazersCount ?? 0)")
        imageUrl = Driver.just(repository.owner?.avatarUrl?.url)
    }
}

extension RepositoryCellViewModel: Equatable {
    static func == (lhs: RepositoryCellViewModel, rhs: RepositoryCellViewModel) -> Bool {
        return lhs.repository == rhs.repository
    }
}
