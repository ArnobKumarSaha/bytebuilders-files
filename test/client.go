
import (
	"k8s.io/client-go/rest"
	"k8s.io/apimachinery/pkg/api/meta"
	"sigs.k8s.io/controller-runtime/pkg/cache"
	"sigs.k8s.io/controller-runtime/pkg/client/apiutil"
	cu "kmodules.xyz/client-go/client"
)


mapper, err := func(c *rest.Config) (meta.RESTMapper, error) {
	return apiutil.NewDynamicRESTMapper(c)
}(cfg)

c, err := cache.New(cfg, cache.Options{Scheme: server.Scheme, Mapper: mapper, Resync: &s.ResyncPeriod})
if err != nil {
	setupLog.Error(err, "unable to start manager")
	os.Exit(1)
}

clientOptions := client.Options{Scheme: server.Scheme, Mapper: mapper}
_, err = cu.NewClient(c, cfg, clientOptions)
if err != nil {
	setupLog.Error(err, "unable to start manager")
	os.Exit(1)
}