Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DD2C433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5+n+NWUyAGj/8akI/XLIVlhMtUs3bxtZ4hKrMZ9uce0=; b=RBuivXBzl/LdIY
	c+tpNpM7LOaKRgKJJ7i3a/GvajGOqIC87YUvfXsLH52k8V8jsbNFaJUe0Ev1wWsdskTqeV1wZ5yEI
	o/VqJW/TYvi69Vxywms9T13RiLT+1l3Bnf15oY5GwAevO9JsG2yviIm9M4kEzGji/bNj5hNePnPPS
	ERfKNdULvrQUzZMxcVM8UtjC0/09S7BXRFwkEQIA50if6xubr/rPPdgx9JNFhA09UFBqR43qX5mY0
	qUOI7xKPOJb8gG83pLtcmAGK/eH2iqmIsKQkejN/V3FJ8I84qWgdqMHR/3TPOynNDo3cGj7obrTK7
	wMaEM6iyU61BX9OO5dWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC8S-003wlP-Jn; Tue, 11 Oct 2022 10:05:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC8P-003wij-Fr
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 10:05:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B6lAbe009058;
	Tue, 11 Oct 2022 10:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=1zBQ5tDHr7Zvy+7qqqBMs86MO2wzcjRuHocuC2qMIyY=;
 b=O/SnqMK2SD9KEHsd3HEogI8MN4dJpH7Kbkqp8BTD0Y0Wyyib+tWK+y1hCUnLKCpzv4aZ
 Wo6lHpBlVgnJrUY27cYSsHLmE6fyn5LF/joCHlwp18OIKBR8kO/oyPVS/8kD9wIQ91SK
 PUgV9MN9RtYvcZju0fydGPvV9Bgegmcgs8F4roKFQYyLEWyfoOAkDff9galbTnFNz0nT
 Hpwk84a04loZln37TwitByc9HngO/kT8u2CPPn3dmxnmfkRD4EA7cJXPZWn0/5mB5pQ9
 oTbqWD7J5mRDuHap3bYDhEU+notlAky6u9XjI6llx6wuReoa1LjBTQxqRYtuNPlipZFH 5A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rx4sqcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 10:05:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29BA59XG020398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 10:05:09 GMT
Received: from ssreeela-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 11 Oct 2022 03:05:07 -0700
From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
Subject: [PATCH] ath11k: Fix firmware crash on vdev delete race condition
Date: Tue, 11 Oct 2022 15:23:46 +0530
Message-ID: <20221011095346.3901-1-quic_ssreeela@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lIQiGnXPEnzWRhdRGsCjtfHLOK5Fb3w5
X-Proofpoint-ORIG-GUID: lIQiGnXPEnzWRhdRGsCjtfHLOK5Fb3w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_03,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_030513_682458_22628800 
X-CRM114-Status: GOOD (  16.77  )
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

Current code does not wait for vdev delete completion on vdev create
failures and tries to send another vdev create followed by vdev set
param to firmware with same vdev id. This causes firmware crash.
Fix this crash by waiting for vdev delete completion on vdev
create failures.

Tested-on: IPQ8074 WLAN.HK.2.6.0.1-00905-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 60 +++++++++++++++++----------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 84d956ad4093..261246383fc6 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6162,6 +6162,40 @@ void ath11k_mac_11d_scan_stop_all(struct ath11k_base *ab)
 	}
 }
 
+static int ath11k_mac_vdev_delete(struct ath11k *ar, struct ath11k_vif *arvif)
+{
+	unsigned long time_left;
+	struct ieee80211_vif *vif = arvif->vif;
+	int ret = 0;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	reinit_completion(&ar->vdev_delete_done);
+
+	ret = ath11k_wmi_vdev_delete(ar, arvif->vdev_id);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to delete WMI vdev %d: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
+						ATH11K_VDEV_DELETE_TIMEOUT_HZ);
+	if (time_left == 0) {
+		ath11k_warn(ar->ab, "Timeout in receiving vdev delete response\n");
+		return -ETIMEDOUT;
+	}
+
+	ar->ab->free_vdev_map |= 1LL << (arvif->vdev_id);
+	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
+	ar->num_created_vdevs--;
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "vdev %pM deleted, vdev_id %d\n",
+		   vif->addr, arvif->vdev_id);
+
+	return ret;
+}
+
 static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 				       struct ieee80211_vif *vif)
 {
@@ -6399,10 +6433,7 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	}
 
 err_vdev_del:
-	ath11k_wmi_vdev_delete(ar, arvif->vdev_id);
-	ar->num_created_vdevs--;
-	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
-	ab->free_vdev_map |= 1LL << arvif->vdev_id;
+	ath11k_mac_vdev_delete(ar, arvif);
 	spin_lock_bh(&ar->data_lock);
 	list_del(&arvif->list);
 	spin_unlock_bh(&ar->data_lock);
@@ -6431,7 +6462,6 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_base *ab = ar->ab;
-	unsigned long time_left;
 	int ret;
 	int i;
 
@@ -6452,29 +6482,13 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 	}
 
-	reinit_completion(&ar->vdev_delete_done);
-
-	ret = ath11k_wmi_vdev_delete(ar, arvif->vdev_id);
+	ret = ath11k_mac_vdev_delete(ar, arvif);
 	if (ret) {
-		ath11k_warn(ab, "failed to delete WMI vdev %d: %d\n",
+		ath11k_warn(ab, "failed to delete vdev %d: %d\n",
 			    arvif->vdev_id, ret);
 		goto err_vdev_del;
 	}
 
-	time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
-						ATH11K_VDEV_DELETE_TIMEOUT_HZ);
-	if (time_left == 0) {
-		ath11k_warn(ab, "Timeout in receiving vdev delete response\n");
-		goto err_vdev_del;
-	}
-
-	ab->free_vdev_map |= 1LL << (arvif->vdev_id);
-	ar->allocated_vdev_map &= ~(1LL << arvif->vdev_id);
-	ar->num_created_vdevs--;
-
-	ath11k_dbg(ab, ATH11K_DBG_MAC, "vdev %pM deleted, vdev_id %d\n",
-		   vif->addr, arvif->vdev_id);
-
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		clear_bit(ATH11K_FLAG_MONITOR_VDEV_CREATED, &ar->monitor_flags);
 		ar->monitor_vdev_id = -1;
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
