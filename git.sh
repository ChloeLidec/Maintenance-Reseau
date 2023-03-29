# fichier pour optimiser les commandes git avec un menu
git config --global user.name "ChloeLidec"
git config --global user.email "chloe.lidec@etu.univ-orleans.fr"

echo("Choisissez une option:")
echo("1. commit fic modif et ajoutés")
echo("3. push")
echo("4. pull")
echo("5. status")
echo("6. creer branche")
echo("7. git merge")
echo("8. git stash")
echo("9. git tag")
echo("10. quitter")
read -p "Entrez votre choix: " choix

if [ $choix -eq 1 ]
then
    git add .
    echo("Entrez un message de commit")
    read -p "Entrez votre message: " message
    git commit -m "$message"
elif [ $choix -eq 2 ]
then
    echo("Choisissez ou poussez")
    git branch
    read -p "Entrez votre choix: " bdest
    git push origin $bdest
elif [ $choix -eq 3 ]
then
    echo("Choisissez la source")
    git branch
    read -p "Entrez votre choix: " bsrc
    git pull origin $bsrc
elif [ $choix -eq 4 ]
then
    git status
elif [ $choix -eq 5 ]
then
    echo("Entrez le nom de la branche:")
    read -p "Entrez votre choix: " branche
    git switch -c $branche
elif [ $choix -eq 6 ]
then
    echo("Choisissez la branche source")
    git branch
    read -p "Entrez votre choix: " bmsrc
    echo("Choisissez la branche destination")
    git branch
    read -p "Entrez votre choix: " bmdest
    git merge $bmsrc $bmdest
elif [ $choix -eq 7 ]
then
    git stash
elif [ $choix -eq 8 ]
then
    echo("Entrez le nom du tag:")
    read -p "Entrez votre choix: " tag
    git tag $tag
elif [ $choix -eq 9 ]
then
    exit
else
    echo "Choix invalide"
fi


