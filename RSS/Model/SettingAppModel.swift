//
//  SettingAppModel.swift
//  RSS
//
//  Created by Daniil G on 30/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation

enum ChoiceButton: String {
    case addChannel = "Добавить канал"
    //case nightMode = "Ночной режим"
    case about = "О приложении"
}

class SettingAppModel {
    var nightMode: Bool = true
}
