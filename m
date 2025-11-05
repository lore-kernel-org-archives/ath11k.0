Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CAACCFA1A
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPbfG9sCcTZPXhCpjHpnFRU9uZKUodfoJEY25YPmkf0=; b=deSygjBcLUVS3QvYuyhImUmm8o
	ssKoB7J+r/x/xa1x9kTfurW6R1Tc6YR3XG60qV9JsVzdeyILs9KBGcJIICB8EPblQlDC8Vj/HSA0N
	faLZCQ7itz+tsr9jmpTX8TqyM91JFWCAiKKzHvF1876rBWbalbEfgpy/3ZcqeqSPbN2OKynAkAiln
	0WDtQd4/DMYtv2vzV+oXk2sBroTNNVlRDDdjoshXFU1YEMirKzUIgRd7b9TRwXFHgEa0a1NslF1WJ
	up7rghBD7uaS8Lz9xLcttyA5+HwKg76cu1gRiWFNPVoYrxjVliuxihtDq9HC8Pakg0ATWfeKDBASg
	PQjNepwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhDQ-0000000E9Wx-14Lg;
	Wed, 05 Nov 2025 17:22:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhDN-0000000E9Ux-3sQw
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 17:22:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5B31Hj655038
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 17:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fPbfG9sCcTZ
	PXhCpjHpnFRU9uZKUodfoJEY25YPmkf0=; b=j5iwViok0jjC0bNOtpOgmVIxhiX
	pibe6WlbTN5udLGTkGYRUCIR1YB/+VxWLFwjE7zha3b3uPZOQ5zZm6n7AHvs1SJv
	vHJskk4QbIoHB+fttuH8LdE6Kt/omUgjUXRv69bVhvzcHKskCAGGuU7vpHrML37E
	1mcTycHPaWffPWeNj/JCdXDSt+zP35x60hIMWIJht+Nw2wqyNrruGWlehE2fYu7y
	O3wmpF5rOrrQr8teaCsmgO83R3WnHfcUTVWvynUZ+Ua9y5W88fso6z7TQPVvR8vJ
	P7xC2gih7oapd2gQSAy8T0XYFEPcdfL7+buQHU58+OM9Ptqf65n0KweDXIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a85c8h2na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 17:22:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so122951a91.0
        for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 09:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762363352; x=1762968152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPbfG9sCcTZPXhCpjHpnFRU9uZKUodfoJEY25YPmkf0=;
        b=fDXrbmRwOXkFOqFaNJZB/VSRdmsFa9IVd/bdXy2AJnfgbyqkTwgALmYA1Z7brxjhFV
         rKyvXMJZiqqN/THtBlRufoIUh6Czp0nM50EC5W2FC9cxbliyl668IXnbTFLFw/2EFAP4
         7h+jFvvAMnpZVEUwwFSvYbOUSTcKnMbegXOZjoP6qn+r97PfDayMAZFzDElD7bhio7rU
         oxng47N+mgVIJQgHjhFFwXJxNSEVY+iX2YT1+e5yf68S77fkmU9LZaNbC8o3smgSZ0TP
         2aKgj1kPQV9N2pLSwlDyYdIovvzaafdmIQz5OEvov/YZwvsgLUwBYh/O6MCY3MfyeO5K
         F/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762363352; x=1762968152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPbfG9sCcTZPXhCpjHpnFRU9uZKUodfoJEY25YPmkf0=;
        b=ApyBi3it2E4rshSG7BcQ+KdjNTIsRfit149LUU6FqA8pyLFnJ9DqSQ06JnH3nvl2Mm
         1sidFE2mQQIWcEdJL5Y+Hkwho/hXdhFP3GmVPr1xuhIs/S7To02qGyPN5meqxiovUyE9
         ySOo5uARylVtW8qoHH08Gw95Pk50hx+VI0K6oJRkkV8JS9y2IWP1n68GChAXbaS6wPLJ
         uf5tuHrmNd2myOhD4K+4LTY23i0rvnIyF+S/RmCI8YRE3Ag2Glihq2VmYp2ERQtEj0B6
         e5wMPDJv22IgRWLBvLieOAVSNy8kXMo3dQArAHeiaksrv74y1cqxYvZFwUewl8iefY2D
         eUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjtOQzFTdGUPk3BLOrnodlfLx7j9M/QPJZ828nq4gL/sNEWLxAVdre9OhqmqAARlYi0OCwl+8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdcbfKJvApQgLHDSi7FMU1GM6/ZojdkjR7TAFbXaNmTV1qMMuv
	mmR1WbX40u4UQpGr4gPF925LYYiVkU46JhINpsW+kU+gcblyO2JBEQ8LVT7VnDs+xT4KtztIBg5
	Jv0nwKICiYT6CPbP+3l1qPaWhh+k83VW1IIsmaiVE1mHeIYS/mM7V2ZTgRJTyIr1z
X-Gm-Gg: ASbGncs32NO3gjCvBPHyQ6sTze7zxn/Xmrf1oNzVmUEfgJ22QyXQYRM1yBj8Xtbvr8V
	qCaJwNOuq1vGavU2A0qSKO+ybqKTfUidB1/38wgfTAj1rQcUVdShIEpR1E6i82VhjpnFavIuTeZ
	Tx7sQ9a5cd8lgmsi7WNznZxj4y6mYDH+/LdmSk5fERkuAbbGu7YNH++N+9FriV9LYT7q1NYhoQ+
	083A3VbsBFGEChBkDW06p4qZQ0GIREQ7desAOTtrjDshZC5DCBf1guhhdzL3MmkVlCzm1Gk9yYR
	VMPfK6N2CwBVFDDu0wI/YPFcY/Wdmb5CMBs4339GRQ4wVCVho8dEE2yILHI+/ntZ67+zgHLvUpi
	uDKMoQ6P1K8DJDpLjIWL//iSyyiCle1OTMoBrG+UDBjgN
X-Received: by 2002:a17:90a:e705:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-341a6b0d548mr4741804a91.0.1762363351569;
        Wed, 05 Nov 2025 09:22:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUOQRLzu+WY5Ade/pSsfUUKW5MyofKkt0ydn6yc9pbg3ZegpKK28GN8hMKfizGjjLHEkJ7Wg==
X-Received: by 2002:a17:90a:e705:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-341a6b0d548mr4741766a91.0.1762363350944;
        Wed, 05 Nov 2025 09:22:30 -0800 (PST)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af48d83c20sm518014b3a.62.2025.11.05.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:22:30 -0800 (PST)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: baochen.qiang@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-next v3 2/6] wifi: ath11k: Register debugfs for CFR configuration
Date: Wed,  5 Nov 2025 09:22:22 -0800
Message-Id: <20251105172226.3182968-3-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251105172226.3182968-1-yu.zhang@oss.qualcomm.com>
References: <20251105172226.3182968-1-yu.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6KbZYQd8FXriEQAgroL9nCW0M2u_V60o
X-Proofpoint-GUID: 6KbZYQd8FXriEQAgroL9nCW0M2u_V60o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNSBTYWx0ZWRfXxq49BJcHfUWF
 U63Nb5xy7SK27VSuK/rKTKPh4J1Zq1maDBZsGWztrfNVyPf8YeRYcpIyn/zV4z0JZFtB0I7/lDS
 PbMnlWTGAypMRgQKKseELxAfncm4Q2K3fi8BNqbQQx3G2iPQNBymJsG3Kc5mVXDdQ9ZNu8xUVH8
 D7CWoLulq+FkLVItrDn6mu3Hv6pvziHOFiQe8/yJkZzzasgFhXzUzqAr1Pf2AwuN957KhQYhxIJ
 G59E44R7XMIS3tm2blxz6amgt8XXQ5ip03Csmc3PFwILTPEutw/H3TZTA4iyE6ulqjYysc4HVhY
 P3/VZKWf9dvhXPeWFEb3nz95BPpHSqISzC7bO1eBBGTaKdkZsjVrHVNQI7dxumTuKREgEb7I/Ii
 aolIn25A3wTxTX25K1t0dEcpP2J99Q==
X-Authority-Analysis: v=2.4 cv=apS/yCZV c=1 sm=1 tr=0 ts=690b87d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dJ9JZWBW9j4LC2dvM44A:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092234_091373_D11856B6 
X-CRM114-Status: GOOD (  19.83  )
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

From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

Provide debugfs interfaces support to config CFR from the user space.

To enable/disable cfr feature use command,

echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr

where, val: 0 to disable CFR and 1 to enable CFR.

To enable CFR capture for associated peers,

echo "<val> <bw> <periodicity> <method>"
 >
/sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture

val: 0 - stop CFR capture
     1 - start CFR capture
bw: CFR capture bandwidth
     0 - 20MHZ
     1 - 40MHZ
     2 - 80MHZ
Periodicity: Periodicity at which hardware is expected to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value must be multiple of 10 ms)
method: Method used by hardware to collect the CFR dump.
     0 - from the ACKs of QOS NULL packets.

Also, send the required WMI commands to the firmware based on the CFR
configurations.

Tested-on: IPQ8074 hw2.0 PCI IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Co-developed-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/cfr.c         | 191 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h         |  41 ++++
 drivers/net/wireless/ath/ath11k/core.h        |  11 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 143 ++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c         |   2 +
 drivers/net/wireless/ath/ath11k/wmi.c         |  41 ++++
 drivers/net/wireless/ath/ath11k/wmi.h         |  50 ++++-
 7 files changed, 476 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
index 78e356672eba..bf0b880e8746 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.c
+++ b/drivers/net/wireless/ath/ath11k/cfr.c
@@ -14,6 +14,193 @@ static int ath11k_cfr_process_data(struct ath11k *ar,
 	return 0;
 }
 
+void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
+				     struct ath11k_sta *arsta)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+
+	spin_lock_bh(&cfr->lock);
+
+	if (arsta->cfr_capture.cfr_enable)
+		cfr->cfr_enabled_peer_cnt--;
+
+	spin_unlock_bh(&cfr->lock);
+}
+
+static enum ath11k_wmi_cfr_capture_bw
+ath11k_cfr_bw_to_fw_cfr_bw(enum ath11k_cfr_capture_bw bw)
+{
+	switch (bw) {
+	case ATH11K_CFR_CAPTURE_BW_20:
+		return WMI_PEER_CFR_CAPTURE_BW_20;
+	case ATH11K_CFR_CAPTURE_BW_40:
+		return WMI_PEER_CFR_CAPTURE_BW_40;
+	case ATH11K_CFR_CAPTURE_BW_80:
+		return WMI_PEER_CFR_CAPTURE_BW_80;
+	default:
+		return WMI_PEER_CFR_CAPTURE_BW_MAX;
+	}
+}
+
+static enum ath11k_wmi_cfr_capture_method
+ath11k_cfr_method_to_fw_cfr_method(enum ath11k_cfr_capture_method method)
+{
+	switch (method) {
+	case ATH11K_CFR_CAPTURE_METHOD_NULL_FRAME:
+		return WMI_CFR_CAPTURE_METHOD_NULL_FRAME;
+	case ATH11K_CFR_CAPTURE_METHOD_NULL_FRAME_WITH_PHASE:
+		return WMI_CFR_CAPTURE_METHOD_NULL_FRAME_WITH_PHASE;
+	case ATH11K_CFR_CAPTURE_METHOD_PROBE_RESP:
+		return WMI_CFR_CAPTURE_METHOD_PROBE_RESP;
+	default:
+		return WMI_CFR_CAPTURE_METHOD_MAX;
+	}
+}
+
+int ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
+					 struct ath11k_sta *arsta,
+					 struct ath11k_per_peer_cfr_capture *params,
+					 const u8 *peer_mac)
+{
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct wmi_peer_cfr_capture_conf_arg arg;
+	enum ath11k_wmi_cfr_capture_bw bw;
+	enum ath11k_wmi_cfr_capture_method method;
+	int ret = 0;
+
+	if (cfr->cfr_enabled_peer_cnt >= ATH11K_MAX_CFR_ENABLED_CLIENTS &&
+	    !arsta->cfr_capture.cfr_enable) {
+		ath11k_err(ar->ab, "CFR enable peer threshold reached %u\n",
+			   cfr->cfr_enabled_peer_cnt);
+		return -ENOSPC;
+	}
+
+	if (params->cfr_enable == arsta->cfr_capture.cfr_enable &&
+	    params->cfr_period == arsta->cfr_capture.cfr_period &&
+	    params->cfr_method == arsta->cfr_capture.cfr_method &&
+	    params->cfr_bw == arsta->cfr_capture.cfr_bw)
+		return ret;
+
+	if (!params->cfr_enable && !arsta->cfr_capture.cfr_enable)
+		return ret;
+
+	bw = ath11k_cfr_bw_to_fw_cfr_bw(params->cfr_bw);
+	if (bw >= WMI_PEER_CFR_CAPTURE_BW_MAX) {
+		ath11k_warn(ar->ab, "FW doesn't support configured bw %d\n",
+			    params->cfr_bw);
+		return -EINVAL;
+	}
+
+	method = ath11k_cfr_method_to_fw_cfr_method(params->cfr_method);
+	if (method >= WMI_CFR_CAPTURE_METHOD_MAX) {
+		ath11k_warn(ar->ab, "FW doesn't support configured method %d\n",
+			    params->cfr_method);
+		return -EINVAL;
+	}
+
+	arg.request = params->cfr_enable;
+	arg.periodicity = params->cfr_period;
+	arg.bw = bw;
+	arg.method = method;
+
+	ret = ath11k_wmi_peer_set_cfr_capture_conf(ar, arsta->arvif->vdev_id,
+						   peer_mac, &arg);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to send cfr capture info: vdev_id %u peer %pM: %d\n",
+			    arsta->arvif->vdev_id, peer_mac, ret);
+		return ret;
+	}
+
+	spin_lock_bh(&cfr->lock);
+
+	if (params->cfr_enable &&
+	    params->cfr_enable != arsta->cfr_capture.cfr_enable)
+		cfr->cfr_enabled_peer_cnt++;
+	else if (!params->cfr_enable)
+		cfr->cfr_enabled_peer_cnt--;
+
+	spin_unlock_bh(&cfr->lock);
+
+	arsta->cfr_capture.cfr_enable = params->cfr_enable;
+	arsta->cfr_capture.cfr_period = params->cfr_period;
+	arsta->cfr_capture.cfr_method = params->cfr_method;
+	arsta->cfr_capture.cfr_bw = params->cfr_bw;
+
+	return ret;
+}
+
+static ssize_t ath11k_read_file_enable_cfr(struct file *file,
+					   char __user *user_buf,
+					   size_t count, loff_t *ppos)
+{
+	struct ath11k *ar = file->private_data;
+	char buf[32] = {};
+	size_t len;
+
+	mutex_lock(&ar->conf_mutex);
+	len = scnprintf(buf, sizeof(buf), "%d\n", ar->cfr_enabled);
+	mutex_unlock(&ar->conf_mutex);
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static ssize_t ath11k_write_file_enable_cfr(struct file *file,
+					    const char __user *ubuf,
+					    size_t count, loff_t *ppos)
+{
+	struct ath11k *ar = file->private_data;
+	u32 enable_cfr;
+	int ret;
+
+	if (kstrtouint_from_user(ubuf, count, 0, &enable_cfr))
+		return -EINVAL;
+
+	guard(mutex)(&ar->conf_mutex);
+
+	if (ar->state != ATH11K_STATE_ON)
+		return -ENETDOWN;
+
+	if (enable_cfr > 1)
+		return -EINVAL;
+
+	if (ar->cfr_enabled == enable_cfr)
+		return count;
+
+	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_PER_PEER_CFR_ENABLE,
+					enable_cfr, ar->pdev->pdev_id);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to enable/disable per peer cfr %d\n", ret);
+		return ret;
+	}
+
+	ar->cfr_enabled = enable_cfr;
+
+	return count;
+}
+
+static const struct file_operations fops_enable_cfr = {
+	.read = ath11k_read_file_enable_cfr,
+	.write = ath11k_write_file_enable_cfr,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+static void ath11k_cfr_debug_unregister(struct ath11k *ar)
+{
+	debugfs_remove(ar->cfr.enable_cfr);
+	ar->cfr.enable_cfr = NULL;
+}
+
+static void ath11k_cfr_debug_register(struct ath11k *ar)
+{
+	ar->cfr.enable_cfr = debugfs_create_file("enable_cfr", 0600,
+						 ar->debug.debugfs_pdev, ar,
+						 &fops_enable_cfr);
+}
+
 void ath11k_cfr_lut_update_paddr(struct ath11k *ar, dma_addr_t paddr,
 				 u32 buf_id)
 {
@@ -88,6 +275,7 @@ void ath11k_cfr_deinit(struct ath11k_base *ab)
 		if (!cfr->enabled)
 			continue;
 
+		ath11k_cfr_debug_unregister(ar);
 		ath11k_cfr_ring_free(ar);
 
 		spin_lock_bh(&cfr->lut_lock);
@@ -146,6 +334,8 @@ int ath11k_cfr_init(struct ath11k_base *ab)
 
 		cfr->lut_num = num_lut_entries;
 		cfr->enabled = true;
+
+		ath11k_cfr_debug_register(ar);
 	}
 
 	return 0;
@@ -158,6 +348,7 @@ int ath11k_cfr_init(struct ath11k_base *ab)
 		if (!cfr->enabled)
 			continue;
 
+		ath11k_cfr_debug_unregister(ar);
 		ath11k_cfr_ring_free(ar);
 
 		spin_lock_bh(&cfr->lut_lock);
diff --git a/drivers/net/wireless/ath/ath11k/cfr.h b/drivers/net/wireless/ath/ath11k/cfr.h
index 3534176c3e01..7d161f7f7be8 100644
--- a/drivers/net/wireless/ath/ath11k/cfr.h
+++ b/drivers/net/wireless/ath/ath11k/cfr.h
@@ -14,10 +14,14 @@
 #define ATH11K_CFR_EVENT_TIMEOUT_MS     1
 #define ATH11K_CFR_NUM_RING_ENTRIES     1
 
+#define ATH11K_MAX_CFR_ENABLED_CLIENTS 10
 #define CFR_MAX_LUT_ENTRIES 136
 
 #define HOST_MAX_CHAINS 8
 
+struct ath11k_sta;
+struct ath11k_per_peer_cfr_capture;
+
 struct ath11k_cfr_dma_hdr {
 	u16 info0;
 	u16 info1;
@@ -48,6 +52,8 @@ struct ath11k_cfr {
 	/* Protect for lut entries */
 	spinlock_t lut_lock;
 	struct ath11k_look_up_table *lut;
+	struct dentry *enable_cfr;
+	u8 cfr_enabled_peer_cnt;
 	u32 lut_num;
 	u64 tx_evt_cnt;
 	u64 dbr_evt_cnt;
@@ -62,11 +68,32 @@ struct ath11k_cfr {
 	bool enabled;
 };
 
+enum ath11k_cfr_capture_method {
+	ATH11K_CFR_CAPTURE_METHOD_NULL_FRAME,
+	ATH11K_CFR_CAPTURE_METHOD_NULL_FRAME_WITH_PHASE,
+	ATH11K_CFR_CAPTURE_METHOD_PROBE_RESP,
+	ATH11K_CFR_CAPTURE_METHOD_MAX,
+};
+
+enum ath11k_cfr_capture_bw {
+	ATH11K_CFR_CAPTURE_BW_20,
+	ATH11K_CFR_CAPTURE_BW_40,
+	ATH11K_CFR_CAPTURE_BW_80,
+	ATH11K_CFR_CAPTURE_BW_MAX,
+};
+
 #ifdef CONFIG_ATH11K_CFR
 int ath11k_cfr_init(struct ath11k_base *ab);
 void ath11k_cfr_deinit(struct ath11k_base *ab);
 void ath11k_cfr_lut_update_paddr(struct ath11k *ar, dma_addr_t paddr,
 				 u32 buf_id);
+void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
+				     struct ath11k_sta *arsta);
+int ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
+					 struct ath11k_sta *arsta,
+					 struct ath11k_per_peer_cfr_capture *params,
+					 const u8 *peer_mac);
+
 #else
 static inline int ath11k_cfr_init(struct ath11k_base *ab)
 {
@@ -81,5 +108,19 @@ static inline void ath11k_cfr_lut_update_paddr(struct ath11k *ar,
 					       dma_addr_t paddr, u32 buf_id)
 {
 }
+
+static inline void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
+						   struct ath11k_sta *arsta)
+{
+}
+
+static inline int
+ath11k_cfr_send_peer_cfr_capture_cmd(struct ath11k *ar,
+				     struct ath11k_sta *arsta,
+				     struct ath11k_per_peer_cfr_capture *params,
+				     const u8 *peer_mac)
+{
+	return 0;
+}
 #endif /* CONFIG_ATH11K_CFR */
 #endif /* ATH11K_CFR_H */
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 40fb7cee3e43..3f41e6569a78 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -532,6 +532,13 @@ struct ath11k_per_ppdu_tx_stats {
 
 DECLARE_EWMA(avg_rssi, 10, 8)
 
+struct ath11k_per_peer_cfr_capture {
+	enum ath11k_cfr_capture_method cfr_method;
+	enum ath11k_cfr_capture_bw cfr_bw;
+	u32 cfr_enable;
+	u32 cfr_period;
+};
+
 struct ath11k_sta {
 	struct ath11k_vif *arvif;
 
@@ -572,6 +579,10 @@ struct ath11k_sta {
 	bool peer_current_ps_valid;
 
 	u32 bw_prev;
+
+#ifdef CONFIG_ATH11K_CFR
+	struct ath11k_per_peer_cfr_capture cfr_capture;
+#endif
 };
 
 #define ATH11K_MIN_5G_FREQ 4150
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index d89d0f28d890..dfb9d877d28a 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -240,6 +239,141 @@ static const struct file_operations fops_tx_stats = {
 	.llseek = default_llseek,
 };
 
+#ifdef CONFIG_ATH11K_CFR
+static ssize_t ath11k_dbg_sta_write_cfr_capture(struct file *file,
+						const char __user *user_buf,
+						size_t count, loff_t *ppos)
+{
+	struct ieee80211_sta *sta = file->private_data;
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ath11k *ar = arsta->arvif->ar;
+	struct ath11k_cfr *cfr = &ar->cfr;
+	struct wmi_peer_cfr_capture_conf_arg arg;
+	u32 cfr_capture_enable = 0, cfr_capture_bw  = 0;
+	u32 cfr_capture_method = 0, cfr_capture_period = 0;
+	char buf[64] = {};
+	int ret;
+
+	simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
+
+	guard(mutex)(&ar->conf_mutex);
+
+	if (ar->state != ATH11K_STATE_ON)
+		return -ENETDOWN;
+
+	if (!ar->cfr_enabled)
+		return -EINVAL;
+
+	ret = sscanf(buf, "%u %u %u %u", &cfr_capture_enable, &cfr_capture_bw,
+		     &cfr_capture_period, &cfr_capture_method);
+
+	if (ret < 1 || (cfr_capture_enable && ret != 4))
+		return -EINVAL;
+
+	if (cfr_capture_enable == arsta->cfr_capture.cfr_enable &&
+	    (cfr_capture_period &&
+	     cfr_capture_period == arsta->cfr_capture.cfr_period) &&
+	    cfr_capture_bw == arsta->cfr_capture.cfr_bw &&
+	    cfr_capture_method == arsta->cfr_capture.cfr_method)
+		return count;
+
+	if (!cfr_capture_enable &&
+	    cfr_capture_enable == arsta->cfr_capture.cfr_enable)
+		return count;
+
+	if (cfr_capture_enable > WMI_PEER_CFR_CAPTURE_ENABLE ||
+	    cfr_capture_bw > arsta->bw ||
+	    cfr_capture_bw > WMI_PEER_CFR_CAPTURE_BW_80 ||
+	    cfr_capture_method > ATH11K_CFR_CAPTURE_METHOD_NULL_FRAME_WITH_PHASE ||
+	    cfr_capture_period > WMI_PEER_CFR_PERIODICITY_MAX)
+		return -EINVAL;
+
+	/* Target expects cfr period in multiple of 10 */
+	if (cfr_capture_period % 10) {
+		ath11k_err(ar->ab, "periodicity should be 10x\n");
+		return -EINVAL;
+	}
+
+	if (ar->cfr.cfr_enabled_peer_cnt >= ATH11K_MAX_CFR_ENABLED_CLIENTS &&
+	    !arsta->cfr_capture.cfr_enable) {
+		ath11k_err(ar->ab, "CFR enable peer threshold reached %u\n",
+			   ar->cfr.cfr_enabled_peer_cnt);
+		return -EINVAL;
+	}
+
+	if (!cfr_capture_enable) {
+		cfr_capture_bw = arsta->cfr_capture.cfr_bw;
+		cfr_capture_period = arsta->cfr_capture.cfr_period;
+		cfr_capture_method = arsta->cfr_capture.cfr_method;
+	}
+
+	arg.request = cfr_capture_enable;
+	arg.periodicity = cfr_capture_period;
+	arg.bw = cfr_capture_bw;
+	arg.method = cfr_capture_method;
+
+	ret = ath11k_wmi_peer_set_cfr_capture_conf(ar, arsta->arvif->vdev_id,
+						   sta->addr, &arg);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to send cfr capture info: vdev_id %u peer %pM: %d\n",
+			    arsta->arvif->vdev_id, sta->addr, ret);
+		return ret;
+	}
+
+	spin_lock_bh(&ar->cfr.lock);
+
+	if (cfr_capture_enable &&
+	    cfr_capture_enable != arsta->cfr_capture.cfr_enable)
+		cfr->cfr_enabled_peer_cnt++;
+	else if (!cfr_capture_enable)
+		cfr->cfr_enabled_peer_cnt--;
+
+	spin_unlock_bh(&ar->cfr.lock);
+
+	arsta->cfr_capture.cfr_enable = cfr_capture_enable;
+	arsta->cfr_capture.cfr_period = cfr_capture_period;
+	arsta->cfr_capture.cfr_bw = cfr_capture_bw;
+	arsta->cfr_capture.cfr_method = cfr_capture_method;
+
+	return count;
+}
+
+static ssize_t ath11k_dbg_sta_read_cfr_capture(struct file *file,
+					       char __user *user_buf,
+					       size_t count, loff_t *ppos)
+{
+	struct ieee80211_sta *sta = file->private_data;
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ath11k *ar = arsta->arvif->ar;
+	char buf[512] = {};
+	int len = 0;
+
+	mutex_lock(&ar->conf_mutex);
+
+	len += scnprintf(buf + len, sizeof(buf) - len, "cfr_enabled = %d\n",
+			 arsta->cfr_capture.cfr_enable);
+	len += scnprintf(buf + len, sizeof(buf) - len, "bandwidth = %d\n",
+			 arsta->cfr_capture.cfr_bw);
+	len += scnprintf(buf + len, sizeof(buf) - len, "period = %d\n",
+			 arsta->cfr_capture.cfr_period);
+	len += scnprintf(buf + len, sizeof(buf) - len, "cfr_method = %d\n",
+			 arsta->cfr_capture.cfr_method);
+
+	mutex_unlock(&ar->conf_mutex);
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_peer_cfr_capture = {
+	.write = ath11k_dbg_sta_write_cfr_capture,
+	.read = ath11k_dbg_sta_read_cfr_capture,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+#endif /* CONFIG_ATH11K_CFR */
+
 static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 					    char __user *user_buf,
 					    size_t count, loff_t *ppos)
@@ -877,6 +1011,13 @@ void ath11k_debugfs_sta_op_add(struct ieee80211_hw *hw, struct ieee80211_vif *vi
 		debugfs_create_file("htt_peer_stats_reset", 0600, dir, sta,
 				    &fops_htt_peer_stats_reset);
 
+#ifdef CONFIG_ATH11K_CFR
+	if (test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT,
+		     ar->ab->wmi_ab.svc_map))
+		debugfs_create_file("cfr_capture", 0600, dir, sta,
+				    &fops_peer_cfr_capture);
+#endif/* CONFIG_ATH11K_CFR */
+
 	debugfs_create_file("peer_ps_state", 0400, dir, sta,
 			    &fops_peer_ps_state);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c6360d6a72bd..965c377cd8dc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9979,6 +9979,8 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 		spin_unlock_bh(&ar->ab->base_lock);
 		mutex_unlock(&ar->ab->tbl_mtx_lock);
+
+		ath11k_cfr_decrement_peer_count(ar, arsta);
 	} else if (old_state == IEEE80211_STA_AUTH &&
 		   new_state == IEEE80211_STA_ASSOC &&
 		   (vif->type == NL80211_IFTYPE_AP ||
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index edff6fb61344..846c9946a084 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3941,6 +3941,47 @@ int ath11k_wmi_fils_discovery_tmpl(struct ath11k *ar, u32 vdev_id,
 	return 0;
 }
 
+int ath11k_wmi_peer_set_cfr_capture_conf(struct ath11k *ar,
+					 u32 vdev_id, const u8 *mac_addr,
+					 struct wmi_peer_cfr_capture_conf_arg *arg)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_peer_cfr_capture_cmd_fixed_param *cmd;
+	struct sk_buff *skb;
+	int ret;
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_peer_cfr_capture_cmd_fixed_param *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_PEER_CFR_CAPTURE_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+
+	memcpy(&cmd->mac_addr, mac_addr, ETH_ALEN);
+	cmd->request = arg->request;
+	cmd->vdev_id = vdev_id;
+	cmd->periodicity = arg->periodicity;
+	cmd->bandwidth = arg->bw;
+	cmd->capture_method = arg->method;
+
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_PEER_CFR_CAPTURE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "WMI vdev %d failed to send peer cfr capture cmd: %d\n",
+			    vdev_id, ret);
+		dev_kfree_skb(skb);
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "WMI peer CFR capture cmd req %u id %u period %u bw %u mode %u\n",
+		   arg->request, vdev_id, arg->periodicity,
+		   arg->bw, arg->method);
+
+	return ret;
+}
+
 int ath11k_wmi_probe_resp_tmpl(struct ath11k *ar, u32 vdev_id,
 			       struct sk_buff *tmpl)
 {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 7a55fe0879c0..1562d169ba9a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -362,6 +362,10 @@ enum wmi_tlv_cmd_id {
 	WMI_PEER_REORDER_QUEUE_REMOVE_CMDID,
 	WMI_PEER_SET_RX_BLOCKSIZE_CMDID,
 	WMI_PEER_ANTDIV_INFO_REQ_CMDID,
+	WMI_PEER_RESERVED0_CMDID,
+	WMI_PEER_TID_MSDUQ_QDEPTH_THRESH_UPDATE_CMDID,
+	WMI_PEER_TID_CONFIGURATIONS_CMDID,
+	WMI_PEER_CFR_CAPTURE_CMDID,
 	WMI_BCN_TX_CMDID = WMI_TLV_CMD(WMI_GRP_MGMT),
 	WMI_PDEV_SEND_BCN_CMDID,
 	WMI_BCN_TMPL_CMDID,
@@ -3833,7 +3837,8 @@ struct wmi_scan_prob_req_oui_cmd {
 #define WMI_TX_PARAMS_DWORD1_BW_MASK		GENMASK(14, 8)
 #define WMI_TX_PARAMS_DWORD1_PREAMBLE_TYPE	GENMASK(19, 15)
 #define WMI_TX_PARAMS_DWORD1_FRAME_TYPE		BIT(20)
-#define WMI_TX_PARAMS_DWORD1_RSVD		GENMASK(31, 21)
+#define WMI_TX_PARAMS_DWORD1_CFR_CAPTURE	BIT(21)
+#define WMI_TX_PARAMS_DWORD1_RSVD		GENMASK(31, 22)
 
 struct wmi_mgmt_send_params {
 	u32 tlv_header;
@@ -4218,6 +4223,45 @@ enum cc_setting_code {
 	 */
 };
 
+enum ath11k_wmi_cfr_capture_bw {
+	WMI_PEER_CFR_CAPTURE_BW_20,
+	WMI_PEER_CFR_CAPTURE_BW_40,
+	WMI_PEER_CFR_CAPTURE_BW_80,
+	WMI_PEER_CFR_CAPTURE_BW_MAX,
+};
+
+enum ath11k_wmi_cfr_capture_method {
+	WMI_CFR_CAPTURE_METHOD_NULL_FRAME,
+	WMI_CFR_CAPTURE_METHOD_NULL_FRAME_WITH_PHASE,
+	WMI_CFR_CAPTURE_METHOD_PROBE_RESP,
+	WMI_CFR_CAPTURE_METHOD_MAX,
+};
+
+struct wmi_peer_cfr_capture_conf_arg {
+	enum ath11k_wmi_cfr_capture_bw bw;
+	enum ath11k_wmi_cfr_capture_method method;
+	u32 request;
+	u32 periodicity;
+};
+
+struct wmi_peer_cfr_capture_cmd_fixed_param {
+	u32 tlv_header;
+	u32 request;
+	struct wmi_mac_addr mac_addr;
+	u32 vdev_id;
+	u32 periodicity;
+	/* BW of measurement - of type enum ath11k_wmi_cfr_capture_bw */
+	u32 bandwidth;
+	/* Method used to capture CFR - of type enum ath11k_wmi_cfr_capture_method */
+	u32 capture_method;
+} __packed;
+
+#define WMI_PEER_CFR_CAPTURE_ENABLE   1
+#define WMI_PEER_CFR_CAPTURE_DISABLE  0
+
+/*periodicity in ms */
+#define WMI_PEER_CFR_PERIODICITY_MAX 600000
+
 static inline enum cc_setting_code
 ath11k_wmi_cc_setting_code_to_reg(enum wmi_reg_cc_setting_code status_code)
 {
@@ -6532,5 +6576,7 @@ bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar);
 int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
 				       u32 vdev_id,
 				       struct ath11k_reg_tpc_power_info *param);
-
+int ath11k_wmi_peer_set_cfr_capture_conf(struct ath11k *ar,
+					 u32 vdev_id, const u8 *mac,
+					 struct wmi_peer_cfr_capture_conf_arg *arg);
 #endif
-- 
2.34.1


