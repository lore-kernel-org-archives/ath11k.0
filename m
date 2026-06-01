Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2B2CD6E64
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDmthOZDE3oCNTwdUq0Bs0V4XD66xhAulJQ4u/yolHc=; b=P0rIEfJO1y3vk3dMB5VihV1a4U
	HAOolKG78DxNZUlIblnErJpP9iwE7bWF6YkbrGlqkKl983boxWzXSHiQO8enMGJIP4eF0/ngSld5C
	dpNwmKd0D/9t7tCHZ3YqAhQoLAYFM3/oy+PYCIz8kGxEkbTysQewlYZukc6JZesi0b9zlzyESXEP5
	toOqBtSU1RdbPCP+IZ0oLnCIz26qnn00SAbQXFTOcz4JCXrChFv0yrSXZv0qqsmTWIsNAV0a5TuMG
	3iVl4eygv9OC029HAOVLE6ysm5n8espBMtrRv3PZOuautsOJWnzbJcW+HAaIHI6uvndPtcDb8E6C8
	DRK1ooKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEd-0000000AW7C-1WzT;
	Mon, 01 Jun 2026 09:47:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEa-0000000AW4n-3cC2
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:47:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6514fHa71641315
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDmthOZDE3oCNTwdUq0Bs0V4XD66xhAulJQ4u/yolHc=; b=GA8PIvCdbExA2H10
	CNT4vPPC7Ss9Ioa2J+WZHIGA7WeEK3ncNOnyYts9XkbdTVldeoFSDOYFUahkLySq
	du8S5C9IQxjy/IdLtoQMq91DLvT5P3Gaov5sqCWtR0pCPQFTBByMPcq9ZHnqsZWJ
	CX4S2Q5jutw/aGBt+DUR+6EAAfc364D8pb7GYEiZnMQ20zO1MeGfkYE557cWxqQ9
	TfKfwh/Nb/+ngJI7SOi/63sp0eSmmLFt1mvpfU3L8C2MinuACtxn6/E0263jbB9E
	TWUYgePXoIbZ9p4rPmGUWJDxD7PxsFXVR3lv8seuMqsx8gy+dgBDnYWajy1UjW6E
	XJiNnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7ff0v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:46:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175842d1abso10677741cf.1
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307219; x=1780912019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDmthOZDE3oCNTwdUq0Bs0V4XD66xhAulJQ4u/yolHc=;
        b=LZhHMzBPC9qo+/ZGhJ2ezrR+r/lR8o/80mtoJPmWTm3t0kwdJ6xGElX2oKPpveqBYU
         a0EOJWB6S/F5GIK/SQlKytsU4TJSl89/iDdMKG0RWPvD/d/Xs2ASthGw61k+0VwgsJ47
         5yY1OVn7Lm7mJkB8qidd48V15FjuOBjoRkog56rP6wpjPx0C6vgqQKvs5ha5CD24tSLG
         bQljGgz3lGVBfHKOoJkW5dQNR7NTWbZnkWIB/n8295811G04YxuFU1RiiSGdaG6o5C6g
         /kC9FhNaXBBvMk12u5vlp5Vr1ythT6z7EAnO3wxF3Kb2ClX3hBeSlGsAeq2+KeNmO0nR
         uF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307219; x=1780912019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDmthOZDE3oCNTwdUq0Bs0V4XD66xhAulJQ4u/yolHc=;
        b=avewhcx0JH3gzNttDdGgly2At3RLcVXGDbvL2UMw+nL6WW6UYGUrNFp0jB9LDIUi2c
         dMBrG5f5bTtFu7rg1aFJORN1Rz/3JYjjvsjrpZPO9RPAJiOvxGimH+ik0WHnd/9sNacS
         MGABaID21sbk30l2uR8fAt/08u4Y/EjMs3UsPAJYFKUd9oUexovuUYvvW7PcheGdlOFW
         Qu7L/yR1uPH0e9N06mZmwTEk8S6fWsn0LHFlyGGx4jDV1JkNTvJTQcN5eW9XU0z+F9Yy
         31Iq1jcLqb9wtjeqhgEfxAmwiZf8JABRc4mPMybnyZ3PJTV6K3pEQXYw0maVcQIlDpB1
         q49w==
X-Forwarded-Encrypted: i=1; AFNElJ9L9O+PgtLxw1DXnodsyT6IeurGdPVoa9NviXHpNjN1s6FVdrRSBawOz9WCH85ZtNMSBisXZLY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6SybeD/TsU5Olv8dQvht6iKavqdKSwAuGseePpEMceU2vaSBi
	G8CvqE6aYj0J4TuvlRp0NR/vdpHZ2hyIetmAVkRZGe/CS10KuLmgMZr/A3/+IjQjy5xkmFwKsur
	CVV4M2hWbOwuW+uqUp5HF41hyhKz+qdJKB1ToqZJVxcVZnE4PxD1T1DwKNDLxlILc
X-Gm-Gg: Acq92OEw8uhDJm++hV8U1Olzv0O6mHNTXxyF30hbkZYzjljrQw5ppYVniAlhK+Sotnw
	RFvuyMLAs/3G5598YQUiXDCDhgHrivGcDlp7z/EytSTIdBAoY4fa0BlZgVXMMs5vif5ooXmgrC6
	t/MjTqZSkFyO6d5P7xp7V8Wu7N2SR5Bl39Oj3UHBfgOVj0bwQZ+E9deNf2L/5lgG+3PGQCCJ5Qr
	LMjQkevIGlfw1hju28XHDwaPLxRdu4MIOpSOCEgMM/TpCy1fP0QxOW2RVwjvFHIHMRfMi4ksmpu
	l5aJO9BmOTXcDbpmxW+S4OEAcgbDURUWx24uW+ek03ttYaSt5Lp5oBn5twyWsQW/xEZaVc9tOV1
	98BmQ9UMQR3+tbnvqvc+zqV6k6tbaOzILOKT3nx62QfSyZMeY2CQ1KeAb+jyDZdq1IfWWyblFIm
	j0fjtng+sTacuBO73avB/R64NecpYVJmKLhOEoAy46EsqRJQ==
X-Received: by 2002:a05:622a:1801:b0:516:dc75:1aca with SMTP id d75a77b69052e-5172dc87953mr151917631cf.26.1780307218913;
        Mon, 01 Jun 2026 02:46:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1801:b0:516:dc75:1aca with SMTP id d75a77b69052e-5172dc87953mr151917371cf.26.1780307218462;
        Mon, 01 Jun 2026 02:46:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:46:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:50 +0300
Subject: [PATCH 2/7] wifi: ath11k: enable support for WCN6851
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6202;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y45NCsNzLa0LZnjcZqaFg8apxQ3FaLRPDC5rkZ5zHog=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVUK7QuYcfCOY5WWIdcP4n/V95KN92adkVK36
 CLoWBZO9qSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCgAKCRCLPIo+Aiko
 1fePCACmpxRJ7fjX6M4d1Hn8bEIkUTXkhbVfYBcp+MNo7FxEDwQfrwU0dqSru85nwTzeJNdlI4t
 O/Da9CX3JfrqNZyRbVykvXjlJwlg9ajAjw1JKZK9X292mm3eLZ07fdivfoxmU8XlswQrk7MmVc/
 DtzKNJ1f8o0J1+fcS0+fJYO8coqo8rkdA34Ad+dFo/PYJFnsPlLfTjYN/VgUa/j5B3rqfXsN6Zw
 y/IZ+Bahb71Hj7mKMCiiRoyC+n+zGEPOeysDfsrgcXxIO5leYGNtCj4CliK5+EAzTWlLbICmvqw
 Vy2iV6ckl2kaMeHXYXWQqlPImhrBv7XpDG8JTuwJYzXULGTe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7ce6DMilBlOO7clZOWvEOv5jP23BnJfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX4d6Q5YpnPWcA
 1Dv+xsiOlqqiecQ4/IAb4Im7+a95UtI2roYHy6bby89Lfk5JAOdP4EqARzi0+5hcIcBPtmcV7D0
 OVAGgEbX/1Wwv1RjxVTh8j2NDFQB/XMsdaPmCsupZu6s7OldHHvZrP/NoUUkwvXJodEt4CPp6cg
 LVD3CpjIMNc7DbZCm6VEHx8lfPx2W53LzN3THKgFSksYyjwm+YkpXqzauIo+Imeu2OfVPrK4uv1
 +f1eDnqM6erj9xCi2MbGuwLIhKpjfhnWzDURYNe7tB247bR5E6wvIkQD5JWWNCnQC13SmOObK4F
 lkmwK/d4BV/pePXIA6ZG/eNPrySNGUydsP7jj6aK7io9bQKFtjIwSJTcgBGh19EupgUeIcvP33b
 WNtrkCUHMaxV/b5EOD6U4kLxrye5ZHau0MLQXbR/aPmGquEt8Z6Ph4gzC/1yZw8NoHEvPnF0UEz
 8WWauPJRRFSGrpGNogg==
X-Proofpoint-GUID: 7ce6DMilBlOO7clZOWvEOv5jP23BnJfM
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d5513 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1Ms6DnRdHleovX8mdIYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_024701_029986_8781BF58 
X-CRM114-Status: GOOD (  16.29  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 92 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  |  9 ++++
 drivers/net/wireless/ath/ath11k/pcic.c | 11 ++++
 5 files changed, 114 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3f6f4db5b7ee..7e997016cf6e 100644
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
+		.num_vdevs = 2 + 1,
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


