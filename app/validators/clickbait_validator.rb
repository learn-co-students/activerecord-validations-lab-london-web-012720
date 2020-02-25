class ClickbaitValidator < ActiveModel::EachValidator
    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]
    
    def validate_each(record, attribute, value)
        
            if CLICKBAIT_PATTERNS.none? { |pat| pat.match value}
              record.errors[attribute] << "must be clickbait"
            end
    end
end