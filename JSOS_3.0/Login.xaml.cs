using MySql.Data.MySqlClient;
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

namespace JSOS_3._0
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Page
    {
        private readonly IMainWindow mainWindow;
        int rola;
        public Login(int rola_, IMainWindow _mainWindow)
        {
            InitializeComponent();
            rola = rola_;
            mainWindow = _mainWindow;
        }

        private void Zaloguj(object sender, EventArgs e)
        {

            // TODO odhaczyc
            //login.Text = "aw1";
            //haslo.Text = "1234";


            bool err=false;
            login_err.Content = string.Empty;
            haslo_err.Content = string.Empty;
            if (login.Text.Length < 1)
            {
                login_err.Content = "Niepoprawny login";
                err = true;
            }
            if (haslo.Text.Length < 1)
            {
                haslo_err.Content = "Niepoprawne hasło";
                err = true;

            }

            if (err)
            {
                //MessageBox.Show("Niepoprawny login lub hasło!");
                return;
            }


            try
            {
                string connstring = "server=localhost;uid=" + login.Text + ";pwd=" + haslo.Text + ";database=uczelnia";
                mainWindow.setConn(new MySqlConnection(connstring));
                mainWindow.getConn().Open();
                if (!mainWindow.getConn().Ping())
                {
                MessageBox.Show("blad polaczenia");
                }   
            }
            catch (MySqlException ex)
            {
            MessageBox.Show("catch: " + ex.Message);
                return;
            }
            string sql = "select uczelnia.login('" + login.Text + "','" + haslo.Text + "') AS result;";
                MySqlDataReader reader = new MySqlCommand(sql, mainWindow.getConn()).ExecuteReader();
                int res = 0;
                while (reader.Read())
                {
                    res = Convert.ToInt16(reader["result"]);
                    //MessageBox.Show(res.ToString());
                }
                reader.Close();

                if (res != 0)
                {
                    // TODO faktyczne zalogowanie do bazy danych
                    mainWindow.setID(res);
                    switch (rola)
                    {
                        //Kandydat
                        case 1:
                            mainWindow.kandydat();
                            break;

                        //Student
                        case 2:
                            mainWindow.student();
                            break;

                        //Pracownik
                        case 3:
                            mainWindow.pracownik();
                            break;
                    }




            }





        }

        private void Powrot(object sender, EventArgs e)
        {
            if (rola == 1)
            {
                mainWindow.kandydatWybor();
            }
            else
            {
                mainWindow.home();
            }
        }
    }
}
