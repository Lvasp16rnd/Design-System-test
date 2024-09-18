import 'package:flutter/material.dart';
import '../Components/Buttons/ActionButton/action_button.dart';
import '../Components/Buttons/ActionButton/action_button_view_model.dart';

class ActionButtonSampleScreen extends StatelessWidget {
  const ActionButtonSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // O DefaultTabController gerencia o estado das abas
      length: 3, // Define o número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Action Button Samples'),
          bottom: TabBar(
            // O TabBar é a barra de abas na parte superior
            tabs: [
              Tab(text: 'Primary'), // Primeira aba
              Tab(text: 'Secondary'), // Segunda aba
              Tab(text: 'Tertiary'), // Terceira aba
            ],
          ),
        ),
        body: TabBarView(
          // O TabBarView exibe o conteúdo correspondente a cada aba
          children: [
            // Conteúdo para a aba "Primary"
            _buildActionButtonGroup(ActionButtonStyle.primary),
            // Conteúdo para a aba "Secondary"
            _buildActionButtonGroup(ActionButtonStyle.secondary),
            // Conteúdo para a aba "Tertiary"
            _buildActionButtonGroup(ActionButtonStyle.tertiary),
          ],
        ),
      ),
    );
  }

  // Função auxiliar para construir um grupo de botões
  Widget _buildActionButtonGroup(ActionButtonStyle style) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Botão grande
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: style,
                size: ActionButtonSize.large,
                text: 'Action button',
              ),
            ),
            SizedBox(height: 8),
            // Botão médio
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: style,
                size: ActionButtonSize.medium,
                text: 'Action button',
              ),
            ),
            SizedBox(height: 4),
            // Botão pequeno
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                style: style,
                size: ActionButtonSize.small,
                text: 'Action button',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
