json.extract! customer_application, :id, :name, :email, :mobile, :created_at, :updated_at
json.url customer_application_url(customer_application, format: :json)
