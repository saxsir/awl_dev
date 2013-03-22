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
.span12.rewards.well{:id => "reward#{reward.id}"}
  %h4= "¥#{reward.amount} 支援すると"
  = link_to "削除", destory_reward_path(reward.project_id,reward.id),:method => :delete,:remote => true, :class=> "destroy-reward btn btn-small pull-right btn-inverse"
  %br
  %p= reward.description
  %br
  #reward-partner
    = image_tag('projects/Partner.png')
    %strong= "#{reward.support.length}/#{reward.quantity_limit} Partner"
  HAML
  end
  def reward_preview_ajax(reward)
    render :inline => <<-HAML, :type => :haml, :locals => {:reward => reward}
.span12.rewards.well{:id => "reward#{reward.id}"}
  %h4= "¥#{reward.amount} 支援すると"
  %br
  %p= reward.description
  %br
  #reward-partner
    = image_tag('projects/Partner.png')
    %strong= "#{reward.support.length}/#{reward.quantity_limit} Partner"
  HAML
  end
end
