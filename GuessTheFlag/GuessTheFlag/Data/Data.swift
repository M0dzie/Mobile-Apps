//
//  Data.swift
//  GuessTheFlag
//
//  Created by Thomas Meyer on 19/01/2024.
//

import SwiftUI
import SwiftData


/* ------- USER ------- */
@Model
class User {
    var name: String
    var password: String
    var mail: String
    
    var maxScore: Int
    
    init(name: String, password: String, mail: String, maxScore: Int) {
        self.name = name
        self.password = password
        self.mail = mail
        self.maxScore = maxScore
    }
}

/* ------- FAKE LEADERBOARD ------- */
var leaderboard = [
    "Thomas": 64,
    "Zoé": 39,
    "Lucas": 24,
    "Cyril": 32,
    "Alice": 78,
    "Bob": 45,
    "Charlie": 50,
    "David": 60,
    "Eva": 42,
    "Frank": 55,
    "Grace": 68,
    "Hank": 30,
    "Ivy": 90,
    "Jack": 75,
    "Kate": 80,
    "Liam": 88,
    "Mia": 36,
    "Noah": 92,
    "Olivia": 65,
    "Peter": 52,
    "Quinn": 84
]


/* ------- LIST OF CONTINENTS ------- */
let continents = [
    "Europe": Europe,
    "Asia": Asia,
    "America": America,
    "Oceania": Oceania,
    "Africa": Africa
]


/* ------- LIST OF COUNTRIES ------- */
let Europe = ["Estonia", "France", "Germany", "Ireland", "Italy", "Poland", "Spain", "UK", "Ukraine", "Montenegro", "Albania", "Netherlands", "Austria", "North Macedonia", "Belgium", "Norway", "Bosnia and Herzegovina", "Portugal", "Bulgaria", "Romania", "Croatia", "Russia", "Czech Republic", "Serbia", "Denmark", "Slovakia", "Finland", "Slovenia", "Greece", "Sweden", "Hungary", "Switzerland", "Kosovo", "Monaco", "Andorra", "Belarus", "Cyprus", "Georgia", "Iceland", "Latvia", "Liechtenstein", "Lithuania", "Malta", "San Marino", "Vatican City", "Aland Islands", "Faroe Islands", "England", "Northern Ireland", "Wales", "Scotland", "Luxembourg", "Martinique", "Guernsey", "Gibraltar", "Jersey", "Moldova", "Isle of Man"].shuffled()

let Asia = ["Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Laos", "Lebanon", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "North Korea", "Oman", "Pakistan", "Palestine", "Philippines", "Qatar", "Saudi Arabia", "Singapore", "South Korea", "Sri Lanka", "Syria", "Taiwan", "Tajikistan", "Thailand", "Timor-Leste", "Turkey", "Turkmenistan", "United Arab Emirates", "Uzbekistan", "Vietnam", "Yemen", "Diego Garcia", "Hong Kong", "Macau"].shuffled()

let America = ["US", "Canada", "Mexico", "Brazil", "Argentina", "Colombia", "Peru", "Venezuela", "Chile", "Ecuador", "Guatemala", "Cuba", "Bolivia", "Dominican Republic", "Honduras", "Paraguay", "El Salvador", "Nicaragua", "Costa Rica", "Puerto Rico", "Panama", "Uruguay", "Jamaica", "Trinidad and Tobago", "Guyana", "Suriname", "Belize", "Bahamas", "Barbados", "Saint Lucia", "Grenada", "Saint Vincent and the Grenadines", "Antigua and Barbuda", "Saint Kitts and Nevis", "Dominica", "Haiti", "Sint Maarten", "Aruba", "Curacao", "Bonaire", "Saba", "Sint Eustatius", "Greenland", "Bermuda", "Cayman Islands", "Turks and Caicos Islands", "Anguilla", "British Virgin Islands", "United States Virgin Islands", "Montserrat", "Saint Pierre and Miquelon", "Falkland Islands", "South Georgia and the South Sandwich Islands", "Saint Barthélemy"].shuffled()

let Oceania = ["Australia", "Papua New Guinea", "New Zealand", "Fiji", "Solomon Islands", "Samoa", "Kiribati", "Tonga", "Micronesia", "Marshall Islands", "Palau", "Tuvalu", "Nauru", "Cook Islands", "Niue", "American Samoa", "Guam", "Northern Mariana Islands", "Pitcairn Islands", "Tokelau", "Wallis and Futuna", "French Polynesia", "New Caledonia", "Vanuatu", "Cocos (Keeling) Islands", "Christmas Island", "Norfolk Island"].shuffled()

let Africa = ["Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "Cabo Verde", "Cameroon", "Central African Republic", "Chad", "Comoros", "Democratic Republic of the Congo", "Djibouti", "Egypt", "Equatorial Guinea", "Eritrea", "Eswatini", "Ethiopia", "Gabon", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", "Ivory Coast", "Kenya", "Lesotho", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique", "Namibia", "Niger", "Nigeria", "Rwanda", "Sao Tome and Principe", "Senegal", "Seychelles", "Sierra Leone", "Somalia", "South Africa", "South Sudan", "Sudan", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe", "Republic of the Congo", "Western Sahara", "Canary Islands", "Saint Helena", "Tristan da Cunha", "Ascension Island"].shuffled()


/* ------- RANKED LIST (WORLD) ------- */
let World = (Europe + Asia + America + Africa + Oceania).shuffled()
