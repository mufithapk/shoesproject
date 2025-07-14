<%@ Page Title="Add or Edit Product" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addoreditproduct.aspx.cs" Inherits="shoesproject.addoreditproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .product-form-card {
            max-width: 500px;
            margin: 50px auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
            background-color: #fff;
        }

        .product-form-card h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .btn-custom {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            font-size: 16px;
        }

        body {
            background-color: #f9f9f9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-form-card">
        <h2>Add or Edit Product</h2>

        <asp:Button 
            ID="Button1" 
            runat="server" 
            CssClass="btn btn-primary btn-custom" 
            OnClick="Button1_Click" 
            Text="➕ Add Product" />

        <asp:Button 
            ID="Button2" 
            runat="server" 
            CssClass="btn btn-warning btn-custom" 
            OnClick="Button2_Click" 
            Text="✏️ Edit Product" />
    </div>
</asp:Content>
