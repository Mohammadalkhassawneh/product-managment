class ProductsController < ApplicationController
    before_action :authenticate_request

  
    def index
      product_endpoint = 'https://giftcards-sandbox.reloadly.com/countries/ae/products'
    
      response = RestClient.get(product_endpoint, { Authorization: @access_token, Accept: 'application/com.reloadly.giftcards-v1+json' })
      products_data = JSON.parse(response.body)
    
      products_data.each do |product_data|
        # Create or update the product in the database based on the product ID
        product = Product.find_or_initialize_by(product_id: product_data['productId'])
        product.product_name = product_data['productName']
        product.global = product_data['global']
        product.sender_fee = product_data['senderFee']
        product.sender_fee_percentage = product_data['senderFeePercentage']
        product.discount_percentage = product_data['discountPercentage']
        product.denomination_type = product_data['denominationType']
        product.recipient_currency_code = product_data['recipientCurrencyCode']
        product.min_recipient_denomination = product_data['minRecipientDenomination']
        product.max_recipient_denomination = product_data['maxRecipientDenomination']
        product.sender_currency_code = product_data['senderCurrencyCode']
        product.min_sender_denomination = product_data['minSenderDenomination']
        product.max_sender_denomination = product_data['maxSenderDenomination']
        product.fixed_recipient_denominations = product_data['fixedRecipientDenominations']
        product.fixed_sender_denominations = product_data['fixedSenderDenominations']
        product.fixed_recipient_to_sender_denominations_map = product_data['fixedRecipientToSenderDenominationsMap']
        product.logo_urls = product_data['logoUrls']
        product.brand = product_data['brand']
        product.country = product_data['country']
        product.redeem_instruction = product_data['redeemInstruction']
    
        product.save
      end
    
      render 'index', locals: { products_data: products_data }
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
    
    
    
    
  
    private
  
    def authenticate_request
      client_id = ENV['CLIENT_ID']
      client_secret = ENV['CLIENT_SECRET']
      audience = ENV['AUDIENCE']
      
      token_endpoint = ENV['TOKEN_ENDPOINT']
      payload = {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'client_credentials',
        audience: audience
      }
      
      response = RestClient.post(token_endpoint, payload)
      token_data = JSON.parse(response.body)
      @access_token = "#{token_data['token_type']} #{token_data['access_token']}"
    end
    
    
  end
  