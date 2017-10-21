json.extract! wpt, :id, :url_id, :load_t, :first_byte_t, :dom_interactive_t, :document_complete_t, :request_count, :speed_index, :ref, :created_at, :updated_at
json.url wpt_url(wpt, format: :json)
