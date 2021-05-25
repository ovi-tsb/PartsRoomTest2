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
      module_size: 2,
      standalone: true
    ).html_safe

    # qrcode = RQRCode::QRCode.new("http://github.com/")
    # png = qrcode.as_png(
    #       bit_depth: 1,
    #       border_modules: 4,
    #       color_mode: ChunkyPNG::COLOR_GRAYSCALE,
    #       color: 'black',
    #       file: nil,
    #       fill: 'white',
    #       module_px_size: 6,
    #       resize_exactly_to: false,
    #       resize_gte_to: false,
    #       size: 120
    #     )
    # # self.update!(qr_code_image: png.to_s)
    # # IO.binwrite("/tmp/github-qrcode.png", png.to_s)
    # File.binwrite("/tmp/github-qrcode.png", png.to_s)


  end
end