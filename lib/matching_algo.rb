class MatchingAlgo
  def initialize(project)
    @lat = project.latitude
    @lng = project.longitude
    @min_budget = project.min_budget
    @max_budget = project.max_budget
    @design_needed = project.is_design_service_req
    @build_nedded = project.is_build_service_req
  end

  def find_match
    res = GeneralContractor.where(id: filter_by_location).where.not(engaged_with: GeneralContractor::MAX_ENGAGEMENT)

    if @design_needed
      res = res.where(is_offering_design_service: @design_needed)
    elsif @build_nedded
      res = res.where(is_offering_build_service: @build_nedded)
    else
      res = res.where("is_offering_design_service = ? AND is_offering_build_service = ?", @design_needed, @build_nedded)  
    end

    res.where("min_project_budget >= (?) AND max_project_budget <= (?)", @min_budget, @max_budget).order(:rank).limit(3)
  end

  def filter_by_location
    query = <<-SQL.squish
    SELECT id FROM general_contractors 
    GROUP BY id
    HAVING coalesce( 6371 * acos( cos( radians(#{@lat}) ) * cos( radians( latitude ) ) * 
    cos( radians( longitude ) - radians(#{@lng}) ) + sin( radians(#{@lat}) ) * 
    sin( radians( latitude ) ) ) ) < 10 
    SQL

    ActiveRecord::Base.connection.execute(query).values.flatten
  end
end