Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE72C77B7A
	for <ath11k@archiver.kernel.org>; Wed,  7 Jun 2023 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YE5bsUYdghiBTsM7Hfcxab07+G0hCwQYq5P27ClhU0=; b=aSeDI0feKyJ7T1
	VeuePZv7XkcxROcLP3cQy5SVtxrfDJcUSzIbXWZSb+l4FTlx6F4YzsuyQI9JaNYoFd8J+/oWZwtc4
	uEETH2Zww/Uq3kRkosHddsrhFGHz8rg5K1NcOVXbeIM5MOydPgf9bt6oOSKKHQVGcExkbzhFesEIj
	4R+1lyb71Y3tcNSYcTXzKiTl2dOfWo2dXC1MuwqdOHwzCrIQsl/sUzBgicrceDxr+/yKqh9ziNGXH
	IMCyQ05+vi7oqZp8dosjsj3YEEWWYqTCcpWqhwG7B3syrovfbQyryIuJc8I6DJrfQBLppxaYtfJnK
	hM/g/pAT5uQ/I0fypwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pma-005KjO-0e;
	Wed, 07 Jun 2023 09:48:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pmV-005Kgb-2D
	for ath11k@lists.infradead.org;
	Wed, 07 Jun 2023 09:48:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3575UgP5026813;
	Wed, 7 Jun 2023 09:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=tiNXjNqM8wXMAhZylLl7A1A8Me1ss4cIvvLUheeZ4iM=;
 b=k1qxNDhFqXmY5UtE/tRJBz4OCP4Zcgf8ihB3TMwzqXs6lMcKFLAznFE7XUTHw/yJNFra
 dg+8oFXeHPAvnoeRVhqhBLCrIAYQrxrl5MdJnvmr9BsRIcIhs99oXE6UhuzC4Mhxoyaz
 9THadCs6L8IwVyv/VjDEXqdQX+iTSa8TfoXh28qGr4Vha1a+i4reFgtZzgL7MP/nfCxn
 LuIVAUdfbV29I9B+G2oBA9xYCm/GYYAYhoocnIr/CDhVS6pBk0ra34rApJP4s2V6jcTF
 DBAwk5gYcNIT9TJiecFQFsRlAOa6TA0eJX5o9Ucvfu4gIakGAiulvJnv7jMtNn7Z/PZ4 Sg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a9thfur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 09:48:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3579mfmP026589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Jun 2023 09:48:41 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 7 Jun 2023 02:48:39 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Wen Gong <quic_wgong@quicinc.com>
Subject: [PATCH v4 4/5] wifi: ath11k: update regulatory rules when interface added
Date: Wed, 7 Jun 2023 05:48:09 -0400
Message-ID: <20230607094810.26707-5-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607094810.26707-1-quic_wgong@quicinc.com>
References: <20230607094810.26707-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S36FHIAOGLTcbh0y2qtPK-e-dvkTD69i
X-Proofpoint-ORIG-GUID: S36FHIAOGLTcbh0y2qtPK-e-dvkTD69i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_024843_840417_33105254 
X-CRM114-Status: GOOD (  17.77  )
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

When wlan boot up, WMI_REG_CHAN_LIST_CC_EXT_EVENTID is sent from
firmware at an early stage, the interface mode is not decided at
this point, then ath11k select reg rules of AP mode as default.

After interface is created, it is exactly decided AP/station mode,
then ath11k need to update reg rules to the exact one.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hw.c  | 6 ++++++
 drivers/net/wireless/ath/ath11k/hw.h  | 2 ++
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index eb995f9cf0fa..15006bb67a5a 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -897,6 +897,12 @@ static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
 	return skb_get_hash(skb);
 }
 
+bool ath11k_hw_supports_6g_cc_ext(struct ath11k *ar)
+{
+	return (test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT,
+			 ar->ab->wmi_ab.svc_map)) && ar->supports_6ghz;
+}
+
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
 	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 6a5dd2dbdb3a..00fe1c5edd06 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -319,6 +319,8 @@ static inline int ath11k_hw_mac_id_to_srng_id(struct ath11k_hw_params *hw,
 	return 0;
 }
 
+bool ath11k_hw_supports_6g_cc_ext(struct ath11k *ar);
+
 struct ath11k_fw_ie {
 	__le32 id;
 	__le32 len;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 75843af7bac7..f586b37336b0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6639,6 +6639,14 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 				    ret);
 	}
 
+	if (ath11k_hw_supports_6g_cc_ext(ar)) {
+		struct cur_regulatory_info *reg_info;
+
+		reg_info = &ab->reg_info_store[ar->pdev_idx];
+		ath11k_dbg(ab, ATH11K_DBG_MAC, "mac interface added to change reg rules\n");
+		ath11k_reg_handle_chan_list(ab, reg_info, IEEE80211_REG_LPI_AP);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 
 	return 0;
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
