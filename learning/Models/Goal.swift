import Foundation

// هنا احنا عرفنا شيء داخله عدة خيارات وهذي الفايدة من إنم
enum GoalDuration: String, Codable {

    case week
    case month
    case year

    // هذا الشي اسمه Computed Property

    //هي معلومة عن شي لكن ما نخزنها نقدر نحسبها من معلومة موجودة عندنا

    var days : Int {

        switch self {

            //سويتش هنا وظيفتها تقارن القيم ولو لقت شيء مطابق تنفذ الي داخله

            //سيلف هنا عشان نعلمها اي اوبجكت بالضبط نبي و تروح له نفسه

        case .week:

            return 7

        case .month:

            return 30

        case .year:

            return 365

        }

    }

}

struct Goal: Codable {

    var topic : String

    var duration: GoalDuration // type (enum)

    var startDate: Date // type (struct)

    //"Date" its an Apple/Foundation's struct

    //":" means the type of startDate is Date

    //that's example of how different types can be used together inside a struct

}
