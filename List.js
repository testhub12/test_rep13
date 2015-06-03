
function ListSelections(clientID) {
    this.id = clientID;
}

ListSelections.prototype = {
    init: function () {
        var btn = $("#" + this.id + "btnAddToRight");
        var controlId = this.id;
        var control = this;

        //right btn
        $("#" + this.id + "btnAddToRight").click(function (e) {

        });

        //right btn all
   
                var targetLen = targetList.options.length;

                for (var i = targetLen - 1; i > -1; i--) {
                    sourceList[sourceLen++] = new Option(targetList.options[i].text, targetList.options[i].value);
                    targetList.options.remove(i);
                }

                targetLen = targetList.options.length;
                var hidden = $("#" + controlId + "hfTargetValues");
                var strTarget = '';
                for (var i = 0; i < targetLen; i++) {
                    if (i < targetLen - 1)
                        strTarget += targetList.options[i].value + "|";
                    else
                        strTarget += targetList.options[i].value
                }

                hidden.val(strTarget);

                control.onRemoveComplete();
            }
        });
    },

    addSourceItem: function (text, value) {
        var sourceList = document.getElementById(this.id + "lstbxtSelectionPool");

        var sourceLen = sourceList.options.length;
        sourceList[sourceLen++] = new Option(text, value);
    },

    addTargetItem: function (text, value) {

        var targetList = document.getElementById(this.id + "lstbxTarget");
        var targetLen = targetList.options.length;

        targetList[targetLen++] = new Option(text, value);

        targetLen = targetList.options.length;
        var hidden = $("#" + this.id + "hfTargetValues");
        var strTarget = '';
        for (var i = 0; i < targetLen; i++) {
            if (i < targetLen - 1)
                strTarget += targetList.options[i].value + "|";
            else
                strTarget += targetList.options[i].value
        }

        hidden.val(strTarget);
    },

    addSourceToTargetByValue: function (value) {
        var sourceList = document.getElementById(this.id + "lstbxtSelectionPool");
        var targetList = document.getElementById(this.id + "lstbxTarget");
        var sourceLen = sourceList.options.length;
        var targetLen = targetList.options.length;

        for (var i = sourceLen - 1; i > -1; i--) {           
            if (sourceList.options[i].value == value) {      
                targetList[targetLen++] = new Option(sourceList.options[i].text, sourceList.options[i].value);          
                sourceList.options.remove(i);
            }
        }

        targetLen = targetList.options.length;
        var hidden = $("#" + this.id + "hfTargetValues");
        var strTarget = '';
        for (var i = 0; i < targetLen; i++) {
            if (i < targetLen - 1)
                strTarget += targetList.options[i].value + "|";
            else
                strTarget += targetList.options[i].value
        }

        hidden.val(strTarget);
    },

    getTargetValues: function () {
        return $("#" + this.id + "hfTargetValues").val().split('|');
    },

    getTargetValueString: function () {
        return $("#" + this.id + "hfTargetValues").val();
    },

    clearTargets: function () {
        $('#' + this.id + 'lstbxTarget').empty();
    },

    clear: function () {
        $('#' + this.id + 'lstbxtSelectionPool').empty();
        $('#' + this.id + 'lstbxTarget').empty();
    },

    onRemove: function () {
        return true;
    },

    onRemoveComplete: function () {

    },

    onAddComplete: function () {

    },
};