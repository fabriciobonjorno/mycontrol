# frozen_string_literal: true

class IntegrationClientReporter < ApplicationRecord
  belongs_to :reportable, polymorphic: true
end
