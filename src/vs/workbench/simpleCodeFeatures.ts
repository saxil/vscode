/**
 * Feature Configuration for Simple Code Editor
 *
 * This file defines which features are enabled or disabled in the simplified build.
 * Set feature flags to control which parts of VS Code are included.
 */

export interface ISimpleCodeFeatures {
	// Core Editor Features
	coreEditor: boolean;
	fileExplorer: boolean;
	search: boolean;
	commandPalette: boolean;
	quickAccess: boolean;

	// GitHub Integration
	sourceControl: boolean;
	githubAuth: boolean;

	// AI Features
	chat: boolean;
	inlineChat: boolean;
	copilotSupport: boolean;

	// Extensions
	extensionManager: boolean;
	extensionGallery: boolean;

	// Terminal
	integratedTerminal: boolean;

	// UI Features
	statusBar: boolean;
	activityBar: boolean;
	sidebar: boolean;
	panel: boolean;
	tabs: boolean;

	// Advanced Features (disabled in simple mode)
	debugging: boolean;
	testing: boolean;
	notebooks: boolean;
	remoteDevlopment: boolean;
	tasks: boolean;
	timeline: boolean;
	performance: boolean;
	telemetry: boolean;
	userDataSync: boolean;
	surveys: boolean;
	mergeEditor: boolean;
	multiDiffEditor: boolean;
	processExplorer: boolean;

	// Themes and Customization
	basicThemes: boolean;
	advancedThemes: boolean;
	customization: boolean;

	// Language Features
	basicLanguageSupport: boolean;
	advancedLanguageFeatures: boolean;

	// Preferences
	basicPreferences: boolean;
	advancedPreferences: boolean;

	// Accessibility
	basicAccessibility: boolean;
	advancedAccessibility: boolean;
}

/**
 * Simple Code Editor Feature Configuration
 *
 * This configuration enables only essential features for a lightweight code editor
 * focused on basic editing, GitHub integration, and AI chat capabilities.
 */
export const SIMPLE_CODE_FEATURES: ISimpleCodeFeatures = {
	// Core Editor Features - ENABLED
	coreEditor: true,
	fileExplorer: true,
	search: true,
	commandPalette: true,
	quickAccess: true,

	// GitHub Integration - ENABLED
	sourceControl: true,
	githubAuth: true,

	// AI Features - ENABLED
	chat: true,
	inlineChat: true,
	copilotSupport: true,

	// Extensions - ENABLED (limited)
	extensionManager: true,
	extensionGallery: true,

	// Terminal - ENABLED (basic)
	integratedTerminal: true,

	// UI Features - ENABLED
	statusBar: true,
	activityBar: true,
	sidebar: true,
	panel: true,
	tabs: true,

	// Advanced Features - DISABLED
	debugging: false,
	testing: false,
	notebooks: false,
	remoteDevlopment: false,
	tasks: false,
	timeline: false,
	performance: false,
	telemetry: false,
	userDataSync: false,
	surveys: false,
	mergeEditor: false,
	multiDiffEditor: false,
	processExplorer: false,

	// Themes and Customization - BASIC ONLY
	basicThemes: true,
	advancedThemes: false,
	customization: false,

	// Language Features - BASIC ONLY
	basicLanguageSupport: true,
	advancedLanguageFeatures: false,

	// Preferences - BASIC ONLY
	basicPreferences: true,
	advancedPreferences: false,

	// Accessibility - BASIC ONLY
	basicAccessibility: true,
	advancedAccessibility: false,
};

/**
 * Check if a feature is enabled in the current configuration
 */
export function isFeatureEnabled(feature: keyof ISimpleCodeFeatures): boolean {
	return SIMPLE_CODE_FEATURES[feature];
}

/**
 * Get the current feature configuration
 */
export function getFeatureConfig(): ISimpleCodeFeatures {
	return SIMPLE_CODE_FEATURES;
}

/**
 * Conditional imports based on feature flags
 * This can be used in the build process to exclude disabled features
 */
export const CONDITIONAL_IMPORTS = {
	// Only import if debugging is enabled
	debugging: SIMPLE_CODE_FEATURES.debugging ? [
		'./contrib/debug/browser/debug.contribution.js',
		'./contrib/debug/browser/debugEditorContribution.js',
		'./contrib/debug/browser/breakpointEditorContribution.js',
		'./contrib/debug/browser/callStackEditorContribution.js',
		'./contrib/debug/browser/repl.js',
		'./contrib/debug/browser/debugViewlet.js',
	] : [],

	// Only import if testing is enabled
	testing: SIMPLE_CODE_FEATURES.testing ? [
		'./contrib/testing/browser/testing.contribution.js',
	] : [],

	// Only import if notebooks are enabled
	notebooks: SIMPLE_CODE_FEATURES.notebooks ? [
		'./contrib/notebook/browser/notebook.contribution.js',
		'./contrib/interactive/browser/interactive.contribution.js',
		'./contrib/replNotebook/browser/repl.contribution.js',
	] : [],

	// Only import if telemetry is enabled
	telemetry: SIMPLE_CODE_FEATURES.telemetry ? [
		'./contrib/telemetry/browser/telemetry.contribution.js',
	] : [],

	// Only import if tasks are enabled
	tasks: SIMPLE_CODE_FEATURES.tasks ? [
		'./contrib/tasks/browser/task.contribution.js',
	] : [],

	// Only import if timeline is enabled
	timeline: SIMPLE_CODE_FEATURES.timeline ? [
		'./contrib/timeline/browser/timeline.contribution.js',
	] : [],

	// Only import if performance monitoring is enabled
	performance: SIMPLE_CODE_FEATURES.performance ? [
		'./contrib/performance/browser/performance.contribution.js',
	] : [],

	// Only import if user data sync is enabled
	userDataSync: SIMPLE_CODE_FEATURES.userDataSync ? [
		'./contrib/userDataSync/browser/userDataSync.contribution.js',
		'./contrib/userDataProfile/browser/userDataProfile.contribution.js',
		'./contrib/editSessions/browser/editSessions.contribution.js',
	] : [],

	// Only import if surveys are enabled
	surveys: SIMPLE_CODE_FEATURES.surveys ? [
		'./contrib/surveys/browser/nps.contribution.js',
		'./contrib/surveys/browser/languageSurveys.contribution.js',
	] : [],

	// Only import if merge editor is enabled
	mergeEditor: SIMPLE_CODE_FEATURES.mergeEditor ? [
		'./contrib/mergeEditor/browser/mergeEditor.contribution.js',
	] : [],

	// Only import if remote development is enabled
	remoteDevlopment: SIMPLE_CODE_FEATURES.remoteDevlopment ? [
		'./contrib/remote/common/remote.contribution.js',
		'./contrib/remote/browser/remote.contribution.js',
	] : [],
};

/**
 * Get all imports that should be included based on current feature flags
 */
export function getEnabledImports(): string[] {
	const imports: string[] = [];

	Object.values(CONDITIONAL_IMPORTS).forEach(importList => {
		imports.push(...importList);
	});

	return imports;
}

/**
 * Check if the current build is the simplified version
 */
export function isSimplifiedBuild(): boolean {
	return !SIMPLE_CODE_FEATURES.debugging &&
		!SIMPLE_CODE_FEATURES.testing &&
		!SIMPLE_CODE_FEATURES.notebooks &&
		!SIMPLE_CODE_FEATURES.telemetry;
}
