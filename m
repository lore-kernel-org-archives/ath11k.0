Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C072C76188
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 19:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0xuHAUTwRtZsRfSVnzoH7GtnJFjxgKd5HRVrPMgC/rg=; b=DCH2+SkQ9Hfbc4
	hNZrGSIgARS5c1DEGik4+hbZiuYF1maZlh+y5LQYIQoAYFxoNHaqwfwHRjbcc2Ghoo1F1JK+JFEyW
	joFEjrVxsn0LmFOC+rYmyJIoUhYRTdcgpvXblGFQ6b/GLbTt1ymsjrgPH5J1uU0w+gSLz17WIHATr
	Xcz7pgFxJZhD0juI/OIk1s4NuI3duPLLVdWppJhCQ2P/pwZ7CMlvw4SMnbfLM3/DQEyHr5ofKgTIE
	giq3iSiU+71IS3YHoQKBsAsLD+VCAjDjywnCgReR4eyRy1WlwrliYmUvN3r3Np9qQFjss/PsKGt6m
	mCKbTJAxiAVO/5tUemwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPer-00GM7n-02;
	Mon, 03 Apr 2023 19:16:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPeo-00GM7B-0V
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 19:15:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333IsYtG028175;
	Mon, 3 Apr 2023 19:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=bli0BYYciNYJ+SvyQthPLEi/etRHSQFUZkpFIKglAHc=;
 b=XbKqdLLDi8bJnCK2wnNo9CBjgfz7ROF9YYN2lXSrl78IVAkgFizguf86ybRz6jgSz0o8
 Mx5LtjETrW25jeaGc/67qIMzk667ZGLAnKodtGgnk9DLhTD+E/7DYXdpsCZM7x60jFz/
 vLZ3fgBZ0BhQ42W9gJVjkFVk+Fg8YCmnOD8SO8URfsYGY6z4K3Gzjj0q1oziODgoiGwR
 APwFTbeUieQ09TSWn7sgr+Fx2SxF2MtVBTeEEa57Q3TSy4m9j3bMqLgALB84rn615DVV
 yL1atMNR9gmlu7loXspjFsigp2CGOVORBsh2QDgAeyOTLG+LdhN0L26AJKvpj9nCvREF OA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqusu1faf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 19:15:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333JFtdY032008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Apr 2023 19:15:55 GMT
Received: from nmaran-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 3 Apr 2023 12:15:53 -0700
From: Nagarajan Maran <quic_nmaran@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nagarajan Maran
	<quic_nmaran@quicinc.com>
Subject: [PATCH] wifi: ath11k: Fix SKB corruption in REO destination ring
Date: Tue, 4 Apr 2023 00:45:33 +0530
Message-ID: <20230403191533.28114-1-quic_nmaran@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ibiqGkv9qN62aQIdNgSX7ybFMkOZJG-L
X-Proofpoint-ORIG-GUID: ibiqGkv9qN62aQIdNgSX7ybFMkOZJG-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_15,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=563 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_121558_308648_5E25DEAA 
X-CRM114-Status: GOOD (  15.73  )
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

While running traffics for a long time, randomly an RX descriptor
filled with value "0" from REO destination ring is received.
This descriptor which is invalid causes the wrong SKB (SKB stored in
the IDR lookup with buffer id "0") to be fetched which in turn
causes SKB memory corruption issue and the same leads to crash
after some time.

Changed the start id for idr allocation to "1" and the buffer id "0"
is reserved for error validation. Introduced Sanity check to validate
the descriptor, before processing the SKB.

Crash Signature :

Unable to handle kernel paging request at virtual address 3f004900
PC points to "b15_dma_inv_range+0x30/0x50"
LR points to "dma_cache_maint_page+0x8c/0x128".
The Backtrace obtained is as follows:
[<8031716c>] (b15_dma_inv_range) from [<80313a4c>] (dma_cache_maint_page+0x8c/0x128)
[<80313a4c>] (dma_cache_maint_page) from [<80313b90>] (__dma_page_dev_to_cpu+0x28/0xcc)
[<80313b90>] (__dma_page_dev_to_cpu) from [<7fb5dd68>] (ath11k_dp_process_rx+0x1e8/0x4a4 [ath11k])
[<7fb5dd68>] (ath11k_dp_process_rx [ath11k]) from [<7fb53c20>] (ath11k_dp_service_srng+0xb0/0x2ac [ath11k])
[<7fb53c20>] (ath11k_dp_service_srng [ath11k]) from [<7f67bba4>] (ath11k_pci_ext_grp_napi_poll+0x1c/0x78 [ath11k_pci])
[<7f67bba4>] (ath11k_pci_ext_grp_napi_poll [ath11k_pci]) from [<807d5cf4>] (__napi_poll+0x28/0xb8)
[<807d5cf4>] (__napi_poll) from [<807d5f28>] (net_rx_action+0xf0/0x280)
[<807d5f28>] (net_rx_action) from [<80302148>] (__do_softirq+0xd0/0x280)
[<80302148>] (__do_softirq) from [<80320408>] (irq_exit+0x74/0xd4)
[<80320408>] (irq_exit) from [<803638a4>] (__handle_domain_irq+0x90/0xb4)
[<803638a4>] (__handle_domain_irq) from [<805bedec>] (gic_handle_irq+0x58/0x90)
[<805bedec>] (gic_handle_irq) from [<80301a78>] (__irq_svc+0x58/0x8c)

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 99859b59138e..4f51123a3ccd 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -389,10 +389,10 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			goto fail_free_skb;
 
 		spin_lock_bh(&rx_ring->idr_lock);
-		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
-				   rx_ring->bufs_max * 3, GFP_ATOMIC);
+		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 1,
+				   (rx_ring->bufs_max * 3) + 1, GFP_ATOMIC);
 		spin_unlock_bh(&rx_ring->idr_lock);
-		if (buf_id < 0)
+		if (buf_id <= 0)
 			goto fail_dma_unmap;
 
 		desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
@@ -2642,6 +2642,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
 
+		if (unlikely(buf_id == 0))
+			continue;
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 		spin_lock_bh(&rx_ring->idr_lock);

base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
