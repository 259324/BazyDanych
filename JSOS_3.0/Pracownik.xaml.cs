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
    /// Interaction logic for Student.xaml
    /// </summary>
    public partial class Pracownik : Page
    {
        private readonly IMainWindow _mainWindow;

        public Pracownik(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
        }
        private void Powrot(object sender, EventArgs e)
        {
            _mainWindow.home();
        }

        private void Oceny(object sender, EventArgs e)
        {
            _mainWindow.pracownikOceny();
        }
        private void Zajecia(object sender, EventArgs e)
        {
            _mainWindow.pracownikZajecia();
        }
        private void Dziekan(object sender, EventArgs e)
        {
            //if(jestes dziekanem)
            _mainWindow.dziekan();
        }

    }
}
