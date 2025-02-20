Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A6C021B2
	for <ath11k@archiver.kernel.org>; Thu, 20 Feb 2025 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz3HgytgUHf7WQWovv4GRdgKGoFgI9OllsigIayTQZk=; b=to2UHjypPqvyHkM0hJLkVn+/zM
	ZhUHUL64r7HzZH0Vw2G4z/I/fLu4+MDVVXaE9KsvGEvdFaPn0KvAZ6Hp/9FF6xOzrqT1HXJzgD7P8
	1tGY41jE4X+gWejcdY/vggBQVQ3IT5P4mH59EdLlWG1698CTF6Gq8dBpDhxA7SYMttJG3gjrBN/FK
	VkJmWuGwA1rdUHyJPvPvnpnEdIWg2S0XVpEZjJL3ZiyRx0KBWXDZNJFWThGrfAkJ6FjTkKZKoJEkv
	QOxIRY3+76hJoHPOgBZ3opQjcuAJlur4euq0qi5hdCh3a4Htuquhj+K2O+nS2p+kc8wUd25S93UV/
	5iEM/vIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rs-0000000HLuS-23M3;
	Thu, 20 Feb 2025 08:25:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1rp-0000000HLrI-3xbS
	for ath11k@lists.infradead.org;
	Thu, 20 Feb 2025 08:25:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6LlXk016798;
	Thu, 20 Feb 2025 08:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oz3HgytgUHf7WQWovv4GRdgKGoFgI9OllsigIayTQZk=; b=A8yULO4F2N6aPqKe
	g5leW3dhrUt4WwS9W6JUEdablIpi5JKNoREtw6B6RlhLL2EjXhaQKmn6Gxu+4eS2
	tVlcDlXlX7zuf8Ly5m/18bYZNgxiDR404Ll9zzzWOB9g5Gn79B0BcB1zNNtzDU48
	H2yenr8u53hm8oEZcSfgNiPDNZa3Wh5B0j6pN6zIFHVWywg8W3z+oNy1W0Iz4+3Q
	SXunc1wYNqbOWr7Zb4gISZJxgj52aNIvVf+WilUtkyCOYbP2sWbxhKUlCiatCgtb
	v0jlPt36M0fCncI7ZAizdhuKeOMxqLKWo2S1Xm2WbkDJKGq/sXUItlhcklf85QgW
	e5BfcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0dc9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K8P8OQ012287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:25:08 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 00:25:06 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2 5/7] wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
Date: Thu, 20 Feb 2025 16:24:46 +0800
Message-ID: <20250220082448.31039-6-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220082448.31039-1-quic_bqiang@quicinc.com>
References: <20250220082448.31039-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nLobVpA6JNqgZ8THVlOnrvU3C3ks4fpz
X-Proofpoint-ORIG-GUID: nLobVpA6JNqgZ8THVlOnrvU3C3ks4fpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_002510_038775_6B94257D 
X-CRM114-Status: GOOD (  12.33  )
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

Currently RCU lock and ar->data_lock are acquired in a sequence of

	rcu_read_lock()
	spin_lock_bh(&ar->data_lock)

but released in a sequence of

	rcu_read_unlock()
	spin_unlock_bh(&ar->data_lock)

Although there are no apparent issues with this, reorder them to
achieve symmetry.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 98811726d33b..56af2e9634f4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8238,8 +8238,8 @@ static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *sk
 
 complete:
 	complete(&ar->fw_stats_complete);
-	rcu_read_unlock();
 	spin_unlock_bh(&ar->data_lock);
+	rcu_read_unlock();
 
 	/* Since the stats's pdev, vdev and beacon list are spliced and reinitialised
 	 * at this point, no need to free the individual list.
-- 
2.25.1


