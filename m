Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYmRw-0000nU-7z
 for ath11k@lists.infradead.org; Sun, 24 Nov 2019 07:36:54 +0000
Subject: RE: [PATCH v2] ath11k: add raw mode support
From: Manikanta Pubbisetty <mpubbise@qti.qualcomm.com>
Date: Sun, 24 Nov 2019 07:36:41 +0000
Message-ID: <MWHPR0201MB3515B882301ED38B1DBC602DE54B0@MWHPR0201MB3515.namprd02.prod.outlook.com>
References: <0101016e9c5512ad-aebdfb34-4ef9-4d42-a7b7-6f17d0767992-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e9c5512ad-aebdfb34-4ef9-4d42-a7b7-6f17d0767992-000000@us-west-2.amazonses.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>

Hi Kalle,

Please ignore this patch.

Thanks,
Manikanta

>-----Original Message-----
>From: ath11k <ath11k-bounces@lists.infradead.org> On Behalf Of Manikanta
>Pubbisetty
>Sent: Sunday, November 24, 2019 1:04 PM
>To: ath11k@lists.infradead.org
>Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>
>Subject: [EXT] [PATCH v2] ath11k: add raw mode support
>
>Adding raw mode tx/rx support; also, adding support for software crypto
>which depends on raw mode.
>
>To enable raw mode tx/rx:
>insmod ath11k.ko rawmode=1
>
>To enable software crypto:
>insmod ath11k.ko cryptmode=1
>
>Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
>---
>v2:
>- minor fixes
>- rebase on post-bringup branch
>
> drivers/net/wireless/ath/ath11k/core.c  | 25 +++++++++++++++++++++
>drivers/net/wireless/ath/ath11k/core.h  |  7 ++++++
>drivers/net/wireless/ath/ath11k/debug.h |  2 ++
>drivers/net/wireless/ath/ath11k/dp_rx.c | 12 ++++++----
>drivers/net/wireless/ath/ath11k/dp_tx.c | 39 +++++++++++++++++++++++--
>--------
> drivers/net/wireless/ath/ath11k/mac.c   | 23 ++++++++++++++++---
> drivers/net/wireless/ath/ath11k/wmi.c   |  4 ++++
> 7 files changed, 93 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/net/wireless/ath/ath11k/core.c
>b/drivers/net/wireless/ath/ath11k/core.c
>index 37d4ecb..b4017ac 100644
>--- a/drivers/net/wireless/ath/ath11k/core.c
>+++ b/drivers/net/wireless/ath/ath11k/core.c
>@@ -16,6 +16,14 @@ unsigned int ath11k_debug_mask;
>module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
>MODULE_PARM_DESC(debug_mask, "Debugging mask");
>
>+unsigned int rawmode;
>+module_param_named(rawmode, rawmode, uint, 0644);
>+MODULE_PARM_DESC(rawmode, "RAW mode TX: 0-disable, 1-enable");
>+
>+unsigned int cryptmode;
>+module_param_named(cryptmode, cryptmode, uint, 0644);
>+MODULE_PARM_DESC(cryptmode, "crypto mode: 0-hardware, 1-
>software");
>+
> static const struct ath11k_hw_params ath11k_hw_params = {
> .name = "ipq8074",
> .fw = {
>@@ -518,6 +526,23 @@ int ath11k_core_qmi_firmware_ready(struct
>ath11k_base *ab)
> return ret;
> }
>
>+switch (cryptmode) {
>+case ATH11K_CRYPT_MODE_SW:
>+set_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab-
>>dev_flags);
>+set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
>+break;
>+case ATH11K_CRYPT_MODE_HW:
>+clear_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab-
>>dev_flags);
>+clear_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
>+break;
>+default:
>+ath11k_info(ab, "invalid cryptmode: %d\n", cryptmode);
>+return -EINVAL;
>+}
>+
>+if (rawmode)
>+set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
>+
> mutex_lock(&ab->core_lock);
> ret = ath11k_core_start(ab, ATH11K_FIRMWARE_MODE_NORMAL);
> if (ret) {
>diff --git a/drivers/net/wireless/ath/ath11k/core.h
>b/drivers/net/wireless/ath/ath11k/core.h
>index 065cb9d..19830c8 100644
>--- a/drivers/net/wireless/ath/ath11k/core.h
>+++ b/drivers/net/wireless/ath/ath11k/core.h
>@@ -51,6 +51,13 @@ enum wme_ac {
> #define ATH11K_VHT_MCS_MAX9
> #define ATH11K_HE_MCS_MAX11
>
>+enum ath11k_crypt_mode {
>+/* Only use hardware crypto engine */
>+ATH11K_CRYPT_MODE_HW,
>+/* Only use software crypto */
>+ATH11K_CRYPT_MODE_SW,
>+};
>+
> static inline enum wme_ac ath11k_tid_to_ac(u32 tid)  {
> return (((tid == 0) || (tid == 3)) ? WME_AC_BE :
>diff --git a/drivers/net/wireless/ath/ath11k/debug.h
>b/drivers/net/wireless/ath/ath11k/debug.h
>index a317a7b..5047caf 100644
>--- a/drivers/net/wireless/ath/ath11k/debug.h
>+++ b/drivers/net/wireless/ath/ath11k/debug.h
>@@ -25,6 +25,8 @@ enum ath11k_debug_mask {
> ATH11K_DBG_REG= 0x00000200,
> ATH11K_DBG_TESTMODE= 0x00000400,
> ATH11k_DBG_HAL= 0x00000800,
>+ATH11K_DBG_DP_TX= 0x00001000,
>+ATH11K_DBG_DP_RX= 0x00002000,
> ATH11K_DBG_ANY= 0xffffffff,
> };
>
>diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c
>b/drivers/net/wireless/ath/ath11k/dp_rx.c
>index 8c21925..d4f632b 100644
>--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
>+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
>@@ -1839,7 +1839,7 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
> struct sk_buff *last_msdu;
> struct sk_buff *msdu;
> struct ath11k_skb_rxcb *last_rxcb;
>-bool is_decrypted;
>+bool is_decrypted = false;
> u32 err_bitmap;
> u8 *qos;
>
>@@ -1856,15 +1856,16 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k
>*ar,
> qos[0] &= ~IEEE80211_QOS_CTL_A_MSDU_PRESENT;
> }
>
>-is_decrypted = ath11k_dp_rx_h_attn_is_decrypted(rx_desc);
>-enctype = ath11k_dp_rx_h_mpdu_start_enctype(rx_desc);
>-
> /* Some attention flags are valid only in the last MSDU. */
> last_msdu = skb_peek_tail(amsdu_list);
> last_rxcb = ATH11K_SKB_RXCB(last_msdu);
>
> err_bitmap = ath11k_dp_rx_h_attn_mpdu_err(last_rxcb->rx_desc);
>
>+enctype = ath11k_dp_rx_h_mpdu_start_enctype(rx_desc);
>+if (enctype != HAL_ENCRYPT_TYPE_OPEN && !err_bitmap)
>+is_decrypted = ath11k_dp_rx_h_attn_is_decrypted(rx_desc);
>+
> /* Clear per-MPDU flags while leaving per-PPDU flags intact. */
> rx_status->flag &= ~(RX_FLAG_FAILED_FCS_CRC |
>      RX_FLAG_MMIC_ERROR |
>@@ -2069,6 +2070,9 @@ static void ath11k_dp_rx_deliver_msdu(struct
>ath11k *ar, struct napi_struct *nap
>    !!(status->flag & RX_FLAG_MMIC_ERROR),
>    !!(status->flag & RX_FLAG_AMSDU_MORE));
>
>+ath11k_dbg_dump(ar->ab, ATH11K_DBG_DP_RX, NULL, "dp rx msdu:
>",
>+msdu->data, msdu->len);
>+
> /* TODO: trace rx packet */
>
> ieee80211_rx_napi(ar->hw, NULL, msdu, napi); diff --git
>a/drivers/net/wireless/ath/ath11k/dp_tx.c
>b/drivers/net/wireless/ath/ath11k/dp_tx.c
>index a8b9557..c681977 100644
>--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
>+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
>@@ -15,7 +15,11 @@ ath11k_txq_tcl_ring_map[ATH11K_HW_MAX_QUEUES]
>= { 0x0, 0x1, 0x2, 0x2 };  static enum hal_tcl_encap_type
>ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
>{
>-/* TODO: Determine encap type based on vif_type and configuration
>*/
>+struct ath11k_base *ab = arvif->ar->ab;
>+
>+if (test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
>+return HAL_TCL_ENCAP_TYPE_RAW;
>+
> return HAL_TCL_ENCAP_TYPE_NATIVE_WIFI;  }
>
>@@ -75,6 +79,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif
>*arvif,
> struct ath11k_dp *dp = &ab->dp;
> struct hal_tx_info ti = {0};
> struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
>+struct ieee80211_key_conf *key = info->control.hw_key;
> struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
> struct hal_srng *tcl_ring;
> struct ieee80211_hdr *hdr = (void *)skb->data; @@ -110,11 +115,17
>@@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
> ti.encap_type = ath11k_dp_tx_get_encap_type(arvif, skb);
> ti.meta_data_flags = arvif->tcl_metadata;
>
>-if (info->control.hw_key)
>-ti.encrypt_type =
>-ath11k_dp_tx_get_encrypt_type(info-
>>control.hw_key->cipher);
>-else
>-ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
>+if (ti.encap_type == HAL_TCL_ENCAP_TYPE_RAW) {
>+if (key) {
>+ti.encrypt_type =
>+ath11k_dp_tx_get_encrypt_type(key-
>>cipher);
>+
>+if (ieee80211_has_protected(hdr->frame_control))
>+skb_put(skb, IEEE80211_CCMP_MIC_LEN);
>+} else {
>+ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
>+}
>+}
>
> ti.addr_search_flags = arvif->hal_addr_search_flags;
> ti.search_type = arvif->search_type;
>@@ -124,7 +135,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif
>*arvif,
> ti.bss_ast_hash = arvif->ast_hash;
> ti.dscp_tid_tbl_idx = 0;
>
>-if (skb->ip_summed == CHECKSUM_PARTIAL) {
>+if (skb->ip_summed == CHECKSUM_PARTIAL &&
>+    ti.encap_type != HAL_TCL_ENCAP_TYPE_RAW) {
> ti.flags0 |=
>FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_IP4_CKSUM_EN, 1) |
>
>FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_UDP4_CKSUM_EN, 1) |
>
>FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_UDP6_CKSUM_EN, 1) | @@ -
>144,10 +156,11 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif
>*arvif,
> ath11k_dp_tx_encap_nwifi(skb);
> break;
> case HAL_TCL_ENCAP_TYPE_RAW:
>-/*  TODO: for CHECKSUM_PARTIAL case in raw mode, HW
>checksum offload
>- *  is not applicable, hence manual checksum calculation
>using
>- *  skb_checksum_help() is needed
>- */
>+if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags)) {
>+ret = -EINVAL;
>+goto fail_remove_idr;
>+}
>+break;
> case HAL_TCL_ENCAP_TYPE_ETHERNET:
> case HAL_TCL_ENCAP_TYPE_802_3:
> /* TODO: Take care of other encap modes as well */ @@ -
>196,6 +209,9 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>
> spin_unlock_bh(&tcl_ring->lock);
>
>+ath11k_dbg_dump(ab, ATH11K_DBG_DP_TX, NULL, "dp tx msdu: ",
>+skb->data, skb->len);
>+
> atomic_inc(&ar->dp.num_tx_pending);
>
> return 0;
>@@ -303,7 +319,6 @@ ath11k_dp_tx_process_htt_tx_complete(struct
>ath11k_base *ab,
>
> wbm_status = FIELD_GET(HTT_TX_WBM_COMP_INFO0_STATUS,
>        status_desc->info0);
>-
> switch (wbm_status) {
> case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
> case HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP:
>diff --git a/drivers/net/wireless/ath/ath11k/mac.c
>b/drivers/net/wireless/ath/ath11k/mac.c
>index 5ee7c2a..fd2baa2 100644
>--- a/drivers/net/wireless/ath/ath11k/mac.c
>+++ b/drivers/net/wireless/ath/ath11k/mac.c
>@@ -2203,6 +2203,9 @@ static int ath11k_install_key(struct ath11k_vif *arvif,
>
> reinit_completion(&ar->install_key_done);
>
>+if (test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab-
>>dev_flags))
>+return 0;
>+
> if (cmd == DISABLE_KEY) {
> /* TODO: Check if FW expects  value other than NONE for del
>*/
> /* arg.key_cipher = WMI_CIPHER_NONE; */ @@ -2234,8
>+2237,13 @@ static int ath11k_install_key(struct ath11k_vif *arvif,
> return -EOPNOTSUPP;
> }
>
>+if (test_bit(ATH11K_FLAG_RAW_MODE, &ar->ab->dev_flags))
>+key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV |
>+      IEEE80211_KEY_FLAG_RESERVE_TAILROOM;
>+
> install:
> ret = ath11k_wmi_vdev_install_key(arvif->ar, &arg);
>+
> if (ret)
> return ret;
>
>@@ -2306,6 +2314,9 @@ static int ath11k_mac_op_set_key(struct
>ieee80211_hw *hw, enum set_key_cmd cmd,
>     key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
> return 1;
>
>+if (test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab-
>>dev_flags))
>+return 1;
>+
> if (key->keyidx > WMI_MAX_KEY_INDEX)
> return -ENOSPC;
>
>@@ -4031,6 +4042,10 @@ static int ath11k_mac_op_add_interface(struct
>ieee80211_hw *hw,
>
> param_id = WMI_VDEV_PARAM_TX_ENCAP_TYPE;
> param_value = ATH11K_HW_TXRX_NATIVE_WIFI;
>+
>+if (test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
>+param_value = ATH11K_HW_TXRX_RAW;
>+
> ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
>     param_id, param_value);
> if (ret) {
>@@ -5557,7 +5572,6 @@ static int ath11k_mac_register(struct ath11k *ar)
> ieee80211_hw_set(ar->hw, HAS_RATE_CONTROL);
> ieee80211_hw_set(ar->hw, AP_LINK_PS);
> ieee80211_hw_set(ar->hw, SPECTRUM_MGMT);
>-ieee80211_hw_set(ar->hw, SUPPORT_FAST_XMIT);
> ieee80211_hw_set(ar->hw, CONNECTION_MONITOR);
> ieee80211_hw_set(ar->hw, SUPPORTS_PER_STA_GTK);
> ieee80211_hw_set(ar->hw, WANT_MONITOR_VIF); @@ -5622,8
>+5636,11 @@ static int ath11k_mac_register(struct ath11k *ar)
>
> ath11k_reg_init(ar);
>
>-/* advertise HW checksum offload capabilities */
>-ar->hw->netdev_features = NETIF_F_HW_CSUM;
>+if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags)) {
>+ar->hw->netdev_features = NETIF_F_HW_CSUM;
>+ieee80211_hw_set(ar->hw, SW_CRYPTO_CONTROL);
>+ieee80211_hw_set(ar->hw, SUPPORT_FAST_XMIT);
>+}
>
> ret = ieee80211_register_hw(ar->hw);
> if (ret) {
>diff --git a/drivers/net/wireless/ath/ath11k/wmi.c
>b/drivers/net/wireless/ath/ath11k/wmi.c
>index b056426..5e9fa8c 100644
>--- a/drivers/net/wireless/ath/ath11k/wmi.c
>+++ b/drivers/net/wireless/ath/ath11k/wmi.c
>@@ -2852,6 +2852,10 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
> config.rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
> config.rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
> config.rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
>+
>+if (test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
>+config.rx_decap_mode = TARGET_DECAP_MODE_RAW;
>+
> config.scan_max_pending_req =
>TARGET_SCAN_MAX_PENDING_REQS;
> config.bmiss_offload_max_vdev =
>TARGET_BMISS_OFFLOAD_MAX_VDEV;
> config.roam_offload_max_vdev =
>TARGET_ROAM_OFFLOAD_MAX_VDEV;
>--
>2.7.4
>
>
>_______________________________________________
>ath11k mailing list
>ath11k@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/ath11k

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
