class SendInvoiceMailer < ActionMailer::Base
  default from: "robot@infoservicios.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_invoice_mailer.send_invoice.subject
  #
  def send_invoice order
    @order = order
    mail to: [order.email],
      :subject => "Invoice [Infoservicios]"
  end
end
