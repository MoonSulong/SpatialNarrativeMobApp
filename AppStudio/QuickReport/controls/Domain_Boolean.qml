/* Copyright 2021 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.0

Rectangle{
    width: Math.min(parent.width-20*app.scaleFactor, 400*app.scaleFactor)
    height: 50*app.scaleFactor
    anchors.topMargin: 20 * app.scaleFactor
    anchors.bottomMargin: 20 * app.scaleFactor
    anchors.horizontalCenter: parent.horizontalCenter
    color: "#C86A4A"
    Text{
        text: fieldName + ", " + fieldValue + ", " + fieldType;
    }
}
