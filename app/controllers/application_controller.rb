class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_cart

  private

  # セッションに保存したIDでショッピングカートを取り出す。
  # まだカートが無ければ（初めてのアクセス）新しく作成し、そのIDをsession[:cart_id]に保存する。
  # セッションCookieには有効期限が無いため、ブラウザを閉じるまでカートの内容が保持される。
  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
