class Notifier < ActionMailer::Base
  default from: "tiketee@gmail.com"
  
    def comment_updated(comment, user)
      @comment = comment
      @user = user
      mail(:to => user.email, :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}", 
      :from => "Ticketee <youraccount+#{comment.project.id}+#{comment.ticket_id}@example.com>")
    end
end
