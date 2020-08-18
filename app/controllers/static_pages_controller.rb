class StaticPagesController < BaseController
  def home
    @test = ENV["HOME"]
  end
end
