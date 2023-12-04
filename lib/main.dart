import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Configurações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          _buildSettingsItem(
            title: 'Informações da Conta',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountInfoScreen()),
              );
            },
          ),
          _buildSettingsItem(
            title: 'Alterar a Senha',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
              );
            },
          ),
          _buildSettingsItem(
            title: 'Desenvolvedores',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DevelopersScreen()),
              );
            },
          ),
          _buildSettingsItem(
            title: 'Uso de Dados do Usuário',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserDataUsageScreen()),
              );
            },
          ),
          _buildSettingsItem(
            title: 'Termos de Uso',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsOfUseScreen()),
              );
            },
          ),
          _buildSettingsItem(
            title: 'Política de Privacidade',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
              );
            },
          ),
          const Spacer(),
          _buildSettingsItem(
            title: 'Sair da Conta',
            onTap: () {

            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações da Conta'),
        centerTitle: true,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),

          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: Rafael Loureiro Melare',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Username: rafamelare',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Email: rafamelare@puccampinas.edu.br',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Data de Nascimento: 21/08/2002',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar a Senha'),
        centerTitle: true,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha Atual'),
            ),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Nova Senha'),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirmar Nova Senha'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _changePassword(context);
              },
              child: const Text('Alterar Senha'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                );
              },
              child: const Text('Esqueceu a Senha?'),
            ),
          ],
        ),
      ),
    );
  }

  void _changePassword(BuildContext context) {

    String currentPassword = _currentPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As novas senhas não coincidem.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Senha alterada com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esqueceu a Senha'),
        centerTitle: true,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Cadastrado'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _sendPasswordRecoveryEmail(context);
              },
              child: const Text('Enviar Email de Recuperação de Senha'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendPasswordRecoveryEmail(BuildContext context) {

    String userEmail = _emailController.text;

    if (userEmail.isEmpty || !userEmail.contains('@puccampinas.edu.br')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, insira um email válido.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email de recuperação enviado para $userEmail.'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class DevelopersScreen extends StatelessWidget {
  const DevelopersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desenvolvedores'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeveloperItem(context, 'Davi Silveira Okida', 'https://github.com/Davi-SO'),
            _buildDeveloperItem(context, 'Igor Siqueira Massaro', 'https://github.com/dev2'),
            _buildDeveloperItem(context, 'João Vitor Gomide Campos', 'https://github.com/JvGomide'),
            _buildDeveloperItem(context, 'Pedro Alberto Falqueiro Giorgiano', 'https://github.com/Pedro-Giorgiano'),
            _buildDeveloperItem(context, 'Rafael Loureiro Melare', 'https://github.com/RafaelMelare'),
            _buildDeveloperItem(context, 'Ricardo Zaninelli Schreiber', 'https://github.com/rzschrb'),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperItem(BuildContext context, String developerName, String githubUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nome:  $developerName',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => _openGitHubProfile(context, githubUrl),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'GitHub: $githubUrl',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _openGitHubProfile(BuildContext context, String githubUrl) async {
    try {
      await launchUrl(Uri.parse(githubUrl));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível abrir o link.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}



class UserDataUsageScreen extends StatelessWidget {
  const UserDataUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uso de Dados do Usuário'),
        centerTitle: true,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explicação sobre o Uso de Dados do Usuário:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildFormattedText(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFormattedText() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'Coletamos dados do usuário para personalizar o conteúdo, ',
          ),
          TextSpan(
            text: 'proporcionar uma experiência mais relevante ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'e ',
          ),
          TextSpan(
            text: 'melhorar nossos serviços',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '. Esses dados podem incluir informações como preferências, interações e histórico de uso.',
          ),
        ],
      ),
    );
  }
}

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termos de Uso'),
        centerTitle: true,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBoldText('Termos de Uso', fontSize: 20),
              const SizedBox(height: 16),
              _buildTermsOfUseText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsOfUseText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBoldText('Conta de Usuário:'),
        const Text(
          'Ao criar uma conta, você concorda em fornecer informações precisas e atualizadas.',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'Você é responsável por manter a confidencialidade de sua senha e conta.\n',
          style: TextStyle(fontSize: 16),
        ),

        _buildBoldText('Comportamento do Usuário:'),
        const Text(
          'Você concorda em não violar as leis aplicáveis e os direitos de terceiros.',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'Não é permitido publicar conteúdo ilegal, difamatório, ofensivo ou prejudicial.\n',
          style: TextStyle(fontSize: 16),
        ),

        _buildBoldText('Propriedade Intelectual:'),
        const Text(
          'A plataforma e seu conteúdo são protegidos por direitos autorais e outras leis de propriedade intelectual.',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'Você concorda em não copiar, modificar, distribuir ou reproduzir o conteúdo sem permissão.\n',
          style: TextStyle(fontSize: 16),
        ),

        _buildBoldText('Responsabilidade do Conteúdo:'),
        const Text(
          'O conteúdo postado é de responsabilidade do usuário.',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'A plataforma reserva-se o direito de remover conteúdo considerado inapropriado.\n',
          style: TextStyle(fontSize: 16),
        ),

        _buildBoldText('Privacidade e Dados:'),
        const Text(
          'Ao usar a plataforma, você concorda com a política de privacidade.',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'Suas informações serão usadas de acordo com as práticas de privacidade.\n',
          style: TextStyle(fontSize: 16),
        ),

        _buildBoldText('Encerramento de Conta:'),
        const Text(
          'A plataforma pode encerrar ou suspender sua conta por violações dos termos.',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'Você pode encerrar sua conta a qualquer momento.\n',
          style: TextStyle(fontSize: 16),
        ),

        _buildBoldText('Modificações nos Termos:'),
        const Text(
          'Os termos de uso podem ser atualizados, e você será notificado sobre as alterações.\n',
          style: TextStyle(fontSize: 16),
        ),

        _buildBoldText('Limitação de Responsabilidade:'),
        const Text(
          'A plataforma não é responsável por danos diretos ou indiretos decorrentes do uso.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBoldText(String text, {double fontSize = 16}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidade'),
        centerTitle: true,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),

          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBoldText('Política de Privacidade', fontSize: 20),
              const SizedBox(height: 16),
              _buildPrivacyPolicyText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyPolicyText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBoldText('Coleta de Informações:'),
        const Text(
          ' Coletamos informações que você fornece ao criar uma conta, incluindo seu nome de usuário, endereço de e-mail e data de nascimento. Podemos coletar informações sobre suas interações na plataforma, como postagens, curtidas e seguidores. Utilizamos cookies e tecnologias semelhantes para melhorar a experiência do usuário.\n\n',
          style: TextStyle(fontSize: 16),
        ),
        _buildBoldText('Uso de Informações:'),
        const Text(
          ' Utilizamos suas informações para personalizar o conteúdo, fornecer funcionalidades da plataforma e melhorar nossos serviços. Não compartilhamos suas informações com terceiros sem o seu consentimento, exceto quando necessário para cumprir obrigações legais.\n\n',
          style: TextStyle(fontSize: 16),
        ),
        _buildBoldText('Segurança:'),
        const Text(
          ' Implementamos medidas de segurança para proteger suas informações contra acesso não autorizado.\n\n',
          style: TextStyle(fontSize: 16),
        ),
        _buildBoldText('Controle de Informações:'),
        const Text(
          ' Você tem controle sobre suas informações e pode revisar, corrigir ou excluir dados da sua conta.\n\n',
          style: TextStyle(fontSize: 16),
        ),
        const Text(
          'Ao usar nossa plataforma, você concorda com os termos desta Política de Privacidade. Se tiver alguma dúvida, entre em contato conosco.\n\nÚltima atualização: [27/11/2023].\n',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBoldText(String text, {double fontSize = 16}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}


