class Sort < ApplicationRecord
	validates :sort,presence:true,uniqueness:{case_sensitive:false}
end
