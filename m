Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B4FC433F5
	for <ath11k@archiver.kernel.org>; Wed,  5 Oct 2022 04:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ahe2SzQAAok1/Eqn4FjghD9OOuKRM7E4HistCrhTyM=; b=IvA16Z4Cz4OagW
	TMZJ3GiHJXENMQfOCbGK6cA9XyWB8PoMgkvZR4XFCadwK30/iuuEOfRU2PAiPirGHjqfJA0caLeEg
	Sg4xxijpfdEL9UyQisWqncY7fIUR4zKoMAKa/JR6T3L52jnBmOjBQwBbIdjlfxQ7aok2YrFSp1tjf
	4LlY2CnrU1xrqBOGSIcZZbp9Ze6nk+bJTmALoQIYbF+Z4uwMhIdqL2HrZzcYpJnmMBEr+o4wl4H+R
	q+pxbxVnxf/nMKkPZf1uNnUOwwamM17Cv/6L+gKIollxGtHCNUrsY8ZOUqRuA4FRu/z0yAoJuKl2M
	zQHAV6axFP3bgLChRY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvlb-00CK9v-1u; Wed, 05 Oct 2022 04:12:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofvlY-00CK9T-6B
	for ath11k@lists.infradead.org; Wed, 05 Oct 2022 04:12:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2953rufm001992;
	Wed, 5 Oct 2022 04:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=4o697tFompU1NB+99bvSizfu9dCD4Y04nHz0iISE6VY=;
 b=J24hEpGODgX/JwRVJ1znMMmY19gwAGjvu2Q/LRTSElTdMvLVkjAVIEVrjftBA78Wy9Vb
 D+iLRRjCs1r34OVw5ZeTEhDkUJCuAYClX7ywPbJ/xmjmJ4YH+UgvtWO0Y7loJzh1M34d
 GR0jBT83yQ7AnTock6wzTQPorOYlJ+wXbaVOMtLZcgjPJtrQHAPKmE90yMN8gnSY/IeP
 4vtFgwj06L58MDu/dVw0IUkWpcMPRDefc+z9AInCcCYcuJydXOOwVRgbcV2Rnk/+jCC8
 3zqbCqD1Ed/VlU5VyUg1dBrJq2iAA1pBbuWDcMCHSJmxbgX+9Bw65g6LbK6hBZYbbKHr +Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxcjffd36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 04:12:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2954CDOO019266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Oct 2022 04:12:13 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 4 Oct 2022 21:12:11 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath11k: suppress add interface error
Date: Wed, 5 Oct 2022 09:41:55 +0530
Message-ID: <20221005041155.6041-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1iwUTUpisADUwCyuKXoNBHokbWLa1eRz
X-Proofpoint-ORIG-GUID: 1iwUTUpisADUwCyuKXoNBHokbWLa1eRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=903
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210050026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_211216_390578_44CC4995 
X-CRM114-Status: GOOD (  15.72  )
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

In the VAP (other than monitor type) creation request, we should not
throw the error code when the monitor VAP creation fails, since the
actual VAP creation succeeds. If we throw the error code from driver
then the actual VAP creation get fail. So suppress the monitor VAP
creation error by throwing warning message instead of error code.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.6.0.1-00760-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 84d956ad4093..a8a212d416b2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6372,18 +6372,16 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 
 	ath11k_dp_vdev_tx_attach(ar, arvif);
 
+	ath11k_debugfs_add_interface(arvif);
+
 	if (vif->type != NL80211_IFTYPE_MONITOR &&
 	    test_bit(ATH11K_FLAG_MONITOR_CONF_ENABLED, &ar->monitor_flags)) {
 		ret = ath11k_mac_monitor_vdev_create(ar);
-		if (ret) {
+		if (ret)
 			ath11k_warn(ar->ab, "failed to create monitor vdev during add interface: %d",
 				    ret);
-			goto err_peer_del;
-		}
 	}
 
-	ath11k_debugfs_add_interface(arvif);
-
 	mutex_unlock(&ar->conf_mutex);
 
 	return 0;
@@ -6408,7 +6406,6 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->data_lock);
 
 err:
-	ath11k_debugfs_remove_interface(arvif);
 	mutex_unlock(&ar->conf_mutex);
 
 	return ret;

base-commit: 15bc43a23ac0504a2a99fceae4a31b8bf37ec8fe
-- 
2.37.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
