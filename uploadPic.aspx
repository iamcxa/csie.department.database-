<%@ Page Language="VB" AutoEventWireup="false" CodeFile="uploadpic.aspx.vb" Inherits="uploadpic" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>::::: 已登入 - </title>

    <script src="javascripts/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="javascripts/jquery.curvycorners.min.js" type="text/javascript"></script>

    <script src="javascripts/corner.js" type="text/javascript"></script>

    <style type="text/css">
        -- body
        {
            font: 100% Arial Unicode MS, Arial Unicode MS;
            background: #666666;
            margin: 0; /* 比較好的做法是將 Body 元素的邊界與欄位間隔調整為零，以處理不同的瀏覽器預設值 */
            padding: 0;
            text-align: center; /* 這樣會讓容器在 IE 5* 瀏覽器內置中對齊。然後，文字會在 #container 選取器中設定為靠左對齊預設值 */
            color: #000000;
        }
        .body
        {
            background-repeat: no-repeat;
            background-position: 0% 0%;
            background-attachment: fixed;
            background-image: url( 'images/cat10_5.jpg' );
        }
        .container
        {
            background: #FFFFFF;
            height: 100%;
            width: 1000px; /* 這樣將會建立為 80% 瀏覽器寬度的容器 */
            background-repeat: no-repeat;
            background-position: 0% 50%;
            background-attachment: fixed;
            background-image: url(   'images/bg.jpg' );
            margin: 0 auto; /* 自動邊界 (搭配寬度) 會讓頁面置中對齊 */
            border: 1px solid #CCCCCC;
            text-align: left; /* 這樣做會覆寫 Body 元素上的 text-align: center。 */
            margin-top: -25px;
        }
        .oneColLiqCtr #mainContent
        {
            padding: 0 20px; /* 請記住，欄位間隔就是 Div 方塊內部的空間，而邊界就是 Div 方塊外部的空間 */
        }
        #Div_View_Login
        {
            margin-left: auto;
            text-align: center;
        }
        .title
        {
            font-weight: bold;
            color: #3366FF;
            font-size: medium;
        }
        .style3
        {
            width: 561px;
            height: 3px;
        }
        .style4
        {
            width: 836px;
            text-align: right;
            font-weight: bold;
            height: 3px;
        }
        .font-size-small
        {
            font-size: small;
        }
        .font-size-medium
        {
            font-size: medium;
        }
        .bottom_copyright
        {
            text-align: center;
            font-family: Corbel;
            font-size: 12px;
        }
        .style19
        {
            font-size: small;
        }
        .style28
        {
            width: 100%;
            height: 97px;
        }
        .style20
        {
            text-align: left;
        }
        .style21
        {
            text-align: center;
        }
              </style>
</head>
<body class="body">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
        AsyncPostBackTimeout="5" CombineScripts="True">
    </cc1:ToolkitScriptManager>
    <div id="container" class="container ">
        <div id="mainContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <p>
                        <table style="width: 100%;">
                            <tr>
                                <td class="style3" style="vertical-align: top" rowspan="2">
                                    <span class="title"><img src="images/logo.png" /></span></td>
                                <td class="style4" style="vertical-align: top">
                                    &nbsp;<asp:LinkButton ID="LinkButton_Help"
                                        runat="server" Font-Size="Small" 
                                        meta:resourcekey="LinkButton_HelpResource1">說明</asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Size="Small" LogoutAction="RedirectToLoginPage"
                                        LogoutPageUrl="~/login.aspx" meta:resourcekey="LoginStatus1Resource1" />
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Language" runat="server" Font-Size="Small" 
                                        Text="English&nbsp; " meta:resourcekey="LinkButton_LanguageResource1"></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" style="vertical-align: top">
                                    <asp:Label ID="Label_Hello" runat="server" Font-Italic="True" Text="您好, " 
                                        meta:resourcekey="Label_HelloResource1"></asp:Label>
                                    <span class="style19" lang="zh-tw">&nbsp; </span>
                                    <asp:LoginName ID="LoginName1" runat="server" Font-Bold="True" Font-Italic="True"
                                        Font-Names="微軟正黑體" Font-Size="Small" Font-Underline="True" 
                                        meta:resourcekey="LoginName1Resource1" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0;
                                    height: 30px;">
                                    <span lang="zh-tw"></span>
                                </td>
                            </tr>
                        </table>
                        <div id="Div_UpdateProgress" style="width: 100%; height: 20px; margin-right: auto;
                            position: static;">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0">
                                <ProgressTemplate>
                                    <div style="text-align: center;">
                                        <img alt="loading" src="images/ajax-loader.gif" /></div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                        <asp:MultiView ID="MultiView_Commom" runat="server" ActiveViewIndex="0">
                           <asp:View ID="View_UploadPic" runat="server">
                                <asp:Panel ID="Panel_UploadPic" runat="server" 
                                    DefaultButton="LinkButton_UploadPic" GroupingText="上傳" Height="276px" 
                                    Width="1000px" meta:resourcekey="Panel_UploadPicResource1">
                                    <br />
                                    <div class="style21">
                                    <img alt="必填欄位" src="images/monitor.png" width="128" /><br /></div>
                                    <table class="style28">
                                        <tr>
                                            <td class="style20">
                                                &nbsp;<asp:Label ID="Label_pic4" runat="server" Font-Bold="True" Font-Size="Small" 
                                                    Text="&nbsp;圖形 :" meta:resourcekey="Label_pic4Resource1"></asp:Label>
                                                <span lang="zh-tw">&nbsp;&nbsp;</span><asp:FileUpload ID="FileUpload_Pic1" 
                                                    runat="server" Font-Size="X-Small" Width="90%" 
                                                    meta:resourcekey="FileUpload_Pic1Resource1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style21">
                                                <asp:Label ID="Label_UploadState" runat="server" Font-Bold="True" 
                                                    Font-Size="Small" ForeColor="Red" 
                                                    meta:resourcekey="Label_UploadStateResource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </asp:View>
                        </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div id="uploadpic" class="style21">
                            <span lang="zh-tw">
                            <br />
                            <asp:LinkButton ID="LinkButton_UploadPic" runat="server" 
                                CausesValidation="False" meta:resourcekey="LinkButton_UploadPicResource1">上 傳</asp:LinkButton>
                            &nbsp;|
                            <asp:LinkButton ID="LinkButton_UploadPicCancel" runat="server" 
                                CausesValidation="False" 
                                meta:resourcekey="LinkButton_UploadPicCancelResource1">取 消</asp:LinkButton>
                            </span>
                        </div>
        </div>
    </div>
    <div class="bottom_copyright">
        ©2009 C.S.U.
        <br />
    </div>
    </form>
</body>
</html>
