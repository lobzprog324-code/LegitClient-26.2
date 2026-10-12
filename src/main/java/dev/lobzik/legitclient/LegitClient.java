package dev.lobzik.legitclient;

import net.fabricmc.api.ClientModInitializer;
import net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents;
import net.fabricmc.fabric.api.client.keybinding.v1.KeyBindingHelper;
import net.fabricmc.fabric.api.client.rendering.v1.HudRenderCallback;
import net.minecraft.client.KeyMapping;
import net.minecraft.client.Minecraft;
import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.network.chat.Component;
import org.lwjgl.glfw.GLFW;

public final class LegitClient implements ClientModInitializer {
    public static final ModuleManager MODULES = new ModuleManager();
    private static KeyMapping openMenuKey;
    private static KeyMapping toggleHudKey;

    @Override
    public void onInitializeClient() {
        ConfigStore.load(MODULES);
        openMenuKey = KeyBindingHelper.registerKeyBinding(new KeyMapping(
                "key.legitclient.open_menu", GLFW.GLFW_KEY_RIGHT_SHIFT, KeyMapping.Category.MISC));
        toggleHudKey = KeyBindingHelper.registerKeyBinding(new KeyMapping(
                "key.legitclient.toggle_hud", GLFW.GLFW_KEY_H, KeyMapping.Category.MISC));

        ClientTickEvents.END_CLIENT_TICK.register(client -> {
            while (openMenuKey.consumeClick()) {
                if (client.screen == null) client.setScreen(new ClickGuiScreen(MODULES));
            }
            while (toggleHudKey.consumeClick()) {
                MODULES.toggle("hud");
                ConfigStore.save(MODULES);
            }
        });
        HudRenderCallback.EVENT.register((graphics, tickCounter) -> renderHud(graphics));
    }

    private static void renderHud(GuiGraphics graphics) {
        Minecraft mc = Minecraft.getInstance();
        if (mc.player == null || !MODULES.isEnabled("hud")) return;
        int y = 8;
        graphics.drawString(mc.font, Component.literal("Legit Client"), 8, y, 0xFF8BE9FD, true);
        y += 12;
        if (MODULES.isEnabled("fps")) {
            graphics.drawString(mc.font, Component.literal("FPS: " + mc.getFps()), 8, y, 0xFFFFFFFF, true);
            y += 11;
        }
        if (MODULES.isEnabled("coordinates")) {
            var p = mc.player;
            graphics.drawString(mc.font, Component.literal(String.format("XYZ: %.1f / %.1f / %.1f",
                    p.getX(), p.getY(), p.getZ())), 8, y, 0xFFFFFFFF, true);
        }
    }
}
