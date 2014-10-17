Imports System.Data

Partial Class admin
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ActiveViewIndex") Is Nothing Then
            Me.MultiView_Commom.ActiveViewIndex = 0
        Else
            If Session("UPScore") <> 1 Then
                Dim index As Integer = Session("ActiveViewIndex")
                Me.MultiView_Commom.ActiveViewIndex = index
            End If
        End If



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

        If Session("UPScore") = 1 Then
            Me.TextBox_Score.Text = I_DR.Item("Score").ToString()
            Me.TextBox_Comment.Text = I_DR.Item("Comment").ToString()

        End If

        I_DR.Close()
        I_DR.Dispose()
        Me.MultiView_Commom.SetActiveView(Me.View_ViewData)

    End Sub

    Protected Sub GridView_Grade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView_Grade.SelectedIndexChanged

        Session("gvs") = Me.GridView_Grade.SelectedValue
        Me.Panel_GradeScore.Visible = True
        Me.SqlDataSource_ViewData.SelectCommand = "" & _
"SELECT No, Number, Time,Title, Chapter, Score, Comment, Compendium, Nutshell, Experiment, Result, Discuss, Conclusion, Graph_1, Graph_1_annotate, Graph_2, Graph_2_annotate, Graph_3, Graph_3_annotate" & _
" FROM 實驗 WHERE (No = N'" & Me.GridView_Grade.SelectedValue & "')"
        Try
            Dim args As New DataSourceSelectArguments
            display(Me.SqlDataSource_ViewData.Select(args))
            Me.Label_lblMessage3.Text = Me.GridView_Grade.SelectedValue
        Catch ex As Exception
            Me.Label_lblMessage3.Text = "發生錯誤" & vbCrLf & ex.ToString
        End Try
    End Sub

    Protected Sub LinkButton_SeedGrade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_SeedGrade.Click
        Dim num As String

        If Session("UPScore") = 1 Then
            num = Me.GridView_Seach.SelectedValue
        Else
            num = Me.GridView_Grade.SelectedValue()
        End If


        Me.SqlDataSource_Insert.UpdateCommand = "" & _
 "UPDATE [實驗] SET [Score] = '" & Me.TextBox_Score.Text.Trim() & "', [Comment] = '" & Me.TextBox_Comment.Text.Trim() & "' WHERE [No] = '" & num & "'"
        Try
            Me.SqlDataSource_Insert.Update()
            If Session("UPScore") = 1 Then
                Me.LinkButton_Grade_Click(sender, e)
            Else
                Me.LinkButton_Search_Click(sender, e)
            End If
        Catch ex As Exception
            Me.Label_lblMessage3.Text = "發生錯誤" & vbCrLf & ex.ToString
        End Try


    End Sub

    Protected Sub GridView_Seach_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView_Seach.Load
        Session("UPScore") = 1
    End Sub
    Protected Sub GridView_Seach_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView_Seach.SelectedIndexChanged
        Me.Panel_GradeScore.Visible = False
        Session("gvs") = Me.GridView_Seach.SelectedValue
        Me.SqlDataSource_ViewData.SelectCommand = "" & _
"SELECT No, Number, Time,Title, Chapter, Score, Comment, Compendium, Nutshell, Experiment, Result, Discuss, Conclusion, Graph_1, Graph_1_annotate, Graph_2, Graph_2_annotate, Graph_3, Graph_3_annotate" & _
" FROM 實驗 WHERE (No = N'" & Me.GridView_Seach.SelectedValue & "')"
        Try
            Dim args As New DataSourceSelectArguments
            display(Me.SqlDataSource_ViewData.Select(args))
            Me.Label_lblMessage3.Text = Me.GridView_Grade.SelectedValue
        Catch ex As Exception
            Me.Label_lblMessage3.Text = "發生錯誤" & vbCrLf & ex.ToString
        End Try
        Me.GridView_Seach.DataBind()
        Me.SqlDataSource_SEACH.DataBind()
    End Sub

    Protected Sub LinkButton_Changeprofile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Changeprofile.Click
        Me.MultiView_Commom.ActiveViewIndex = 4
    End Sub

    Protected Sub LinkButton_Grade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Grade.Click
        Session("UPScore") = 0
        Session("ActiveViewIndex") = 2
        Me.MultiView_Commom.ActiveViewIndex = 2

        Me.Panel_GradeScore.Visible = True
        Me.GridView_Grade.DataBind()
        Me.SqlDataSource_ViewData.DataBind()

    End Sub

    Protected Sub Button_Seach_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_Seach.Click
        Dim useTime_a As Double = Date.Now.TimeOfDay.TotalMilliseconds
        Dim useTime_b As Double
        Dim keyword As String
        keyword = Me.TextBox_Seach.Text.Trim()
        If keyword <> "" Then

            Me.SqlDataSource_SEACH.SelectCommand = "" & _
            "SELECT * FROM [實驗] WHERE (Compendium LIKE '%' + '" & keyword & "' + '%') or (Number Like '%' + '" & keyword & "' + '%')or (Title LIKE '%' + '" & keyword & "' + '%') or (Comment LIKE '%' + '" & keyword & "' + '%')  or (Result LIKE '%' + '" & keyword & "' + '%')"
            Try
                Dim args As New DataSourceSelectArguments
                Dim gv As GridView
                Dim I_DR As IDataReader = CType(Me.SqlDataSource_SEACH.Select(args), IDataReader)
                I_DR.Read()
                gv = SqlDataSource_SEACH.Select(args)
                I_DR.Close()
                I_DR.Dispose()
                Me.GridView_Seach.DataSource = gv
                Me.GridView_Seach.DataBind()
            Catch ex As Exception
            End Try
            useTime_b = Date.Now.TimeOfDay.TotalMilliseconds
            Me.Label_useTime.Text = "搜尋耗時 " & (useTime_b - useTime_a)
        End If

    End Sub

    Protected Sub Button_ListAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_ListAll.Click
        Dim useTime_a As Double = Date.Now.TimeOfDay.TotalMilliseconds
        Dim useTime_b As Double
        Me.SqlDataSource_SEACH.SelectCommand = "SELECT [No], [Number], [Time], [Title], [Chapter], [Score], [Comment], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion] FROM [實驗] ORDER BY [Time] DESC"
        Me.SqlDataSource_SEACH.DataBind()
        Me.GridView_Seach.DataBind()
        useTime_b = Date.Now.TimeOfDay.TotalMilliseconds
        Me.Label_useTime.Text = "搜尋耗時 " & (useTime_b - useTime_a)
    End Sub


    Protected Sub LinkButton_Search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Search.Click
        Session("ActiveViewIndex") = 1
        Session("UPScore") = 0
        Me.Page.Response.Redirect("admin.aspx")
    End Sub

    Protected Sub LinkButton_Retur_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Retur.Click
        Me.MultiView_Commom.ActiveViewIndex = Session("ActiveViewIndex")
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

    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Not Me.Page.User.IsInRole("管理者") Then
            Session("ActiveViewIndex") = 0
            Me.Page.Response.Redirect("index.aspx")
        End If
    End Sub


    Protected Sub LinkButton_UpdataScore_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_UpdataScore.Click

        If Me.MultiView_Commom.ActiveViewIndex <> 2 Then
            Session("UPScore") = 1
            Me.Panel_GradeScore.Visible = True
        End If

    End Sub
End Class
