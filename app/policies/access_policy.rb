# frozen_string_literal: true

class AccessPolicy
  include AccessGranted::Policy

  def configure
    role :user do
      can %i[create index show update destroy update_status edit], RenovationProject do |rp, current_user|
        rp.owner_id == current_user.id  && current_user.is_owner?
      end

      can %i[create index show update destroy update_status edit], GeneralContractor do |gc, current_user|
        gc.contractor_id == current_user.id && current_user.is_contractor?
      end
    end
  end
end
