Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivhjO-000207-Pe
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 13:13:40 +0000
Received: by mail-vs1-xe35.google.com with SMTP id x123so4053631vsc.2
 for <ath11k@lists.infradead.org>; Sun, 26 Jan 2020 05:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20200122142930.19239-1-john@phrozen.org>
In-Reply-To: <20200122142930.19239-1-john@phrozen.org>
From: Justin Capella <justincapella@gmail.com>
Date: Sun, 26 Jan 2020 05:13:24 -0800
Message-ID: <CAMrEMU-0qBk+5eKTi2P82NdkPx0F1pOyMidapAAkksY8-zZnVg@mail.gmail.com>
Subject: Re: [RESEND] ath11k: add tx hw 802.11 encapusaltion offloading support
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

>  ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
>  {
> -       /* TODO: Determine encap type based on vif_type and configuration */
> +       struct ieee80211_tx_info *tx_info = IEEE80211_SKB_CB(skb);
> +
> +       if (tx_info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP)
> +               return HAL_TCL_ENCAP_TYPE_ETHERNET;
> +
>         return HAL_TCL_ENCAP_TYPE_NATIVE_WIFI;
>  }

Would reserving some bits/separating encapsulation so a mask/shift
could allow for enum/switch? I second Karthikeyan's idea of the
generic module_param--- If you look at the ath10k codebase they have
separate flags for sw/hwcrypto and ethernet and it resulted in needing
to check for the mutually exclusive options

> @@ -39,8 +43,11 @@ static void ath11k_dp_tx_encap_nwifi(struct sk_buff *skb)
> +       if (cb->flags & ATH11K_SKB_HW_80211_ENCAP)
> +               return skb->priority % IEEE80211_QOS_CTL_TID_MASK;

Maybe use & to be consistent with other _MASKs instead of %?

>         pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);

Not part of the patch but would "min" be better here?

>         case HAL_TCL_ENCAP_TYPE_802_3:\

+default? (Take care of that todo:?)


> +static unsigned int ath11k_ethernet_mode;
> +module_param_named(ethernet_mode, ath11k_ethernet_mode, uint, 0644);
> +MODULE_PARM_DESC(ethernet_mode, "Use ethernet frame datapath");

See above

>         if (buf_id < 0)
>                 return -ENOSPC;

Again not part of your patch but, why is this not just unsigned then,
or are negatives used to invalidate? Haven't looked through the code
enough yet

> +       info = IEEE80211_SKB_CB(skb);

Could this be done at at initialization?


> +       if (!(info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP)) {
> +               if ((ieee80211_is_action(hdr->frame_control) ||
> +                    ieee80211_is_deauth(hdr->frame_control) ||
> +                    ieee80211_is_disassoc(hdr->frame_control)) &&
> +                    ieee80211_has_protected(hdr->frame_control)) {
> +                       skb_put(skb, IEEE80211_CCMP_MIC_LEN);

Maybe just skip/goto past this if offloading? Totally a style thing,
but if more encapsulation/offloading is added later it might pave the
way for cleaner code?

Totally trivial/not a real issue, but I had the thought that if it
were written in the reverse order, protected && (action || deauth ||
dissassoc), it could shortcut quicker potentially?

> @@ -3745,6 +3753,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
>                              struct ieee80211_tx_control *control,
>                              struct sk_buff *skb)
>  {
> +       struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB((struct sk_buff *)skb);

I don't think this cast is needed.

> @@ -4028,6 +4040,7 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
> +       int hw_encap = 0;

Another spot where the possibility of having an enum for the
encapsulation/flags could be handy?


-       if (ieee80211_is_mgmt(hdr->frame_control)) {
+       skb_cb->flags = 0;
+       if (info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP) {
+               skb_cb->flags = ATH11K_SKB_HW_80211_ENCAP;
+       } else if (ieee80211_is_mgmt(hdr->frame_control)) {

Should this maybe be future proofed, something like skb_cb->flags |=
ATH11K_SKB_HW_80211_ENCAP or perhaps even masking the encapsulation
bits as to not reset all the flags ( =0)



> +       switch (vif->type) {
> +       case NL80211_IFTYPE_STATION:
> +       case NL80211_IFTYPE_AP_VLAN:
> +       case NL80211_IFTYPE_AP:
> +               hw_encap = 1;
> +               break;
> +       default:
> +               break;

No mesh?



> +static unsigned int ath11k_ethernet_mode;
> +module_param_named(ethernet_mode, ath11k_ethernet_mode, uint, 0644);
> +MODULE_PARM_DESC(ethernet_mode, "Use ethernet frame datapath");

> +
>  static const struct ieee80211_channel ath11k_2ghz_channels[] = {
>         CHAN2G(1, 2412, 0),
>         CHAN2G(2, 2417, 0),
> @@ -3633,6 +3637,7 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
>  {
>         struct ath11k_base *ab = ar->ab;
>         struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
> +       struct ieee80211_tx_info *info;
>         dma_addr_t paddr;
>         int buf_id;
>         int ret;
> @@ -3644,11 +3649,14 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
>         if (buf_id < 0)
>                 return -ENOSPC;
>
> -       if ((ieee80211_is_action(hdr->frame_control) ||
> -            ieee80211_is_deauth(hdr->frame_control) ||
> -            ieee80211_is_disassoc(hdr->frame_control)) &&
> -            ieee80211_has_protected(hdr->frame_control)) {
> -               skb_put(skb, IEEE80211_CCMP_MIC_LEN);
> +       info = IEEE80211_SKB_CB(skb);
> +       if (!(info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP)) {
> +               if ((ieee80211_is_action(hdr->frame_control) ||
> +                    ieee80211_is_deauth(hdr->frame_control) ||
> +                    ieee80211_is_disassoc(hdr->frame_control)) &&
> +                    ieee80211_has_protected(hdr->frame_control)) {
> +                       skb_put(skb, IEEE80211_CCMP_MIC_LEN);
> +               }
>         }
>
>         paddr = dma_map_single(ab->dev, skb->data, skb->len, DMA_TO_DEVICE);
> @@ -3745,6 +3753,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
>                              struct ieee80211_tx_control *control,
>                              struct sk_buff *skb)
>  {
> +       struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB((struct sk_buff *)skb);
>         struct ath11k *ar = hw->priv;
>         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
>         struct ieee80211_vif *vif = info->control.vif;
> @@ -3753,7 +3762,10 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
>         bool is_prb_rsp;
>         int ret;
>
> -       if (ieee80211_is_mgmt(hdr->frame_control)) {
> +       skb_cb->flags = 0;
> +       if (info->control.flags & IEEE80211_TX_CTRL_HW_80211_ENCAP) {
> +               skb_cb->flags = ATH11K_SKB_HW_80211_ENCAP;
> +       } else if (ieee80211_is_mgmt(hdr->frame_control)) {
>                 is_prb_rsp = ieee80211_is_probe_resp(hdr->frame_control);
>                 ret = ath11k_mac_mgmt_tx(ar, skb, is_prb_rsp);
>                 if (ret) {
> @@ -4028,6 +4040,7 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
>         struct vdev_create_params vdev_param = {0};
>         struct peer_create_params peer_param;
>         u32 param_id, param_value;
> +       int hw_encap = 0;
>         u16 nss;
>         int i;
>         int ret;
> @@ -4119,7 +4132,21 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
>         spin_unlock_bh(&ar->data_lock);
>
>         param_id = WMI_VDEV_PARAM_TX_ENCAP_TYPE;
> -       param_value = ATH11K_HW_TXRX_NATIVE_WIFI;
> +       switch (vif->type) {
> +       case NL80211_IFTYPE_STATION:
> +       case NL80211_IFTYPE_AP_VLAN:
> +       case NL80211_IFTYPE_AP:
> +               hw_encap = 1;
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       if (ieee80211_set_hw_80211_encap(vif, ath11k_ethernet_mode && hw_encap))
> +               param_value = ATH11K_HW_TXRX_ETHERNET;
> +       else
> +               param_value = ATH11K_HW_TXRX_NATIVE_WIFI;
> +
>         ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
>                                             param_id, param_value);
>         if (ret) {
> --
> 2.20.1
>

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
