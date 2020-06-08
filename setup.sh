#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gboucett <gboucett@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/18 13:55:24 by gboucett          #+#    #+#              #
#    Updated: 2020/03/18 13:59:16 by gboucett         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

start=`date +%s`

echo "            __ _                           _                             "
echo "           / _| |_     ___  ___ _ ____   _(_) ___ ___  ___               "
echo "          | |_| __|   / __|/ _ \\ '__\\ \\ / / |/ __/ _ \\/ __|          "
echo "          |  _| |_    \\__ \\  __/ |   \\ V /| | (_|  __/\\__ \\         "
echo "          |_|  \\__|___|___/\\___|_|    \\_/ |_|\\___\\___||___/         "
echo "                 |_____|"
echo "========================================================================="
echo "                                                              by gboucett"


#starting minikube and the dashboard
minikube start --vm-driver=docker
minikube dashboard

eval $(minikube docker-env)

CLUSTER_IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

#enabling addons
minikube addons enable ingress


echo "Building nginx image..."
docker build -t nginx srcs/nginx --quiet


echo "Cluster IP : ${CLUSTER_IP}"

end=`date +%s`
total=$((end - start))
echo "========================================================================="
echo "✅ ft_services deployment done in $total seconds"
