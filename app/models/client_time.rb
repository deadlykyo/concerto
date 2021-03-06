class ClientTime < Content

  DISPLAY_NAME = 'Client Time'

  after_initialize :set_kind

  # Validations
  validates :duration, :numericality => { :greater_than => 0, :less_than => 60 }

  # Automatically set the kind for the content
  # if it is new.
  def set_kind
    return unless new_record?
    self.kind = Kind.where(:name => 'Text').first
  end
end
