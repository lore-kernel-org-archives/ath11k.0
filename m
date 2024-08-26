Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2CAC5472E
	for <ath11k@archiver.kernel.org>; Mon, 26 Aug 2024 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5g4RZsotagJedf2qIR8RAUL8IfaN3ul2nT/Ia6QQcg=; b=rNl2gxW4LG69jjJ3y/BitWkAn+
	0k6Ce+fGE3XVSmYAnlDL+koLbD2rxOooIBAZUuxh0KD+mmvQs2e2+Cun7nsnrB46UdnTDUzmMHAr4
	Rc2ZxLQwQeX1Som0HoYCB+8IVRyBg37OeYHseU20ajNCKmzTSiwAIGTq/swgbKlVDXsy9rN4pVgE7
	3BmT7RlnQklpMInzxdMewt/HRBc3kk4EWBH6QmrpUfRKS3ndnBqs427KyWIfVemmLXQC4mbauSjCg
	uQB8zfn/VSXYoWoY2OvvZ5/yIPk78+l/Qr0ze1BxIIF/dwMKfZCA5JuPHEATrOcrf2l53xLNLLy/N
	nqx4YLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOs0-00000005TZk-4C6v;
	Mon, 26 Aug 2024 01:50:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siOrv-00000005TXd-2Ke8
	for ath11k@lists.infradead.org;
	Mon, 26 Aug 2024 01:50:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PLojlU030599;
	Mon, 26 Aug 2024 01:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5g4RZsotagJedf2qIR8RAUL8IfaN3ul2nT/Ia6QQcg=; b=OgxQegc7ihp0WKVa
	RZTi98FcVrh7VhW9b2p9mynQhangqyDYpUJsKsbaSHZZGM/Tbvd8VV6XztZhU5WJ
	QcshmCQOkzjv12Txi+2JfC6z60eMR0l0zyb4Xh8Le87k2MMpQSAuqShtmP1Fsa5X
	IdlLxjh+cXsAHBCyUsSqQ+nbPwSi4X/5yN+cMd2F31/qKO4UhyII4brNO9xG4HQ/
	sDc7vl2MUysKchx/O7hRpPWOKSwxpDoy9c7XG6LrBmcGgW9fRgp6Mmmc2c+YxNiA
	9/tHfpOdX5VKgvSF3ZBOTeIInzjnd2kbRSCfxiXtgBWogOads8yBoEgs6lVQs093
	WbQOtg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41798ka5r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q1o5vo022326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 01:50:05 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 25 Aug
 2024 18:50:04 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 2/3] wifi: ath11k: fix leaking peer->tfm_mmic in reset scenario
Date: Mon, 26 Aug 2024 09:49:41 +0800
Message-ID: <20240826014942.87783-3-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826014942.87783-1-quic_bqiang@quicinc.com>
References: <20240826014942.87783-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RBFrIBrabkDXjq3wO6lEoNBLYZIq1ZxT
X-Proofpoint-ORIG-GUID: RBFrIBrabkDXjq3wO6lEoNBLYZIq1ZxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_20,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408260012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_185007_754475_785926BE 
X-CRM114-Status: GOOD (  14.27  )
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

Currently peer->tfm_mmic would only get freed, by ath11k_dp_peer_cleanup(),
when the corresponding station transit from NONE to NOTEXIST state within
ath11k_mac_op_sta_state(). However in reset scenario, there is no chance for
it to go through such transition. Further, during reset, we call
ath11k_mac_peer_cleanup_all() where peer is freed, thus leak peer->tfm_mmic:

Kmemleak reports:
unreferenced object 0xffff9a3ca7828d00 (size 64):
  backtrace (crc 4a016586):
    __kmalloc_node_noprof+0x38f/0x480
    crypto_alloc_tfmmem.isra.0+0x2e/0x60
    crypto_create_tfm_node+0x29/0xe0
    crypto_alloc_tfm_node+0x5d/0x130
    ath11k_peer_rx_frag_setup+0x2c/0x150 [ath11k]
    ath11k_dp_peer_setup+0x82/0x160 [ath11k]
    ath11k_mac_op_sta_state+0x26f/0xca0 [ath11k]
    drv_sta_state+0x11e/0x9c0 [mac80211]
    sta_info_insert_rcu+0x469/0x880 [mac80211]
    sta_info_insert+0x10/0x80 [mac80211]
    ieee80211_prep_connection+0x295/0x950 [mac80211]
    ieee80211_mgd_auth+0x230/0x5a0 [mac80211]
    cfg80211_mlme_auth+0xeb/0x2a0 [cfg80211]

In order to fix it we need to call crypto_free_shash() as well in
ath11k_mac_peer_cleanup_all(). Considering ath11k_peer_rx_tid_cleanup() is
also called there, we can simply replace it with ath11k_dp_peer_cleanup().

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f1dff26bc237..f21d37cefb65 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -883,7 +883,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 	mutex_lock(&ab->tbl_mtx_lock);
 	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
-		ath11k_peer_rx_tid_cleanup(ar, peer);
+		ath11k_dp_peer_cleanup(ar, peer->vdev_id, peer->sta->addr);
 		ath11k_peer_rhash_delete(ab, peer);
 		list_del(&peer->list);
 		kfree(peer);
-- 
2.25.1


