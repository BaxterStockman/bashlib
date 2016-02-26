SimpleCov.configure do
    if ENV['SIMPLECOV_ALLOW_FOREIGN']
        profiles.delete :root_profile
        filters.delete_at 1
    end

    add_filter do |source_file|
        !source_file.filename.end_with? 'bashlib'
    end
end
