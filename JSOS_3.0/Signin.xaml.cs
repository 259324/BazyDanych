using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;

namespace JSOS_3._0
{
    /// <summary>
    /// Interaction logic for Signin.xaml
    /// </summary>
    public partial class Signin : Page
    {
        private readonly IMainWindow _mainWindow;
        private bool err = false;

        public Signin(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
            _mainWindow.RejestrBot();
        }

        private void Powrot(object sender, EventArgs e)
        {
            _mainWindow.kandydatWybor();
            _mainWindow.CloseConn();
        }

        public void Zarejestruj(object sender, EventArgs e)
        {
            err = false;
            login_err.Content= string.Empty;
            haslo_err.Content= string.Empty;
            phaslo_err.Content= string.Empty;


            if (login.Text.Length < 1)
            {
                login_err.Content = "Niepoprawny login";
                err = true;

            }
            if (haslo.Text.Length<1)
            {
                haslo_err.Content = "Niepoprawne hasło";
                err = true;

            }
            if (phaslo.Text.Length < 1)
            {
                phaslo_err.Content = "Niepoprawne hasło";
                err = true;

            }
            if(phaslo.Text!=haslo.Text)
            {
                phaslo_err.Content = "Hasła różnią się";
                err = true;


            }


            if (err){ return; }


            try
            {

                    string sql = "select uczelnia.isLoginUsed('" + login.Text + "') AS result;";

                    MySqlDataReader reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                while (reader.Read() && !reader.IsClosed)
                {

                    if (reader["result"].ToString() == "True")
                    {
                        MessageBox.Show("Login zajęty");
                        reader.Close(); 
                        return;
                    }
                    else
                    {
                        reader.Close();
                        try
                        {
                            sql = "CREATE USER '" + login.Text + "'@'localhost' IDENTIFIED WITH mysql_native_password BY '" + haslo.Text +"';";
                            new MySqlCommand(sql, _mainWindow.getConn()).ExecuteScalar();

                            sql = "GRANT RolaKandydat TO '" + login.Text + "'@'localhost';";
                            new MySqlCommand(sql, _mainWindow.getConn()).ExecuteScalar();

                            sql = "flush privileges;";
                            new MySqlCommand(sql, _mainWindow.getConn()).ExecuteScalar();

                            sql = "call uczelnia.add_kandydat('" + login.Text + "','" + haslo.Text + "');";
                            new MySqlCommand(sql, _mainWindow.getConn()).ExecuteScalar();

                        }
                        catch (MySqlException ex) { 
                            MessageBox.Show(ex.Message);
                        }

                        _mainWindow.CloseConn();
                        
                        _mainWindow.login(1);

                        return;

                    }
                }
                

                // TODO signin

            }
            catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
        }

    }
}

