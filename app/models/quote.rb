class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  broadcasts_to ->(quote) { "quotes"}, inserts_by: :prepend

  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }

  # shorthand for:
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }
  #
  # can add target: "turbo_frame_tag_name"; defaults to plural of model name
  # locals: { quote: self } is the default ({ model name => self })
  #
  # By default, the target option will be equal to model_name.plural,
  #   which is equal to "quotes" in the context of our Quote model.
  #   Thanks to this convention, we can remove the
  #   target:"quotes" option:
  #
  # The partial default value is equal to calling to_partial_path
  #   on an instance of the model, which by default in Rails for
  #   our Quote model is equal to "quotes/quote".
  #
  # The locals default value is equal to
  #   { model_name.element.to_sym => self } which, in in the context
  #   of our Quote model, is equal to { quote: self }.
end
