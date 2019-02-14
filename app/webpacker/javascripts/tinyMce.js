import tinymce from 'tinymce/tinymce';
import 'tinymce/themes/silver/theme';
import 'tinymce/plugins/table';
import 'tinymce/plugins/preview';
import 'tinymce/plugins/searchreplace';
import 'tinymce/plugins/fullscreen';
import 'tinymce/plugins/image';
import 'tinymce/plugins/autolink';
import 'tinymce/plugins/directionality';
import 'tinymce/plugins/link';
import 'tinymce/plugins/media';
import 'tinymce/plugins/template';
import 'tinymce/plugins/codesample';
import 'tinymce/plugins/charmap';
import 'tinymce/plugins/hr';
import 'tinymce/plugins/anchor';
import 'tinymce/plugins/toc';
import 'tinymce/plugins/insertdatetime';
import 'tinymce/plugins/lists';
import 'tinymce/plugins/wordcount';
import 'tinymce/plugins/advlist';
import 'tinymce/plugins/lists';
import 'tinymce/plugins/imagetools';
import 'tinymce/plugins/help';
import 'tinymce/plugins/textpattern';
import 'tinymce/plugins/textcolor';
import "tinymce/skins/ui/oxide/skin.min.css";
import "./langs/pl";
import 'tinymce/skins/content/default/content.css';

function tinyMce() {


    tinymce.init({
        selector: 'textarea.tinymce',
        plugins: 'preview searchreplace autolink directionality fullscreen image link media template codesample table charmap hr anchor toc insertdatetime advlist lists wordcount imagetools textpattern help',
        toolbar: 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
        image_advtab: true,
        image_caption: true,
        language: "pl"
    });


}


export { tinyMce };