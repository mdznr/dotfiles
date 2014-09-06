function size_of_repo
    while true;
        wc -l *.h *.m */*.h */*.m | tail -n 1 | awk '{print $1}' | read SIZE_NOW
        git log --format="%at" | head -n 1 | read DATE_NOW

        echo -n $DATE_NOW >> ~/Desktop/size.txt
        echo -n " " >> ~/Desktop/size.txt
        echo $SIZE_NOW >> ~/Desktop/size.txt
        git checkout HEAD~5
    end
end
