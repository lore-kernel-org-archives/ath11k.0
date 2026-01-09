Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EAFD232DB
	for <ath11k@archiver.kernel.org>; Fri,  9 Jan 2026 04:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypKeszfpgojbgy6wMmI/rGB/PjQY3jemXow+UjHywJQ=; b=S7RPQ0Ch68CxSALc/lRJzXlchQ
	aaroxi3Xoz3Qi8c+qqUCfrUyDeUTP+KEaQ4dF/RhVWzs4FSPJpipOECtnj0ktY6qptKqSBZbT1cMT
	VNKGl775gqeKgAjBg2PKJhPB1odBvcg0XH+xw6Oy/2xRCcb3PFNaAzRugoTlMk2BHGxym58VKr6tA
	RVi5wQywDDanP1sNpahCbnTwG6VE6n/e0/69c6h2OS5cx5Ym2mABNmRZdH1aZtihAa7deqbtTkQtl
	vTZLaXlfmH0vfvape2AD7a8m5vABjd1J85mVKxSg8Yc/H5P1ZQMtRxbKN6feoD975sZ5UsdlKH2q6
	jftWZyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4N5-00000001Kua-14bc;
	Fri, 09 Jan 2026 04:45:11 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4N2-00000001KsZ-1P8Q
	for ath11k@lists.infradead.org;
	Fri, 09 Jan 2026 04:45:09 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7ce229972d9so2279570a34.0
        for <ath11k@lists.infradead.org>; Thu, 08 Jan 2026 20:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933907; x=1768538707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypKeszfpgojbgy6wMmI/rGB/PjQY3jemXow+UjHywJQ=;
        b=csDuU1MES49ZzsMULxSJ6X3iWOYNvJ+2Ge5SwvQ0TEp60f1rPnDQLtpgSbQT34KQxU
         ZHLlZpuF2SwUIJjNm/fQGL9CdgkAgoYIUceN63EYHOK2nGRUgRHnuiY9pmxHd7OOEUFR
         MGGlZNbjBBSb122j6Mm1kRx0SYClgroMX0JkAz0fgPItVoqSh2a7JcHKOcKuAQdpAgg1
         r5SP8rYI0SOsspWB2PeBG6wWjAOiTXUC81wTspvbXLY4gqF6GxBJlithhWKKRRfLIkV5
         xrn2kE0/pNcxcV/fi15Kiz6PCc0Q9/FeT9bF0Zq8DeEiT5JFW+Z7lcS9F3gBnYIokoqV
         jzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933907; x=1768538707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ypKeszfpgojbgy6wMmI/rGB/PjQY3jemXow+UjHywJQ=;
        b=n6z6m+RybfQpcFPJyRgh3K+miXcxm8dAxFdh7JGa3TQM9JL3l2ixNngm8AK+QF4eQJ
         4+vnS94CMjG29oysmAPYXokGRHVL+w8QdixqONlvLK17zdq5N+bJDdy7eZPN5H+nOYRi
         a//xY/tJk0wbj8N2qqLcldmVkKvmpXl3GGDGB2EpUnYNfoAZEC/hJ4SNgPR+A0siHihv
         0dH6qAp3h1L7aXex9aBxr3rZ6wszCSfn2Q6ZsPwk0LZ1pTohF5mgn70Iu8P339Zn3Pxa
         Q/bAfIxopsOHPMBeTWjydtdKBWaPxyrrbQEK8KsFqjaQ8+SGEiy+Wpk3oRzR888aGcFk
         /Izg==
X-Forwarded-Encrypted: i=1; AJvYcCW5EVm9j0i/XJuBuuTrjsyoBZadS/siDnCDIw4Eeni7M/Hc/S5P10sIIafcgJFfFnVwg5wm5T0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjFN5QQ2eZXrbGwW4I2TCJTe/tsSiK+0xW1lGRqLClCNAF8M6q
	yYS3uLcm7Ajk6qj0bACKsydzrJmBAJBFYocVNgnAas3YcMQitVcCCBfP
X-Gm-Gg: AY/fxX5d0iXCV7lj6O0tb/vfo8v8JstyizV2A5UHDmlXAj/EbjTOP4/wNyuO8Hn/e60
	QkXiHuyLx0nrJqpr/W/aWlaySu3pyuoGlRMAVJhgZRvY96oYkEi9xCIlx686p/wQppOSuX9DXQx
	ZeL+AzuLvqDbzdejZDXvT4EdceYzdGVKYLxKjiTQFyVyasszN4ffDCQ6p5NS9Way2NmSp7GwfLw
	ctAqaJ5PvAFivoTUh0ENJM9yv6d86kbDhKN28IS3/8QrBOzucNhp1AbKblrv17rBVq/RfvEfuvp
	n9O79ZjY7LM3slKVmJnv4vGUBQWIOoYO7UigoG9mrs9gH2MXAVPXffIuRtE3loboIf8cxxP7ldg
	S6Agoftb3ILXwcVB6ciiTBiMi0hi17rJabIwQJrapziV2YtG5JIq9uPQyx76JY4SI2hHpufvMX9
	7L4p6O5Vm228oKEZR2fAuAegJF9wMsETd5tpnOAlB28pA07UqeyxtSXLKsE07KVF2HK5AlKn+Wo
	q09NsqvzccpXC+P6D0jfR7tQ8neoV8Aa7T8DX4=
X-Google-Smtp-Source: AGHT+IHzGEtr343kQgjxmKV9EME11PnTGtdoj63Wm6AsleFjdKkdyI4VIVj9KJa4nZdVheAIBE7S5g==
X-Received: by 2002:a05:6830:2b28:b0:7c7:586c:846c with SMTP id 46e09a7af769-7ce50b8d34fmr5291070a34.19.1767933907080;
        Thu, 08 Jan 2026 20:45:07 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47802551sm6683515a34.1.2026.01.08.20.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:45:06 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org
Cc: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 2/2] wifi: ath11k: support ipq9574
Date: Thu,  8 Jan 2026 22:44:54 -0600
Message-ID: <20260109044457.3074510-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
References: <20260109044457.3074510-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_204508_544739_B34E8A9E 
X-CRM114-Status: GOOD (  18.37  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The IPQ9574 can be coupled with wifi-6 chips, like QCN5024 to expose
a wifi device over AHB. Add the data structures necessarry to describe
the IPQ9574 wifi hardware.

The CE configs are identical to IPQ6018, as confirmed by inspecting
the out-of-tree qca-wifi-host-cmn (cnss2) driver.

Coldboot calibration does not seem to work. One of two issues are
seen. (1) The remoteproc firmware crashes with a fatal error, or
(2) the firmware stops sending qmi responses, appearing to hang. Leave
coldboot calibration disabled for now.

Tested-on: IPQ5974 WLAN.HK.2.9.0.1-01890-QCAHKSWPL_SILICONZ-1

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

---
Most information about the fields cames from the donwstream patch [1].
Analysis of the out-of-tree driver [2] shows that the IPQ9574 uses the
same CE configs as IPQ6018.

[1] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/raw/NHSS.QSDK.12.4.5.r2/mac80211/patches/324-ath11k-ipq9574-support.patch?inline=false
[2] https://git.codelinaro.org/clo/external-wlan/qca-wifi-host-cmn/-/blob/caf_migration/wlan-cmn.driver.lnx.2.13/hif/src/ce/ce_assignment.h?ref_type=heads
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  4 ++
 drivers/net/wireless/ath/ath11k/core.c | 82 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.c   | 51 ++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 5 files changed, 139 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 8dfe9b40c126..e68bcc6b6069 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -25,6 +25,9 @@ static const struct of_device_id ath11k_ahb_of_match[] = {
 	/* TODO: Should we change the compatible string to something similar
 	 * to one that ath10k uses?
 	 */
+	{ .compatible = "qcom,ipq9574-wifi",
+	  .data = (void *)ATH11K_HW_IPQ9574,
+	},
 	{ .compatible = "qcom,ipq8074-wifi",
 	  .data = (void *)ATH11K_HW_IPQ8074,
 	},
@@ -1117,6 +1120,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	hw_rev = (uintptr_t)device_get_match_data(&pdev->dev);
 
 	switch (hw_rev) {
+	case ATH11K_HW_IPQ9574:
 	case ATH11K_HW_IPQ8074:
 	case ATH11K_HW_IPQ6018_HW10:
 	case ATH11K_HW_IPQ5018_HW10:
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 812686173ac8..fed888414005 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -40,6 +40,88 @@ module_param_named(ftm_mode, ath11k_ftm_mode, bool, 0444);
 MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
 
 static const struct ath11k_hw_params ath11k_hw_params[] = {
+	{
+		.hw_rev = ATH11K_HW_IPQ9574,
+		.name = "ipq9574",
+		.fw = {
+			.dir = "IPQ9574/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+		},
+		.max_radios = 1,
+		.bdf_addr = 0x4B700000,
+		.hw_ops = &ipq9574_ops,
+		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
+		.internal_sleep_clock = false,
+		.regs = &ipq8074_regs,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074,
+		.host_ce_config = ath11k_host_ce_config_ipq8074,
+		.ce_count = 12,
+		.target_ce_config = ath11k_target_ce_config_wlan_ipq8074,
+		.target_ce_count = 11,
+		.svc_to_ce_map = ath11k_target_service_to_ce_map_wlan_ipq6018,
+		.svc_to_ce_map_len = 19,
+		.ce_ie_addr = &ath11k_ce_ie_addr_ipq8074,
+		.single_pdev_only = false,
+		.rxdma1_enable = true,
+		.num_rxdma_per_pdev = 1,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+		.htt_peer_map_v2 = true,
+
+		.spectral = {
+			.fft_sz = 2,
+			.fft_pad_sz = 2,
+			.summary_pad_sz = 0,
+			.fft_hdr_len = 16,
+			.max_fft_bins = 512,
+			.fragment_160mhz = true,
+		},
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = true,
+		.full_monitor_mode = false,
+		.supports_shadow_regs = false,
+		.idle_ps = false,
+		.supports_sta_ps = false,
+		.coldboot_cal_mm = false,
+		.coldboot_cal_ftm = false,
+		.fw_mem_mode = 0,
+		.num_vdevs = 16 + 1,
+		.num_peers = 512,
+		.supports_suspend = false,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
+		.supports_regdb = false,
+		.fix_l1ss = true,
+		.credit_flow = false,
+		.hal_params = &ath11k_hw_hal_params_ipq8074,
+		.supports_dynamic_smps_6ghz = false,
+		.alloc_cacheable_memory = true,
+		.supports_rssi_stats = false,
+		.fw_wmi_diag_event = false,
+		.current_cc_support = false,
+		.dbr_debug_support = true,
+		.global_reset = false,
+		.bios_sar_capa = NULL,
+		.m3_fw_support = false,
+		.fixed_bdf_addr = true,
+		.fixed_mem_region = true,
+		.static_window_map = false,
+		.hybrid_bus_type = false,
+		.fixed_fw_mem = false,
+		.support_off_channel_tx = false,
+		.supports_multi_bssid = false,
+
+		.sram_dump = {},
+
+		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
+		.smp2p_wow_exit = false,
+		.support_dual_stations = false,
+		.pdev_suspend = false,
+	},
 	{
 		.hw_rev = ATH11K_HW_IPQ8074,
 		.name = "ipq8074 hw2.0",
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e8780b05ce11..9a4acde3acfa 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -142,6 +142,7 @@ struct ath11k_skb_rxcb {
 };
 
 enum ath11k_hw_rev {
+	ATH11K_HW_IPQ9574,
 	ATH11K_HW_IPQ8074,
 	ATH11K_HW_QCA6390_HW20,
 	ATH11K_HW_IPQ6018_HW10,
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index caa6dc12a790..6862b718b004 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -34,6 +34,17 @@ static u8 ath11k_hw_ipq6018_mac_from_pdev_id(int pdev_idx)
 	return pdev_idx;
 }
 
+static u8 ath11k_hw_ipq9574_mac_from_pdev_id(int pdev_idx)
+{
+	/* ipq9574 is a single PHY radio which maps to PHY B(mac3) */
+	switch (pdev_idx) {
+	case 0:
+		return 2;
+	default:
+		return ATH11K_INVALID_HW_MAC_ID;
+	}
+}
+
 static void ath11k_hw_ipq8074_tx_mesh_enable(struct ath11k_base *ab,
 					     struct hal_tcl_data_cmd *tcl_cmd)
 {
@@ -900,6 +911,46 @@ static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
 	return skb_get_hash(skb);
 }
 
+const struct ath11k_hw_ops ipq9574_ops = {
+	.get_hw_mac_from_pdev_id = ath11k_hw_ipq9574_mac_from_pdev_id,
+	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
+	.mac_id_to_pdev_id = ath11k_hw_mac_id_to_pdev_id_ipq8074,
+	.mac_id_to_srng_id = ath11k_hw_mac_id_to_srng_id_ipq8074,
+	.tx_mesh_enable = ath11k_hw_ipq8074_tx_mesh_enable,
+	.rx_desc_get_first_msdu = ath11k_hw_ipq8074_rx_desc_get_first_msdu,
+	.rx_desc_get_last_msdu = ath11k_hw_ipq8074_rx_desc_get_last_msdu,
+	.rx_desc_get_l3_pad_bytes = ath11k_hw_ipq8074_rx_desc_get_l3_pad_bytes,
+	.rx_desc_get_hdr_status = ath11k_hw_ipq8074_rx_desc_get_hdr_status,
+	.rx_desc_encrypt_valid = ath11k_hw_ipq8074_rx_desc_encrypt_valid,
+	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
+	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
+	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
+	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
+	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
+	.rx_desc_get_mpdu_start_seq_no = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_seq_no,
+	.rx_desc_get_msdu_len = ath11k_hw_ipq8074_rx_desc_get_msdu_len,
+	.rx_desc_get_msdu_sgi = ath11k_hw_ipq8074_rx_desc_get_msdu_sgi,
+	.rx_desc_get_msdu_rate_mcs = ath11k_hw_ipq8074_rx_desc_get_msdu_rate_mcs,
+	.rx_desc_get_msdu_rx_bw = ath11k_hw_ipq8074_rx_desc_get_msdu_rx_bw,
+	.rx_desc_get_msdu_freq = ath11k_hw_ipq8074_rx_desc_get_msdu_freq,
+	.rx_desc_get_msdu_pkt_type = ath11k_hw_ipq8074_rx_desc_get_msdu_pkt_type,
+	.rx_desc_get_msdu_nss = ath11k_hw_ipq8074_rx_desc_get_msdu_nss,
+	.rx_desc_get_mpdu_tid = ath11k_hw_ipq8074_rx_desc_get_mpdu_tid,
+	.rx_desc_get_mpdu_peer_id = ath11k_hw_ipq8074_rx_desc_get_mpdu_peer_id,
+	.rx_desc_copy_attn_end_tlv = ath11k_hw_ipq8074_rx_desc_copy_attn_end,
+	.rx_desc_get_mpdu_start_tag = ath11k_hw_ipq8074_rx_desc_get_mpdu_start_tag,
+	.rx_desc_get_mpdu_ppdu_id = ath11k_hw_ipq8074_rx_desc_get_mpdu_ppdu_id,
+	.rx_desc_set_msdu_len = ath11k_hw_ipq8074_rx_desc_set_msdu_len,
+	.rx_desc_get_attention = ath11k_hw_ipq8074_rx_desc_get_attention,
+	.rx_desc_get_msdu_payload = ath11k_hw_ipq8074_rx_desc_get_msdu_payload,
+	.reo_setup = ath11k_hw_ipq8074_reo_setup,
+	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
+	.rx_desc_mac_addr2_valid = ath11k_hw_ipq8074_rx_desc_mac_addr2_valid,
+	.rx_desc_mpdu_start_addr2 = ath11k_hw_ipq8074_rx_desc_mpdu_start_addr2,
+	.get_ring_selector = ath11k_hw_ipq8074_get_tcl_ring_selector,
+};
+
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
 	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 52d9f4c13b13..0ea36c8ebb66 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -273,6 +273,7 @@ struct ath11k_hw_ops {
 	u32 (*get_ring_selector)(struct sk_buff *skb);
 };
 
+extern const struct ath11k_hw_ops ipq9574_ops;
 extern const struct ath11k_hw_ops ipq8074_ops;
 extern const struct ath11k_hw_ops ipq6018_ops;
 extern const struct ath11k_hw_ops qca6390_ops;
-- 
2.45.1


