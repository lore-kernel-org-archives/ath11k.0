Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF02C6FD1D
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xcLAp+T6HP2v5VK15uiDPVNg+vsQLZuoAh1WQ50/8pM=; b=WXoAs5CZ3jxI13
	oYfgX1OBImqYT5UB7o65aSivJUpvmm0pC0yA0leaa6gjTDtXmLufdolu1TMLJCLY1gIxVPn5T0rer
	Yiq6Qwq87iZiMdko9cRFSlejOF9WTsck8Ig1dugtbEz1572Vm159YW4bxxGA26usAtxN9m1jpblIi
	aRc4KQwD/qS1v7jSSENQG6f65TMp9NefFOSFpfp45fPqUfB3I+OZmxzKHPEpBGlwNjYIJv6dzMqZU
	/oEZcVZPBWLW2ZOBJjE9BOx+fCukisgGn0gbIYTPz6W/WwBYt9adaO3+EKk6wmmsnh9tA8H3aw991
	ShOJM0950qUUTk34eP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peUYt-00BGF9-3D;
	Tue, 21 Mar 2023 05:29:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peUYr-00BGEj-0H
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 05:29:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L4dSX8016597;
	Tue, 21 Mar 2023 05:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=wPkZLT8NAOuoa9qcxWtzxqaWd2HsJXryibfrRNBNDbo=;
 b=L55Iq68EV/lbqan2n2FvqICPH60eGTNyvRysR3uCGYPh75IAEkIjxLR5Ytn3VdExzT+l
 0h+QdZKYqMnPLUI24D8xqUZ5Bp9F7psZHmcxHd+IfpSvXxlcPJ+RihDyE8sKqWBc3pGu
 JXxLWXJYR+D76y+P3wzmGQ3rBOZ8EkovEMHF0Jr7siyRUoNzWanFZA8uLoZCihjiq9ad
 lEzTnUtXxOJrs0wSeCfuymzvfwGpeQrDWiQJxpQdFmnh29NTQqcmknYoUWer1a/MbEV7
 EUJrpGs9zuWzmdo+Oy6h71kZzeP3SaYgg8Fhz1k6e9rqc5NoaqtXFiEvS3A9ensSET8R hQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pet871nyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 05:29:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32L5TOZ9010881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 05:29:24 GMT
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 22:29:23 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2] wifi: ath11k: fix writing to unintended memory region
Date: Tue, 21 Mar 2023 10:59:00 +0530
Message-ID: <20230321052900.16895-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vDQJKxiMD98TZR5BPZnmR_mGEyi7VI-v
X-Proofpoint-ORIG-GUID: vDQJKxiMD98TZR5BPZnmR_mGEyi7VI-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_03,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=662 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_222929_266840_44093CA5 
X-CRM114-Status: GOOD (  16.01  )
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

While initializing spectral, the magic value is getting written to the
invalid memory address leading to random boot-up crash. This occurs
due to the incorrect index increment in ath11k_dbring_fill_magic_value
function. Fix it by replacing the existing logic with memset32 to ensure
there is no invalid memory access.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Fixes: d3d358efc553 ("ath11k: add spectral/CFR buffer validation support")
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
v2:
	- Remove extra space between fixes and signed off tag.
---
 drivers/net/wireless/ath/ath11k/dbring.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dbring.c b/drivers/net/wireless/ath/ath11k/dbring.c
index 2107ec05d14f..f072067a75e4 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.c
+++ b/drivers/net/wireless/ath/ath11k/dbring.c
@@ -26,13 +26,14 @@ int ath11k_dbring_validate_buffer(struct ath11k *ar, void *buffer, u32 size)
 static void ath11k_dbring_fill_magic_value(struct ath11k *ar,
 					   void *buffer, u32 size)
 {
-	u32 *temp;
-	int idx;
 
-	size = size >> 2;
+	/* memset32 function fills buffer payload with the ATH11K_DB_MAGIC_VALUE
+	 * and the variable size is expected to be the number of u32 values
+	 * to be stored, not the number of bytes.
+	 */
+	size = size / sizeof(u32);
 
-	for (idx = 0, temp = buffer; idx < size; idx++, temp++)
-		*temp++ = ATH11K_DB_MAGIC_VALUE;
+	memset32(buffer, ATH11K_DB_MAGIC_VALUE, size);
 }
 
 static int ath11k_dbring_bufs_replenish(struct ath11k *ar,

base-commit: 3df3715e556027e94246b2cb30986563362a65f4
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
