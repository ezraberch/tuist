import Foundation
import TSCBasic
import TuistCore
import TuistGraph
import TuistGraphTesting
import TuistLoader

@testable import TuistCoreTesting
@testable import TuistKit

final class MockProjectEditorMapper: ProjectEditorMapping {
    var mapStub: Graph?
    var mapArgs: [(
        name: String,
        tuistPath: AbsolutePath,
        sourceRootPath: AbsolutePath,
        destinationDirectory: AbsolutePath,
        setupPath: AbsolutePath?,
        configPath: AbsolutePath?,
        dependenciesPath: AbsolutePath?,
        projectManifests: [AbsolutePath],
        editablePluginManifests: [EditablePluginManifest],
        pluginProjectDescriptionHelpersModule: [HelpersModule],
        projectDescriptionHelpers: [AbsolutePath],
        projectAutomationHelpers: [AbsolutePath],
        templates: [AbsolutePath],
        tasks: [AbsolutePath],
        projectDescriptionPath: AbsolutePath,
        projectAutomationPath: AbsolutePath
    )] = []

    func map(
        name: String,
        tuistPath: AbsolutePath,
        sourceRootPath: AbsolutePath,
        destinationDirectory: AbsolutePath,
        setupPath: AbsolutePath?,
        configPath: AbsolutePath?,
        dependenciesPath: AbsolutePath?,
        projectManifests: [AbsolutePath],
        editablePluginManifests: [EditablePluginManifest],
        pluginProjectDescriptionHelpersModule: [HelpersModule],
        projectDescriptionHelpers: [AbsolutePath],
        projectAutomationHelpers: [AbsolutePath],
        templates: [AbsolutePath],
        tasks: [AbsolutePath],
        projectDescriptionPath: AbsolutePath,
        projectAutomationPath: AbsolutePath
    ) throws -> Graph {
        mapArgs.append((
            name: name,
            tuistPath: tuistPath,
            sourceRootPath: sourceRootPath,
            destinationDirectory: destinationDirectory,
            setupPath: setupPath,
            configPath: configPath,
            dependenciesPath: dependenciesPath,
            projectManifests: projectManifests,
            editablePluginManifests: editablePluginManifests,
            pluginProjectDescriptionHelpersModule: pluginProjectDescriptionHelpersModule,
            projectDescriptionHelpers: projectDescriptionHelpers,
            projectAutomationHelpers: projectAutomationHelpers,
            templates: templates,
            tasks: tasks,
            projectDescriptionPath: projectDescriptionPath,
            projectAutomationPath: projectAutomationPath
        ))

        if let mapStub = mapStub { return mapStub }
        return Graph.test()
    }
}
