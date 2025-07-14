<%@ Page Title="Admin Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminreg.aspx.cs" Inherits="shoesproject.adminreg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Container */
        .form-container {
            max-width: 400px;           /* reduced width */
            padding: 25px 20px;         /* reduced padding */
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.12);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 50px auto;
        }

        /* Header */
        .form-header {
            text-align: center;
            font-size: 24px;            /* smaller font */
            font-weight: 700;
            color: #222;
            margin-bottom: 25px;
        }

        /* Form fields */
        .form-group {
            margin-bottom: 15px;        /* less spacing */
        }

        label {
            display: block;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
            font-size: 14px;            /* smaller label font */
        }

        input[type="text"], input[type="password"], textarea {
            width: 100%;
            padding: 8px 12px;          /* smaller input padding */
            font-size: 14px;            /* smaller input font */
            border: 1.5px solid #ccc;
            border-radius: 8px;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        textarea:focus {
            border-color: #0078D7;
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 60px;           /* smaller height */
        }

        /* Validation error messages */
        .validation-error {
            color: #d93025;
            font-size: 12px;            /* smaller error text */
            margin-top: 3px;
            display: block;
        }

        /* Submit button */
        .btn-submit {
            background-color: #0078D7;
            color: white;
            border: none;
            padding: 10px 20px;         /* smaller button */
            font-size: 15px;            /* slightly smaller font */
            border-radius: 9px;
            cursor: pointer;
            font-weight: 700;
            width: 100%;
            transition: background-color 0.25s ease;
        }

        .btn-submit:hover {
            background-color: #005aaf;
        }

        /* Success message */
        .success-message {
            color: green;
            font-weight: 700;
            text-align: center;
            margin-top: 20px;
            font-size: 14px;            /* smaller font */
        }

        /* Responsive */
        @media (max-width: 480px) {
            .form-container {
                margin: 20px 15px;
                padding: 20px 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-header">Admin Registration</div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-error" HeaderText="Please fix the following errors:" />

        <div class="form-group">
            <label for="TextBox1">Name</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="input-field" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="* Name is required" CssClass="validation-error" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="TextBox2">Address</label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" CssClass="input-field" />
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="TextBox2"
                ErrorMessage="* Address is required" CssClass="validation-error" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="TextBox3">Email</label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="input-field" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBox3"
                ErrorMessage="* Email is required" CssClass="validation-error" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TextBox3"
                ValidationExpression="^\S+@\S+\.\S+$" ErrorMessage="* Invalid email format"
                CssClass="validation-error" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="TextBox4">Phone No</label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="input-field" />
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="TextBox4"
                ErrorMessage="* Phone number is required" CssClass="validation-error" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="TextBox4"
                ValidationExpression="^\d{10}$" ErrorMessage="* Must be a 10-digit number"
                CssClass="validation-error" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="TextBox5">Place</label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="input-field" />
            <asp:RequiredFieldValidator ID="rfvPlace" runat="server" ControlToValidate="TextBox5"
                ErrorMessage="* Place is required" CssClass="validation-error" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="TextBox6">Username</label>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="input-field" />
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="TextBox6"
                ErrorMessage="* Username is required" CssClass="validation-error" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="TextBox7">Password</label>
            <asp:TextBox ID="TextBox7" runat="server" TextMode="Password" CssClass="input-field" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBox7"
                ErrorMessage="* Password is required" CssClass="validation-error" Display="Dynamic" />
        </div>

        <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn-submit" OnClick="Button1_Click" />

        <asp:Label ID="Label9" runat="server" Text="Successfully inserted!" CssClass="success-message" Visible="False" />
    </div>
</asp:Content>
