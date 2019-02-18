module RenovationProjectsHelper
  def status_accepted(project, gc_id)
    gc = project.matching_gcs.where(general_contractor_id: gc_id, renovation_project_id: project.id)
    unless gc.blank?
      if gc.first.is_owner_accepted
        'Accepted'
      elsif gc.first.is_owner_rejected
        'Rejected'
      end
    end  
  end
end
