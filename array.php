<?php
// PHP simple program to find
// elements which are not
// present in second array
 
// Function for finding
// elements which are there
// in a[] but not in b[].
function findMissing( $a, $b, $n, $m)
{
    for ( $i = 0; $i < $n; $i++)
    {
        $j;
        for ($j = 0; $j < $m; $j++)
            if ($a[$i] == $b[$j])
                break;
 
        if ($j == $m)
            echo $a[$i] , " ";
    }
}
 
// Driver code
$a = array( 1, 2, 6, 3, 4, 5 );
$b = array( 2, 4, 3, 1, 0 );
$n = count($a);
$m = count($b);
findMissing($a, $b, $n, $m);
 
// This code is contributed by anuj_67.
?>