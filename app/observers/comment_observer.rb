class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    (comment.ticket.watchers - [comment.user]).each do |user|
      Notifier.comment_updated(comment,user).deliver
    end
  end
  
  def comment_updated(comment,user)
    @comment = comment
    @user = user
    mail(:to => user.email, :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end