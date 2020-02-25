class Post < ActiveRecord::Base
  
    validates :title, presence: true
    validates :content, :length => { minimum: 250 }
    validates :summary, :length => { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    
    validate :title_is_bait

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]
    
    def title_is_bait
        
            if CLICKBAIT_PATTERNS.none? { |pat| pat.match title}
              errors.add(:title, "must be clickbait")
            end
    end


end



#     t.string   "name"
#     t.string   "phone_number"
#     t.datetime "created_at",   null: false
#     t.datetime "updated_at",   null: false
#   end

#   create_table "posts", force: :cascade do |t|
#     t.string   "title"
#     t.text     "content"
#     t.text     "summary"
#     t.string   "category"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end