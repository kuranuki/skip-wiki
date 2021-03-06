class Admin::AttachmentsController < Admin::ApplicationController

  def index
    @attachments = (if requested_note
                      requested_note.attachments
                    else
                      Attachment
                    end).paginate(paginate_option(Attachment))
    @per_page = (params[:per_page] || 10).to_i
    @topics = [_("Attachment|Index")]
  end

  def show
    @attachment = Attachment.find(params[:id])
    opts = {:filename => @attachment.display_name, :type => @attachment.content_type }
    opts[:disposition] = "inline" if params[:position] == "inline"

    send_file(@attachment.full_filename, opts)
  end

  def destroy
    begin
      @attachment = Attachment.find(params[:id])
      @attachment.destroy
      flash[:notice] = _("Attachment was deleted successfully")
      redirect_to (requested_note ? admin_note_attachments_url(requested_note) : admin_attachments_url)
    rescue => ex
      flash[:error] = "Failed to delete attachment"
    end
  end

end
