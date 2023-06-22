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
            login.Text = "aw5";
            haslo.Text = "1234";
        }

        private void Zaloguj(object sender, EventArgs e)
        {

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

            if (err){ return; }


            //logowanie do serwera
            try
            {

                //string connstring = "server=localhost;uid=" + login.Text+";pwd="+haslo.Text+";database=uczelnia";
                string connstring = "server=localhost;uid=tmpUser;pwd=1234;database=uczelnia";
                mainWindow.setConn(new MySqlConnection(connstring));
                mainWindow.getConn().Open();
                if (!mainWindow.getConn().Ping())
                {
                    MessageBox.Show("blad polaczenia");
                }

            }
            catch (MySqlException ex)
            {
                MessageBox.Show("1 catch: " + ex.Message);
                return;
            }


            // walidacja halsa i loginu i wyboru roli
            string sql = "select uczelnia.login('" + login.Text + "','" + haslo.Text + "') AS result;";
            MySqlDataReader reader = new MySqlCommand(sql, mainWindow.getConn()).ExecuteReader();
            int res = 0;
            while (reader.Read())
            {
                res = Convert.ToInt16(reader["result"]);
            }
            reader.Close();
            if (res != 0)
            {
                mainWindow.setID(res);
                string resul="";
                switch (rola)
                {
                    //Kandydat
                    case 1:
                        sql = "select uczelnia.isKandydat("+ mainWindow.getID() + ") AS result;";
                        reader = new MySqlCommand(sql, mainWindow.getConn()).ExecuteReader();
                        while (reader.Read())
                        {
                            resul = reader["result"].ToString();
                        }
                        reader.Close();

                        if (resul == "True")
                        {
                            mainWindow.kandydat();

                        }
                        else
                        {
                            MessageBox.Show("Nie jeteś Kandydatem!");
                        }
                        break;

                    //Student
                    case 2:
                        sql = "select uczelnia.isStudent(" + mainWindow.getID() + ") AS result;";
                        reader = new MySqlCommand(sql, mainWindow.getConn()).ExecuteReader();
                        while (reader.Read())
                        {
                            resul = reader["result"].ToString();
                        }
                        reader.Close();

                        if (resul == "True")
                        {
                            mainWindow.student();

                        }
                        else
                        {
                            MessageBox.Show("Nie jeteś Studentem!");
                            return;
                        }
                        break;


                    //Pracownik
                    case 3:
                        sql = "select uczelnia.isPrac(" + mainWindow.getID() + ") AS result;";
                        reader = new MySqlCommand(sql, mainWindow.getConn()).ExecuteReader();
                        while (reader.Read())
                        {
                            resul = reader["result"].ToString();
                        }
                        reader.Close();

                        if (resul == "True")
                        {
                            mainWindow.pracownik();

                        }
                        else
                        {
                            MessageBox.Show("Nie jeteś Pracownikiem!");
                        }
                        break;
                }
            }
            else
            {
                MessageBox.Show("bledny login lub haslo");

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
