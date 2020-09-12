//
//  DataManager.swift
//  SimpleMesageApp
//
//  Created by ddyack on 12.09.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    private let userOne = User(login: "tim",
                    password: "123",
                    profile: Profile(type: .tim,
                                     name: "Tim",
                                     surname: "Cook",
                                     avatar: "tim",
                                     about: "Ти́моти До́нальд Кук (англ. Timothy Donald Cook; род. 1 ноября 1960 года, Мобил, Алабама, США) — американский менеджер и генеральный директор компании Apple. Пришёл в компанию в марте 1998 года. Занял должность гендиректора после отставки (в связи с продолжительной болезнью) Стива Джобса 24 августа 2011 года."))
    
    private let userTwo = User(login: "bill",
                       password: "123",
                       profile: Profile(type: .bill,
                                        name: "Bill",
                                        surname: "Gates",
                                        avatar: "bill",
                                        about: "Уи́льям Ге́нри Гейтс III (англ. William Henry Gates III; 28 октября 1955, Сиэтл, Вашингтон), более известный как Билл Гейтс (англ. Bill Gates) — американский предприниматель и общественный деятель, филантроп, один из создателей (совместно с Полом Алленом) и бывший крупнейший акционер компании Microsoft. До июня 2008 года являлся руководителем компании, после ухода с поста остался в должности её неисполнительного председателя совета директоров. Также является сопредседателем благотворительного Фонда Билла и Мелинды Гейтс, членом совета директоров Berkshire Hathaway, ген. директор Cascade investment."))
    
    var users: [User] {
        [userOne, userTwo]
    }
    
    var messages: [Message] = [Message(text: "Привет Тим",
                                       person: DataManager.shared.userOne.profile),
                               Message(text: "Привет Билл",
                                       person: DataManager.shared.userTwo.profile)]
    
    
}
