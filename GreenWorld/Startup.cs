﻿using log4net.Config;
using Owin;

namespace GreenWorld
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            XmlConfigurator.Configure();
        }
    }
}
