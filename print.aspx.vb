Imports System.Data

Partial Class print
    Inherits System.Web.UI.Page






    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim gv As String = Session("gvs")
        Me.SqlDataSource_ViewData.SelectCommand = "" & _
"SELECT No, Number, Time,Title, Chapter, Score, Comment, Compendium, Nutshell, Experiment, Result, Discuss, Conclusion, Graph_1, Graph_1_annotate, Graph_2, Graph_2_annotate, Graph_3, Graph_3_annotate" & _
" FROM 實驗 WHERE (No = N'" & gv & "')"
        Try
            Dim args As New DataSourceSelectArguments
            display(Me.SqlDataSource_ViewData.Select(args))
            Me.SqlDataSource_ViewData.DataBind()
        Catch ex As Exception

        End Try


    End Sub

    Sub display(ByVal sqldatanum As System.Data.IDataReader)
        Dim args As New DataSourceSelectArguments
        Dim I_DR As IDataReader = CType(sqldatanum, IDataReader)
        I_DR.Read()
        Me.Label_Time0.Text = I_DR.Item("Time").ToString
        Me.Label_AuthorNumber.Text = I_DR.Item("Number").ToString
        Me.Label_Chapter0.Text = I_DR.Item("Chapter").ToString
        Me.TextBox_Title0.Text = I_DR.Item("Title").ToString
        Me.Page.Title = "::Print " & I_DR.Item("Title").ToString
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
    End Sub
End Class
