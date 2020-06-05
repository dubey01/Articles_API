module Api

	module V1

		class ArticlesController < ApplicationController

			def index
				articles = Article.order('created_at ASC')
				render json: {status: 'SUCCESS (Great Work)', message:'Loaded articles', data: articles}, status: :ok
			end

			def show
				article = Article.find(params[:id])
				render json: {status: 'SUCCESS (Great Work)', message:'Loaded article', data: article}, status: :ok
			end

			def create
				article = Article.new(article_params)

				if article.save
					render json: {status: 'SUCCESS (Great Work)', message:'Article Saved', data: article}, status: :ok
				else
				    render json: {status: 'Error (Correct the error)', message:'Unable to load', data: article.errors}, status: :failed_design
				end
			end

			def destroy
				article = Article.find(params[:id])
				article.destroy
				render json: {status: 'SUCCESS (Great Work)', message:'Article Deleted', data: article}, status: :ok

			end

			def update
				article = Article.find(params[:id])

				if article.update_attributes(article_params)
					render json: {status: 'SUCCESS (Great Work)', message:'Article Updated', data: article}, status: :ok
				else
					render json: {status: 'Failure (Failed Updation)', message:'Article not able to update', data: article}, status: :ok
				end
			end

			private

			def article_params
				params.permit(:title, :body)
			end

		end
	end
end
