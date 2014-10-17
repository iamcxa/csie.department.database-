Imports System.Data.SqlClient
Imports System.Data

Partial Class index
    Inherits System.Web.UI.Page
    Dim No, path As String
    Dim SaveAspath As String = HttpContext.Current.Request.MapPath("~/")

    Sub AddRows(ByVal Textbox_Name As TextBox)
        Textbox_Name.Rows += 1
    End Sub
    Sub SubRows(ByVal Textbox_Name As TextBox)
        If Textbox_Name.Rows > 1 Then
            Textbox_Name.Rows -= 1
        End If
    End Sub
    Protected Sub LinkButton_Addrows_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Addrows2.Click
        AddRows(TextBox_Experiment)
    End Sub
    Protected Sub LinkButton_Subrows_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Subrows2.Click
        SubRows(TextBox_Experiment)
    End Sub
    Protected Sub LinkButton_Addrows1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Addrows1.Click
        AddRows(TextBox_Nutshell)
    End Sub
    Protected Sub LinkButton_Subrows1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Subrows1.Click
        SubRows(TextBox_Nutshell)
    End Sub
    Protected Sub LinkButton1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Addrows3.Click
        AddRows(TextBox_Result)
    End Sub
    Protected Sub LinkButton_Subrows3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Subrows3.Click
        SubRows(TextBox_Result)
    End Sub
    Protected Sub LinkButton_Addrows5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Addrows5.Click
        AddRows(TextBox_Conclusion)
    End Sub
    Protected Sub LinkButton_Subrows5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Subrows5.Click
        SubRows(TextBox_Conclusion)
    End Sub
    Protected Sub LinkButton_Addrows4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Addrows4.Click
        AddRows(TextBox_Discuss)
    End Sub
    Protected Sub LinkButton_Subrows4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Subrows4.Click
        SubRows(TextBox_Discuss)
    End Sub
    Sub display(ByVal sqldatanum As System.Data.IDataReader)
        Dim args As New DataSourceSelectArguments
        Dim I_DR As IDataReader = CType(sqldatanum, IDataReader)
        I_DR.Read()
        Me.Label_Time0.Text = I_DR.Item("Time").ToString
        Me.Label_AuthorNumber.Text = I_DR.Item("Number").ToString
        Me.Label_Chapter0.Text = I_DR.Item("Chapter").ToString
        Me.TextBox_Title0.Text = I_DR.Item("Title").ToString
        Me.TextBox_Compendium1.Text = I_DR.Item("Compendium").ToString

        If Not I_DR.Item("Graph_1").ToString = "~/images/Add.png" Then
            Me.Image1.ImageUrl = I_DR.Item("Graph_1").ToString
        End If

        If Not I_DR.Item("Graph_2").ToString = "~/images/Add.png" Then
            Me.Image2.ImageUrl = I_DR.Item("Graph_2").ToString
        End If
        If Not I_DR.Item("Graph_3").ToString = "~/images/Add.png" Then
            Me.Image3.ImageUrl = I_DR.Item("Graph_3").ToString
        End If


        Me.TextBox_Nutshell1.Text = I_DR.Item("Nutshell").ToString
        If Me.TextBox_Nutshell1.Text.Length / 35 > Me.TextBox_Nutshell1.Rows Then
            Me.TextBox_Nutshell1.Rows = (Me.TextBox_Nutshell1.Text.Length / 35)
        End If

        Me.TextBox_Experiment1.Text = I_DR.Item("Experiment").ToString
        If Me.TextBox_Experiment1.Text.Length / 35 > Me.TextBox_Experiment1.Rows Then
            Me.TextBox_Experiment1.Rows = (Me.TextBox_Experiment1.Text.Length / 35)
        End If

        Me.TextBox_Result1.Text = I_DR.Item("Result").ToString
        If Me.TextBox_Result1.Text.Length / 35 > Me.TextBox_Result1.Rows Then
            Me.TextBox_Result1.Rows = (Me.TextBox_Result1.Text.Length / 35)
        End If
        Me.TextBox_Discuss1.Text = I_DR.Item("Discuss").ToString
        If Me.TextBox_Discuss1.Text.Length / 35 > Me.TextBox_Discuss1.Rows Then
            Me.TextBox_Discuss1.Rows = (Me.TextBox_Discuss1.Text.Length / 35)
        End If

        Me.TextBox_Conclusion1.Text = I_DR.Item("Conclusion").ToString
        If Me.TextBox_Conclusion1.Text.Length / 35 > Me.TextBox_Conclusion1.Rows Then
            Me.TextBox_Conclusion1.Rows = (Me.TextBox_Conclusion1.Text.Length / 35)
        End If

        Me.TextBox_UppicReadme4.Text = I_DR.Item("Graph_1_annotate").ToString
        If Me.TextBox_UppicReadme4.Text.Length / 35 > Me.TextBox_UppicReadme4.Rows Then
            Me.TextBox_UppicReadme4.Rows = (Me.TextBox_UppicReadme4.Text.Length / 35)
        End If

        Me.TextBox_UppicReadme5.Text = I_DR.Item("Graph_2_annotate").ToString
        If Me.TextBox_UppicReadme5.Text.Length / 35 > Me.TextBox_UppicReadme5.Rows Then
            Me.TextBox_UppicReadme5.Rows = (Me.TextBox_UppicReadme5.Text.Length / 35)
        End If

        Me.TextBox_UppicReadme6.Text = I_DR.Item("Graph_3_annotate").ToString
        If Me.TextBox_UppicReadme6.Text.Length / 35 > Me.TextBox_UppicReadme6.Rows Then
            Me.TextBox_UppicReadme6.Rows = (Me.TextBox_UppicReadme6.Text.Length / 35)
        End If

        I_DR.Close()
        I_DR.Dispose()
        Me.MultiView_Commom.SetActiveView(Me.View_ViewData)

    End Sub


    Protected Sub LinkButton_Help_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Help.Click
        Me.MultiView_Commom.ActiveViewIndex = 0
        Session("ActiveViewIndex") = 0

    End Sub

    Protected Sub LinkButton_Changeprofile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Changeprofile.Click
        Me.MultiView_Commom.ActiveViewIndex = 4
        Session("ActiveViewIndex") = 4
    End Sub

    Protected Sub LinkButton_Write_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.MultiView_Commom.ActiveViewIndex = 1
        Session("ActiveViewIndex") = 1
        Session("IsUploadPic") = 0
        Me.Page.Response.Redirect("index.aspx")

    End Sub

    Protected Sub LinkButton_Oldreport_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.MultiView_Commom.ActiveViewIndex = 2
        Session("ActiveViewIndex") = 2

        Me.SqlDataSource_ViewData.DataBind()
        Me.GridView_OldReport.DataBind()
    End Sub
    Protected Sub LinkButton_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.MultiView_Commom.ActiveViewIndex = 1
        Session("ActiveViewIndex") = 1
    End Sub


    Protected Sub GridView_OldReport_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView_OldReport.SelectedIndexChanged
        Session("gvs") = Me.GridView_OldReport.SelectedValue

        Me.SqlDataSource_ViewData.SelectCommand = "" & _
"SELECT No, Number, Time,Title, Chapter, Score, Comment, Compendium, Nutshell, Experiment, Result, Discuss, Conclusion, Graph_1, Graph_1_annotate, Graph_2, Graph_2_annotate, Graph_3, Graph_3_annotate" & _
" FROM 實驗 WHERE (No = N'" & Me.GridView_OldReport.SelectedValue & "')"

        Try
            Dim args As New DataSourceSelectArguments
            display(Me.SqlDataSource_ViewData.Select(args))

        Catch ex As Exception
            Me.Label_lblMessage3.Text = "發生錯誤" & vbCrLf & ex.ToString

        End Try
    End Sub


    Protected Sub LinkButton_Post_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Post.Click


        If RequiredFieldValidator_Conclusion.IsValid And RequiredFieldValidator_Experiment.IsValid And RequiredFieldValidator_Nutshell.IsValid And RequiredFieldValidator_Result.IsValid And RequiredFieldValidator_Result.IsValid Then
            Dim chapternum As String
            chapternum = "'" & Me.DropDownList1.SelectedValue & "-" & Me.DropDownList2.SelectedValue & "-" & Me.DropDownList3.SelectedValue & "'"
            No = Me.Page.User.Identity.Name & "." & Now.Year & Now.Month & Now.Hour & Now.Minute & Now.Millisecond
            Try
                Me.SqlDataSource_Insert.InsertCommand = ("INSERT INTO [實驗] ([No],[Number],[Title],[Chapter],[Time],[Compendium],[Nutshell],[Experiment],[Result],[Discuss],[Conclusion],[Graph_1_annotate],[Graph_2_annotate],[Graph_3_annotate],[Graph_1],[Graph_2],[Graph_3]) " & _
    "VALUES ('" & No & "','" & Me.Page.User.Identity.Name.Trim() & "','" & Me.TextBox_Title.Text.Trim() & "'," & chapternum & "," & Me.Label_Time.Text.Trim() & ",'" & Me.TextBox_Compendium.Text.Trim() & "','" & Me.TextBox_Nutshell.Text.Trim() & "','" & Me.TextBox_Experiment.Text.Trim() & "','" & Me.TextBox_Result.Text.Trim() & "','" & Me.TextBox_Discuss.Text.Trim() & "','" & Me.TextBox_Conclusion.Text.Trim() & "','" & Me.TextBox_UppicReadme1.Text.Trim() & "','" & Me.TextBox_UppicReadme2.Text.Trim() & "','" & Me.TextBox_UppicReadme3.Text.Trim() & "','" & Me.ImageButton_Pic1.ImageUrl & "','" & Me.ImageButton_Pic2.ImageUrl & "','" & Me.ImageButton_Pic3.ImageUrl & "')")

                Me.SqlDataSource_Insert.Insert()
                Me.LinkButton_Oldreport_Click(sender, e)
            Catch ex As Exception
                Me.Label_lblMessage.Text = "發生錯誤" & vbCrLf & ex.ToString
            End Try
        Else
            Me.Label_lblMessage.Text = "某些欄位尚未完成！"
        End If
    End Sub
    Sub SetImagebutton(ByVal Pic_id As ImageButton)
        path = Session("SaveAsPath")
        Pic_id.ImageUrl ="~/upload_pics/" & path
        If System.Drawing.Image.FromFile(SaveAspath & "/upload_pics/" & path).Width > 450 Then
            Pic_id.Width = 450
        Else
            Pic_id.Width = Pic_id.Width
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("user") = Me.Page.User.Identity.Name

        If Me.Page.User.IsInRole("管理者") Then
            Me.Page.Response.Redirect("admin.aspx", False)
        End If
        If Session("ActiveViewIndex") Is Nothing Then
            Me.MultiView_Commom.ActiveViewIndex = 0
        Else
            Dim index As Integer = Session("ActiveViewIndex")
            Me.MultiView_Commom.ActiveViewIndex = index
            Me.Label_Time.Text = "'" & Now.Date & " " & Now.Hour & ":" & Now.Minute & ":" & Now.Second & "'"

            If Session("IsUploadPic") = 1 Then
                If Session("Pic_ID") = "ImageButton_Pic1" Then
                    SetImagebutton(ImageButton_Pic1)
                    Me.LinkButton_RemovePic2.Visible = True
                ElseIf Session("Pic_ID") = "ImageButton_Pic2" Then
                    SetImagebutton(ImageButton_Pic2)
                    Me.LinkButton_RemovePic2.Visible = True
                ElseIf Session("Pic_ID") = "ImageButton_Pic3" Then
                    SetImagebutton(ImageButton_Pic3)
                    Me.LinkButton_RemovePic3.Visible = True
                End If
                ReadAsSession()
            End If



        End If



    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Retur.Click
        Me.MultiView_Commom.ActiveViewIndex = Session("ActiveViewIndex")


    End Sub
    Sub SaveAsSession()
        Session("Time") = Me.Label_Time.Text
        Session("ch1") = Me.DropDownList1.SelectedValue
        Session("ch2") = Me.DropDownList2.SelectedValue
        Session("ch3") = Me.DropDownList3.SelectedValue
        Session("Title") = Me.TextBox_Title.Text
        Session("Compendium") = Me.TextBox_Compendium.Text
        Session("Conclusion") = Me.TextBox_Conclusion.Text
        Session("Discuss") = Me.TextBox_Discuss.Text
        Session("Experiment") = Me.TextBox_Experiment.Text
        Session("Nutshell") = Me.TextBox_Nutshell.Text
        Session("Result") = Me.TextBox_Result.Text
        Session("Readme1") = TextBox_UppicReadme1.Text
        Session("Readme2") = TextBox_UppicReadme2.Text
        Session("Readme3") = TextBox_UppicReadme3.Text
        Session("Pic1") = Me.ImageButton_Pic1.ImageUrl
        Session("Pic1.w") = Me.ImageButton_Pic1.Width
        Session("Pic2") = Me.ImageButton_Pic2.ImageUrl
        Session("Pic2.w") = Me.ImageButton_Pic2.Width
        Session("Pic3") = Me.ImageButton_Pic3.ImageUrl
        Session("Pic3.w") = Me.ImageButton_Pic3.Width
    End Sub
    Sub ReadAsSession()
        Me.Label_Time.Text = Session("Time")
        Me.DropDownList1.SelectedValue = Session("ch1")
        Me.DropDownList2.SelectedValue = Session("ch2")
        Me.DropDownList3.SelectedValue = Session("ch3")
        Me.TextBox_Title.Text = Session("Title")
        Me.TextBox_Compendium.Text = Session("Compendium")
        Me.TextBox_Conclusion.Text = Session("Conclusion")
        Me.TextBox_Discuss.Text = Session("Discuss")
        Me.TextBox_Experiment.Text = Session("Experiment")
        Me.TextBox_Nutshell.Text = Session("Nutshell")
        Me.TextBox_Result.Text = Session("Result")
        Me.TextBox_UppicReadme1.Text = Session("Readme1")
        Me.TextBox_UppicReadme2.Text = Session("Readme2")
        Me.TextBox_UppicReadme3.Text = Session("Readme3")
        If Session("Pic_ID") <> ImageButton_Pic1.ID Then
            Me.ImageButton_Pic1.ImageUrl = Session("Pic1")
            Me.ImageButton_Pic1.Width = Session("Pic1.w")

        End If
        If Session("Pic_ID") <> ImageButton_Pic2.ID Then
            Me.ImageButton_Pic2.ImageUrl = Session("Pic2")
            Me.ImageButton_Pic2.Width = Session("Pic2.w")

        End If
        If Session("Pic_ID") <> ImageButton_Pic3.ID Then
            Me.ImageButton_Pic3.ImageUrl = Session("Pic3")
            Me.ImageButton_Pic3.Width = Session("Pic3.w")
        End If
    End Sub

    Protected Sub ImageButton_Pic1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton_Pic1.Click
        Session("IsUploadPic") = 1
        Session("Pic_ID") = ImageButton_Pic1.ID
        SaveAsSession()
        Me.Page.Response.Redirect("uploadPic.aspx")
    End Sub
    Protected Sub ImageButton_Pic2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton_Pic2.Click
        Session("IsUploadPic") = 1
        Session("Pic_ID") = ImageButton_Pic2.ID
        SaveAsSession()
        Me.Page.Response.Redirect("uploadPic.aspx")
    End Sub
    Protected Sub ImageButton_Pic3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton_Pic3.Click
        Session("IsUploadPic") = 1
        Session("Pic_ID") = ImageButton_Pic3.ID
        SaveAsSession()
        Me.Page.Response.Redirect("uploadPic.aspx")
    End Sub
    Protected Sub LinkButton_Print_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Print.Click
        Session("ActiveViewIndex") = 5
        Session("GridView").Value = GridView_OldReport.SelectedValue
    End Sub

    Protected Sub LinkButton_RemovePic1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_RemovePic1.Click
        Me.ImageButton_Pic1.ImageUrl = "~/images/Add.png"
        Me.ImageButton_Pic1.Width = "84px"
        Me.LinkButton_RemovePic1.Visible = False

    End Sub

    Protected Sub LinkButton_RemovePic2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_RemovePic2.Click
        Me.ImageButton_Pic2.ImageUrl = "~/images/Add.png"
        Me.ImageButton_Pic2.Width = "84px"
        Me.LinkButton_RemovePic2.Visible = False
    End Sub

    Protected Sub LinkButton_RemovePic3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_RemovePic3.Click
        Me.ImageButton_Pic3.ImageUrl = "~/images/Add.png"
        Me.ImageButton_Pic3.Width = "84px"
        Me.LinkButton_RemovePic3.Visible = False
    End Sub

    Protected Sub LinkButton_Grade_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("ActiveViewIndex") = 1
        Me.Page.Response.Redirect("~\admin\admin.aspx")
    End Sub

    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Me.Page.User.IsInRole("管理者") Then
            Me.Page.Response.Redirect("~\admin\admin.aspx")
        End If
    End Sub

    Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad
        If Me.Page.User.IsInRole("管理者") Then
            Me.Page.Response.Redirect("~\admin\admin.aspx")
        End If
    End Sub

    Protected Sub LinkButton_Language_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Language.Click
        Dim currentPage As String = Page.Request.Path
        If Threading.Thread.CurrentThread.CurrentCulture.Name = "zh-TW" Then
            Response.Cookies.Add(New HttpCookie("en-US", "Y"))
            Response.Redirect(currentPage)
        Else
            Response.Cookies.Add(New HttpCookie("en-US", "N"))
            Response.Redirect(currentPage)

        End If

    End Sub
End Class
