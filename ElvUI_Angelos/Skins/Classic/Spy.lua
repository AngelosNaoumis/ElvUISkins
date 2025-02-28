local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local hooksecurefunc = hooksecurefunc
local pairs = pairs
local type = type
local unpack = unpack

function S:Spy()
    -- Main frames
    if _G.Spy_MainWindow then
        S:HandleFrame(_G.Spy_MainWindow)
        _G.Spy_MainWindow:SetTemplate("Transparent")

        -- Make title bar transparent
        if _G.Spy_MainWindow.TitleBar then
            _G.Spy_MainWindow.TitleBar:SetAlpha(0)
        end
    end

    -- Skin alert window
    if _G.Spy_AlertWindow then
        S:HandleFrame(_G.Spy_AlertWindow)

        -- Skin alert icon
        if _G.Spy_AlertWindow.Icon then
            _G.Spy_AlertWindow.Icon:CreateBackdrop()
        end
    end

    -- Skin bar frames (detected players)
    for i = 1, 10 do
        local bar = _G["Spy_MainWindow_Bar" .. i]
        if bar then
            bar:SetTemplate("Transparent")
        end
    end

    -- Skin and resize close button
    if _G.Spy_MainWindow and _G.Spy_MainWindow.CloseButton then
        S:HandleCloseButton(_G.Spy_MainWindow.CloseButton)
        _G.Spy_MainWindow.CloseButton:SetSize(22, 22)
    end

    -- Hide clear button and adjust layout
    if _G.Spy_MainWindow and _G.Spy_MainWindow.ClearButton then
        _G.Spy_MainWindow.ClearButton:SetSize(22, 22)
    end

    -- Resize statistics button
    if _G.Spy_MainWindow and _G.Spy_MainWindow.StatsButton then
        _G.Spy_MainWindow.StatsButton:SetSize(14, 14)
    end

    -- Resize arrow buttons
    if _G.Spy_MainWindow then
        if _G.Spy_MainWindow.LeftButton then
            S:HandleNextPrevButton(_G.Spy_MainWindow.LeftButton)
            _G.Spy_MainWindow.LeftButton:SetSize(16, 16)
        end
        if _G.Spy_MainWindow.RightButton then
            S:HandleNextPrevButton(_G.Spy_MainWindow.RightButton)
            _G.Spy_MainWindow.RightButton:SetSize(16, 16)
        end
    end

    -- Stats frame
    if _G.SpyStatsFrame then
        S:HandlePortraitFrame(_G.SpyStatsFrame)
        if _G.SpyStatsFrame.StatsFrame then
            _G.SpyStatsFrame.StatsFrame:StripTextures()
            _G.SpyStatsFrame.StatsFrame:SetTemplate('Transparent')
        end
        if _G.SpyStatsPlayerHistoryFrame then
            _G.SpyStatsPlayerHistoryFrame:StripTextures()
            _G.SpyStatsPlayerHistoryFrame:SetTemplate('Transparent')
        end
        if _G.SpyStatsTabFrameTabContentFrame then
            _G.SpyStatsTabFrameTabContentFrame:StripTextures()
            _G.SpyStatsTabFrameTabContentFrame:SetTemplate('Transparent')
            if _G.SpyStatsTabFrameTabContentFrame.ContentFrame then
                _G.SpyStatsTabFrameTabContentFrame.ContentFrame:StripTextures()
                _G.SpyStatsTabFrameTabContentFrame.ContentFrame:SetTemplate('Transparent')
            end
        end
    end

	if _G.SpyStatsFrameTopCloseButton then
    	S:HandleCloseButton(_G.SpyStatsFrameTopCloseButton)
	end

    if _G.SpyStatsFilterBox and _G.SpyStatsFilterBox.FilterBox then
        _G.SpyStatsFilterBox.FilterBox:StripTextures()
        S:HandleEditBox(_G.SpyStatsFilterBox.FilterBox)
        _G.SpyStatsFilterBox:SetSize(150, 15)
    end

    if _G.SpyStatsKosCheckbox then
		S:HandleCheckBox(_G.SpyStatsKosCheckbox)
	end
    if _G.SpyStatsRealmCheckbox then
		S:HandleCheckBox(_G.SpyStatsRealmCheckbox)
	end
    if _G.SpyStatsWinsLosesCheckbox then
		S:HandleCheckBox(_G.SpyStatsWinsLosesCheckbox)
	end
    if _G.SpyStatsReasonCheckbox then
		S:HandleCheckBox(_G.SpyStatsReasonCheckbox)
	end
    if _G.SpyStatsRefreshButton then
        S:HandleButton(_G.SpyStatsRefreshButton)
        _G.SpyStatsRefreshButton:ClearAllPoints()
        _G.SpyStatsRefreshButton:SetPoint("BOTTOMRIGHT", _G.SpyStatsFrame, "BOTTOMRIGHT", -12, 5)
        _G.SpyStatsRefreshButton:SetBackdrop()
    end

    if _G.SpyStatsTabFrameTabContentFrameScrollFrameScrollBar then
        S:HandleScrollBar(_G.SpyStatsTabFrameTabContentFrameScrollFrameScrollBar)
    end
end

S:AddCallbackForAddon("Spy")
