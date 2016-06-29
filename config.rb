require 'slim'
Slim::Engine.disable_option_validator!

activate :dotenv
activate :i18n, langs: %i(en fr), path: '/:locale/'
I18n.default_locale = :en

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

helpers do
  def svg_tag(svg, opts = {})
    content_tag :svg, opts do
      tag :use, 'xlink:href' => "##{svg}"
    end
  end

  def icon_tag(svg, opts = {})
    opts[:width] ||= 24
    opts[:height] ||= 24
    opts[:class] = [opts[:class], 'icon'].compact.join(' ')
    svg_tag("icon-#{svg}", opts)
  end

  def inline_svg(path)
    File.open "source/images/#{path}", 'rb', &:read
  end

  def image_set_tag(source, options = {})
    sizes = options.delete(:sizes) || %w(2x)
    srcset = sizes.map do |size|
      filename = File.basename(source, '.*')
      name = source.sub(filename, "#{filename}@#{size}")
      "#{asset_url('images/' + name)} #{size}"
    end.join(', ')

    image_tag(source, options.merge(srcset: srcset))
  end
end

configure :development do
  Slim::Engine.options[:pretty] = true
  activate :livereload, no_swf: true, apply_css_live: true
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash

  Slim::Engine.options[:pretty] = false

  # Use relative URLs
  # activate :relative_assets

  activate :asset_host
  set :asset_host, 'http://hemera.camp'

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
