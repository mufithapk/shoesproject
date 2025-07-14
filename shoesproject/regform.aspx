<%@ Page Title="Registration Form" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="regform.aspx.cs" Inherits="shoesproject.regform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-container {
            width: 100%;
            max-width: 400px;
            margin: 60px auto;
            padding: 40px 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .form-container:hover {
            box-shadow: 0 10px 28px rgba(0, 0, 0, 0.15);
        }

        .form-header {
            text-align: center;
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 600;
            color: #333;
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            font-weight: bold;
            margin-bottom: 20px;
            border-radius: 6px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-user {
            background-color: #007BFF;
            color: white;
        }

        .btn-user:hover {
            background-color: #0056b3;
        }

        .btn-admin {
            background-color: #6f42c1;
            color: white;
        }

        .btn-admin:hover {
            background-color: #5936a2;
        }

        @media (max-width: 500px) {
            .form-container {
                margin: 30px 15px;
                padding: 30px 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-header">Choose Registration Type</div>

        <asp:Button ID="Button1" runat="server" CssClass="btn btn-user" Text="User Registration" OnClick="Button1_Click" />
        
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-admin" Text="Admin Registration" OnClick="Button2_Click" />
    </div>
</asp:Content>
