import tinymce from 'tinymce/tinymce';
import 'tinymce/themes/silver/theme';
import 'tinymce/plugins/table';
import 'tinymce/plugins/lists';
import "tinymce/skins/ui/oxide/skin.min.css";
import "tinymce/skins/content/default/content.min.css";

function tinyMce() {
    tinymce.init({
        selector: 'textarea.tinymce',
        // some other settings, like height, language,
        // order of buttons on your toolbar etc.
        plugins: [
            'table', 'lists'
        ],
    });
}
// if you're using a language file, you can place its content here
export { tinyMce };