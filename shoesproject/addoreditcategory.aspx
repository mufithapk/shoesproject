<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addoreditcategory.aspx.cs" Inherits="shoesproject.addoreditcartegory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .category-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .category-card {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        .category-card h2 {
            margin-bottom: 30px;
            color: #333;
        }

        .category-button {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-add {
            background-color: #28a745;
        }

        .btn-add:hover {
            background-color: #218838;
        }

        .btn-edit {
            background-color: #007bff;
        }

        .btn-edit:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="category-container">
        <div class="category-card">
            <h2>Manage Category</h2>

            <asp:Button ID="Button1" runat="server" Text="Add Category" CssClass="category-button btn-add" OnClick="Button1_Click" />

            <asp:Button ID="Button2" runat="server" Text="Edit Category" CssClass="category-button btn-edit" OnClick="Button2_Click" />
        </div>
    </div>
</asp:Content>
