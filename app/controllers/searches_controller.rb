class SearchesController < ApplicationController
	def search 
		user_name_ids = User.where("user_name = ?", params[:submit_name]) .pluck(:id)
#プルダウンで選ばれたsubmit_nameと同一のsubmi_nameを持つレコードを取得し、そのidを全て列挙する
		problem_name_ids = Submit.where("problem_name LIKE (?)", "#{params[:problem_name]}").pluck(:id)
#キーワードで検索された名前と同じproblem_nameと同じproblem_nameを持つレコードのidを全て列挙する
	@submit_searched = Submit.where("submit_id IN (?) or submit_id IN (?)", submit_name_ids, problem_name_ids)
	end
end
