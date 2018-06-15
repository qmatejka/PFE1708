//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 
package networks;

import node.Node;

network WattsAndStrogatz
{
    parameters:
        int N @prompt("Number of nodes") = default(20);
        int K @prompt("Number of edges before rewiring") = default(4);
        double p @prompt("Probability of rewiring") = default(0.2);
 	submodules:
 	    node[N]: Node {
 	     	parameters:
 	     	    address = index;   
 	    }
    connections allowunconnected:
        //init
        //if (K%2 == 0) {
        for i=0..N, for j=1..K/2 {
			node[i].port++ <--> {  delay = 0.1ms; datarate = 1Gbps; } <--> node[i+j].port++;
        }
        //}
        
        //rewiring
 
}
