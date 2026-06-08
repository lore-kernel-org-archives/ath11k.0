Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4332CCD8CA4
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IatakC3wGB9ng7DsDoD4sHfhEEYjsCIhCpSWGUq81CY=; b=O3/jf5IvaUqShksa4PuVIZXxyv
	0aoD18TWFvjudIPxldJTKl/EiiMr4QaAOb86zuYZf71bYNRbBPg0M494KPp13+EoeU+A6OoTrvx0W
	2i3LyNqNj0Ld2lMzl1GaI9z3KvD4PNWlstBwdraVDjUH6NHpMxlSWXUngKh4zfjTk34rBc3HaHEvO
	3iyKmpWBLRWFBrNZclgYt6oFnYuZRcCwShYztDtgMkFmV8iOUkQK9JHvaathaA+gLa6oUaSBqvlXt
	nrwk3Y2sI4fERqMIWUul55fGxlX/xXDMd55QMsEafHmy6fRvHWx1ERG+zUYyu932kvQ6cwjcdTxnn
	dUzd/sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxQ-00000002vPU-0cOw;
	Mon, 08 Jun 2026 06:59:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxN-00000002vNE-0Gim
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QrgA2771589
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IatakC3wGB9ng7DsDoD4sHfhEEYjsCIhCpSWGUq81CY=; b=jRqNMoHA6tID5OPq
	XwcfKTt+eYYsdaLZ7tp4seY/d4bD1A/NUeOco5Ne80FtQV8IvXLJEbvFh99RO3vl
	7BOUBol4OmlK85r3/z9DVG+ysPxJf7uDkKB6pl1yr0jPJaGJjTfTVuJcDR0GXFVd
	/pPNDA8gGX07RpPfIm7Hmiw3ZIT72D3LbAUfczHlFWdpCWVZQYJo0K3mrYyjKL7P
	XcorehwzMoEk8WE19jGnSNyr04anRg7EWSw6NDWp5fHGTxpYzNAm+6VfxUaOKykO
	Maj1ctAYpBAg9/POSgHfQiMF7BAt04XRyfp4OU8XYS88OtWLwhFzUH1/fEYXOjMG
	aq0diw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6ea8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:32 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5b344b4e8a8so1094187e0c.1
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901971; x=1781506771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IatakC3wGB9ng7DsDoD4sHfhEEYjsCIhCpSWGUq81CY=;
        b=CwUXtWMZKBZleapqmfN8JflwIJvhgEG1ULXTGAx8PUIRd7rYhWTK//Znh+gKa+8K5L
         lWFC0K+Xy8K1pcTfn/UV6/l8Zqx/HBc5WqM4DZwYi9p4RSwMxANgJjuOpP7QhKda9SBy
         jA+61hW23DClCvMi8VqgvUtuqZFaojWyUDcezZnMJExGVO8mTY6jtA4se+LpTivBuOtz
         /+AhiEB43pRz0l8eT/M54DZwFBFTtS/gldruUuxMreDS+wZZO+SbHH9TFsglIyRWZUE4
         WpCb5R/tBCsnEGsaiW+Hf8+5QuszrFIfnRH+IK+1oqwPUtWXDAJx4dF+cagQU3jo+X75
         B3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901971; x=1781506771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IatakC3wGB9ng7DsDoD4sHfhEEYjsCIhCpSWGUq81CY=;
        b=sKHXhWRnmp+uVtKZ72ZXENdTtxXjXOhH5zctfpMtXKYlE2ABBbKf2HrIDkWUEYdCmG
         qpZESmxYfrCSwUubteTP2u+4oGQ9lFBQKf35LyAe/M1oLWDfdIxWyGI+dCBGc1wBh5RN
         3OXAEiovjicHTwUiVsErEWVW7xVaRauE2d5ULgC1Y5V9UeO5TDrJhLkwYlOr4xlXW2AQ
         rOVustD7RSaKzHaK3WIXk+5WEWWbAu0Xja5ZqMiRsoBaDz+SoKiOP0wQRoaQox1Qjk/u
         g/2n5CaUHsL4b5Xl0jd/xRE/kSCe/XOn0dmRYk9cz7Mpq+RZ3nQdT2W0sKbgoIWs3C4H
         1voQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ejzl4TdE6xsasBpbUq1aKQ+FN2SUOtQ8pN4pMTB+MXTsJuRgyYyM8dre21Cr+SLD61tZ7w2c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZvg1L00lwmhIaDnKU8kpyq7NmzAT5iMYsIeUOO1LEpTQF6Yhb
	S6PhBLONieWh4q5/VD/PHB7igUW6TCchqj6zYiF0RNgSmkwKzoHnD3fDV5YX5qTzU02U+Cw4qx5
	vOw6VMwSb1AlBm9IitZxKDKImbcKZ8rSwDp+FF8yhlI8DOGaGFj3GvQq9uONw7Pcz
X-Gm-Gg: Acq92OG6NwvYaOLRfwkZiRtyVhNyVi9U8mTf6D8fTNP6PHb47EUtoRAkVmAalo+dubo
	pbZlUlbqj92McIYkntQmodKnHAnYSzbsSQbecSSQQukTPybNfbr7AXpEoOIHz4i55qVtFVFg9Oi
	lWtfzJ6UleG3WzK6LecGgxoPT+R1g7hcXtJHF3Sj6bjQRVkB+CzlvmukaTDVXuVjHC2CCDPVAqG
	hLujiGMHFWzXKwBJUdTrLRcS2/p26uljFvZavbmwRE/J9LXqqt+sqmheghmpu5ZxSRiwuAMmJhU
	LFS6Eczoc0PdkBekRxHn3ByNTpgmBRU2FqSYiZ6L6gN66+hksvDzrc1Lx1IwSmfG16a7FNU/ofh
	laxIRuoLrSV0BZVgxzca2fXlsWV96gzuPpjJW7N5SSA1wuNfVDp6sNlQbb7E8vE8bdUV+Efu4eC
	AmXPAuM4KJo3y0Txq0JAH7qFDMQxuLfHc68JhMDDWvf2vIgQ==
X-Received: by 2002:a05:6102:d8d:b0:613:e996:3014 with SMTP id ada2fe7eead31-6fefb0a7367mr7189673137.20.1780901971353;
        Sun, 07 Jun 2026 23:59:31 -0700 (PDT)
X-Received: by 2002:a05:6102:d8d:b0:613:e996:3014 with SMTP id ada2fe7eead31-6fefb0a7367mr7189651137.20.1780901970940;
        Sun, 07 Jun 2026 23:59:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:20 +0300
Subject: [PATCH v2 2/7] wifi: ath11k: enable support for WCN6851
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-2-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6271;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Itx6KvM9p25Ke8x91M9Gz0gLSN7XGE+rPcHJSWGUNo4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhKzgeew76Nc19/nB5LY0YDRfAy6SNHZpGcn
 zPMFbEFzdiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSgAKCRCLPIo+Aiko
 1ReNCACE49BFc02i9Pwu4kG4mEUyFc1wHnKlkDN80b4iJcM1VkF4SSPtHTHNpPIV2dArv3T+xTt
 Itdq64CXgIwhpW+6PsDWlCWK666Sn6lyQQB/ziWjXlYuNS/oHSfkRAGQTKsb+hvnfdqaSN5SvAt
 BVboN9QvIoOPSPka023EDB8Kx+itNOXE/h9TO8V5iADEqKMtnHD6N31Ie9b7kEV9FR87yyiEN/e
 bKPOrrXlDiNRk5FzUb+EPGyFylF3jlL0rvpLHNqrDnbA7+x5tcYrELPByAXZsS9PtsRkZ4yiywM
 fburWtNSrsqsSw/FoYCXHh0rfuRdsb4uRSRwAZMWnYEV3vOk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a266854 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1Ms6DnRdHleovX8mdIYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX247dMFERSRAS
 1hDxP78j7KC17iOi7rO0gluFi1cgYy9mYqJJJRo2wMbSUCjd4wMhQRiKF8QFFu/QB1xCdTh/Spr
 HH8IBJ1/wWyS9RmGAIwMtOk2IhdtAayQ5iAH9Q01gZadGmwpZPBVGW13TUGdp/vShRN+bqwnTbK
 maJlGrmTvhkqhFVdzMLRfRzq9zcNZ/vVo3LgNGTV7m0x66mbjD5yDsv5VDYcLSQW6/J6xj/34nQ
 fXWj1NHaisEPbKD7Z2dMU1dSDt94/LYOYIhynhgPs0DxtimJW1NHA9DQTLWeocHYmK7UCHmkTVg
 QSqs/ZhA3h3XMco7B49aCC2iqRJ0YzpIQO1Rq0ucRMNmJaSD7ItsLcbIKWyNfv89x8ospHXCF5V
 XDz6uevPlgJGzvyhWtj3Zqz4e8CDUwJBEAZiCyVUeQUNSHtWhVDkk6jXbIU+9OJduKHcjW344fc
 3vPKZTWzNJLtps+0nYg==
X-Proofpoint-GUID: ROmUCMSz0PQd6QX3XvoEDB5vRnjKJXKa
X-Proofpoint-ORIG-GUID: ROmUCMSz0PQd6QX3XvoEDB5vRnjKJXKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235933_234514_45C5BA1C 
X-CRM114-Status: GOOD (  15.92  )
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

The WCN6851, found e.g. on SM8350 platforms, is an earlier version of
WCN6855 platform. It identifies itself as hw1.1. Copy WCN6855 hw 2.0
configuration to support hw1.1 version.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 92 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  |  9 ++++
 drivers/net/wireless/ath/ath11k/pcic.c | 11 ++++
 5 files changed, 114 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8dacc878c006..78a226ca081c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -393,6 +393,98 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cfr_num_stream_bufs = 0,
 		.cfr_stream_buf_size = 0,
 	},
+	{
+		.name = "wcn6855 hw1.1",
+		.hw_rev = ATH11K_HW_WCN6855_HW11,
+		.fw = {
+			.dir = "WCN6855/hw1.1",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+		},
+		.max_radios = 3,
+		.bdf_addr = 0x4B0C0000,
+		.hw_ops = &wcn6855_ops,
+		.ring_mask = &ath11k_hw_ring_mask_qca6390,
+		.internal_sleep_clock = true,
+		.regs = &wcn6855_regs,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390,
+		.host_ce_config = ath11k_host_ce_config_qca6390,
+		.ce_count = 9,
+		.target_ce_config = ath11k_target_ce_config_wlan_qca6390,
+		.target_ce_count = 9,
+		.svc_to_ce_map = ath11k_target_service_to_ce_map_wlan_qca6390,
+		.svc_to_ce_map_len = 14,
+		.ce_ie_addr = &ath11k_ce_ie_addr_ipq8074,
+		.single_pdev_only = true,
+		.rxdma1_enable = false,
+		.num_rxdma_per_pdev = 2,
+		.rx_mac_buf_ring = true,
+		.vdev_start_delay = true,
+		.htt_peer_map_v2 = false,
+
+		.spectral = {
+			.fft_sz = 0,
+			.fft_pad_sz = 0,
+			.summary_pad_sz = 0,
+			.fft_hdr_len = 0,
+			.max_fft_bins = 0,
+			.fragment_160mhz = false,
+		},
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_P2P_DEVICE) |
+					BIT(NL80211_IFTYPE_P2P_CLIENT) |
+					BIT(NL80211_IFTYPE_P2P_GO),
+		.supports_monitor = false,
+		.full_monitor_mode = false,
+		.supports_shadow_regs = true,
+		.idle_ps = true,
+		.supports_sta_ps = true,
+		.coldboot_cal_mm = false,
+		.coldboot_cal_ftm = false,
+		.cbcal_restart_fw = false,
+		.fw_mem_mode = 0,
+		.num_vdevs = 4,
+		.num_peers = 512,
+		.supports_suspend = true,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
+		.supports_regdb = true,
+		.fix_l1ss = false,
+		.credit_flow = true,
+		.hal_params = &ath11k_hw_hal_params_qca6390,
+		.supports_dynamic_smps_6ghz = false,
+		.alloc_cacheable_memory = false,
+		.supports_rssi_stats = true,
+		.fw_wmi_diag_event = true,
+		.current_cc_support = true,
+		.dbr_debug_support = false,
+		.global_reset = true,
+		.bios_sar_capa = &ath11k_hw_sar_capa_wcn6855,
+		.m3_fw_support = true,
+		.fixed_bdf_addr = false,
+		.fixed_mem_region = false,
+		.static_window_map = false,
+		.hybrid_bus_type = false,
+		.fixed_fw_mem = false,
+		.support_off_channel_tx = true,
+		.supports_multi_bssid = true,
+
+		.sram_dump = {
+			.start = 0x01400000,
+			.end = 0x0177ffff,
+		},
+
+		.tcl_ring_retry = true,
+		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
+		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = true,
+		.support_dual_stations = true,
+		.pdev_suspend = false,
+		.cfr_support = false,
+		.cfr_num_stream_bufs = 0,
+		.cfr_stream_buf_size = 0,
+	},
 	{
 		.name = "wcn6855 hw2.0",
 		.hw_rev = ATH11K_HW_WCN6855_HW20,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..29727ee94bfc 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -147,6 +147,7 @@ enum ath11k_hw_rev {
 	ATH11K_HW_QCA6390_HW20,
 	ATH11K_HW_IPQ6018_HW10,
 	ATH11K_HW_QCN9074_HW10,
+	ATH11K_HW_WCN6855_HW11,
 	ATH11K_HW_WCN6855_HW20,
 	ATH11K_HW_WCN6855_HW21,
 	ATH11K_HW_WCN6750_HW10,
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index a6c9ff112c68..c94546c367a7 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -393,6 +393,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 		ath11k_mhi_config = &ath11k_mhi_config_qcn9074;
 		break;
 	case ATH11K_HW_QCA6390_HW20:
+	case ATH11K_HW_WCN6855_HW11:
 	case ATH11K_HW_WCN6855_HW20:
 	case ATH11K_HW_WCN6855_HW21:
 	case ATH11K_HW_QCA2066_HW21:
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 35bb9e7a63a2..dc1dfd219d88 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1031,6 +1031,15 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		ath11k_pci_read_hw_version(ab, &soc_hw_version_major,
 					   &soc_hw_version_minor);
 		switch (soc_hw_version_major) {
+		case 1:
+			switch (soc_hw_version_minor) {
+			case 0x10:
+				ab->hw_rev = ATH11K_HW_WCN6855_HW11;
+				break;
+			default:
+				goto unsupported_wcn6855_soc;
+			}
+			break;
 		case 2:
 			switch (soc_hw_version_minor) {
 			case 0x00:
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index fc6e7da05c60..0f4dc05cc5b5 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -86,6 +86,17 @@ static const struct ath11k_msi_config ath11k_msi_config[] = {
 		},
 		.hw_rev = ATH11K_HW_QCN9074_HW10,
 	},
+	{
+		.total_vectors = 32,
+		.total_users = 4,
+		.users = (struct ath11k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 10, .base_vector = 3 },
+			{ .name = "WAKE", .num_vectors = 1, .base_vector = 13 },
+			{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
+		},
+		.hw_rev = ATH11K_HW_WCN6855_HW11,
+	},
 	{
 		.total_vectors = 32,
 		.total_users = 4,

-- 
2.47.3


