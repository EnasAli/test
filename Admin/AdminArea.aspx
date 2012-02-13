<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminArea.aspx.cs" Inherits="ufff.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:GridView ID="getUsers" runat="server" AutoGenerateColumns="False"  
        CellPadding="4" ForeColor="#333333" GridLines="None" Width="914px" 
        onrowcancelingedit="getUsers_RowCancelingEdit" 
        onrowediting="getUsers_RowEditing" onrowupdating="getUsers_RowUpdating" 
        onrowdeleting="getUsers_RowDeleting" 
        onrowdatabound="getUsers_RowDataBound" > 
        <AlternatingRowStyle BackColor="White" />
        <Columns> 

             
            <asp:CommandField ButtonType="Button" ShowEditButton="true" 
                ShowCancelButton="true" HeaderText="Edit" />
            <asp:BoundField DataField="username" HeaderText="User Name" ReadOnly="true" Visible="true"/>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                     <%# Eval("email")%>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox runat="server" ID="txtEmail" Text='<%# Eval("email")%>' />
                </EditItemTemplate>
                
            </asp:TemplateField>
            <asp:BoundField DataField="creationdate" HeaderText="Creation Date" ReadOnly="true"/> 
            <asp:BoundField DataField="lastlogindate" HeaderText="Last Login Date" ReadOnly="true" /> 
            <asp:BoundField DataField="lastactivitydate" HeaderText="Last Activity Date" ReadOnly="true" /> 
            <asp:BoundField DataField="isonline" HeaderText="Is Online?" ReadOnly="true" /> 

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                       CommandArgument='<%# Eval("username") %>' CommandName="Delete" Text="Delete"
                       OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                </ItemTemplate>
            </asp:TemplateField>
            
 
        </Columns> 
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <br/>
    <asp:Button ID="Button1" runat="server" Text="Show Users" 
        onclick="Button1_Click" />
    </asp:Content>
