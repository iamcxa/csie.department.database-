<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login"
    meta:resourcekey="PageResource1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::: 登入系統 </title>
    <script src="javascripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="javascripts/jquery.curvycorners.min.js" type="text/javascript"></script>
    <script src="javascripts/corner.js" type="text/javascript"></script>
    <style type="text/css">
        -- body
        {
            font: 100% Arial Unicode MS, 新細明體;
            font-size: small;
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
            background-image: url('images/cat10_5.jpg');
        }
        .container
        {
            background: #FFFFFF;
            height: 100%;
            width: 1000px; /* 這樣將會建立為 80% 瀏覽器寬度的容器 */
            background-repeat: no-repeat;
            background-position: 50% 0%;
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
            width: 657px;
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
        .style12
        {
            width: 40px;
        }
        .style13
        {
            text-align: right;
        }
        .style17
        {
            width: 351px;
        }
        .bottom_copyright
        {
            text-align: center;
            font-family: Corbel;
            font-size: 12px;
        }
        .style20
        {
            width: 405px;
        }
        .style21
        {
            width: 100%;
        }
        .style22
        {
            width: 351px;
            height: 3px;
        }
        .style25
        {
            width: 180px;
            height: 32px;
        }
        .style26
        {
            width: 94px;
        }
        .style27
        {
            width: 185px;
        }
    </style>
</head>
<body class="body" style="background-color: #333333;">
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" CombineScripts="True">
    </cc1:ToolkitScriptManager>
    <div id="container" class="container ">
        <div id="mainContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <p>
                        <table style="width: 100%;">
                            <tr>
                                <td class="style22" style="width: 180px; vertical-align: top">
                                    <img alt="e-tasks" class="style25" src="images/logo.png" />
                                </td>
                                <td class="style3" style="vertical-align: top">
                                    <asp:Label ID="Label_Use_already_existed_id" runat="server" Font-Names="Arial Unicode MS"
                                        Font-Size="Small" ForeColor="Black" Text="<%$ Resources:Label_Use_already_existed_id.Text %>"></asp:Label>
                                    <span class="font-size-medium">
                                        <asp:LinkButton ID="LinkButton_Login" runat="server" Font-Size="Small" meta:resourcekey="LinkButton_LoginResource1"></asp:LinkButton>
                                    </span>
                                    <asp:Label ID="Label_Or" runat="server" Font-Names="Arial Unicode MS" Font-Size="Small"
                                        ForeColor="Black" Text="<%$ Resources:Label_Or.Text %>"></asp:Label>
                                    &nbsp;<asp:LinkButton ID="LinkButton_Regid" runat="server" meta:resourcekey="LinkButton_RegidResource1"
                                        Text="註冊">
                                    </asp:LinkButton>
                                    <asp:Label ID="Label_A_id" runat="server" Font-Names="Arial Unicode MS" Font-Size="Small"
                                        Text="<%$ Resources:Label_A_id.Text %>"></asp:Label>
                                </td>
                                <td class="style4" style="vertical-align: top">
                                    <asp:LinkButton ID="LinkButton_About" runat="server" meta:resourcekey="LinkButton_HelpResource1"
                                        Font-Size="Small"></asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Getpassword" runat="server" meta:resourcekey="LinkButton_GetpasswordResource1"
                                        Font-Size="Small">忘記密碼</asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Getproblem" runat="server" meta:resourcekey="LinkButton_GetproblemResource1"
                                        Font-Size="Small">不能登入？</asp:LinkButton>
                                    <span class="font-size-small" lang="zh-tw">｜</span>
                                    <asp:LinkButton ID="LinkButton_Language" runat="server" Font-Size="Small" Text="<%$ Resources:LinkButton_Language.Text %>"></asp:LinkButton>
                                    <span lang="zh-tw">&nbsp; </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #C0C0C0;
                                    height: 30px;" height="10px">
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
                        <asp:MultiView ID="MultiView_Main" runat="server" ActiveViewIndex="0">
                            <asp:View ID="View_Login" runat="server">
                                <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                                    <table style="width: 100%; vertical-align: middle;">
                                        <tr>
                                            <td class="style12">
                                                &nbsp;
                                            </td>
                                            <td id="TD_Right" rowspan="3" style="border-left-style: solid; border-left-width: 1px;
                                                border-left-color: #C0C0C0; padding-left: 20px; width: 55%;">
                                                <asp:Login ID="Login1" runat="server" Width="466px" DestinationPageUrl="~/index.aspx"
                                                    meta:resourcekey="Login1Resource1">
                                                    <LayoutTemplate>
                                                        <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                                            <tr>
                                                                <td class="style17">
                                                                    <table border="0" cellpadding="0">
                                                                        <tr>
                                                                            <td align="center" colspan="2">
                                                                            </td>
                                                                            <td rowspan="6">
                                                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Height="80px" Text="登入"
                                                                                    ValidationGroup="Login1" Width="60px" meta:resourcekey="LoginButtonResource1" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" class="style26">
                                                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" meta:resourcekey="UserNameLabelResource1">學號：</asp:Label>
                                                                            </td>
                                                                            <td class="style27">
                                                                                <asp:TextBox ID="UserName" runat="server" Width="150px" BorderStyle="Groove" BorderWidth="1px"
                                                                                    meta:resourcekey="UserNameResource1"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                                    ErrorMessage="必須提供使用者名稱。" ToolTip="必須提供使用者名稱。" ValidationGroup="Login1" meta:resourcekey="UserNameRequiredResource1">*</asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center" colspan="2">
                                                                                &nbsp;&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" class="style26">
                                                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" meta:resourcekey="PasswordLabelResource1">密碼：</asp:Label>
                                                                            </td>
                                                                            <td class="style27">
                                                                                <asp:TextBox ID="Password" runat="server" BorderStyle="Groove" BorderWidth="1px"
                                                                                    meta:resourcekey="PasswordResource1" TextMode="Password" Width="150px"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                                    ErrorMessage="必須提供密碼。" meta:resourcekey="PasswordRequiredResource1" ToolTip="必須提供密碼。"
                                                                                    ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center" colspan="2" style="color: Red;">
                                                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False" meta:resourcekey="FailureTextResource1"></asp:Literal>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </LayoutTemplate>
                                                </asp:Login>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style13">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/world.png" Height="128px"
                                                    Width="128px" meta:resourcekey="Image1Resource1" />
                                                <span lang="zh-tw">&nbsp;&nbsp;&nbsp;</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style12">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </asp:View>
                            <asp:View ID="View_Regid" runat="server">
                                <table class="style21">
                                    <tr>
                                        <td style="width: 20%;">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">
                                            &nbsp;
                                        </td>
                                        <td class="style20" rowspan="3">
                                            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/index.aspx"
                                                Width="422px" meta:resourcekey="CreateUserWizard1Resource1" EmailRegularExpressionErrorMessage="<%$ Resources:CreateUserWizard1Resource1.ExpressionEmailErrorMessage %>"
                                                PasswordRegularExpressionErrorMessage="<%$ Resources:PasswordRequiredResource1.ExpressionMessage %>">
                                                <WizardSteps>
                                                    <asp:CreateUserWizardStep runat="server" meta:resourcekey="CreateUserWizardStepResource1">
                                                        <ContentTemplate>
                                                            <table border="0" style="width: 422px; font-size: 100%;">
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">學號:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                            ErrorMessage="必須提供使用者名稱。" ToolTip="必須提供使用者名稱。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2">
                                                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                                                            <asp:ListItem Selected="True">正修科技大學</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label1" runat="server" Text="姓名 : "></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <br />
                                                                        <asp:TextBox ID="TextBox_Name" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2">
                                                                        註冊您的新帳戶
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密碼:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                            ErrorMessage="必須提供密碼。" ToolTip="必須提供密碼。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">電子郵件:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                                            ErrorMessage="必須提供電子郵件。" ToolTip="必須提供電子郵件。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">確認密碼:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                                            ErrorMessage="必須提供確認密碼。" ToolTip="必須提供確認密碼。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">安全性解答:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                                                            ErrorMessage="必須提供安全性解答。" ToolTip="必須提供安全性解答。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">安全性問題:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                                                            ErrorMessage="必須提供安全性問題。" ToolTip="必須提供安全性問題。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td align="center" colspan="2">
                                                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                                            ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="密碼和確認密碼必須相符。"
                                                                            ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2" style="color: Red;">
                                                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                        <CustomNavigationTemplate>
                                                            <table border="0" cellspacing="5" style="width: 100%; height: 100%;">
                                                                <tr align="right">
                                                                    <td align="right" colspan="0">
                                                                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="建立使用者"
                                                                            ValidationGroup="CreateUserWizard1" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </CustomNavigationTemplate>
                                                    </asp:CreateUserWizardStep>
                                                    <asp:CompleteWizardStep runat="server" meta:resourcekey="CompleteWizardStepResource1" />
                                                </WizardSteps>
                                            </asp:CreateUserWizard>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View_Help" runat="server">
                                <span lang="zh-tw">關於：</span>
                            </asp:View>
                            <asp:View ID="View_GetPassword" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td width="35%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE"
                                                BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
                                                Font-Size="1em" meta:resourcekey="PasswordRecovery1Resource1">
                                                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                                <SubmitButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
                                                    Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                                                <SuccessTextStyle Font-Bold="True" ForeColor="#507CD1" />
                                                <TextBoxStyle Font-Size="0.8em" />
                                                <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                                            </asp:PasswordRecovery>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </asp:View>
                            <asp:View ID="View_Cantlogin" runat="server">
                                <span lang="zh-tw">不能登入？</span>
                            </asp:View>
                        </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- end #mainContent -->
        </div>
        <!-- end #container -->
    </div>
    <!-- end #container -->
    </div>
    <div class="bottom_copyright">
        ©2009 CSU CSIE 95.</div>
    </form>
</body>
</html>
