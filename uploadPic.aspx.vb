
Partial Class uploadPic
    Inherits System.Web.UI.Page
    Dim No, path As String
    Dim SaveAspath As String = HttpContext.Current.Request.MapPath("~/")



    Protected Sub LinkButton_Help_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Help.Click

    End Sub

    Protected Sub LoginStatus1_LoggingOut(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles LoginStatus1.LoggingOut

    End Sub

    Protected Sub LinkButton_Language_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Language.Click

    End Sub

    Protected Sub LinkButton_UploadPicCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_UploadPicCancel.Click
        Session("ActiveViewIndex") = 1
        Session("Pic_ID") = ""
        Me.Page.Response.Redirect("index.aspx")
    End Sub
    Sub CratePicFile(ByVal Fileupdata_ID As FileUpload)
        If (Fileupdata_ID.HasFile) Then
            Dim SaveAspath As String = HttpContext.Current.Request.MapPath("~/")
            Dim fileName As String = Fileupdata_ID.FileName
            Dim extension As String = System.IO.Path.GetExtension(fileName)
            Dim user As String = Session("user")


            If (extension = ".jpg") Or (extension = ".gif") Or (extension = ".png") Then
                If Fileupdata_ID.PostedFile.ContentLength > 2048000 Then
                    Me.Label_UploadState.Text = "超出檔案大小限制！"
                Else
                    If Not System.IO.Directory.Exists(SaveAspath & "/upload_pics/" & Me.Page.User.Identity.Name & "/") Then
                        System.IO.Directory.CreateDirectory(SaveAspath & "/upload_pics/" & Me.Page.User.Identity.Name & "/")
                    End If
                    path = user & "/" & Now.Year & Now.Month & Now.Day & Now.Hour & Now.Minute & Now.Millisecond & Fileupdata_ID.FileName.Trim()
                    Fileupdata_ID.SaveAs(SaveAspath & "/upload_pics/" & path)
                    If Not System.IO.Directory.Exists(SaveAspath & "/upload_pics/" & path) Then
                        Me.Label_UploadState.Text = "上傳失敗！"
                    End If
                    Session("SaveAsPath") = path
                End If
            Else
                Me.Label_UploadState.Text = "檔案格式錯誤！"
            End If
        Else
            Me.Label_UploadState.Text = "沒有選擇檔案！"
        End If
    End Sub

    Protected Sub LinkButton_UploadPic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_UploadPic.Click
        CratePicFile(FileUpload_Pic1)


        Session("IsUploadPic") = 1
        Me.Page.Response.Redirect("index.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
     
    End Sub
End Class
