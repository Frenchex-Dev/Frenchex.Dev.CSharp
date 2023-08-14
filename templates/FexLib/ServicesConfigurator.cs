#region Licensing

(copyright)

#endregion

#region Usings

using Microsoft.Extensions.DependencyInjection;

#endregion

namespace (namespace);

/// <summary>
/// Configures Services for (project-name)
/// </summary>
public static class ServicesConfigurator 
{
    /// <summary>
    /// Configures Services for (project-name)
    /// </summary>
    /// <param name="services">The <see cref="IServiceCollection"/> service collection to configure services on</param>
    public static void ConfigureServices(IServiceCollection services) 
    {
        Domain.ServicesConfigurator.ConfigureServices(services);
        Infrastructure.ServicesConfigurator.ConfigureServices(services);
    }
}