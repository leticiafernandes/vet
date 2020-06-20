def get_value_from_json(key)
    JSON.parse(response.body)[key]
end