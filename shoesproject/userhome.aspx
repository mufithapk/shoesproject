<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userhome.aspx.cs" Inherits="shoesproject.userhome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .container {
            display: flex;
            justify-content: center;
            padding: 30px;
        }

        .search-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-box {
            height: 32px;
            width: 180px;
            font-weight: bold;
            border: 2px solid #003300;
            padding: 5px;
        }

        .search-btn {
            background-color: lime;
            border: 2px outset #00CC00;
            color: #333300;
            font-weight: bold;
            padding: 5px 10px;
            margin-left: 10px;
        }

        .data-list-wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .data-card {
            width: 180px;
            border: 1px solid #333300;
            padding: 15px;
            text-align: center;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
        }

        .data-card img {
            border-radius: 6px;
        }

        .data-label {
            margin-top: 10px;
            font-weight: bold;
            color: #333300;
        }

        .data-description {
            font-size: 13px;
            color: #666666;
            margin-top: 5px;
        }

        .feedback-section {
            text-align: center;
            margin-top: 40px;
        }

        .feedback-btn {
            background-color: white;
            border: 2px solid #333300;
            font-weight: bold;
            padding: 8px 20px;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <div class="search-section">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="search-box" />
                <asp:Button ID="Button2" runat="server" Text="Search" CssClass="search-btn" OnClick="Button2_Click" />
            </div>

            <div class="data-list-wrapper">
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                    <ItemTemplate>
                        <div class="data-card">
                            <asp:ImageButton ID="ImageButton1" runat="server"
                                ImageUrl='<%# Eval("category_image") %>'
                                Width="100px" Height="93px"
                                CommandArgument='<%# Eval("category_Id") %>'
                                CommandName="SelectItem"
                                OnCommand="ImageButton1_Command" />

                            <div class="data-label">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("category_name") %>' />
                            </div>

                            <div class="data-description">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("category_description") %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div class="feedback-section">
                <asp:Button ID="Button1" runat="server" Text="Send Feedback" CssClass="feedback-btn" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
