json.extract! dossier, :id, :name, :client, :result, :created_at, :updated_at
json.url dossier_url(dossier, format: :json)