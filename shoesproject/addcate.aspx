<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addcate.aspx.cs" Inherits="shoesproject.addcate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .form-card {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 500px;
        }

        .form-card h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #555;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-group input[type="file"] {
            padding: 3px;
        }

        .submit-button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }

        .message-label {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #28a745;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-card">
            <h2>Add New Category</h2>

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Category Image"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Category Description"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Rows="4" />
            </div>

            <asp:Button ID="Button1" runat="server" Text="Insert" CssClass="submit-button" OnClick="Button1_Click" />

            <asp:Label ID="Label4" runat="server" CssClass="message-label" />
        </div>
    </div>
</asp:Content>
