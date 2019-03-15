//
//	Copyright  Nemetschek Vectorworks, Inc.
//	Use of this file is governed by the Nemetschek Vectorworks SDK License Agreement
//	http://developer.vectorworks.net/index.php?title=Vectorworks_SDK_License
//


#include "StdHeaders.h"
#include "VectorworksSDK.h"

#include "VWFC/VWUI/DialogEventArgs.h"

using namespace VWFC::VWUI;

VWDialogEventArgs::VWDialogEventArgs()
{
	fDialogID			= 0;
	fpData				= NULL;
	fbNegativeControlID	= false;
	fControlID			= 0;
}

VWDialogEventArgs::VWDialogEventArgs(Sint32 dlgID, Sint32 ctrlID, void* pData)
{
	fDialogID			= dlgID;
	fpData				= pData;
	fbNegativeControlID	= ctrlID < 0;
	fControlID			= ctrlID >= 0 ? ctrlID : - ctrlID;
}

VWDialogEventArgs::~VWDialogEventArgs()
{
	fDialogID	= 0;
	fControlID	= 0;
	fpData		= NULL;
}

Sint32 VWDialogEventArgs::GetEventData() const
{
	Sint32	data	= 0;
	
	if ( fpData ) {
		Sint32*	pData	= (Sint32*) fpData;
		data			= *pData;
	}

	return data;
}

void* VWDialogEventArgs::GetEventDataPtr() const
{
	return fpData;
}

EListBrowserEventType VWDialogEventArgs::GetListBrowserEvent(size_t& outRowIndex, size_t& outColumnIndex) const
{
	EListBrowserEventType	type		= kListBrowserEventType_Unknown;
	if ( fDialogID == 0 || fControlID == 0 )
	{
		outRowIndex		= size_t(-1);
		outColumnIndex	= size_t(-1);
	}
	else
	{
		Sint32	eventType	= 0;
		Sint32	rowIndex	= 0;
		Sint32	columnIndex	= 0;
		if ( ::GS_GetListBrowserEventInfo( gCBP, fDialogID, fControlID, eventType, rowIndex, columnIndex ) ) {
			if ((eventType != kListBrowserEventType_SelectionChangeClick) ||
				(rowIndex >= 0) && (columnIndex >=0))
			{
				type			= (EListBrowserEventType) eventType;
				outRowIndex		= rowIndex; 
				outColumnIndex	= columnIndex;
			}
			else
			{
				type = kListBrowserEventType_Unknown;
				outRowIndex = 0;
				outColumnIndex = 0;
			}
		}
	}

	return type;
}

bool VWDialogEventArgs::IsListBrowserDoubleClickEvent() const
{
	return fbNegativeControlID;
}

bool VWDialogEventArgs::IsListBrowserNextMessageIsDropInfo() const
{
	return this->GetEventData() == -50;
}

SListBrowserDragDropInfo* VWDialogEventArgs::GetListBrowserDropInfo()
{
	SListBrowserDragDropInfo** ppInfo = (SListBrowserDragDropInfo**) this->GetEventDataPtr();
    return ppInfo ? *ppInfo : nullptr;
}

bool VWDialogEventArgs::IsListBrowserDrawNDropEnd() const
{
	return this->GetEventData() == -51;
}

bool VWDialogEventArgs::IsPullDownNotification() const
{
	return this->GetEventData() == -1;
}

bool VWDialogEventArgs::IsImagePopupSelected() const
{
	return !fbNegativeControlID;
}

bool VWDialogEventArgs::IsImagePopupBeforeOpen() const
{
	bool result = false;
	if ( fbNegativeControlID )
	{
		SImagePopupAdvancedMsgData* pInfo = (SImagePopupAdvancedMsgData*) this->GetEventDataPtr();
		result = pInfo ? pInfo->fReason == SImagePopupAdvancedMsgData::Opened : false;
	}

	return result;
}

bool VWDialogEventArgs::IsImagePopupCategoryChanged(size_t& outCategoryIndex)
{
	bool result = false;
	if ( fbNegativeControlID )
	{
		SImagePopupAdvancedMsgData* pInfo = (SImagePopupAdvancedMsgData*) this->GetEventDataPtr();
		result = pInfo ? pInfo->fReason == SImagePopupAdvancedMsgData::CategoryChanged : false;
		if ( result )
		{
			outCategoryIndex = pInfo->fCategoryIndex;
		}
	}

	return result;
}

TTreeItemID VWDialogEventArgs::GetTreeCtrlClickItemID() const
{
	TTreeItemID result = -1;
	if ( fpData )
	{
		TreeControlClickMessageData* msgData = (TreeControlClickMessageData*) fpData;
		result = msgData->fItemClickedOn;
	}

	return result;
}

bool VWDialogEventArgs::IsTreeCtrlSelectionChanged() const
{
	bool result = false;
	if ( fpData )
	{
		TreeControlClickMessageData* msgData = (TreeControlClickMessageData*) fpData;
		result = msgData->fIsSelectionChanged;
	}

	return result;
}

bool VWDialogEventArgs::IsTreeCtrlDoubleClickEvent() const
{
	bool result = false;
	if ( fpData )
	{
		TreeControlClickMessageData* msgData = (TreeControlClickMessageData*) fpData;
		result = msgData->fIsDoubleClick;
	}

	return result;
}

bool VWDialogEventArgs::IsTreeCtrlClickOnIcon() const
{
	bool result = false;
	if ( fpData )
	{
		TreeControlClickMessageData* msgData = (TreeControlClickMessageData*) fpData;
		result = msgData->fIsClickOnIcon;
	}

	return result;
}

bool VWDialogEventArgs::IsTreeCtrlClickOnCheckBox() const
{
	bool result = false;
	if ( fpData )
	{
		TreeControlClickMessageData* msgData = (TreeControlClickMessageData*) fpData;
		result = msgData->fIsCLickOnCheckBox;
	}

	return result;
}

void VWDialogEventArgs::GetTreeCtrlModifiers(bool& outShiftDown, bool& outCtrlDown, bool& outAltDown) const
{
	outShiftDown = false;
	outCtrlDown = false;
	outAltDown = false;
	if ( fpData )
	{
		TreeControlClickMessageData* msgData = (TreeControlClickMessageData*) fpData;
		outShiftDown = msgData->fShiftKeyDown;
		outCtrlDown = msgData->fControlKeyDown;
		outAltDown = msgData->fAltKeyDown;
	}
}

bool VWDialogEventArgs::GetTreeCtrlKeyClick(Sint32& outKeyCode) const
{
	bool result = false;
	if ( fpData )
	{
		TreeControlClickMessageData* msgData = (TreeControlClickMessageData*) fpData;
		result = msgData->fIsKeyClick;
		outKeyCode = msgData->fKeyClickCode;
	}

	return result;
}

bool VWDialogEventArgs::IsCustomCtrlMouseDown() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 0 ] == -1;
}

bool VWDialogEventArgs::IsCustomCtrlClickEvent() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 0 ] == 0;
}

bool VWDialogEventArgs::IsCustomCtrlDoubleClickEvent() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 0 ] == 10;
}

bool VWDialogEventArgs::IsCustomCtrlRightClickEvent() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 0 ] == 1;
}

bool VWDialogEventArgs::IsCustomCtrlRightDoubleClickEvent() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 0 ] == 10;
}

bool VWDialogEventArgs::IsCustomCtrlMiddleClickEvent() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 0 ] == 2;
}

bool VWDialogEventArgs::IsCustomCtrlMiddleDoubleClickEvent() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 0 ] == 20;
}

Sint32 VWDialogEventArgs::GetCustomCtrlEventPosX() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 1 ];
}

Sint32 VWDialogEventArgs::GetCustomCtrlEventPosY() const
{
	Sint32* arr = (Sint32*) fpData;
	return arr[ 2 ];
}

