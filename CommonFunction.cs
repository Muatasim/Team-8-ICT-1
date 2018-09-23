using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Grocery_Demo  
{
    public class CommonFunction : Interface1
    {
        string CS;
        SqlConnection con;
        SqlCommand cmd;
        public void Add_Click(string arg)
        {

        }
        public void Add_Click(object sender, EventArgs e, FileUpload fu)
        {
            HttpPostedFile postedfile = fu.PostedFile;
            string filename = Path.GetFileName(postedfile.FileName);
            string fileextension = Path.GetExtension(filename);
            int filesize = postedfile.ContentLength;

            if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".jpeg" || fileextension.ToLower() == ".bmp" ||
                fileextension.ToLower() == ".gif" || fileextension.ToLower() == ".png")
            {
                Stream stream = postedfile.InputStream;
                BinaryReader binaryreader = new BinaryReader(stream);
                byte[] bytes = binaryreader.ReadBytes((int)stream.Length);
               // string CS;
                CS = "Data Source=DESKTOP-UEA1TMT;Initial Catalog=Grocery_Demo;Integrated Security=True";
                con = new SqlConnection(CS);
                cmd = new SqlCommand("AddProducts", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
            }
        }
        public void Display(string query,GridView grd)
        {
            CS = "Data Source=DESKTOP-UEA1TMT;Initial Catalog=Grocery_Demo;Integrated Security=True";
            con = new SqlConnection(CS);
            cmd = new SqlCommand("ViewProducts", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            grd.DataSource = cmd.ExecuteReader();
            grd.DataBind();
            con.Close();
        }
        public void Edit_Click(object sender, EventArgs e)
        {
            CS = "Data Source=DESKTOP-UEA1TMT;Initial Catalog=Grocery_Demo;Integrated Security=True";
            con = new SqlConnection(CS);
            cmd = new SqlCommand("UpdateProfile", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
        }
    }
}