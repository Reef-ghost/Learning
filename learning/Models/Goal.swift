

// هنا احنا عرفنا شيء داخله عدة خيارات وهذي الفايدة من إنم
enum GoalDuration {
    case weak
    case month
    case year
    
    // هذا الشي اسمه Computed Property
    //هي معلومة عن شي لكن ما نخزنها نقدر نحسبها من معلومة موجودة عندنا
    var days : Int {
        
        switch self {
            //سويتش هنا وظيفتها تقارن القيم ولو لقت شيء مطابق تنفذ الي داخله
            //سيلف هنا عشان نعلمها اي اوبجكت بالضبط نبي و تروح له نفسه
        case .weak:
            return 7
            
        case .month:
            return 30
            
        case .year:
            return 365
            
            
            
        }
        
        
    }
    
}
