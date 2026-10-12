package dev.lobzik.legitclient;

import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.client.gui.components.Button;
import net.minecraft.client.gui.screens.Screen;
import net.minecraft.network.chat.Component;

public final class ClickGuiScreen extends Screen {
    private final ModuleManager modules;

    public ClickGuiScreen(ModuleManager modules) {
        super(Component.literal("Legit Client"));
        this.modules = modules;
    }

    @Override
    protected void init() {
        int w = 210;
        int x = (width - w) / 2;
        int y = Math.max(48, (height - modules.all().size() * 27) / 2);
        for (ClientModule module : modules.all()) {
            addRenderableWidget(Button.builder(label(module), b -> {
                module.toggle();
                ConfigStore.save(modules);
                b.setMessage(label(module));
            }).bounds(x, y, w, 22).build());
            y += 27;
        }
        addRenderableWidget(Button.builder(Component.literal("Save config"), b -> ConfigStore.save(modules))
            .bounds(x, y + 4, w, 22).build());
    }

    private static Component label(ClientModule m) {
        return Component.literal((m.enabled() ? "[ON] " : "[OFF] ") + m.title());
    }

    @Override
    public void render(GuiGraphics graphics, int mouseX, int mouseY, float delta) {
        renderBackground(graphics, mouseX, mouseY, delta);
        graphics.drawCenteredString(font, "LEGIT CLIENT", width / 2, 18, 0xFF8BE9FD);
        graphics.drawCenteredString(font, "Right Shift: menu | H: HUD", width / 2, 32, 0xFFBBBBBB);
        super.render(graphics, mouseX, mouseY, delta);
    }

    @Override
    public boolean isPauseScreen() { return false; }
}
