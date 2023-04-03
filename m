Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA4BC76188
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+oJxxxnVN5pa4S29eCQsfzuVy17mWEi5KmVldXBksI=; b=ff43dGFiiZB70E
	UUQqY+6C0MYuugtvodnepVyTf3MSJef4aGqXp7oQygUvVucGIWvS/eilmrNII21DgI82k32K94fTp
	fog5GFZI76eYRw/PYYQNTNvDyD7loDe8jFhywG66lr8l8SMa9RH+B2kFP88qI6hdiWccp8I/coWzI
	NfsUnH+9/uTxgNB/l9f4VDUmGFUIwK2iuP45I5DWrtp3tL0scvlDyPeq/QoedVD1CYWUk9F8lLAf7
	e8kUYTfoDYdycNc42T9ZmjIf7A77oU7m1DSKQx9FLTu3pddB4FE2SYeQvCL9Nak8Pi52YyCkOPl49
	sgmlXCVMbBKZWwtVQANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP8m-00GHCy-0N;
	Mon, 03 Apr 2023 18:42:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjP8j-00GHC5-2j
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 18:42:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3339kljQ025797;
	Mon, 3 Apr 2023 18:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=64dnArwDE/nX2hyQ9IDtxxU3+sUYPqIFERQVHfqx5Qo=;
 b=lQfv53xCCZfGDKtj9S/GRTmr6lMf7kJZ3BSoVa/1kC7QzreNGk2vkJ+6MH5v7MqBc7y8
 D7xsxQpZQrXfWjfmdI386l/qdco6a7Q8LUkSp/1B5Pgceiv3XzNmTow6DbvGxsZtorep
 7eq5NrQTQYF13EZuw3flTm0O4Hj4hmhAsYAopiid+wirxdgc4uiaMokpgelzH4BTOegT
 nrDN+wg+5/NzsARj+0B+qmnJgxOBd6MFpTGj7fQxBYiB9Gj0WPKsxdMxKTJ0VOpPPNwX
 aOtdTtO4suf9duRLLVlhStJSL+v/rq4ev2DlvKYCyXaE5BtW3R+S1ZyK2A3KcHaUHBT5 mw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqus59cym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 18:42:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333IgltS016764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Apr 2023 18:42:47 GMT
Received: from nmaran-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 3 Apr 2023 11:42:45 -0700
From: Nagarajan Maran <quic_nmaran@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>,
        Nagarajan Maran <quic_nmaran@quicinc.com>
Subject: [PATCH 1/2] wifi: ath11k: Ignore frags from uninitialized peer in dp.
Date: Tue, 4 Apr 2023 00:11:54 +0530
Message-ID: <20230403184155.8670-2-quic_nmaran@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230403184155.8670-1-quic_nmaran@quicinc.com>
References: <20230403184155.8670-1-quic_nmaran@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dZeKY9fVqidlbYytsOMw_w6TKKVPRaM0
X-Proofpoint-GUID: dZeKY9fVqidlbYytsOMw_w6TKKVPRaM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_15,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_114249_999865_C6D089D0 
X-CRM114-Status: GOOD (  20.29  )
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

From: Harshitha Prem <quic_hprem@quicinc.com>

When max virtual ap interfaces are configured in all the bands with
ACS and hostapd restart is done every 60s, a crash is observed at
random times.
In this certain scenario, a fragmented packet is received for
self peer, for which rx_tid and rx_frags are not initialized in
datapath. While handling this fragment, crash is observed as the
rx_frag list is uninitialised and when we walk in
ath11k_dp_rx_h_sort_frags, skb null leads to exception.

To address this, before processing received fragments we check
dp_setup_done flag is set to ensure that peer has completed its
dp peer setup for fragment queue, else ignore processing the
fragments.

Call trace:
  ath11k_dp_process_rx_err+0x550/0x1084 [ath11k]
  ath11k_dp_service_srng+0x70/0x370 [ath11k]
  0xffffffc009693a04
  __napi_poll+0x30/0xa4
  net_rx_action+0x118/0x270
  __do_softirq+0x10c/0x244
  irq_exit+0x64/0xb4
  __handle_domain_irq+0x88/0xac
  gic_handle_irq+0x74/0xbc
  el1_irq+0xf0/0x1c0
  arch_cpu_idle+0x10/0x18
  do_idle+0x104/0x248
  cpu_startup_entry+0x20/0x64
  rest_init+0xd0/0xdc
  arch_call_rest_init+0xc/0x14
  start_kernel+0x480/0x4b8
  Code: f9400281 f94066a2 91405021 b94a0023 (f9406401)

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 4 +++-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 8 ++++++++
 drivers/net/wireless/ath/ath11k/peer.h  | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index f5156a7fbdd7..d070bcb3fe24 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -36,6 +36,7 @@ void ath11k_dp_peer_cleanup(struct ath11k *ar, int vdev_id, const u8 *addr)
 	}
 
 	ath11k_peer_rx_tid_cleanup(ar, peer);
+	peer->dp_setup_done = false;
 	crypto_free_shash(peer->tfm_mmic);
 	spin_unlock_bh(&ab->base_lock);
 }
@@ -72,7 +73,8 @@ int ath11k_dp_peer_setup(struct ath11k *ar, int vdev_id, const u8 *addr)
 	ret = ath11k_peer_rx_frag_setup(ar, addr, vdev_id);
 	if (ret) {
 		ath11k_warn(ab, "failed to setup rx defrag context\n");
-		return ret;
+		tid--;
+		goto peer_clean;
 	}
 
 	/* TODO: Setup other peer specific resource used in data path */
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 99859b59138e..2893f6757e3e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3127,6 +3127,7 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 	}
 
 	peer->tfm_mmic = tfm;
+	peer->dp_setup_done = true;
 	spin_unlock_bh(&ab->base_lock);
 
 	return 0;
@@ -3572,6 +3573,13 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 		ret = -ENOENT;
 		goto out_unlock;
 	}
+	if (!peer->dp_setup_done) {
+		ath11k_warn(ab, "The peer %pM [%d] has uninitialized datapath\n",
+			    peer->addr, peer_id);
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
 	rx_tid = &peer->rx_tid[tid];
 
 	if ((!skb_queue_empty(&rx_tid->rx_frags) && seqno != rx_tid->cur_sn) ||
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index 6dd17bafe3a0..9bd385d0a38c 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -35,6 +35,7 @@ struct ath11k_peer {
 	u16 sec_type;
 	u16 sec_type_grp;
 	bool is_authorized;
+	bool dp_setup_done;
 };
 
 void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
