unit uFormSunMove;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Effects;

type
  TFormSunMove = class(TForm)
    RectSky: TRectangle;
    CircleSun: TCircle;
    LineRay01: TLine;
    LineRay02: TLine;
    LineRay03: TLine;
    LineRay04: TLine;
    LineRay05: TLine;
    LineRay06: TLine;
    LineRay07: TLine;
    LineRay08: TLine;
    LineRay09: TLine;
    LineRay10: TLine;
    LineRay11: TLine;
    LineRay12: TLine;
    FloatAnimation1: TFloatAnimation;
    procedure FormCreate(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    FReady: Boolean;
    FDown: TPointF;
    FMoving: Boolean;
  public
    { Public declarations }
  end;

var
  FormSunMove: TFormSunMove;

implementation

{$R *.fmx}

procedure TFormSunMove.FormCreate(Sender: TObject);
begin
  FMoving := False;
  FReady := False;
  FloatAnimation1.StartValue := rectSky.Height + 150;
end;

procedure TFormSunMove.FloatAnimation1Finish(Sender: TObject);
begin
  FReady := True;
end;

procedure TFormSunMove.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if FReady then
  begin
    FDown := PointF(X, Y);
    FMoving := True;
  end;
end;

procedure TFormSunMove.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if FMoving then
  begin
    CircleSun.Position.X := CircleSun.Position.X + (X - FDown.X);
    CircleSun.Position.Y := CircleSun.Position.Y + (Y - FDown.Y);
    FMoving := False;
  end;
end;

end.
