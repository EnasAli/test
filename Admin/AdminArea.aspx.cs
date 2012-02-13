using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using System.Web.Security;

namespace ufff
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) 
         {
             
                 
         }

        protected void Button1_Click(object sender, EventArgs e)
        {
             getUsers.DataSource = Membership.GetAllUsers();
             getUsers.DataBind();
 
        }

        protected void getUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            getUsers.EditIndex = e.NewEditIndex;
            getUsers.DataSource = Membership.GetAllUsers();
            getUsers.DataBind();
        }

        protected void getUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            getUsers.EditIndex = -1;
            getUsers.DataSource = Membership.GetAllUsers();
            getUsers.DataBind();
        }

        protected void getUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string userName = getUsers.Rows[e.RowIndex].Cells[1].Text;
            GridViewRow row = getUsers.Rows[e.RowIndex];
            
            TextBox txtEmail    = (TextBox)row.FindControl("txtEmail");
            String email        = txtEmail.Text;

            MembershipUser user = Membership.GetUser(userName);
            user.Email = email;
          
            Membership.UpdateUser(user);

            getUsers.EditIndex = -1;
            getUsers.DataSource = Membership.GetAllUsers();
            getUsers.DataBind();
          
        }

        protected void getUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void getUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string userName = getUsers.Rows[e.RowIndex].Cells[1].Text;
            Membership.DeleteUser(userName , true);
            getUsers.DataSource = Membership.GetAllUsers();
            getUsers.DataBind();


        }

    

      

  
    }
}