class ConfirmMailer < ApplicationMailer
  def confirm_mail(confirm)
    @confirm = confirm

    mail to: @confirm.user.email, subject: @confirm.user.name + "さんの記事を作成しました"
  end
end
