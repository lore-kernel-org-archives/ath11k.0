Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E971CE784BE
	for <ath11k@archiver.kernel.org>; Sun, 28 Dec 2025 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpMs7DUUJiTVZzkNa0WwVvn6iVCEHIOvp8u0lRuMmRg=; b=dqnaw2gC8zzb6xI0sfpTaKixll
	Q9zouh3b/uIjqlRtG/Gc9j1h3WCuyin/Lp3PBcoi6fNFvI0cgU2MAGDrVENBhWbQ2ojBVsMoVbkeF
	/AjikQGLsEYkqCYlS2jqAsJhTWXI/eZJp3iifLx4V100CZ8impURKUyHF50GBj1N6rHy2qCEXC2ax
	tDSSDD7IsiIxArZ7mZglIb6Ckwjw1ArMsxzH4jvORG1ctfjp/SzfZhQbaDYW2SfnmaVKDTa+9Q5lr
	y1mUdIJg4ApGDQfJqUUTfZXAaGnqMpJhO923blSRgJwMp3I4fFqX0Ze2HOfQmBUFQH5sVxR1SpsJA
	g8bzY6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtAl-00000002rWI-1VME;
	Sun, 28 Dec 2025 15:59:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtAk-00000002rVt-0dju
	for ath11k@bombadil.infradead.org;
	Sun, 28 Dec 2025 15:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IpMs7DUUJiTVZzkNa0WwVvn6iVCEHIOvp8u0lRuMmRg=; b=iZDt1p8pFdbOPMpEutjnMNvtVm
	6GfLlMNSaHBkjGj/QWUA1FEdwgNGYWTn1jCUDG5KwLhlMU4c+6DWD0PlboUYKNno4xL0mcyoYjsyp
	ADtTEya99G0365FsRYwYHg0xa/vMqrF0vS6BB/im0UnmKx6mTm+xvclSnKkXiNEu5I5j1NUGWIDfy
	yfTSh4f/+bs0JGbYkIUtRRxextjm5Fb46k0ViS7t9QEpuLabgKeSE2Ivvdzh836zfhcniJsqpZCcy
	V0lS0dEgwbOXguG9X1qv6S6MzSvhhJODbZ0p0g4FyrkQqYhA88Kjo7inkrnf8G6fhwTtxk6FKi0uN
	FYPG+K3A==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZtAg-00000002AcI-3z3b
	for ath11k@lists.infradead.org;
	Sun, 28 Dec 2025 15:59:08 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c701097a75so4709910a34.3
        for <ath11k@lists.infradead.org>; Sun, 28 Dec 2025 07:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766937544; x=1767542344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpMs7DUUJiTVZzkNa0WwVvn6iVCEHIOvp8u0lRuMmRg=;
        b=NuOwwR7VtaewOO+A4Tq6bG0RTCJlQVTOVYUdtI4PfdXNRGB2dIntuAfJ3JN6B3NvlZ
         k01I65UM5vBw22leEgrvwft+ryI04sPiUaLSlBnwANxG1zuA2Iv10yNNtYko4kSzcemZ
         iNyduiuaN/nK3TkSLo5dUuuISVCthomslMdNrotys5Yy3nRPi29jXK0aSXnk1hv8q76N
         W8ZSLJ1HbS1s5k3FVZQgZRf2Qxpjwb1H5HggcA8rZcOfseabY6LhhdMy2VE0vh1t9vXf
         X+go0VKy/Sk114uUxpmD8lRRYeQ3mJdML7+nQIhhvrWrEPKNm68/IlPf8HPDIj4ZgGNC
         NcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937544; x=1767542344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IpMs7DUUJiTVZzkNa0WwVvn6iVCEHIOvp8u0lRuMmRg=;
        b=DdNxck/Lsf3yy1IsWGE3QmYXlLSw4JzX07tePXlBAWhbSfP+X5vbu1gsSSDwQQLO1y
         Oswypg8InxhsSFZacvyQgq3faFslD3r+QzZm7d4oKhB+ohNo4xoNZQerQ/Ts990YXNB8
         agrFragHuVkImR2YPkejuj0irbsP1uonAWDrGfzL9ouHSB2JcJ4hU6Ni5cEjV9UUI8IZ
         cBac/tdj6AvApLSc9S1xJxMwQHfw5n2+WFeuLQUchuXplzb4xvJvkx5cC0pSEu+kbcof
         10YjmBBDyZfaYPMNKt5U3AL6Squ6CbXTrkafd8bk5dAPk4gUKMGk4WDjBCrELDueQVee
         tidg==
X-Forwarded-Encrypted: i=1; AJvYcCW/MDcokUPE/Gyn38iv3Gu0Jl5FvbD5YJgP6nLJxm7TytVn8j+7X/Z0TNzfyblwsUznNp+IaYo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzD6BefSI1lZaThLmg4Ez5aceD3f+58N7AXu5373HqpM/mdu97x
	vXpS5eUh2Vv0MfPyqT+fYOANcMez+RQ22ouzDj/AQS5yLjRxxblV4WMU
X-Gm-Gg: AY/fxX4OMHdm9kJLN6zaJLN9zwYKYE4esjJ4dw3svXFSkckREUuzeGutmKfd6+INBXP
	r3r02H9IDJ2Em8ZizRhsJCfFT6mNTYza7FuhzQ0uXIF545+pWvQxXZXhKjh+95XtjqKOk7adGKx
	e/2+8M63NSXNTq7dSQd+0KARR3W3y1ccBBU5R00Nxn8IbAXsNlSPJI3QTLkOak1Qcpjt100qTex
	y6Nj5BHsHZWGKChq36bEvok41a9fb2PcQ4xY+1ohQufDdvDaL9Xs34AH8k/4u8rABGKI+tqWo7K
	BTKj3h+BjR7lEk4nnBF0uB98nw1FYzMhbDTO4Itsqc7vcKo3GIos/Z469cXgAXrvnsXEoAYfUDn
	LExaWHEWN1IkRx5/tcotiU36yOvfytP//Ex2JX2Avq2wndunWdnVIY2SADLJYtwjx6Kwbplxq2f
	e3DKSiq1ZdjYve0qSp+44CiuJDc3KFBV6ujjhCNbxDGSqi6kDKIWe8J8biSnEz8NaiCbTSwhQ7y
	BoqWVAv/C3YhDiZajjNwuZRJ9qu
X-Google-Smtp-Source: AGHT+IGA/19UZG5DpvuP1qzpTnG6guQS1kofs5N8t66j8r2IZe+SU0PQExCFDAszQDjgoEZVkKuLXg==
X-Received: by 2002:a05:6830:2b0c:b0:7c7:68d8:f6ee with SMTP id 46e09a7af769-7cc668ae239mr16048197a34.6.1766937544453;
        Sun, 28 Dec 2025 07:59:04 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667ecd6esm19004434a34.25.2025.12.28.07.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 07:59:03 -0800 (PST)
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
Subject: [PATCH 2/2] wifi: ath11k: support ipq9574
Date: Sun, 28 Dec 2025 09:58:52 -0600
Message-ID: <20251228155855.2118792-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251228155855.2118792-1-mr.nuke.me@gmail.com>
References: <20251228155855.2118792-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_155907_075700_6E621F1D 
X-CRM114-Status: GOOD (  17.37  )
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
index 8dfe9b40c1262..e68bcc6b60692 100644
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
index 812686173ac8a..fed888414005a 100644
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
index e8780b05ce11e..9a4acde3acfae 100644
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
index caa6dc12a790b..6862b718b0043 100644
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
index 52d9f4c13b136..0ea36c8ebb666 100644
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


