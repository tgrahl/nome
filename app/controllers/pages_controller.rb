class PagesController < ApplicationController
  def index
  	@biographicaldata =BiographicalData.new
  end

  def save_biographical_data
  @biographicaldata =current_user.biographical_datas.create(params[:biographical_data])
  @course = Course.new
	 if @biographicaldata.save
		 respond_to do |format|
		  format.js
		 end
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

  def referral_data_save
  
  if !params[:next].present?
    @education =Education.find(params[:education_id])
    @education_refrences =@education.refrences
    @refrence =Refrence.create(params[:refrence])
    @refrence.education_id = params[:education_id]
    @refrence.save
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
