<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminh.aspx.cs" Inherits="shoesproject.adminh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);
            min-height: 100vh;
        }

        .dashboard-card {
            border: none;
            border-radius: 15px;
            transition: transform 0.3s ease;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        .card-header-gradient {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            font-weight: 600;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            text-align: center;
            padding: 1rem 0;
        }

        .dashboard-icon {
            font-size: 3rem;
            color: #343a40;
        }

        .dashboard-img {
            width: 96px;
            height: 96px;
            object-fit: contain;
            border-radius: 10px;
            margin-bottom: 1rem;
        }

        .btn-glass {
            background-color: rgba(0, 123, 255, 0.8);
            color: #fff;
            border: none;
        }

        .btn-glass:hover {
            background-color: rgba(0, 123, 255, 1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h2 class="text-center text-white mb-5">Admin Dashboard</h2>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
            <div class="col">
                <div class="card dashboard-card shadow">
                    <div class="card-header-gradient">Paid Products</div>
                    <div class="card-body text-center">
                        <i class="bi bi-currency-dollar dashboard-icon mb-3"></i>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-glass" Text="View Paid Products" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card dashboard-card shadow">
                    <div class="card-header-gradient">Category Management</div>
                    <div class="card-body text-center">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/category.png" CssClass="dashboard-img" OnClick="ImageButton1_Click" />
                        <asp:Label ID="Label1" runat="server" Text="Add / Edit Category" CssClass="fw-semibold d-block text-dark"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card dashboard-card shadow">
                    <div class="card-header-gradient">Feedback</div>
                    <div class="card-body text-center">
                        <i class="bi bi-chat-left-text dashboard-icon mb-3"></i>
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-glass" Text="View Feedback" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card dashboard-card shadow">
                    <div class="card-header-gradient">Product Management</div>
                    <div class="card-body text-center">
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/product.jpg" CssClass="dashboard-img" OnClick="ImageButton2_Click" />
                        <asp:Label ID="Label2" runat="server" Text="Add / Edit Product" CssClass="fw-semibold d-block text-dark"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
