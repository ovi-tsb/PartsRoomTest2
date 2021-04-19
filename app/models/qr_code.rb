class QrCode
  def self.call(url)
    new(url).call
  end

  attr_accessor :url
  def initialize(url)
    @url = url
  end

  def call
    qrcode = RQRCode::QRCode.new(url)
    qrcode.as_svg(
      offset: 0,
      color: '000000',
      module_size: 5,
      standalone: true
    ).html_safe
  end
end