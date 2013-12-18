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
	  format.html {redirect_to course_qualification_path(:biographical_data_id => @biographicaldata.id)}
   end
    
  end

  def course_qualification
    if params[:course_back_id].present?
        @course =Course.find(params[:course_back_id])
        @biographicaldata =BiographicalData.find(@course.biographical_data_id)
    else
      @course = Course.new
       @biographicaldata =BiographicalData.find(params[:biographical_data_id])
    end
   
  end

  def course_qualification_save
   
  
    @course =Course.create(params[:course])
    @course.biographical_data_id = params[:biographical_data_id]
    @course.save
    

     respond_to do |format|
      format.html {redirect_to education_path(:course_id => @course.id)}
     end
  end

  def education 
    if !params[:education_id].nil?
       @education = Education.find(params[:education_id])
       @course =  Course.find(@education.course_id)
    else
      @course =Course.find(params[:course_id])
      @education = Education.new
    end
  end

  def education_save_data
    @education =Education.create(params[:education])
    @education.course_id =params[:course_id]
    @education.save
    
     respond_to do |format|
      format.html {redirect_to reference_path(:education_id=>@education.id)}
     end
  end

  def reference 
    if !params["ref_id"].blank?
      @refrence = Refrence.find(params[:ref_id])
    else
      @refrence =Refrence.new
    end
    @education =Education.find(params[:education_id])
    @education_refrences =@education.refrences
    
    if !@refrence.id.nil?
      @attached_files = @refrence.document_references
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

    respond_to do |format|
      format.html {redirect_to reference_path(education_id: params[:education_id])}
    end

  end

  def destroy_ref_document
    @docu_ref = DocumentReference.find(params[:file_id])
    @ref_id = @docu_ref.refrence_id
    @docu_ref.destroy

    respond_to do |format|
      format.html {redirect_to reference_path(:ref_id => @ref_id, education_id: params[:education_id])}
    end

  end



  def referral_data_save

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

    if !params[:ref_document].blank?
      params[:ref_document].each do |ref_document|
        @docu_ref = DocumentReference.create(ref_document: ref_document)
        @docu_ref.refrence_id = @refrence.id
        @docu_ref.save
      end
    end

    @refrence = Refrence.new

    respond_to do |format|
      format.html {redirect_to reference_path(education_id: @education.id)}
    end

  end

  def supporting_documents
    @supporting_document = UserSupportingDocument.new 
    @documents =SupportingDocument.all
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
