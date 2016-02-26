SimpleCov.configure do
    unless ENV['SIMPLECOV_DISALLOW_FOREIGN']
        profiles.delete :root_profile
        filters.delete_at 1
    end

    add_filter do |source_file|
        !source_file.filename.end_with? 'bashlib'
    end
end
