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
        private readonly IMainWindow _mainWindow;
        int rola;
        public Login(int rola_, IMainWindow mainWindow)
        {
            InitializeComponent();
            rola = rola_;
                _mainWindow = mainWindow;
        }

        private void Zaloguj(object sender, EventArgs e)
        {
            login_err.Content = string.Empty;
            haslo_err.Content = string.Empty;

            if (login.Text.Length < 1)
            {
                login_err.Content = "Niepoprawny login";
            }
            if (haslo.Text.Length < 1)
            {
                haslo_err.Content = "Niepoprawne hasło";
            }

            if (haslo_err.Content.ToString() == string.Empty & login_err.Content.ToString() == string.Empty)
            {
                //MessageBox.Show("mozna");

            }
            switch (rola)
            {
                //Kandydat
                case 1:
                    //MessageBox.Show("kand");
                    _mainWindow.kandydat();
                    break;


                //Student
                case 2:
                    MessageBox.Show("stud");

                    break;


                //Pracownik
                case 3:
                    MessageBox.Show("prac");

                    break;
            }




        }

        private void Powrot(object sender, EventArgs e)
        {
            if (rola == 1)
            {
                _mainWindow.kandydatWybor();
            }
            else
            {
                _mainWindow.home();
            }
        }
    }
}
