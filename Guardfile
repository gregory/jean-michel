# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :minitest do
  # with Minitest::Unit
  #watch(%r{^test/(.*)\/?test_(.*)\.rb})
  #watch(%r{^lib/(.*/)?([^/]+)\.rb})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  #watch(%r{^test/test_helper\.rb})      { 'test' }

  # with Minitest::Spec
  watch(%r{^spec/(.*)_spec\.rb})
  #watch(%r{^lib/(.+)\.rb})         { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^domain/(.+)\.rb})         { |m| "spec/domain/#{m[1]}_spec.rb" }
  watch(%r{^ports/(.+)\.rb})         { |m| "spec/ports/#{m[1]}_spec.rb" }
  watch(%r{^app/commands/(.+)\.rb})       { |m| "spec/use_cases/#{m[1]}_spec.rb" }
  watch(%r{^app/api/(.+)\.rb})       { |m| "spec/api/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/application_controller\.rb}) { 'spec/integration' }
  watch(%r{^app/controllers/(.+)_controller\.rb})        { |m| "spec/integration/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb}) { 'spec' }

  # Rails 4
  # watch(%r{^test/test_helper\.rb}) { 'test' }
  # watch(%r{^test/.+_test\.rb})
  # watch(%r{^app/(.+)\.rb})                               { |m| "test/#{m[1]}_test.rb" }
  # watch(%r{^app/controllers/application_controller\.rb}) { 'test/controllers' }
  # watch(%r{^app/controllers/(.+)_controller\.rb})        { |m| "test/integration/#{m[1]}_test.rb" }
  # watch(%r{^app/views/(.+)_mailer/.+})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
  # watch(%r{^lib/(.+)\.rb})                               { |m| "test/lib/#{m[1]}_test.rb" }

  # Rails 3.2
  # watch(%r{^app/controllers/(.*)\.rb}) { |m| "test/controllers/#{m[1]}_test.rb" }
  # watch(%r{^app/helpers/(.*)\.rb})     { |m| "test/helpers/#{m[1]}_test.rb" }
  # watch(%r{^app/models/(.*)\.rb})      { |m| "test/unit/#{m[1]}_test.rb" }

  # Rails
  # watch(%r{^app/controllers/(.*)\.rb}) { |m| "test/functional/#{m[1]}_test.rb" }
  # watch(%r{^app/helpers/(.*)\.rb})     { |m| "test/helpers/#{m[1]}_test.rb" }
  # watch(%r{^app/models/(.*)\.rb})      { |m| "test/unit/#{m[1]}_test.rb" }
end
