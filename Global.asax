<%@ Application Language="VB" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)

        
    End Sub
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 應用程式關閉時執行的程式碼
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' 發生未處理錯誤時執行的程式碼
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' 啟動新工作階段時執行的程式碼

    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 工作階段結束時執行的程式碼。 
        ' 注意: 只有在 Web.config 檔將 sessionstate 模式設定為 InProc 時，
        ' 才會引發 Session_End 事件。如果將工作階段模式設定為 StateServer 
        ' 或 SQLServer，就不會引發這個事件。
    End Sub

    Protected Sub Application_BeginRequest(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentInfo As System.Globalization.CultureInfo

        
    
        If Not Request.Cookies("en-US") Is Nothing Then
            
    
            If Request.Cookies("en-US").Value.ToString() <> "" Then
      
                If Request.Cookies("en-US").Value.ToString() = "Y" Then
        
                    currentInfo = New System.Globalization.CultureInfo("en-US")
                End If
                    
                If Request.Cookies("en-US").Value.ToString() = "N" Then

                    currentInfo = New System.Globalization.CultureInfo("zh-TW")
                
                End If
                Thread.CurrentThread.CurrentCulture = currentInfo
                Thread.CurrentThread.CurrentUICulture = currentInfo
            End If
      
        End If
        
    End Sub
    
    </script>