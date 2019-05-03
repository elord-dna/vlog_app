class ExampleController < ApplicationController

  def test
    render json: "test"
  end

  def test2
    render json: {A:1,B:'test',name:"张三"}
  end

  def TNum
    render json: 3
  end
end
