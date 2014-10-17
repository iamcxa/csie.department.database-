<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print.aspx.vb" Inherits="print" meta:resourcekey="PageResource1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>:::Print</title>
    <style type="text/css">
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
        .style23
        {
            text-align: left;
            height: 34px;
        }
        .style24
        {
            text-align: right;
            height: 34px;
        }
              .#body
        {
            margin: 0 auto;
            text-align: center; /* 這樣會讓容器在 IE 5* 瀏覽器內置中對齊。然後，文字會在 #container 選取器中設定為靠左對齊預設值 */

        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" 
    style="margin-right: auto; text-align: center;">
    <div class="style21">
        <asp:Panel ID="Panel1" runat="server" Width="1024px" HorizontalAlign="Center" 
            meta:resourcekey="Panel1Resource1">
            <asp:SqlDataSource ID="SqlDataSource_ViewData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DataSourceMode="DataReader" SelectCommand="SELECT [Time], [Chapter], [Compendium], [Nutshell], [Experiment], [Result], [Discuss], [Conclusion], [Chart_1], [Chart_1_annotate], [Chart_2], [Chart_2_annotate], [Chart_3], [Chart_3_annotate], [No] FROM [實驗] WHERE (([Number] = @Number) AND ([No] = @No))">
            </asp:SqlDataSource>
            <div class="style21">
                <asp:Panel ID="Panel_LoggedStudent" runat="server" Font-Bold="True" Font-Names="Arial Unicode MS"
                    Font-Size="Medium" GroupingText="內容" Width="1024px" 
                    HorizontalAlign="Center" meta:resourcekey="Panel_LoggedStudentResource1">
                    <table style="width: 100%;">
                        <tr class="style22">
                            <td class="style23">
                                <ul>
                                    <li>
                                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" 
                                            PostBackUrl="~/index.aspx" meta:resourcekey="LinkButton1Resource1">回上頁</asp:LinkButton>
                                        &nbsp; </li>
                                </ul>
                            </td>
                            <td class="style24">
                                <asp:Label ID="Label_AuthorNumber" runat="server" Font-Size="Small" 
                                    Text="[ AuthorNumber]" meta:resourcekey="Label_AuthorNumberResource1"></asp:Label>
                                （<asp:Label ID="Label_Chapter0" runat="server" Font-Size="Small" 
                                    Text="[Chapter]" meta:resourcekey="Label_Chapter0Resource1"></asp:Label>
                                ）<span lang="zh-tw">＠</span><asp:Label ID="Label_Time0" runat="server" Font-Size="Small"
                                    Text='<%# Eval("Time", "{0:g}") %>' 
                                    meta:resourcekey="Label_Time0Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20" colspan="2">
                                <img alt="必填欄位" src="images/arrow.png" width="16" />
                                <asp:Label ID="Label_Compendium3" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="&nbsp;標題 :" meta:resourcekey="Label_Compendium3Resource1"></asp:Label>
                                <asp:TextBox ID="TextBox_Title0" runat="server" BorderStyle="None" BorderWidth="0px"
                                    Font-Size="Medium" MaxLength="100" Rows="1" Text='<%# Eval("標題") %>' ToolTip="最多 100 字"
                                    Width="400px" meta:resourcekey="TextBox_Title0Resource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20" colspan="2">
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
                            <td class="style22" colspan="2">
                                <asp:TextBox ID="TextBox_Compendium1" runat="server" BorderWidth="0px" Font-Size="Medium"
                                    MaxLength="100" Rows="1" Text='<%# Eval("摘要") %>' ToolTip="最多 100 字" Width="1000px"
                                    ReadOnly="True" meta:resourcekey="TextBox_Compendium1Resource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20" colspan="2">
                                <br />
                                <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Nutshell1"
                                    runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;簡述 :" 
                                    meta:resourcekey="Label_Nutshell1Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style22" colspan="2">
                                <asp:TextBox ID="TextBox_Nutshell1" runat="server" BorderWidth="0px" CausesValidation="True"
                                    Columns="90" Font-Size="Medium" Rows="3" TextMode="MultiLine" 
                                    Width="1000px" ReadOnly="True" meta:resourcekey="TextBox_Nutshell1Resource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20" colspan="2">
                                <br />
                                <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Experiment0"
                                    runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;實驗及方法：" 
                                    meta:resourcekey="Label_Experiment0Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style22" colspan="2">
                                <asp:TextBox ID="TextBox_Experiment1" runat="server" BorderWidth="0px" CausesValidation="True"
                                    Columns="90" Font-Size="Medium" ReadOnly="True" Rows="10" Text='<%# Eval("實驗及方法") %>'
                                    TextMode="MultiLine" Width="1000px" 
                                    meta:resourcekey="TextBox_Experiment1Resource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20" colspan="2">
                                <br />
                                <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Result0"
                                    runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;結果檢驗：" 
                                    meta:resourcekey="Label_Result0Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style22" colspan="2">
                                <asp:TextBox ID="TextBox_Result1" runat="server" BorderWidth="0px" Columns="90" Font-Size="Medium"
                                    ReadOnly="True" Rows="3" Text='<%# Eval("結果檢驗") %>' TextMode="MultiLine" 
                                    Width="1000px" meta:resourcekey="TextBox_Result1Resource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20" colspan="2">
                                <br />
                                <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Discuss0"
                                    runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;討論：" 
                                    meta:resourcekey="Label_Discuss0Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style22" colspan="2">
                                <asp:TextBox ID="TextBox_Discuss1" runat="server" BorderWidth="0px" Columns="90"
                                    Font-Size="Medium" ReadOnly="True" Rows="3" Text='<%# Eval("討論") %>' TextMode="MultiLine"
                                    Width="1000px" meta:resourcekey="TextBox_Discuss1Resource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style20" colspan="2">
                                <br />
                                <img alt="必填欄位" src="images/plus.png" width="16" />&nbsp;<asp:Label ID="Label_Conclusion0"
                                    runat="server" Font-Bold="True" Font-Size="Small" Text="&nbsp;結論：" 
                                    meta:resourcekey="Label_Conclusion0Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style22" colspan="2">
                                <asp:TextBox ID="TextBox_Conclusion1" runat="server" AutoPostBack="True" BorderWidth="0px"
                                    CausesValidation="True" Columns="90" Font-Size="Medium" ReadOnly="True" Rows="3"
                                    Text='<%# Eval("結論") %>' TextMode="MultiLine" Width="1000px" 
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
                                    Rows="5" Text='<%# Eval("Chart_1_annotate") %>' TextMode="MultiLine" Width="1000px"
                                    BorderStyle="None" BorderWidth="0px" 
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
                                    Rows="5" Text='<%# Eval("Chart_1_annotate") %>' TextMode="MultiLine" Width="1000px"
                                    BorderStyle="None" BorderWidth="0px" 
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
                                    Rows="5" Text='<%# Eval("Chart_1_annotate") %>' TextMode="MultiLine" Width="1000px"
                                    BorderStyle="None" BorderWidth="0px" 
                                    meta:resourcekey="TextBox_UppicReadme6Resource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
         </div>
          </asp:Panel>
    </div>
  
    </form>
</body>
</html>
