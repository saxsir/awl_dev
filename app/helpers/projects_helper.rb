# -*- coding: utf-8 -*-
module ProjectsHelper


#ログインフォームを置くために使う
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def reward_preview(reward)
    render :inline => <<-HAML, :type => :haml, :locals => {:reward => reward}
.span12#rewards
  %h4= "¥#{reward.amount}支援すると"
  %br
  %p= reward.description
  %br
  #reward-partner
    = image_tag('projects/Partner.png')
    %strong= "#{reward.support.length}/#{reward.quantity_limit} Partner"
  %br
  %hr
  HAML
  end
    def reward_preview_ajax(reward)
    render :inline => <<-HAML, :type => :haml, :locals => {:reward => reward}
.span12#rewards{:style => "display:none"}
  %h4= "¥#{reward.amount}支援すると"
  %br
  %p= reward.description
  %br
  #reward-partner
    = image_tag('projects/Partner.png')
    %strong= "#{reward.support.length}/#{reward.quantity_limit} Partner"
  %br
  %hr
  HAML
  end
end
