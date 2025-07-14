<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="uviewcart.aspx.cs" Inherits="shoesproject.uviewcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            display: flex;
            justify-content: center;
            padding: 40px;
            background-color: #f0f4f8;
        }

        .cart-wrapper {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 900px;
        }

        .gridview-style {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .gridview-style th {
            background-color: #2c3e50;
            color: white;
            padding: 12px 10px;
            font-size: 15px;
            text-align: left;
        }

        .gridview-style td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        .gridview-style tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview-style tr:hover {
            background-color: #eef6ff;
        }

        .gridview-style .aspNet-GridView a {
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        .btn-confirm {
            margin-top: 10px;
            padding: 12px 25px;
            background-color: #28a745;
            border: none;
            color: white;
            font-weight: bold;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-confirm:hover {
            background-color: #218838;
        }

        .total-label {
            font-weight: bold;
            font-size: 18px;
            color: #2c3e50;
            margin-bottom: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="cart-wrapper">
            <asp:GridView ID="GridView1" runat="server" CssClass="gridview-style aspNet-GridView"
                DataKeyNames="product_id,cart_id"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDeleting="GridView1_RowDeleting"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating"
                OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                AutoGenerateColumns="True">
                <Columns>
                    <asp:CommandField ShowEditButton="True" EditText="✏️ Edit" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="🗑️ Delete" />
                </Columns>
            </asp:GridView>

            <div class="total-label">
                <asp:Label ID="Label1" runat="server" Text="Total: ₹0.00"></asp:Label>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Confirm Order" OnClick="Button1_Click" CssClass="btn-confirm" />
        </div>
    </div>
</asp:Content>
