class Personal < ApplicationRecord

	has_many :registros

	before_save :downcase_all

	def downcase_all
		self.nombres.downcase!
		self.apellidos.downcase!
	end

end
