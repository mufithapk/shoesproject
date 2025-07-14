<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"
         AutoEventWireup="true"
         CodeBehind="editcategory.aspx.cs"
         Inherits="shoesproject.editcategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body { font-family:'Segoe UI',sans-serif; background:#f9f9f9; }

        .auto-style1 {
            width:100%; background:#fff; border-collapse:collapse;
            border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,.05); padding:20px;
        }
        .auto-style1 td { padding:10px; }

        .auto-style2 { width:387px; }
        .auto-style3 { height:155px; }

        .auto-style4 {
            margin-left:10px; padding:6px; width:320px;
            border:1px solid #ccc; border-radius:5px;
        }
        .auto-style5 { width:160px; font-weight:bold; color:#333; }

        .auto-style8 {
            margin-left:10px; border:1px solid #ccc; border-radius:5px;
        }
        .auto-style8 th { background:#007bff; color:#fff; padding:8px; font-weight:bold; }
        .auto-style8 td { padding:6px 8px; }
        .auto-style8 tr:nth-child(even){ background:#f2f2f2; }
        .auto-style8 tr:hover      { background:#e0e0e0; }

        #ImageButton1:hover { border:2px solid #007bff; transition:.3s; }
        #Panel1             { margin-top:10px; }
        #Label4             { font-weight:bold; color:#28a745; }

        /* ── Logout button style ── */
        .logout-wrap { text-align:right; margin-bottom:12px; }
        .logout-wrap input {
            background:#dc3545; color:#fff; border:none;
            padding:6px 16px; border-radius:5px; cursor:pointer; font-weight:600;
        }
        .logout-wrap input:hover { background:#c82333; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Logout button (calls btnLogout_Click in code-behind) -->
    <div class="logout-wrap">
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>

    <!-- Existing layout -->
    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" Width="411px"
                                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                OnRowEditing="GridView1_RowEditing"
                                OnRowUpdating="GridView1_RowUpdating"
                                OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                                CssClass="auto-style8"
                                DataKeyNames="category_id">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:CommandField ShowEditButton="True" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>

                    <tr><td>&nbsp;</td><td>&nbsp;</td></tr>

                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style3">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style5">Description:</td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style4"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style5">Image:</td>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server"
                                                         Height="97px" Width="105px"
                                                         OnClick="ImageButton1_Click1" />
                                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </asp:Panel>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style5">Status:</td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style4"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style5">Message:</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>

            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
