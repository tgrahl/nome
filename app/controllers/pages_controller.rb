class PagesController < ApplicationController
  def index
    
    if params[:id].present?
      @biographicaldata =BiographicalData.find(params[:id])
    else
     	@biographicaldata =BiographicalData.new
    end
     respond_to do |format|
      format.js
      format.html
     end
  end

  def save_biographical_data
  if params[:course_back_id].present?
        @course =Course.find(params[:course_back_id])
        @biographicaldata =BiographicalData.find(@course.biographical_data_id)
    else

      @biographicaldata =current_user.biographical_datas.create(params[:biographical_data])
      @course = Course.new
    end
      
       respond_to do |format|
  		  format.js
       end
    
  end

  def course_qualification_save
   
  
    @course =Course.create(params[:course])
    @course.biographical_data_id = params[:biographical_data_id]
    @course.save
    @education = Education.new

     respond_to do |format|
      format.js
     end
  end

  def education_save_data
  @education =Education.create(params[:education])
  @education.course_id =params[:course_id]
  @education.save
  @education_refrences =@education.refrences
  @refrence =Refrence.new
     respond_to do |format|
      format.js
     end
  end

  def save_education_data
    if params[:education_back_id].present?
        @education =Education.find(params[:education_back_id])
        @course = Course.find(@education.course_id)
        # @biographicaldata =BiographicalData.find(@course.biographical_data_id)
    else
      # biographicaldata =current_user.biographical_datas.create(params[:biographical_data])
      @education = Education.new
    end
      
       respond_to do |format|
        format.js
       end
    
  end

  def edit_referral_data
    @refrence = Refrence.find(params[:ref_id])
    @education =Education.find(params[:education_id])
    @education_refrences =@education.refrences
  end

  def destroy_ref_data
    @ref = Refrence.find(params[:ref_id])
    @ref.destroy

    @education =Education.find(params[:education_id])
    @education_refrences =@education.refrences

    @refrence = Refrence.new

  end



  def referral_data_save
  
  if !params[:next].present?
    @education =Education.find(params[:education_id])
    @education_refrences =@education.refrences
    if params["ref_id"].blank?
      @refrence =Refrence.create(params[:refrence])
      @refrence.education_id = params[:education_id]
      @refrence.save
    else
      @refrence = Refrence.find(params["ref_id"])
      @refrence.update_attributes(params[:refrence])
    end
     @refrence = Refrence.new
  else
    @supporting_document = UserSupportingDocument.new 
    @documents =SupportingDocument.all
  end
   respond_to do |format|
      format.js
     end
  end

  def supporting_document_save
  if !params[:document_given].nil?
    params[:document_given].each do |document_id|
    
     @document =SupportingDocument.find(document_id)

     if !params[:certified].nil? && params[:certified].include?(document_id)
 
       @supporting_document = @document.user_supporting_documents.create(:user_id=>current_user.id,:document_given=>true,:certified=>false)
     else

      @supporting_document = @document.user_supporting_documents.create(:user_id=>current_user.id,:document_given=>true,:certified=>false)
   
     end
   end
 end
     @unmatch_certified = []
     if !params[:certified].nil?
      params[:certified].each do |certified|
        if  params[:document_given].include?(certified) == false
        @unmatch_certified <<  certified
        end
      end
    end

    if !@unmatch_certified.nil? && !@unmatch_certified.blank?
      @unmatch_certified.each do |un_match|
        @document =SupportingDocument.find(un_match)
        @supporting_document = @document.user_supporting_documents.create(:user_id=>current_user.id,:document_given=>false,:certified=>true)
    end
   end
   respond_to do |format|
      format.js
     end
  end
end
