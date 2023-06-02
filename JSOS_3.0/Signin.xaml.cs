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

        public Signin(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
        }

        private void Powrot(object sender, EventArgs e)
        {
            _mainWindow.kandydatWybor();
        }

        public void Zarejestruj(object sender, EventArgs e)
        {
            login_err.Content= string.Empty;
            haslo_err.Content= string.Empty;
            phaslo_err.Content= string.Empty;

            if (login.Text.Length < 1)
            {
                login_err.Content = "Niepoprawny login";
            }
            if(haslo.Text.Length<1)
            {
                haslo_err.Content = "Niepoprawne hasło";
            }
            if(phaslo.Text.Length < 1)
            {
                phaslo_err.Content = "Niepoprawne hasło";
            }
            if(phaslo.Text!=haslo.Text)
            {
                phaslo_err.Content = "Hasła różnią się";
            }

            if (phaslo_err.Content.ToString() == string.Empty & 
                haslo_err.Content.ToString() == string.Empty &
                login_err.Content.ToString() == string.Empty)
            {
                //MessageBox.Show("mozna");

                try
                {
                    string connstring = "server=localhost;uid=Rejestracja_bot;pwd=haslo1234;database=uczelnia";
                    MySqlConnection conn = new MySqlConnection(connstring);
                    conn.Open();

                    string sql = "select uczelnia.is_login_used('"+login.Text+"') AS result;";

                    MySqlDataReader reader = new MySqlCommand(sql, conn).ExecuteReader();
                    while (reader.Read())
                    {
                        if (Convert.ToInt32(reader["result"]) != 0)
                        {
                            login_err.Content = "Login zajęty";
                        }
                        else
                        {
                            sql = "CREATE USER '"+login.Text+ "'@'localhost' IDENTIFIED BY '"+haslo.Text+"'";
                        }
                    }
                    reader.Close();
                    reader = new MySqlCommand(sql, conn).ExecuteReader();
                    


                    conn.Close();

                    _mainWindow.login(2);
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

    }
}

