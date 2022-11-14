install-addons: ##Install required addons for minikube cluster
	@echo "Installing minikube dependencies"
	@minikube addons enable ingress
	@minikube addons enable metrics-server

install-chart: install-addons
	@helm upgrade --install $(app_name) $(namespace)

uninstall-chart:
	@ helm uninstall $(app_name)

## Improvements 
## 1) need to check whether helm installed in the system or not of not install it.
## 2) need to check if addons is enabled or not if not then only install addons
## 3) need to check if hey have passed any extra parameters for helm, if yes then only append those to helm upgrade --install command
## ex: helm upgrade --install bede-app sumant-code/ --image=sumanth:latest       ## here --image=sumanth:latest is the extra parameter for helm