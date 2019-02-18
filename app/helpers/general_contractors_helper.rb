module GeneralContractorsHelper
  def status_accepted_gc(project, gc_id)
    gc = project.matching_gcs.where(general_contractor_id: gc_id, renovation_project_id: project.id)

    unless gc.blank?
      if gc.first.is_contractor_accepted
        'Accepted'
      elsif gc.first.is_contractor_rejected
        'Rejected'
      end
    end  
  end
end
