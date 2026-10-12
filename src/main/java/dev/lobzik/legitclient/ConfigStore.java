package dev.lobzik.legitclient;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import net.fabricmc.loader.api.FabricLoader;

import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.LinkedHashMap;
import java.util.Map;

public final class ConfigStore {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private static final Path FILE = FabricLoader.getInstance().getConfigDir().resolve("legitclient.json");
    private static final Type MAP_TYPE = new TypeToken<Map<String, Boolean>>() {}.getType();

    private ConfigStore() {}

    public static void load(ModuleManager manager) {
        if (!Files.exists(FILE)) return;
        try {
            Map<String, Boolean> values = GSON.fromJson(Files.readString(FILE), MAP_TYPE);
            if (values == null) return;
            values.forEach((id, enabled) -> {
                ClientModule module = manager.get(id);
                if (module != null && enabled != null) module.setEnabled(enabled);
            });
        } catch (IOException | RuntimeException ignored) {
            // Ignore malformed config so it cannot prevent launch.
        }
    }

    public static void save(ModuleManager manager) {
        Map<String, Boolean> values = new LinkedHashMap<>();
        for (ClientModule module : manager.all()) values.put(module.id(), module.enabled());
        try {
            Files.createDirectories(FILE.getParent());
            Files.writeString(FILE, GSON.toJson(values));
        } catch (IOException ignored) {
            // A failed save must not crash the client.
        }
    }
}
