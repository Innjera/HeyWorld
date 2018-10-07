class Sellers::InquiryController < ApplicationController
  def new_seller_register_inquiry
    @new_seller_register_inquiry = Inquiry.new
  end

  def new_seller_register_inquiry_confirm
    @inquiry = Inquiry.new(reqister_params)
    if @inquiry.valid?
      render action: 'new_seller_register_inquiry_confirm'
    else
      render action: 'new_seller_register_inquiry'
    end
  end

  def new_seller_register_thanks
    if params[:commit]
      # メール送信
      @inquiry = Inquiry.new(params[:inquiry])
      InquiryMailer.received_email(@inquiry).deliver
      # 完了画面を表示
      render :action => 'new_seller_register_thanks'
    else
      render action 'new_seller_register_inquiry'
    end
  end

  def reqister_params
    params.require(:inquiry).permit(
      :company_name, :company_tell, :company_url, :email, :email_confirmation, :contents
    )
  end
end
