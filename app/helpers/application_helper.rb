module ApplicationHelper
    def thumbnail(image)
        image.variant(resize: '500x500').processed
    end

    def find_time(t)
        a = t.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata'))
        a.strftime("at %I : %M %p")
    end
     
    def find_date(d)
        d.strftime("%d %b, %y") 
    end

    def format_category(c,a)
        "#{c}  (#{a})"
    end
end
