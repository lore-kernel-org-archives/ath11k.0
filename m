Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205CCC04A6A
	for <ath11k@archiver.kernel.org>; Thu,  3 Aug 2023 07:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPMbJ6z6VSld8pFOovZ6yoR10iNGLLD39TmrqFTbK90=; b=3YtWKLdl9XxZ9N
	p4+X5LuzUhiX59lzlxKirr2mhQ7p6llaqIOkDvPsBp1VbbyyMvkk1J+3sXc2Ov1XRMVj+hoErC6jf
	0p1ioqrwGxTA0f/FJIMkddJOjxPs2lvwD2XhVh65NqzrklolYSRZHKr2LiIbgk7LjksdSH2b+HVBq
	SHNyz9T9iSe+x2IZogWo68ToFS/DkfC8qJEbgNOKSe0I9NhLHww616J7bQ/nouT9z1t+41lPc+W0g
	41ibpYtnhJEpT7PY2v+y7V8sOp3Q1kcNkQbaHKONt21jnDwoi3zB3tUyD2NmW3FqmsWgCRhtcXdg3
	RHN38dNVsLY/I5UNyYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSaU-006ql5-2e;
	Thu, 03 Aug 2023 07:17:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSaS-006qj7-0f
	for ath11k@lists.infradead.org;
	Thu, 03 Aug 2023 07:17:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37377ZDL008536;
	Thu, 3 Aug 2023 07:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=8KNyJv/hkB+NwTrceymMPaEhWcWaTa1RhwevoAaSfGg=;
 b=SYEKVf8HwOH4sv/UuQQoiDYg/rwemrj1BRbrm5MrH0IA8+YSASeayJ3V+C2LlPDeznfg
 XU3SkoSflXKFPPptvaVgN7IMzn1WKvlYIaWgwJlzLRGPew+r8ogvfAlhgZYyqr27ypsK
 zDhTRyLv9YPtJGxKCRkDe5dKGZ7kRg5aQ2zEVo2hFetDDPyxCWrGouxOKaLSb4zDzSKq
 cAv5X0eQL/cioVRjulTKX2SNPdlzrBjWRFmWoZw9z6R03ooScdcOwQViaAujhEFxn0HO
 bweXulA3PpVKoQ58xR91NtMVx0ftpn4ZLsbWv8wqP01qK8DaO47JxxsNmzGLjA7yEu3Y cA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s87jhg0jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 07:17:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3737HOfn007099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2023 07:17:24 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 3 Aug 2023 00:17:23 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Wen Gong <quic_wgong@quicinc.com>
Subject: [PATCH v5 5/5] wifi: ath11k: update regulatory rules when connect to AP on 6 GHz band for station
Date: Thu, 3 Aug 2023 03:17:01 -0400
Message-ID: <20230803071701.15084-6-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803071701.15084-1-quic_wgong@quicinc.com>
References: <20230803071701.15084-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N4PFPe9YZTNkWLafQu24lSsZyu7yC0qR
X-Proofpoint-ORIG-GUID: N4PFPe9YZTNkWLafQu24lSsZyu7yC0qR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_04,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308030064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_001732_359668_0D3C988A 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

When station connect to AP on 6 GHz band, it needs switch the regulatory
rules according to the regulatory info sub field in HE operation element.
Switch to the power type which AP used for station interface.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index d9d223d80819..51515e0c8186 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7613,6 +7613,8 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct ath11k_vif *arvif = (void *)vif->drv_priv;
 	int ret;
 	struct peer_create_params param;
+	struct cur_regulatory_info *reg_info;
+	enum ieee80211_ap_reg_power power_type;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -7620,6 +7622,18 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		   "chanctx assign ptr %p vdev_id %i\n",
 		   ctx, arvif->vdev_id);
 
+	if (ath11k_mac_supports_6g_cc_ext(ar) &&
+	    ctx->def.chan->band == NL80211_BAND_6GHZ &&
+	    arvif->vdev_type == WMI_VDEV_TYPE_STA) {
+		reg_info = &ab->reg_info_store[ar->pdev_idx];
+		power_type = vif->bss_conf.power_type;
+		ath11k_dbg(ab, ATH11K_DBG_MAC, "mac chanctx power type %d\n",
+			   power_type);
+		if (power_type == IEEE80211_REG_UNSET_AP)
+			power_type = IEEE80211_REG_LPI_AP;
+		ath11k_reg_handle_chan_list(ab, reg_info, power_type);
+	}
+
 	/* for QCA6390 bss peer must be created before vdev_start */
 	if (ab->hw_params.vdev_start_delay &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
