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
    /// Interaction logic for StronaPowitalna.xaml
    /// </summary>
    public partial class StronaPowitalna : Page
    {
        private readonly IMainWindow _mainWindow;

        public StronaPowitalna(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;
        }


        public void kandydatClick(object sender, EventArgs e)
        {
            _mainWindow.kandydatWybor();
        }
        public void studentClick(object sender, EventArgs e)
        {
            _mainWindow.login(2);
        }
        public void pracownikClick(object sender, EventArgs e)
        {
            _mainWindow.login(3);
        }
    }


}
