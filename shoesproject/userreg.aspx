<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userreg.aspx.cs" Inherits="shoesproject.userreg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-box {
            max-width: 700px;
            margin: 50px auto;
            padding: 40px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            font-family: 'Segoe UI', sans-serif;
        }

        .form-header {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #333;
        }

        .form-box table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        .form-box td {
            padding: 5px 10px;
            vertical-align: top;
        }

        .form-box input[type="text"],
        .form-box input[type="password"],
        .form-box textarea,
        .form-box select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .form-box input[type="text"]:focus,
        .form-box input[type="password"]:focus,
        .form-box textarea:focus,
        .form-box select:focus {
            border-color: #0078D7;
            outline: none;
        }

        .form-box .aspNetDisabled {
            background-color: #f0f0f0;
        }

        .form-box .btn-register {
            background-color: #0078D7;
            color: #fff;
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .form-box .btn-register:hover {
            background-color: #005cbf;
        }

        .form-box .validation-error {
            color: red;
            font-size: 12px;
        }

        .form-box .success-label {
            color: green;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-box">
        <div class="form-header">User Registration</div>
        <table>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>Age:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvAge" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revAge" runat="server" ControlToValidate="TextBox2"
                        ValidationExpression="^\d+$" ErrorMessage="* Must be a number" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBox3"
                        ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TextBox3"
                        ValidationExpression="^\S+@\S+\.\S+$" ErrorMessage="* Invalid email" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="3" />
                </td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" />
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="TextBox5"
                        ValidationExpression="^\d{10}$" ErrorMessage="* Invalid phone" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>Place:</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" />
                </td>
            </tr>
            <tr>
                <td>State:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="Select State" Value="" />
                        <asp:ListItem Text="Kerala" Value="kerala" />
                        <asp:ListItem Text="Tamil Nadu" Value="tamilnadu" />
                        <asp:ListItem Text="Gujarat" Value="gujarat" />
                        <asp:ListItem Text="Karnataka" Value="karnataka" />
                        <asp:ListItem Text="Maharashtra" Value="maharashtra" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" InitialValue="" ControlToValidate="DropDownList1"
                        ErrorMessage="* Select a state" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>District:</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Text="Select District" Value="" />
                        <asp:ListItem Text="Thrissur" Value="thrissur" />
                        <asp:ListItem Text="Idukki" Value="idukki" />
                        <asp:ListItem Text="Kannur" Value="kannur" />
                        <asp:ListItem Text="Malappuram" Value="malappuram" />
                        <asp:ListItem Text="Palakkad" Value="palakkad" />
                        <asp:ListItem Text="Ahmedabad" Value="ahmedabad" />
                        <asp:ListItem Text="Udaipur" Value="udaipur" />
                        <asp:ListItem Text="Patan" Value="patan" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" InitialValue="" ControlToValidate="DropDownList2"
                        ErrorMessage="* Select a district" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>Username:</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="TextBox7"
                        ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBox8"
                        ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn-register" OnClick="Button1_Click" />
                    <asp:Label ID="Label12" runat="server" Text="Successfully inserted!" Visible="False" CssClass="success-label" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
