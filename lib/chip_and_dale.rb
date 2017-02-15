# Exceptions Handling Module
module ChipAndDale
  extend ActiveSupport::Concern

  included do
    # InvalidAuthenticityToken exception <br>
    # Happens when logged in user opens separate window, loggs there off <br>
    # and tries to do anything on first window
    rescue_from ActionController::InvalidAuthenticityToken do |exception|
      if exception
        logger.warn "Rendering 422 with exception: #{exception.message}"
      end

      respond_to do |format|
        format.html { render file: "#{Rails.root}/public/422.html", status: :unprocessable_entity, layout: false }
        format.xml  { head :unprocessable_entity }
        format.any  { head :unprocessable_entity }
      end
    end

    # InvalidURIError exception <br>
    # happens when user is trying to open strange pages
    rescue_from URI::InvalidURIError do |exception|
      if exception
        logger.warn "Rendering 404 with URI::InvalidURIError exception: #{exception.message}"
      end

      respond_to do |format|
        format.html { render file: "#{Rails.root}/public/404.html", status: 404, layout: false }
        format.xml  { redirect_to root_path, alert: 'Page not found.' }
        format.any  { redirect_to root_path, alert: 'Page not found.' }
      end
    end

    # Weird formats
    rescue_from ActionController::UnknownFormat do |exception|
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    end
  end
end
