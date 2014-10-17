<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" meta:resourcekey="PageResource1" %>

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
            background-image: url( 'images/bg_main.jpg' );
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
            width: 212px;
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
        .style24
        {
            width: 492px;
            text-align: left;
        }
        .style29
        {
            width: 180px;
            height: 32px;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" 
        AsyncPostBackTimeout="5" CombineScripts="True">
    </cc1:ToolkitScriptManager>
    <div id="container" class="container ">
        <asp:SqlDataSource ID="SqlDataSource_Score" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [No], [Number], [Time], [Chapter], [Title], [Score], [Comment] FROM [實驗] WHERE ([Score] IS NULL) ORDER BY [Time] DESC, [No] DESC"
            OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_Score0" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Score], [Comment], [No], [Number], [Time] FROM [實驗] WHERE ([No] = @No2)"
            OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues"
            DeleteCommand="DELETE FROM [實驗] WHERE [No] = @original_No AND (([Score] = @original_Score) OR ([Score] IS NULL AND @original_Score IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND [Number] = @original_Number AND [Time] = @original_Time"
            InsertCommand="INSERT INTO [實驗] ([Score], [Comment], [No], [Number], [Time]) VALUES (@Score, @Comment, @No, @Number, @Time)"
            UpdateCommand="UPDATE [實驗] SET [Score] = @Score, [Comment] = @Comment, [Number] = @Number, [Time] = @Time WHERE [No] = @original_No AND (([Score] = @original_Score) OR ([Score] IS NULL AND @original_Score IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL)) AND [Number] = @original_Number AND [Time] = @original_Time">
      
            <DeleteParameters>
                <asp:Parameter Name="original_No" Type="String" />
                <asp:Parameter Name="original_Score" Type="String" />
                <asp:Parameter Name="original_Comment" Type="String" />
                <asp:Parameter Name="original_Number" Type="String" />
                <asp:Parameter DbType="Date" Name="original_Time" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Score" Type="String" />
                <asp:Parameter Name="Comment" Type="String" />
                <asp:Parameter Name="Number" Type="String" />
                <asp:Parameter DbType="Date" Name="Time" />
                <asp:Parameter Name="original_No" Type="String" />
                <asp:Parameter Name="original_Score" Type="String" />
                <asp:Parameter Name="original_Comment" Type="String" />
                <asp:Parameter Name="original_Number" Type="String" />
                <asp:Parameter DbType="Date" Name="original_Time" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Score" Type="String" />
                <asp:Parameter Name="Comment" Type="String" />
                <asp:Parameter Name="No" Type="String" />
                <asp:Parameter Name="Number" Type="String" />
                <asp:Parameter DbType="Date" Name="Time" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_Insert" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [No], [Number], [Time], [Chapter], [Score], [Comment], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion], [Graph_1], [Graph_1_annotate], [Graph_2], [Graph_2_annotate], [Graph_3], [Graph_3_annotate] FROM [實驗] WHERE ([Number] = @Number)">
            <SelectParameters>
                <asp:SessionParameter Name="Number" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_ViewData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Time], [Chapter], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion], [Graph_1], [Graph_1_annotate], [Graph_2], [Graph_2_annotate], [Graph_3], [Graph_3_annotate], [No] FROM [實驗] WHERE (([Number] = @Number) AND ([No] = @No))"
            DataSourceMode="DataReader">
            <SelectParameters>
                <asp:SessionParameter Name="Number" SessionField="user" Type="String" />
                <asp:ControlParameter ControlID="GridView_OldReport" DefaultValue="Select IsNull(max(No) , 0)+1 as No from [實驗]"
                    Name="No" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_SEACH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [No], [Number], [Time], [Title], [Chapter], [Score], [Comment], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion] FROM [實驗] ORDER BY [Time] DESC"
            OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [Time], [No], [Number], [Chapter], [Title], [Score], [Comment] FROM [實驗] WHERE ([Number] = @Number) ORDER BY [Time] DESC, [No] DESC"
            OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:SessionParameter Name="Number" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div id="mainContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <p>
                        <table style="width: 100%;">
                            <tr>
                                <td class="style3" style="vertical-align: top" rowspan="2">
                                    <img alt="e-Tasks" class="style29" src="images/logo.png" /></td>
                                <td class="style4" style="vertical-align: top">
                                            <asp:LinkButton ID="LinkButton_Write" runat="server" Font-Size="Small" 
                                                OnClick="LinkButton_Write_Click" meta:resourcekey="LinkButton_WriteResource1">撰寫報告</asp:LinkButton>
                                            <span class="font-size-small" lang="zh-tw">｜</span>
                                            <asp:LinkButton ID="LinkButton_Oldreport" runat="server" Font-Size="Small" 
                                                OnClick="LinkButton_Oldreport_Click" 
                                                meta:resourcekey="LinkButton_OldreportResource1">已完成報告</asp:LinkButton>
                                        
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Changeprofile" runat="server" Font-Size="Small" 
                                        meta:resourcekey="LinkButton_ChangeprofileResource1">更改資料</asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span><asp:LinkButton ID="LinkButton_Help"
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
                            <asp:View ID="View_Readme" runat="server">
                                <table style="width:100%;">
                                    <tr>
                                        <td class="style22" rowspan="2" width="35%">
                                            <asp:Image ID="Image_Readme" runat="server" ImageUrl="~/images/home.png" 
                                                Width="128px" meta:resourcekey="Image_ReadmeResource1" />
                                            <span lang="zh-tw">&nbsp; </span>
                                        </td>
                                        <td width="75%">
                                             <asp:LoginName ID="LoginName3" runat="server" Font-Bold="True" 
                                                        Font-Italic="True" Font-Names="微軟正黑體" Font-Size="Small" 
                                                        Font-Underline="True" meta:resourcekey="LoginName3Resource1" />
                                                    &nbsp;</span><asp:Label ID="Label_Readmehello" runat="server" 
                                                 Text="<%$ Resources:Label_Readmehello.text %>"></asp:Label>
&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="55%">
                                            <span lang="zh-tw">
                                            <asp:Label ID="Label_Readme" runat="server" 
                                                meta:resourcekey="Label_ReadmeResource1"></asp:Label>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                                <span lang="zh-tw">
                                    <br />
                                </span>
                            </asp:View>
                            <asp:View ID="View_Writereport" runat="server">
                                <asp:Panel ID="Panel_LoggedStudent" runat="server" Font-Names="Arial Unicode MS"
                                    Font-Size="Small" Width="100%" 
                                    meta:resourcekey="Panel_LoggedStudentResource1">
                                    <div class="style21">
                                        <div class="style22">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="style24">
                                                        <img alt="必填欄位" src="images/plus.png" width="16" /><span lang="zh-tw"> </span>
                                                        <asp:Label ID="Label_Chapter" runat="server" Font-Bold="True" Font-Size="Small" 
                                                            Text="&nbsp;章節：" meta:resourcekey="Label_ChapterResource1"></asp:Label>
                                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                                            meta:resourcekey="DropDownList1Resource1">
                                                            <asp:ListItem meta:resourcekey="ListItemResource1">0</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource2">1</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource3">2</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource4">3</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource5">4</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource6">5</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource7">6</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource8">7</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource9">8</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource10">9</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource11">10</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource12">11</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource13">12</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource14">13</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource15">14</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource16">15</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource17">16</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource18">17</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource19">18</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource20">19</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource21">20</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource22">21</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource23">22</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource24">23</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource25">24</asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource26">25</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span lang="zh-tw">&nbsp;─
                                                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                                            meta:resourcekey="DropDownList2Resource1">
                                                                <asp:ListItem meta:resourcekey="ListItemResource27">0</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource28">1</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource29">2</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource30">3</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource31">4</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource32">5</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource33">6</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource34">7</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource35">8</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource36">9</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource37">11</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource38">10</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource39">12</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource40">13</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource41">14</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource42">15</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource43">16</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource44">17</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource45">18</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource46">19</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource47">21</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource48">20</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource49">22</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource50">23</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource51">24</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource52">25</asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;─
                                                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                                            meta:resourcekey="DropDownList3Resource1">
                                      <asp:ListItem meta:resourcekey="ListItemResource53">0</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource54">1</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource55">2</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource56">3</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource57">4</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource58">5</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource59">6</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource60">7</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource61">8</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource62">9</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource63">11</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource64">10</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource65">12</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource66">13</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource67">14</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource68">15</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource69">16</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource70">17</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource71">18</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource72">19</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource73">21</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource74">20</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource75">22</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource76">23</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource77">24</asp:ListItem>
                                                                <asp:ListItem meta:resourcekey="ListItemResource78">25</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label_writeTime" runat="server" Font-Bold="True" Font-Size="Small"
                                                            Text="撰寫時間：" meta:resourcekey="Label_writeTimeResource1"></asp:Label>
                                                        <asp:Label ID="Label_Time" runat="server" Text='<%# Eval("Time", "{0:g}") %>' 
                                                            meta:resourcekey="Label_TimeResource1"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    <img alt="必填欄位" src="images/arrow.png" width="16" />
                                                    <asp:Label ID="Label_Compendium2" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;標題 :" meta:resourcekey="Label_Compendium2Resource1"></asp:Label>
                                                    <span lang="zh-tw">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Title" 
                                                        runat="server" ControlToValidate="TextBox_Compendium"
                                                            ErrorMessage="尚未輸入內容！" ValidationGroup="Textbox" 
                                                        meta:resourcekey="RequiredFieldValidator_TitleResource1"></asp:RequiredFieldValidator>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <asp:TextBox ID="TextBox_Title" runat="server" Font-Size="Medium"
                                                        Rows="1" Text='<%# Eval("標題") %>' Width="825px" CausesValidation="True" 
                                                        meta:resourcekey="TextBox_TitleResource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Compendium" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;摘要 :" meta:resourcekey="Label_CompendiumResource1"></asp:Label>
                                                    <span lang="zh-tw">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Compendium" runat="server"
                                                            ControlToValidate="TextBox_Compendium" ErrorMessage="尚未輸入內容！" 
                                                        ValidationGroup="Textbox" 
                                                        meta:resourcekey="RequiredFieldValidator_CompendiumResource1"></asp:RequiredFieldValidator>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <asp:TextBox ID="TextBox_Compendium" runat="server" Font-Size="Medium" MaxLength="100"
                                                        Rows="1" Text='<%# Eval("摘要") %>' Width="825px" CausesValidation="True" 
                                                        meta:resourcekey="TextBox_CompendiumResource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Nutshell" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;簡述 :" meta:resourcekey="Label_NutshellResource1"></asp:Label>
                                                         <asp:LinkButton ID="LinkButton_Addrows1" runat="server"
                                                            Font-Size="Small" meta:resourcekey="LinkButton_Addrows1Resource1" > ＋ </asp:LinkButton>
                                                    -
                                                    <asp:LinkButton ID="LinkButton_Subrows1" runat="server" Font-Size="Small" 
                                                        Font-Bold="True" meta:resourcekey="LinkButton_Subrows1Resource1"> － </asp:LinkButton>
                                                    <span lang="zh-tw">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Nutshell" 
                                                        runat="server" ControlToValidate="TextBox_Nutshell"
                                                            ErrorMessage="尚未輸入內容！" ValidationGroup="Textbox" 
                                                        meta:resourcekey="RequiredFieldValidator_NutshellResource1"></asp:RequiredFieldValidator>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <asp:TextBox ID="TextBox_Nutshell" runat="server" CausesValidation="True" Columns="90"
                                                        Font-Size="Medium" Rows="3" TextMode="MultiLine" Width="825px" 
                                                        meta:resourcekey="TextBox_NutshellResource1"></asp:TextBox>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    </span>
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Experiment" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;實驗及方法：" meta:resourcekey="Label_ExperimentResource1"></asp:Label>
                                                    <asp:LinkButton ID="LinkButton_Addrows2" runat="server"
                                                            Font-Size="Small" OnClick="LinkButton_Addrows_Click" 
                                                        meta:resourcekey="LinkButton_Addrows2Resource1"> ＋ </asp:LinkButton>
                                                    -
                                                    <asp:LinkButton ID="LinkButton_Subrows2" runat="server" Font-Size="Small" 
                                                        Font-Bold="True" meta:resourcekey="LinkButton_Subrows2Resource1"> － </asp:LinkButton>
                                                   
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Experiment" runat="server"
                                                            ControlToValidate="TextBox_Experiment" ErrorMessage="尚未輸入內容！" 
                                                        ValidationGroup="Textbox" 
                                                        meta:resourcekey="RequiredFieldValidator_ExperimentResource1"></asp:RequiredFieldValidator>
                                                                                                 </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <asp:TextBox ID="TextBox_Experiment" runat="server" CausesValidation="True" Columns="90"
                                                        Font-Size="Medium" Rows="10" Text='<%# Eval("實驗及方法") %>' TextMode="MultiLine"
                                                        Width="825px" meta:resourcekey="TextBox_ExperimentResource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Result" runat="server" Font-Bold="True" Font-Size="Small" 
                                                        Text="&nbsp;結果檢驗：" meta:resourcekey="Label_ResultResource1"></asp:Label>
                                                    <asp:LinkButton ID="LinkButton_Addrows3" runat="server"
                                                            Font-Size="Small" meta:resourcekey="LinkButton_Addrows3Resource1" > ＋ </asp:LinkButton>
                                                    -
                                                    <asp:LinkButton ID="LinkButton_Subrows3" runat="server" Font-Size="Small" 
                                                        Font-Bold="True" meta:resourcekey="LinkButton_Subrows3Resource1"> － </asp:LinkButton>
                                                    <span lang="zh-tw">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Result" 
                                                        runat="server" ControlToValidate="TextBox_Result"
                                                            ErrorMessage="尚未輸入內容！" ValidationGroup="Textbox" 
                                                        meta:resourcekey="RequiredFieldValidator_ResultResource1"></asp:RequiredFieldValidator>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <asp:TextBox ID="TextBox_Result" runat="server" Columns="90" Font-Size="Medium" Rows="3"
                                                        Text='<%# Eval("結果檢驗") %>' TextMode="MultiLine" Width="825px" 
                                                        CausesValidation="True" meta:resourcekey="TextBox_ResultResource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Discuss" runat="server" Font-Bold="True" Font-Size="Small" 
                                                        Text="&nbsp;討論：" meta:resourcekey="Label_DiscussResource1"></asp:Label>
                                                    <asp:LinkButton ID="LinkButton_Addrows4" runat="server" Font-Size="Small" 
                                                        meta:resourcekey="LinkButton_Addrows4Resource1" > ＋ </asp:LinkButton>
                                                    -
                                                    <asp:LinkButton ID="LinkButton_Subrows4" runat="server" Font-Size="Small" 
                                                        Font-Bold="True" meta:resourcekey="LinkButton_Subrows4Resource1"> － </asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <asp:TextBox ID="TextBox_Discuss" runat="server" Columns="90" Font-Size="Medium"
                                                        Rows="3" Text='<%# Eval("討論") %>' TextMode="MultiLine" Width="825px" 
                                                        CausesValidation="True" meta:resourcekey="TextBox_DiscussResource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Conclusion" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;結論：" meta:resourcekey="Label_ConclusionResource1"></asp:Label>
                                                    <asp:LinkButton ID="LinkButton_Addrows5" runat="server"
                                                            Font-Size="Small" meta:resourcekey="LinkButton_Addrows5Resource1" > ＋ </asp:LinkButton>
                                                    -
                                                    <asp:LinkButton ID="LinkButton_Subrows5" runat="server" Font-Size="Small" 
                                                        Font-Bold="True" meta:resourcekey="LinkButton_Subrows5Resource1"> － </asp:LinkButton>
                                                    <span lang="zh-tw">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Conclusion" runat="server"
                                                            ControlToValidate="TextBox_Conclusion" ErrorMessage="尚未輸入內容！" 
                                                        ValidationGroup="Textbox" 
                                                        meta:resourcekey="RequiredFieldValidator_ConclusionResource1"></asp:RequiredFieldValidator>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <asp:TextBox ID="TextBox_Conclusion" runat="server" CausesValidation="True"
                                                        Columns="90" Font-Size="Medium" Rows="3" Text='<%# Eval("結論") %>' TextMode="MultiLine"
                                                        Width="825px" meta:resourcekey="TextBox_ConclusionResource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    </span>
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic1" runat="server" Font-Bold="True" Font-Size="Small" 
                                                        Text="&nbsp;圖形一：" meta:resourcekey="Label_Pic1Resource1"></asp:Label>
                                                                                                        <asp:LinkButton ID="LinkButton_RemovePic1" runat="server" Visible="False" 
                                                        meta:resourcekey="LinkButton_RemovePic1Resource1">[移除]</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21">
                                                    <asp:ImageButton ID="ImageButton_Pic1" runat="server" 
                                                        ImageUrl="~/images/Add.png" meta:resourcekey="ImageButton_Pic1Resource1" />
                                                </td>
                                                <td class="style21" width="50%">
                                                    <asp:TextBox ID="TextBox_UppicReadme1" runat="server" Columns="90" Font-Size="Medium"
                                                        MaxLength="300" Rows="10" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine"
                                                        Width="400px" meta:resourcekey="TextBox_UppicReadme1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    </span>
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic2" runat="server" Font-Bold="True" Font-Size="Small" 
                                                        Text="&nbsp;圖形二：" meta:resourcekey="Label_Pic2Resource1"></asp:Label>
                                                    <asp:LinkButton ID="LinkButton_RemovePic2" runat="server" Visible="False" 
                                                        meta:resourcekey="LinkButton_RemovePic2Resource1">[移除]</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21">
                                                    <asp:ImageButton ID="ImageButton_Pic2" runat="server" 
                                                        ImageUrl="~/images/Add.png" meta:resourcekey="ImageButton_Pic2Resource1" />
                                                </td>
                                                <td class="style21" width="50%">
                                                    <asp:TextBox ID="TextBox_UppicReadme2" runat="server" Columns="90" Font-Size="Medium"
                                                        MaxLength="300" Rows="10" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine"
                                                        Width="400px" meta:resourcekey="TextBox_UppicReadme2Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20" colspan="2">
                                                    </span>
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic3" runat="server" Font-Bold="True" Font-Size="Small" 
                                                        Text="&nbsp;圖形三：" meta:resourcekey="Label_Pic3Resource1"></asp:Label>
                                                    <asp:LinkButton ID="LinkButton_RemovePic3" runat="server" Visible="False" 
                                                        meta:resourcekey="LinkButton_RemovePic3Resource1">[移除]</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21">
                                                    <asp:ImageButton ID="ImageButton_Pic3" runat="server" 
                                                        ImageUrl="~/images/Add.png" meta:resourcekey="ImageButton_Pic3Resource1" />
                                                </td>
                                                <td class="style21" width="50%">
                                                    <asp:TextBox ID="TextBox_UppicReadme3" runat="server" Columns="90" Font-Size="Medium"
                                                        MaxLength="300" Rows="10" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine"
                                                        Width="400px" meta:resourcekey="TextBox_UppicReadme3Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <span lang="zh-tw">
                                                        <asp:Label ID="Label_lblMessage" runat="server" Font-Bold="True" Font-Names="Arial Unicode MS"
                                                            Font-Size="Small" ForeColor="Red" 
                                                        meta:resourcekey="Label_lblMessageResource1"></asp:Label>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style21" colspan="2">
                                                    <span lang="zh-tw">
                                                        <asp:LinkButton ID="LinkButton_Post" runat="server" 
                                                        ValidationGroup="Textbox" meta:resourcekey="LinkButton_PostResource1">完 成</asp:LinkButton>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </div>
                                </asp:Panel>
                            </asp:View>
                            <asp:View ID="View_Oldreport" runat="server">
                                <div class="style21">
                                    <asp:Panel ID="Panel_ReportMenu_Admin" runat="server" GroupingText="已完成報告" 
                                        Width="100%" meta:resourcekey="Panel_ReportMenu_AdminResource1">
                                        <asp:GridView ID="GridView_OldReport" runat="server" AllowPaging="True" AllowSorting="True"
                                            AutoGenerateColumns="False" DataKeyNames="No" 
                                            DataSourceID="SqlDataSource1" Width="100%"
                                            BorderStyle="Groove" BorderWidth="0px" GridLines="None" 
                                            HorizontalAlign="Center" meta:resourcekey="GridView_OldReportResource1">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" 
                                                    meta:resourcekey="CommandFieldResource1" />
                                                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" 
                                                    DataFormatString="{0}" meta:resourcekey="BoundFieldResource1">
                                                    <ItemStyle Font-Size="Small" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="No" HeaderText="No" SortExpression="No" ReadOnly="True"
                                                    Visible="False" meta:resourcekey="BoundFieldResource2" />
                                                <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" 
                                                    Visible="False" meta:resourcekey="BoundFieldResource3" />
                                                <asp:BoundField DataField="Chapter" HeaderText="Chapter" 
                                                    SortExpression="Chapter" meta:resourcekey="BoundFieldResource4" />
                                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" 
                                                    meta:resourcekey="BoundFieldResource5" />
                                                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" 
                                                    meta:resourcekey="BoundFieldResource6" />
                                                <asp:BoundField DataField="Comment" HeaderText="Comment" 
                                                    SortExpression="Comment" meta:resourcekey="BoundFieldResource7" />
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                                <div class="style21">
                                    <br />
                                    <br />
                                </div>
                            </asp:View>
                            <asp:View ID="View_ViewData" runat="server">
                                <ul>
                                    <li>
                                        <asp:LinkButton ID="LinkButton_Retur" runat="server" 
                                            meta:resourcekey="LinkButton_ReturResource1">回已完成報告目錄</asp:LinkButton>
                                        |
                                        <asp:LinkButton ID="LinkButton_Print" runat="server" PostBackUrl="~/print.aspx" 
                                            meta:resourcekey="LinkButton_PrintResource1">可列印版本</asp:LinkButton>
                                    </li>
                                </ul>
                                <asp:Panel ID="Panel_LoggedasStudent" runat="server" Font-Bold="True" Font-Names="Arial Unicode MS"
                                    Font-Size="Medium" GroupingText="內容" Width="100%" 
                                    meta:resourcekey="Panel_LoggedasStudentResource1">
                                    <div class="style21">
                                        <table style="width: 100%;">
                                            <tr class="style22">
                                                <td class="style22">
                                                    
                                                    <asp:Label ID="Label_AuthorNumber" runat="server" Font-Size="Small" 
                                                        Text="[ AuthorNumber]" meta:resourcekey="Label_AuthorNumberResource1"></asp:Label>
                                                    （<asp:Label ID="Label_Chapter0" runat="server" Font-Size="Small" 
                                                        Text="[Chapter]" meta:resourcekey="Label_Chapter0Resource1"></asp:Label>
                                                    ）<span lang="zh-tw">＠</span><asp:Label ID="Label_Time0" runat="server" 
                                                        Font-Size="Small" Text='<%# Eval("Time", "{0:g}") %>' 
                                                        meta:resourcekey="Label_Time0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <img alt="必填欄位" src="images/arrow.png" width="16" />
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
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Compendium1" runat="server" Font-Bold="True" Font-Size="Small"
                                                        Text="&nbsp;摘要 :" meta:resourcekey="Label_Compendium1Resource1"></asp:Label>
                                                    <asp:Label ID="Label_lblMessage3" runat="server" Font-Bold="True" Font-Names="Arial Unicode MS"
                                                        Font-Size="Small" ForeColor="Red" Text="　" 
                                                        meta:resourcekey="Label_lblMessage3Resource1"></asp:Label>
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
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Nutshell1"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;簡述 :" 
                                                        meta:resourcekey="Label_Nutshell1Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Nutshell1" runat="server" BorderWidth="0px" CausesValidation="True"
                                                        Columns="90" Font-Size="Medium" Rows="3" TextMode="MultiLine" 
                                                        Width="825px" ReadOnly="True" meta:resourcekey="TextBox_Nutshell1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Experiment0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;實驗及方法：" 
                                                        meta:resourcekey="Label_Experiment0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Experiment1" runat="server" BorderWidth="0px" CausesValidation="True"
                                                        Columns="90" Font-Size="Medium" ReadOnly="True" Rows="10" Text='<%# Eval("實驗及方法") %>'
                                                        TextMode="MultiLine" Width="825px" 
                                                        meta:resourcekey="TextBox_Experiment1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Result0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;結果檢驗：" 
                                                        meta:resourcekey="Label_Result0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Result1" runat="server" BorderWidth="0px" Columns="90" Font-Size="Medium"
                                                        ReadOnly="True" Rows="3" Text='<%# Eval("結果檢驗") %>' TextMode="MultiLine" 
                                                        Width="825px" meta:resourcekey="TextBox_Result1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Discuss0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;討論：" 
                                                        meta:resourcekey="Label_Discuss0Resource1"></asp:Label>
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
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Conclusion0"
                                                        runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;結論：" 
                                                        meta:resourcekey="Label_Conclusion0Resource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style22">
                                                    <asp:TextBox ID="TextBox_Conclusion1" runat="server" AutoPostBack="True" BorderWidth="0px"
                                                        CausesValidation="True" Columns="90" Font-Size="Medium" ReadOnly="True" Rows="3"
                                                        Text='<%# Eval("結論") %>' TextMode="MultiLine" Width="825px" 
                                                        meta:resourcekey="TextBox_Conclusion1Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style20">
                                                    </span>
                                                    <br />
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic7" runat="server" Font-Bold="True" Font-Size="Small" 
                                                        Text="&nbsp;圖形一：" meta:resourcekey="Label_Pic7Resource1"></asp:Label>
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
                                                        Rows="5" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine" 
                                                        Width="825px" BorderStyle="None" BorderWidth="0px" 
                                                        meta:resourcekey="TextBox_UppicReadme4Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic8" runat="server" Font-Bold="True" Font-Size="Small" 
                                                        Text="&nbsp;圖形二：" meta:resourcekey="Label_Pic8Resource1"></asp:Label>
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
                                                        Rows="5" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine" 
                                                        Width="825px" BorderStyle="None" BorderWidth="0px" 
                                                        meta:resourcekey="TextBox_UppicReadme5Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                  <td class="style20">
                                                    <br />
                                                    <img alt="必填欄位" src="images/plus.png" width="16" />
                                                    <asp:Label ID="Label_Pic9" runat="server" Font-Bold="True" Font-Size="Small" 
                                                          Text="&nbsp;圖形三：" meta:resourcekey="Label_Pic9Resource1"></asp:Label>
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
                                                        Rows="5" Text='<%# Eval("Graph_1_annotate") %>' TextMode="MultiLine" 
                                                        Width="825px" BorderStyle="None" BorderWidth="0px" 
                                                        meta:resourcekey="TextBox_UppicReadme6Resource1"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </div>
                                </asp:Panel>
                            </asp:View>
                            <asp:View ID="View_Changeprofile" runat="server">
                                <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="~/index.aspx"
                                    ContinueDestinationPageUrl="~/index.aspx" SuccessPageUrl="~/index.aspx" 
                                    meta:resourcekey="ChangePassword1Resource1">
                                </asp:ChangePassword>
                                <br />
                            </asp:View>
                        </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="bottom_copyright">
        ©2009 C.S.U.
        <br />
    </div>
    </form>
</body>
</html>
