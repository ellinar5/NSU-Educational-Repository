import Barans

grandfatherM' :: Sheep -> Maybe Sheep  -- дедушка по маме (1) (3)
grandfatherM' s1 = do	
		m <- mother s1
		father m
		
grandmotherM' :: Sheep -> Maybe Sheep  -- бабушка по маме 
grandmotherM' s1 = do	
		gmM <- mother s1
		mother gmM
		

greatGrandfatherM' :: Sheep -> Maybe Sheep  -- прадедушка по маме (2)
greatGrandfatherM' s1 = do	
		ggfM <- grandfatherM' s1
		father ggfM
		
grandfatherP' :: Sheep -> Maybe Sheep  -- дедушка по папе
grandfatherP' s1 = do	
		gP <- father s1
		father gP
		
grandmotherP' :: Sheep -> Maybe Sheep  -- бабушка по папе 
grandmotherP' s1 = do	
		gmP <- father s1
		mother gmP	

rod :: Sheep -> [Maybe Sheep]  -- мама и папа
rod s1 = (mother s1) : (father s1) : []

grod :: Sheep -> [Maybe Sheep]  -- бабушки и дедушки
grod s1 = grandfatherM' s1 : grandmotherM' s1 : grandfatherP' s1 : grandfatherP' s1 : []

rodGrod :: Sheep -> [[Maybe Sheep]]  --   список всех родителей и список бабушек с дедушками
rodGrod s1 = rod s1 : grod s1 : [] 

orphan :: Sheep -> Bool -- №4
orphan s1 = (father s1 == Nothing) && (mother s1 == Nothing)


selected_barans = ["i3", "i5", "i6", "i9", "i12"] -- для номера 5

selectedFather :: Sheep -> Maybe Sheep -- для номера 5
selectedFather s = 
    if s `elem` selected_barans 
    then father s 
    else Nothing

closestMaleAncestor :: Sheep -> Maybe Sheep
closestMaleAncestor s = do
    f <- father s
    if f `elem` selected_barans
        then Just f
        else closestMaleAncestor f
		
main :: IO ()
main = do
		print $ grandfatherM' "i10"  -- i7 (дедушка по маме)
		print $ greatGrandfatherM' "i10" -- Nothing (прадедушка по маме)
		print $ father "i10" -- i9 (отец)
		print $ mother "i10" -- i8 (мать)
		print $ rodGrod "i10" -- №3
		print $ orphan "i10" -- False (№4)
		print $ orphan "i4" -- True (как для примера №4)
		print $ selectedFather "i6" -- i5
		print $ selectedFather "i9" -- i5
		print $ selectedFather "i12" -- i6
		print $ closestMaleAncestor "i10" -- №6 i9 (отец)
		print $ closestMaleAncestor "i5" -- №6 Nothing