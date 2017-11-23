from docutils import nodes
from docutils.parsers.rst import Directive


class pseudocode(nodes.Part, nodes.Element):
    pass


def html_visit_pseudocode(self, node):
    self.body.append('<pre id="{}" style="display: none;">'.format(node['tagid']))
    self.body.append(r'\begin{algorithm}')
    self.body.append('\n')
    self.body.append(r'\caption{}')
    self.body.append('\n')
    self.body.append(r'\begin{algorithmic}')
    self.body.append('\n')
    self.body.append(node['latex'])
    self.body.append('\n')
    self.body.append(r'\end{algorithmic}')
    self.body.append('\n')
    self.body.append(r'\end{algorithm}')
    self.body.append('\n')
    self.body.append('</pre>')

def html_depart_pseudocode(self, node):
    self.body.append('<script>')
    self.body.append(
      'var block = document.getElementById("{}");'.format(node['tagid']));
    self.body.append('''
      var code = block.textContent;
      var options = {
        lineNumber: true,
      };
      var outputEl = document.createElement('div');
    ''')
    self.body.append(
      'outputEl.id = "{}-out";'.format(node['tagid']))
    self.body.append('''
      block.parentNode.insertBefore(outputEl, block.nextSibling);
      pseudocode.render(code, outputEl, options);
    ''')
    self.body.append('</script>')


class PseudoCodeDirective(Directive):
    has_content = True

    def run(self):
        env = self.state.document.settings.env
        tagid = "pseudocode-{}".format(env.new_serialno('pseudocode'))
        latex = '\n'.join(self.content)

        node = pseudocode()
        node['latex'] = latex
        node['tagid'] = tagid

        return [node]


def builder_inited(app):
    app.add_stylesheet('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-alpha1/katex.min.css')
    app.add_javascript('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-alpha1/katex.min.js')

    app.add_stylesheet('css/pseudocode.min.css')
    app.add_javascript('js/pseudocode.min.js')


def setup(app):
    app.add_node(
        pseudocode,
        html=(html_visit_pseudocode, html_depart_pseudocode))

    app.add_directive('pseudo-code', PseudoCodeDirective)
    app.connect('builder-inited', builder_inited)
