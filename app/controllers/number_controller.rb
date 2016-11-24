require 'prime'
class NumberController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def input
  end

  def view
    n=params[:n].to_i
    @arr=(1..1.0/0.0).
        lazy.map{|x| 2**x - 1}
             .take_while{|x| x < n}
             .select{|x| Prime.prime?(x)}.to_a
  end

  def index
  end
end
