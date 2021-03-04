{**********************************************
	This file was automatically generated 2019:02:25T09:29:00
	
	DO NOT EDIT THIS FILE -- Use Dialog Builder Tools to edit this file.
***********************************************}


PROCEDURE DlgLogin;
CONST
    {Alignment constants}
    kRight                     = 1;
    kBottom                    = 2;
    kLeft                      = 3;
    kColumn                    = 4;
    kResize                    = 0;
    kShift                     = 1;

    { default and cancel button IDs}
    kOK                        = 1;
    kCancel                    = 2;

    { control IDs}
    kMainLbl                   = 4;
    kImageInfo                 = 5;
    kCredentialsStaticTextGrp  = 6;
    kEmailStaticText           = 7;
    kEmailEditTextBox          = 8;
    kPasswordStaticText        = 9;
    kPasswordEditTextBox       = 10;
    kRememberCheckBox          = 11;
    kNoAccessStaticText        = 12;
    kRegisterAccountStaticText = 13;

VAR
    dialog            :INTEGER;
    cnt               :INTEGER;
    major, minor, maintenance, platform:INTEGER;
    v_AccLinks    :BOOLEAN;

FUNCTION GetStr(ndx :STRING) :STRING;
BEGIN
    GetVWRString(GetStr, 'WebExample/Strings/DlgLogin.vwstrings', ndx);
END;

BEGIN
    GetVersion(major, minor, maintenance, platform);
    IF (platform = 1) THEN BEGIN  {IsMac}
      v_AccLinks    := FALSE;
    END ELSE BEGIN
      v_AccLinks    := FALSE;
    END;

v_AccLinks := Rpstr_GetValueBool( 'AccLinks', TRUE );

    dialog := CreateResizableLayout(GetStr('dialog_title'), TRUE, GetStr('ok_button'), GetStr('cancel_button'), TRUE, FALSE );

    {create controls}
    CreateStaticText( dialog, kMainLbl, GetStr('kMainLbl'), 65 );
    CreateImageControl2( dialog, kImageInfo, 0, 0, 'WebExample/Images/DlgLogin.png' );
    CreateGroupBox( dialog, kCredentialsStaticTextGrp, GetStr('kCredentialsStaticTextGrp'), TRUE );
    CreateStaticText( dialog, kEmailStaticText, GetStr('kEmailStaticText'), -1 );
    CreateEditText( dialog, kEmailEditTextBox, GetStr('kEmailEditTextBox'), 30 );
    CreateStaticText( dialog, kPasswordStaticText, GetStr('kPasswordStaticText'), -1 );
    CreateEditPassword( dialog, kPasswordEditTextBox, 30 );
    CreateCheckBox( dialog, kRememberCheckBox, GetStr('kRememberCheckBox') );
    CreateStaticText( dialog, kNoAccessStaticText, GetStr('kNoAccessStaticText'), -1 );
    SetStaticTextStyle( dialog, kNoAccessStaticText, 4 );
    SetStaticTextColor( dialog, kNoAccessStaticText, 0, 0, 255);
    CreateStaticText( dialog, kRegisterAccountStaticText, GetStr('kRegisterAccountStaticText'), -1 );
    SetStaticTextStyle( dialog, kRegisterAccountStaticText, 4 );
    SetStaticTextColor( dialog, kRegisterAccountStaticText, 0, 0, 255);

    {set relations}
    SetFirstLayoutItem( dialog, kMainLbl );
    SetBelowItem( dialog, kMainLbl, kImageInfo, 0, 0 );
    SetRightItem( dialog, kImageInfo, kCredentialsStaticTextGrp, 0, -2 );
    SetFirstGroupItem( dialog, kCredentialsStaticTextGrp, kEmailStaticText );
    SetBelowItem( dialog, kCredentialsStaticTextGrp, kNoAccessStaticText, 0, 0 );
    SetRightItem( dialog, kEmailStaticText, kEmailEditTextBox, 0, 0 );
    SetBelowItem( dialog, kEmailStaticText, kPasswordStaticText, 0, 0 );
    SetRightItem( dialog, kPasswordStaticText, kPasswordEditTextBox, 3, 0 );
    SetBelowItem( dialog, kPasswordStaticText, kRememberCheckBox, 0, 0 );
    SetBelowItem( dialog, kNoAccessStaticText, kRegisterAccountStaticText, 0, 0 );

    {set alignments}
    AlignItemEdge( dialog, kEmailEditTextBox, kLeft, 1, kShift );
    AlignItemEdge( dialog, kPasswordEditTextBox, kLeft, 1, kShift );

    AlignItemEdge( dialog, kMainLbl, kRight, 10, kResize );
    AlignItemEdge( dialog, kCredentialsStaticTextGrp, kRight, 10, kResize );

    {set bindings}
    SetEdgeBinding        ( dialog, kCredentialsStaticTextGrp, TRUE, TRUE, FALSE, FALSE );
    SetEdgeBinding        ( dialog, kEmailEditTextBox, TRUE, TRUE, FALSE, FALSE );
    SetEdgeBinding        ( dialog, kPasswordEditTextBox, TRUE, TRUE, FALSE, FALSE );

    {set help strings}
    SetHelpText(dialog, kOK, GetStr('ok_button_help'));
    SetHelpText(dialog, kCancel, GetStr('cancel_button_help'));
    SetHelpText(dialog, kMainLbl, GetStr('kMainLbl_help'));
    SetHelpText(dialog, kImageInfo, GetStr('kImageInfo_help'));
    SetHelpText(dialog, kCredentialsStaticTextGrp, GetStr('kCredentialsStaticTextGrp_help'));
    SetHelpText(dialog, kEmailStaticText, GetStr('kEmailStaticText_help'));
    SetHelpText(dialog, kEmailEditTextBox, GetStr('kEmailEditTextBox_help'));
    SetHelpText(dialog, kPasswordStaticText, GetStr('kPasswordStaticText_help'));
    SetHelpText(dialog, kPasswordEditTextBox, GetStr('kPasswordEditTextBox_help'));
    SetHelpText(dialog, kRememberCheckBox, GetStr('kRememberCheckBox_help'));
    SetHelpText(dialog, kNoAccessStaticText, GetStr('kNoAccessStaticText_help'));
    SetHelpText(dialog, kRegisterAccountStaticText, GetStr('kRegisterAccountStaticText_help'));
    

    { uncomment to test the script
    IF RunLayoutDialog( dialog, NIL ) = 1 then BEGIN
    END;}

END;
RUN( DlgLogin );

{XML defintion of the layout}
{<BEGIN_XML>
<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<DialogBuilder>

  <LayoutData>
    <Name>DlgLogin</Name>
    <Title>Log In to the Web Service</Title>
    <OKText>Log In</OKText>
    <OKHelpText>Click to log in.</OKHelpText>
    <CancelText>Cancel</CancelText>
    <CancelHelpText>Cancels the log in.</CancelHelpText>
    <ResizableHeight>FALSE</ResizableHeight>
    <StringsStartID>0</StringsStartID>
    <HelpStrStartID>1</HelpStrStartID>
    <TablesAddToDlgRes>TRUE</TablesAddToDlgRes>
    <Precode>v_AccLinks := Rpstr_GetValueBool( 'AccLinks', TRUE );</Precode>
    <AltStringStartID>0</AltStringStartID>
    <ResourceRoot>WebExample</ResourceRoot>
    <ResTables>
      <Table ID="0" Name="misc">
        <Values>
          <Value Constant="LogoutButton">Log Out</Value>
          <Value Constant="LogoutDialogTitle">Log Out of AutoTURN Online</Value>
          <Value Constant="LogoutButtonHelpTxt">Click to log out.</Value>
          <Value Constant="LogoutMainLblTxt">Log out of the AutoTURN Online account in use.</Value>
        </Values>
      </Table>
    </ResTables>
    <Vars>
      <Var>
        <Name>v_AccLinks</Name>
        <Type>BOOLEAN</Type>
        <WinValue>FALSE</WinValue>
        <MacValue>FALSE</MacValue>
      </Var>
    </Vars>
  </LayoutData>

  <Controls>
    <Control name="DialogBuilderControl" x="-79" y="67">
      <Parameter Name="__UUID">%LB6E637087-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="type">kStaticTextGroup</Parameter>
      <Parameter Name="id">6</Parameter>
      <Parameter Name="constName">CredentialsStaticTextGrp</Parameter>
      <Parameter Name="label">Log in credentials</Parameter>
      <Parameter Name="vertOffset">-2</Parameter>
      <Parameter Name="alignGroup">10</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="ctrlWidth">45</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">84mm</Parameter>
      <Parameter Name="ControlPoint00Y">-31mm</Parameter>
      <Parameter Name="ControlPoint01X">44mm</Parameter>
      <Parameter Name="ControlPoint01Y">-74mm</Parameter>
      <Parameter Name="ControlPoint02X">82mm</Parameter>
      <Parameter Name="ControlPoint02Y">-61mm</Parameter>
      <Parameter Name="__BottomUUID">%LB6A8C9B24-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="__savedHandleRightX">84mm</Parameter>
      <Parameter Name="__savedHandleRightY">-31mm</Parameter>
      <Parameter Name="__savedHandleBottomX">44mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-74mm</Parameter>
      <Parameter Name="__fVisControlWidth">84</Parameter>
      <Parameter Name="__fVisControlHeight">63</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-67" y="58">
      <Parameter Name="__UUID">%LBA1BAE49B-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="id">7</Parameter>
      <Parameter Name="constName">EmailStaticText</Parameter>
      <Parameter Name="label">Email:</Parameter>
      <Parameter Name="bindLeft">kNone</Parameter>
      <Parameter Name="bindRight">kNone</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">35mm</Parameter>
      <Parameter Name="ControlPoint00Y">1mm</Parameter>
      <Parameter Name="ControlPoint01X">9mm</Parameter>
      <Parameter Name="ControlPoint01Y">-12mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__RightUUID">%LBA9D1DA67-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="__BottomUUID">%LBA9D1DA68-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="__savedHandleRightX">35mm</Parameter>
      <Parameter Name="__savedHandleRightY">1mm</Parameter>
      <Parameter Name="__savedHandleBottomX">9mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-12mm</Parameter>
      <Parameter Name="__fVisControlWidth">11</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-32" y="61">
      <Parameter Name="__UUID">%LBA9D1DA67-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="type">kEditTextBox</Parameter>
      <Parameter Name="id">8</Parameter>
      <Parameter Name="constName">EmailEditTextBox</Parameter>
      <Parameter Name="helpText">Please enter your email here.</Parameter>
      <Parameter Name="alignGroup">1</Parameter>
      <Parameter Name="alignEdge">kLeft</Parameter>
      <Parameter Name="alignMode">kShift</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="ctrlWidth">30</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">24mm</Parameter>
      <Parameter Name="ControlPoint00Y">-2mm</Parameter>
      <Parameter Name="ControlPoint01X">12mm</Parameter>
      <Parameter Name="ControlPoint01Y">-4mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__savedHandleRightX">24mm</Parameter>
      <Parameter Name="__savedHandleRightY">-2mm</Parameter>
      <Parameter Name="__savedHandleBottomX">12mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-4mm</Parameter>
      <Parameter Name="__fVisControlWidth">24</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-68" y="46">
      <Parameter Name="__UUID">%LBA9D1DA68-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="id">9</Parameter>
      <Parameter Name="constName">PasswordStaticText</Parameter>
      <Parameter Name="label">Password:</Parameter>
      <Parameter Name="bindLeft">kNone</Parameter>
      <Parameter Name="bindRight">kNone</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">34mm</Parameter>
      <Parameter Name="ControlPoint00Y">-1mm</Parameter>
      <Parameter Name="ControlPoint01X">35mm</Parameter>
      <Parameter Name="ControlPoint01Y">-9mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__RightUUID">%LBA9D1DA69-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="__BottomUUID">%LB24E636A7-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="__savedHandleRightX">34mm</Parameter>
      <Parameter Name="__savedHandleRightY">-1mm</Parameter>
      <Parameter Name="__savedHandleBottomX">35mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-9mm</Parameter>
      <Parameter Name="__fVisControlWidth">19</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-34" y="47">
      <Parameter Name="__UUID">%LBA9D1DA69-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="type">kEditPasswordBox</Parameter>
      <Parameter Name="id">10</Parameter>
      <Parameter Name="constName">PasswordEditTextBox</Parameter>
      <Parameter Name="helpText">Please enter your password here.</Parameter>
      <Parameter Name="horzOffset">3</Parameter>
      <Parameter Name="alignGroup">1</Parameter>
      <Parameter Name="alignEdge">kLeft</Parameter>
      <Parameter Name="alignMode">kShift</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="ctrlWidth">30</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">35mm</Parameter>
      <Parameter Name="ControlPoint00Y">-2mm</Parameter>
      <Parameter Name="ControlPoint01X">17mm</Parameter>
      <Parameter Name="ControlPoint01Y">-4mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__savedHandleRightX">35mm</Parameter>
      <Parameter Name="__savedHandleRightY">-2mm</Parameter>
      <Parameter Name="__savedHandleBottomX">17mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-4mm</Parameter>
      <Parameter Name="__fVisControlWidth">35</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LBA1BAE49B-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="RelatedObj">%LBA9D1DA67-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="ParentMode">0</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LBA9D1DA68-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="RelatedObj">%LBA9D1DA69-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="ParentMode">0</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LBA1BAE49B-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="RelatedObj">%LBA9D1DA68-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="ParentMode">1</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-60" y="37">
      <Parameter Name="__UUID">%LB24E636A7-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="type">kCheckBox</Parameter>
      <Parameter Name="id">11</Parameter>
      <Parameter Name="constName">RememberCheckBox</Parameter>
      <Parameter Name="label">Remember my login info.</Parameter>
      <Parameter Name="helpText">Click here if you want Vectorworks to remember your login info.</Parameter>
      <Parameter Name="bindLeft">kNone</Parameter>
      <Parameter Name="bindRight">kNone</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">54mm</Parameter>
      <Parameter Name="ControlPoint00Y">-2mm</Parameter>
      <Parameter Name="ControlPoint01X">27mm</Parameter>
      <Parameter Name="ControlPoint01Y">-4mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__savedHandleRightX">54mm</Parameter>
      <Parameter Name="__savedHandleRightY">-2mm</Parameter>
      <Parameter Name="__savedHandleBottomX">27mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-4mm</Parameter>
      <Parameter Name="__fVisControlWidth">54</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LBA9D1DA68-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="RelatedObj">%LB24E636A7-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="ParentMode">1</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-61" y="-7">
      <Parameter Name="__UUID">%LB6A8C9B24-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="id">12</Parameter>
      <Parameter Name="constName">NoAccessStaticText</Parameter>
      <Parameter Name="label">Can't access your account?</Parameter>
      <Parameter Name="staticTextStyle">kUnderlinedStyle</Parameter>
      <Parameter Name="staticTextColor">0:0:255</Parameter>
      <Parameter Name="helpText">If you can't access your account, enter your email and click this link. A password reset link will be mailed to you.</Parameter>
      <Parameter Name="bindLeft">kNone</Parameter>
      <Parameter Name="bindRight">kNone</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">52mm</Parameter>
      <Parameter Name="ControlPoint00Y">-2mm</Parameter>
      <Parameter Name="ControlPoint01X">32mm</Parameter>
      <Parameter Name="ControlPoint01Y">-8mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__BottomUUID">%LB8D40FAF9-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="__savedHandleRightX">52mm</Parameter>
      <Parameter Name="__savedHandleRightY">-2mm</Parameter>
      <Parameter Name="__savedHandleBottomX">32mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-8mm</Parameter>
      <Parameter Name="__fVisControlWidth">52</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-61" y="-15">
      <Parameter Name="__UUID">%LB8D40FAF9-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="id">13</Parameter>
      <Parameter Name="constName">RegisterAccountStaticText</Parameter>
      <Parameter Name="label">Sign up to setup a FREE account.</Parameter>
      <Parameter Name="staticTextStyle">kUnderlinedStyle</Parameter>
      <Parameter Name="staticTextColor">0:0:255</Parameter>
      <Parameter Name="helpText">Click here to make an account.</Parameter>
      <Parameter Name="bindLeft">kNone</Parameter>
      <Parameter Name="bindRight">kNone</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">63mm</Parameter>
      <Parameter Name="ControlPoint00Y">-2mm</Parameter>
      <Parameter Name="ControlPoint01X">31mm</Parameter>
      <Parameter Name="ControlPoint01Y">-4mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__savedHandleRightX">63mm</Parameter>
      <Parameter Name="__savedHandleRightY">-2mm</Parameter>
      <Parameter Name="__savedHandleBottomX">31mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-4mm</Parameter>
      <Parameter Name="__fVisControlWidth">63</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-150" y="95">
      <Parameter Name="__UUID">%LB5C4FB8D8-933C-417B-8862-76DAC871D02A%RB</Parameter>
      <Parameter Name="id">4</Parameter>
      <Parameter Name="constName">MainLbl</Parameter>
      <Parameter Name="label">Log in into a sample imaginary web service.</Parameter>
      <Parameter Name="alignGroup">10</Parameter>
      <Parameter Name="bindLeft">kNone</Parameter>
      <Parameter Name="bindRight">kNone</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="sizeToText">False</Parameter>
      <Parameter Name="ctrlWidth">65</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">137mm</Parameter>
      <Parameter Name="ControlPoint00Y">-2mm</Parameter>
      <Parameter Name="ControlPoint01X">20mm</Parameter>
      <Parameter Name="ControlPoint01Y">-21mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__BottomUUID">%LB1B332007-4E0C-44D2-82EF-4BFC53D8D7CA%RB</Parameter>
      <Parameter Name="__savedHandleRightX">137mm</Parameter>
      <Parameter Name="__savedHandleRightY">-2mm</Parameter>
      <Parameter Name="__savedHandleBottomX">20mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-21mm</Parameter>
      <Parameter Name="__fVisControlWidth">137</Parameter>
      <Parameter Name="__fVisControlHeight">4</Parameter>
    </Control>
    <Control name="DialogBuilderControl" x="-144" y="74">
      <Parameter Name="__UUID">%LB1B332007-4E0C-44D2-82EF-4BFC53D8D7CA%RB</Parameter>
      <Parameter Name="type">kImageControlPath</Parameter>
      <Parameter Name="id">5</Parameter>
      <Parameter Name="constName">ImageInfo</Parameter>
      <Parameter Name="value">WebExample/Images/DlgLogin.png</Parameter>
      <Parameter Name="helpText">&lt;&lt;provide short description of the service&gt;&gt;</Parameter>
      <Parameter Name="bindLeft">kNone</Parameter>
      <Parameter Name="bindRight">kNone</Parameter>
      <Parameter Name="bindTop">kNone</Parameter>
      <Parameter Name="bindBottom">kNone</Parameter>
      <Parameter Name="renderMode">Wireframe</Parameter>
      <Parameter Name="viewMode">Top/Plan</Parameter>
      <Parameter Name="hasFrame">True</Parameter>
      <Parameter Name="ControlPoint00X">65mm</Parameter>
      <Parameter Name="ControlPoint00Y">-39mm</Parameter>
      <Parameter Name="ControlPoint01X">14mm</Parameter>
      <Parameter Name="ControlPoint01Y">-28mm</Parameter>
      <Parameter Name="ControlPoint02X">0mm</Parameter>
      <Parameter Name="ControlPoint02Y">0mm</Parameter>
      <Parameter Name="__RightUUID">%LB6E637087-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="__savedHandleRightX">65mm</Parameter>
      <Parameter Name="__savedHandleRightY">-39mm</Parameter>
      <Parameter Name="__savedHandleBottomX">14mm</Parameter>
      <Parameter Name="__savedHandleBottomY">-28mm</Parameter>
      <Parameter Name="__fVisControlWidth">28</Parameter>
      <Parameter Name="__fVisControlHeight">28</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LB5C4FB8D8-933C-417B-8862-76DAC871D02A%RB</Parameter>
      <Parameter Name="RelatedObj">%LB1B332007-4E0C-44D2-82EF-4BFC53D8D7CA%RB</Parameter>
      <Parameter Name="ParentMode">1</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LB1B332007-4E0C-44D2-82EF-4BFC53D8D7CA%RB</Parameter>
      <Parameter Name="RelatedObj">%LB6E637087-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="ParentMode">0</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LB6E637087-27C5-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="RelatedObj">%LB6A8C9B24-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="ParentMode">1</Parameter>
    </Control>
    <Control name="Dialog Builder Link" x="0" y="0">
      <Parameter Name="ParentObj">%LB6A8C9B24-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="RelatedObj">%LB8D40FAF9-27C6-11E8-B220-509A4C07EC59%RB</Parameter>
      <Parameter Name="ParentMode">1</Parameter>
    </Control>
  </Controls>

</DialogBuilder>

<END_XML>}

