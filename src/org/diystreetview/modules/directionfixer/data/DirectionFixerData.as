﻿/*
Copyright 2011 Marek Standio.

This file is part of DIY streetview player.

SaladoPlayer is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published
by the Free Software Foundation, either version 3 of the License,
or (at your option) any later version.

SaladoPlayer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with SaladoPlayer. If not, see <http://www.gnu.org/licenses/>.
*/
package org.diystreetview.modules.directionfixer.data{
	
	import com.panozona.player.module.data.ModuleData;
	import com.panozona.player.module.data.ModuleNode;
	import com.panozona.player.module.data.structure.Master;
	
	public class DirectionFixerData extends Master{
		
		public var settings:Settings = new Settings();
		public var valuesData:ValuesData = new ValuesData();
		public var inOutData:InOutData = new InOutData();
		public var labelToDirection:LabelToDirection = new LabelToDirection();
		
		public function DirectionFixerData(moduleData:ModuleData, debugMode:Boolean){
			super(debugMode);
			
			for each(var moduleNode:ModuleNode in moduleData.moduleNodes) {
				switch (moduleNode.nodeName) {
					case "settings":
						readRecursive(settings, moduleNode);
					break;
					default:
						throw new Error("Could not recognize: "+moduleNode.nodeName);
				}
			}
		}
	}
}