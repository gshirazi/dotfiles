alias tp='tsh kube --proxy=${TELEPORT_PROXY}'
alias tpls='tp ls'
alias tpli='tp login --set-context-name'
func tplogin() {
   local cluster=$1
   local user=$1
   if ! tpli $cluster $user; then
	   echo "failed to teleport to $cluster/$user via ${TELEPORT_PROXY} list of available clusters:"
	   tpls
   fi
}

alias tp1='tplogin env-1'
alias tp2='tplogin us-dev-2'
alias tp4='tplogin env-4'
alias tp5='tplogin us-dev-5'
alias tpp='tplogin us-com-1'
alias tp0='tpp'
alias tps='tplogin us-stg-1'
alias tpbox4='tplogin box-4'
alias tpdd='tplogin ddi-dev-use1'
alias tpdq='tplogin ddi-qa-use1'
alias tpqaps1='tplogin ddi-qa-aps1'
alias tpd2a='tpd2'
alias tpd4='tplogin ddi-qa-ase1'
alias tpb4='tplogin box-4'

alias tpdaps='tplogin ddi-dev-aps1'
alias tpdase='tpologin ddi-dev-ase1'
alias tpdsgp='tplogin ddi-dev-sgp1'
alias tpsuse='tplogin ddi-stg-use1'
alias tp0mmb='tplogin ddi-prd-mmb1'
alias tp0cac='tplogin ddi-prd-cac1'
alias tp0spa='tplogin ddi-prd-spa1'
alias tp0nva='tplogin ddi-prd-nva1'

alias tpu='tsh kube --proxy=${TELEPORT_EU_PROXY}'
alias tpuls='tpu ls'
alias tpuli='tpu login --set-context-name'
func tpulogin() {
   local cluster=$1
   local user=$1
   if ! tpuli $cluster $user; then
           echo "failed to teleport to $cluster/$user via ${TELEPORT_EU_PROXY} list of available clusters:"
           tpuls
   fi
}

alias tpustg='tpulogin eu-stg-1'
alias tpus='tpustg'
alias tpu0='tpulogin eu-com-1'
alias tpu0frk='tpulogin ddi-eu-prd-frk1'

alias tpg='tsh kube --proxy=${TELEPORT_GCP_PROXY}'
alias tpgls='tpg ls'
alias tpgli='tpg login'
func tpglogin() {
    local cluster=$1
       if ! tpgli $cluster; then
           echo "failed to teleport to $cluster via ${TELEPORT_GCP_PROXY} list of available clusters:"
           tpgls
   fi
}
alias tpgduse1='tpglogin gcp-ddi-dev-use1'
alias tpgd='tpguse1'
alias tpgdase='tpglogin gcp-ddi-dev-ase1'
alias tpgquse='tpglogin gcp-ddi-qa-use1'
alias tpgq='tpguse1'
alias tpgsase='tpglogin gcp-ddi-stg-ase1'
alias tpg0ogn='tplogin gcp-ddi-prd-ogn1'
alias tpg0ldn='tplogin gcp-ddi-eu-prd-ldn1'
alias tpg0eu='tpg0ldn'

