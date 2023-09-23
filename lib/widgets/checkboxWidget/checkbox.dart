part of rush;


class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget(
      {Key? key,
      this.child,
      this.activeColor,
      this.hoverColor,
      this.checked = false,
      this.disabled = false,
      this.onChanged})
      : super(key: key);

  final Widget? child;
  final bool checked;
  final bool disabled;
  final Color? activeColor,hoverColor;
  final void Function(bool?)? onChanged;

  @override
  State<CheckboxWidget> createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxWidget> {
  bool hovered = false;
  bool checked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      checked = widget.checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        hovered = true;
      }),
      onExit: (_) => setState(() {
        hovered = false;
      }),
      child: GestureDetector(
        onTap: widget.disabled?(){}:_handleTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              side: !hovered?null:BorderSide(color: widget.hoverColor!, width: 1.3),
              value: widget.checked,
              onChanged: widget.disabled?(_){}:(value) {
                widget.onChanged!(value);
                setState(() {
                  checked = !widget.checked;
                });
              },
              activeColor: widget.activeColor,
            ),
            widget.child??const SizedBox(),
          ],
        ),
      ),
    );
  }

  void _handleTap() {
    setState(() {checked = !checked;});
  }
}
