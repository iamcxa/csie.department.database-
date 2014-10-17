
Partial Class login
    Inherits System.Web.UI.Page
    Protected Sub LinkButton_Login_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Login.Click
        Me.MultiView_Main.ActiveViewIndex = 0
    End Sub
    Protected Sub LinkButton_Regid_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Regid.Click
        Me.MultiView_Main.ActiveViewIndex = 1
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Englisg As Boolean = False


    End Sub

    Protected Sub LinkButton_Help_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_About.Click
        Me.MultiView_Main.ActiveViewIndex = 2
    End Sub


    Protected Sub LinkButton_Getproblem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Getproblem.Click
        Me.MultiView_Main.ActiveViewIndex = 4
    End Sub

    Protected Sub LinkButton_Getpassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton_Getpassword.Click
        Me.MultiView_Main.ActiveViewIndex = 3
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
