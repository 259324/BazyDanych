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
    /// Interaction logic for KandytatWybor.xaml
    /// </summary>
    public partial class KandytatWybor : Page
    {
        private readonly IMainWindow _mainWindow;
        public KandytatWybor(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
        }

        public void zaloguj(object sender, EventArgs e)
        {
            _mainWindow.login(1);
        }
        public void zarejestruj(object sender, EventArgs e)
        {
            _mainWindow.signin();
        }

        public void powrot(object sender, EventArgs e)
        {
            _mainWindow.home();
        }
    }
}
