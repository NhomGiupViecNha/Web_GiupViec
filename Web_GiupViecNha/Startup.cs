using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web_GiupViecNha.Startup))]
namespace Web_GiupViecNha
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
