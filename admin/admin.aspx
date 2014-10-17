<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin.aspx.vb" Inherits="admin"
    meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>::::: 已登入 - </title>
    <script src="../javascripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../javascripts/jquery.curvycorners.min.js" type="text/javascript"></script>
    <script src="../javascripts/corner.js" type="text/javascript"></script>
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
            background-image: url( '../images/bg_main.jpg' );
        }
        .container
        {
            background: #FFFFFF;
            height: 100%;
            width: 1000px; /* 這樣將會建立為 80% 瀏覽器寬度的容器 */
            background-repeat: no-repeat;
            background-position: 0% 50%;
            background-attachment: fixed;
            background-image: url(   '../images/bg.jpg' );
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
        .style21
        {
            text-align: center;
        }
        .style22
        {
            text-align: right;
        }
        .style20
        {
            text-align: left;
        }
        .style26
        {
            text-align: left;
            width: 592px;
        }
        .style27
        {
            text-align: left;
            height: 10px;
        }
        .style28
        {
            width: 180px;
            height: 32px;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" AsyncPostBackTimeout="5"
        CombineScripts="True">
    </cc1:ToolkitScriptManager>
    <div id="container" class="container ">
        <asp:SqlDataSource ID="SqlDataSource_Insert" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [No], [Number], [Time], [Chapter], [Score], [Comment], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion], [Graph_1], [Graph_1_annotate], [Graph_2], [Graph_2_annotate], [Graph_3], [Graph_3_annotate] FROM [實驗] WHERE ([Number] = @Number)">
            <SelectParameters>
                <asp:SessionParameter Name="Number" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_Score" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Number], [Time], [Title], [Chapter], [Compendium], [No] FROM [實驗] WHERE ([Score] IS NULL) ORDER BY [Time] DESC"
            OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_ViewData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Time], [Chapter], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion], [Graph_1], [Graph_1_annotate], [Graph_2], [Graph_2_annotate], [Graph_3], [Graph_3_annotate], [No] FROM [實驗] WHERE (([Number] = @Number) AND ([No] = @No))"
            DataSourceMode="DataReader"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_SEACH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [No], [Number], [Time], [Title], [Chapter], [Score], [Comment], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion] FROM [實驗] ORDER BY [Time] DESC"
            OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>
        <div id="mainContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <p>
                        <table style="width: 100%;">
                            <tr>
                                <td class="style3" style="vertical-align: top" rowspan="2">
                                    <span class="title">
                                        <img src="../images/logo.png" /></span>
                                </td>
                                <td class="style4" style="vertical-align: top">
                                    <asp:LinkButton ID="LinkButton_Search" runat="server" Font-Size="Small" OnClick="LinkButton_Search_Click"
                                        meta:resourcekey="LinkButton_SearchResource1" Text="搜尋"></asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Grade" runat="server" Font-Size="Small" OnClick="LinkButton_Grade_Click"
                                        meta:resourcekey="LinkButton_GradeResource1" Text="評分"></asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Changeprofile" runat="server" Font-Size="Small" meta:resourcekey="LinkButton_ChangeprofileResource1"
                                        Text="更改資料"></asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" Text="前端設定" meta:resourcekey="LinkButton1Resource1"></asp:LinkButton><span
                                        class="font-size-small" lang="zh-tw">｜</span><asp:LinkButton ID="LinkButton_Help"
                                            runat="server" Font-Size="Small" meta:resourcekey="LinkButton_HelpResource1"
                                            Text="說明"></asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LoginStatus ID="LoginStatus1" runat="server" Font-Size="Small" LogoutAction="RedirectToLoginPage"
                                        LogoutPageUrl="~/login.aspx" meta:resourcekey="LoginStatus1Resource1" />
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Language" runat="server" Font-Size="Small" Text="English&nbsp; "
                                        meta:resourcekey="LinkButton_LanguageResource1"></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" style="vertical-align: top">
                                    <asp:Label ID="Label_Hello" runat="server" Font-Italic="True" Text="您好, " meta:resourcekey="Label_HelloResource1"></asp:Label>
                                    <span class="style19" lang="zh-tw">&nbsp; </span>
                                    <asp:LoginName ID="LoginName1" runat="server" Font-Bold="True" Font-Italic="True"
                                        Font-Names="微軟正黑體" Font-Size="Small" Font-Underline="True" meta:resourcekey="LoginName1Resource1" />
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
                                        <img alt="loading" src="../images/ajax-loader.gif" /></div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                        <asp:MultiView ID="MultiView_Commom" runat="server" ActiveViewIndex="0">
                            <asp:View ID="View_Readme" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="style22" rowspan="2" width="35%">
                                            <asp:Image ID="Image_Readme" runat="server" ImageUrl="../images/home.png" Width="128px"
                                                meta:resourcekey="Image_ReadmeResource1" />
                                            <span lang="zh-tw">&nbsp; </span>
                                        </td>
                                        <td width="75%">
                                            <asp:LoginName ID="LoginName2" runat="server" Font-Bold="True" Font-Italic="True"
                                                Font-Names="微軟正黑體" Font-Size="Small" Font-Underline="True" meta:resourcekey="LoginName2Resource1" />
                                            &nbsp;<asp:Label ID="Label_Readmehello" runat="server" meta:resourcekey="Label_ReadmehelloResource1"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="55%">
                                            <span lang="zh-tw">
                                                <asp:Label ID="Label_Readme" runat="server" meta:resourcekey="Label_ReadmeResource1"></asp:Label>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View_Seach" runat="server">
                                <asp:Panel ID="Panel_ReportMenu_Grade0" runat="server" GroupingText="搜尋" Width="1000px"
                                    meta:resourcekey="Panel_ReportMenu_Grade0Resource1">
                                    <table style="width: 100%;">
                                        <tbody class="style20">
                                            <tr>
                                                <td class="style27" style="vertical-align: bottom">
                                                    <img alt="必填欄位" src="../images/001_40.png" width="16" />
                                                    <asp:Label ID="Label_Seach" runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;搜尋 :"
                                                        meta:resourcekey="Label_SeachResource1"></asp:Label>
                                                    <span lang="zh-tw">&nbsp;</span><asp:TextBox ID="TextBox_Seach" runat="server" Width="525px"
                                                        meta:resourcekey="TextBox_SeachResource1"></asp:TextBox>
                                                    <span lang="zh-tw">&nbsp; </span>
                                                    <asp:Button ID="Button_Seach" runat="server" Text="搜尋" Width="60px" meta:resourcekey="Button_SeachResource1" />
                                                    <span lang="zh-tw">&nbsp; </span>
                                                    <asp:Button ID="Button_ListAll" runat="server" Text="依時間列出全部" Width="150px" UseSubmitBehavior="False"
                                                        meta:resourcekey="Button_ListAllResource1" />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" style="vertical-align: bottom">
                                                    <asp:Label ID="Label_useTime" runat="server" Text="-" Font-Size="X-Small" meta:resourcekey="Label_useTimeResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <asp:GridView ID="GridView_Seach" runat="server" AllowPaging="True" AllowSorting="True"
                                                        AutoGenerateColumns="False" BorderStyle="Groove" HorizontalAlign="Center" GridLines="None"
                                                        BorderWidth="0px" DataSourceID="SqlDataSource_SEACH" Width="100%" DataKeyNames="No"
                                                        PageSize="20" CssClass="style21" meta:resourcekey="GridView_SeachResource1">
                                                        <Columns>
                                                            <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                                            <asp:BoundField DataField="No" HeaderText="No" ReadOnly="True" SortExpression="No"
                                                                Visible="False" meta:resourcekey="BoundFieldResource1" />
                                                            <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" meta:resourcekey="BoundFieldResource2" />
                                                            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" Visible="False"
                                                                meta:resourcekey="BoundFieldResource3"></asp:BoundField>
                                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" meta:resourcekey="BoundFieldResource4" />
                                                            <asp:BoundField DataField="Chapter" HeaderText="Chapter" SortExpression="Chapter"
                                                                meta:resourcekey="BoundFieldResource5" />
                                                            <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" meta:resourcekey="BoundFieldResource6" />
                                                            <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment"
                                                                meta:resourcekey="BoundFieldResource7"></asp:BoundField>
                                                            <asp:BoundField DataField="Compendium" HeaderText="Compendium" SortExpression="Compendium"
                                                                Visible="False" meta:resourcekey="BoundFieldResource8" />
                                                            <asp:BoundField DataField="Nutshell" HeaderText="Nutshell" SortExpression="Nutshell"
                                                                meta:resourcekey="BoundFieldResource9" />
                                                            <asp:BoundField DataField="Experiment" HeaderText="Experiment" SortExpression="Experiment"
                                                                Visible="False" meta:resourcekey="BoundFieldResource10" />
                                                            <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" meta:resourcekey="BoundFieldResource11" />
                                                            <asp:BoundField DataField="Discuss" HeaderText="Discuss" SortExpression="Discuss"
                                                                Visible="False" meta:resourcekey="BoundFieldResource12" />
                                                            <asp:BoundField DataField="Conclusion" HeaderText="Conclusion" SortExpression="Conclusion"
                                                                meta:resourcekey="BoundFieldResource13" />
                                                        </Columns>
                                                        <EmptyDataTemplate>
                                                            <asp:Label ID="Label_GridView_Grade_Enpty0" runat="server" Text="找不到關鍵字。" meta:resourcekey="Label_GridView_Grade_Enpty0Resource1"></asp:Label>
                                                        </EmptyDataTemplate>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </asp:Panel>
                            </asp:View>
                            <asp:View ID="View_Grade" runat="server">
                                <div class="style21">
                                    <asp:Panel ID="Panel_ReportMenu_Grade" runat="server" GroupingText="評分" Width="1000px"
                                        meta:resourcekey="Panel_ReportMenu_GradeResource1">
                                        <asp:GridView ID="GridView_Grade" runat="server" AllowPaging="True" AllowSorting="True"
                                            AutoGenerateColumns="False" BorderStyle="Groove" HorizontalAlign="Center" GridLines="None"
                                            DataKeyNames="No" DataSourceID="SqlDataSource_Score" Width="875px" meta:resourcekey="GridView_GradeResource1">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource2" />
                                                <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" meta:resourcekey="BoundFieldResource14" />
                                                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" meta:resourcekey="BoundFieldResource15" />
                                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" meta:resourcekey="BoundFieldResource16">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Chapter" HeaderText="Chapter" SortExpression="Chapter"
                                                    meta:resourcekey="BoundFieldResource17" />
                                                <asp:BoundField DataField="Compendium" HeaderText="Compendium" SortExpression="Compendium"
                                                    meta:resourcekey="BoundFieldResource18" />
                                                <asp:BoundField DataField="No" HeaderText="No" SortExpression="No" ReadOnly="True"
                                                    Visible="False" meta:resourcekey="BoundFieldResource19" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <asp:Label ID="Label_GridView_Grade_Enpty" runat="server" Text="已全部評分完畢。" meta:resourcekey="Label_GridView_Grade_EnptyResource1"></asp:Label>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </asp:View>
                            <asp:View ID="View_ViewData" runat="server">
                                <asp:Panel ID="Panel_GradeScore" runat="server" GroupingText="評分" Visible="False"
                                    Width="1000px" meta:resourcekey="Panel_GradeScoreResource1">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="style26">
                                                <img alt="必填欄位" src="../images/plus.png" width="16" />
                                                <asp:Label ID="Label_Score" runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;評分 :"
                                                    meta:resourcekey="Label_ScoreResource1"></asp:Label>
                                            </td>
                                            <td class="style22">
                                                <asp:LinkButton ID="LinkButton_SeedGrade" runat="server" OnClick="LinkButton_SeedGrade_Click"
                                                    meta:resourcekey="LinkButton_SeedGradeResource1" Text="送出成績"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style21" colspan="2">
                                                <asp:TextBox ID="TextBox_Score" runat="server" BorderStyle="Dotted" BorderWidth="1px"
                                                    Font-Size="Medium" MaxLength="100" Rows="1" ToolTip="最多 100 字" Width="825px"
                                                    meta:resourcekey="TextBox_ScoreResource1"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style20" colspan="2">
                                                <img alt="必填欄位" src="../images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Comment"
                                                    runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;評語 :" meta:resourcekey="Label_CommentResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style21" colspan="2">
                                                <asp:TextBox ID="TextBox_Comment" runat="server" BorderStyle="Dotted" BorderWidth="1px"
                                                    CausesValidation="True" Columns="90" Font-Size="Medium" Rows="3" TextMode="MultiLine"
                                                    Width="825px" meta:resourcekey="TextBox_CommentResource1"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <ul>
                                    <li>
                                        <asp:LinkButton ID="LinkButton_Retur" runat="server" meta:resourcekey="LinkButton_ReturResource1"
                                            Text="回已完成報告目錄"></asp:LinkButton>
                                        |
                                        <asp:LinkButton ID="LinkButton_Print" runat="server" PostBackUrl="~/print.aspx" meta:resourcekey="LinkButton_PrintResource1"
                                            Text="可列印版本"></asp:LinkButton>
                                        |
                                        <asp:LinkButton ID="LinkButton_UpdataScore" runat="server" Text="<%$ Resources:LinkButton_UpdataScore.text %>"
                                            meta:resourcekey="LinkButton_UpdataScoreResource1"></asp:LinkButton>
                                    </li>
                                </ul>
                                <asp:Panel ID="Panel_LoggedStudent0" runat="server" Font-Bold="True" Font-Names="Arial Unicode MS"
                                    Font-Size="Medium" GroupingText="內容" Width="100%" meta:resourcekey="Panel_LoggedStudent0Resource1">
                                    <div class="style21">
                                        <table style="width: 100%;">
                                            <tr class="style22">
                                                <td class="style22">
                                                    <asp:Label ID="Label_AuthorNumber" runat="server" Font-Size="Small" Text="[ AuthorNumber]"
                                                        meta:resourcekey="Label_AuthorNumberResource1"></asp:Label>
                                                    （<asp:Label ID="Label_Chapter0" runat="server" Font-Size="Small" Text="[Chapter]"
                                                        meta:resourcekey="Label_Chapter0Resource1"></asp:Label>
                                                    ）<span lang="zh-tw">＠</span><asp:Label ID="Label_Time0" runat="server" Font-Size="Small"
                                                        Text='<%# Eval("Time", "{0:g}") %>' meta:resourcekey="Label_Time0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <img alt="必填欄位" src="../images/arrow.png" width="16" />
                                                    <asp:Label ID="Label_Compendium3" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;標題 :" meta:resourcekey="Label_Compendium3Resource1"></asp:Label>
                                                    <asp:TextBox ID="TextBox_Title0" runat="server" BorderStyle="None" BorderWidth="0px"
                                                        Font-Size="Medium" MaxLength="100" Rows="1" Text='<%# Eval("標題") %>' ToolTip="最多 100 字"
                                                        Width="400px" meta:resourcekey="TextBox_Title0Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Compendium1" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;摘要 :" meta:resourcekey="Label_Compendium1Resource1"></asp:Label>
                                                    <asp:Label ID="Label_lblMessage3" runat="server" Font-Bold="True" Font-Names="Arial Unicode MS"
                                                        Font-Size="Small" ForeColor="Red" Text="　" meta:resourcekey="Label_lblMessage3Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Compendium1" runat="server" BorderWidth="0px" Font-Size="Medium"
                                                        MaxLength="100" Rows="1" Text='<%# Eval("摘要") %>' ToolTip="最多 100 字" Width="825px"
                                                        ReadOnly="True" meta:resourcekey="TextBox_Compendium1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Nutshell1"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;簡述 :" meta:resourcekey="Label_Nutshell1Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Nutshell1" runat="server" BorderWidth="0px" CausesValidation="True"
                                                        Columns="90" Font-Size="Medium" Rows="3" TextMode="MultiLine" Width="825px" ReadOnly="True"
                                                        meta:resourcekey="TextBox_Nutshell1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Experiment0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;實驗及方法：" meta:resourcekey="Label_Experiment0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Experiment1" runat="server" BorderWidth="0px" CausesValidation="True"
                                                        Columns="90" Font-Size="Medium" ReadOnly="True" Rows="10" Text='<%# Eval("實驗及方法") %>'
                                                        TextMode="MultiLine" Width="825px" meta:resourcekey="TextBox_Experiment1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Result0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;結果檢驗：" meta:resourcekey="Label_Result0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Result1" runat="server" BorderWidth="0px" Columns="90" Font-Size="Medium"
                                                        ReadOnly="True" Rows="3" Text='<%# Eval("結果檢驗") %>' TextMode="MultiLine" Width="825px"
                                                        meta:resourcekey="TextBox_Result1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Discuss0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;討論：" meta:resourcekey="Label_Discuss0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Discuss1" runat="server" BorderWidth="0px" Columns="90"
                                                        Font-Size="Medium" ReadOnly="True" Rows="3" Text='<%# Eval("討論") %>' TextMode="MultiLine"
                                                        Width="825px" meta:resourcekey="TextBox_Discuss1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Conclusion0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;結論：" meta:resourcekey="Label_Conclusion0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Conclusion1" runat="server" AutoPostBack="True" BorderWidth="0px"
                                                        CausesValidation="True" Columns="90" Font-Size="Medium" ReadOnly="True" Rows="3"
                                                        Text='<%# Eval("結論") %>' TextMode="MultiLine" Width="825px" meta:resourcekey="TextBox_Conclusion1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style20">
                                                    </span>
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic7" runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;圖形一："
                                                        meta:resourcekey="Label_Pic7Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21">
                                                    <asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_UppicReadme4" runat="server" Columns="90" Font-Size="Medium"
                                                        Rows="5" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine" Width="825px"
                                                        BorderStyle="None" BorderWidth="0px" meta:resourcekey="TextBox_UppicReadme4Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic8" runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;圖形二："
                                                        meta:resourcekey="Label_Pic8Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21">
                                                    <asp:Image ID="Image2" runat="server" meta:resourcekey="Image2Resource1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_UppicReadme5" runat="server" Columns="90" Font-Size="Medium"
                                                        Rows="5" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine" Width="825px"
                                                        BorderStyle="None" BorderWidth="0px" meta:resourcekey="TextBox_UppicReadme5Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="../images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic9" runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;圖形三："
                                                        meta:resourcekey="Label_Pic9Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21">
                                                    <asp:Image ID="Image3" runat="server" meta:resourcekey="Image3Resource1" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_UppicReadme6" runat="server" Columns="90" Font-Size="Medium"
                                                        Rows="5" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine" Width="825px"
                                                        BorderStyle="None" BorderWidth="0px" meta:resourcekey="TextBox_UppicReadme6Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </div>
                                </asp:Panel>
                            </asp:View>
                            <asp:View ID="View_Changeprofile" runat="server">
                                <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="~/index.aspx"
                                    ContinueDestinationPageUrl="~/index.aspx" SuccessPageUrl="~/index.aspx" meta:resourcekey="ChangePassword1Resource1">
                                </asp:ChangePassword>
                                <br />
                            </asp:View>
                        </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
     <div class="bottom_copyright">
        ©2009 CSU CSIE 95.</div>
    </div>
    </form>
</body>
</html>
