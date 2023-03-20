Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F09C6FD1D
	for <ath11k@archiver.kernel.org>; Mon, 20 Mar 2023 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pABXy4EIhw68B9UsI2EWmqkfIhbB1GWD9FTcWYFr2rA=; b=SOU+/UiIpNxB4K
	pTFBKlBt0bk9Ys0wbYIs3FYtuPWMriww7keexyyZHBsJTSXxPCpXtUc4Zy0j/p6Eybo7QjB3/5l3o
	Ib1TmJc3GTctP0hPgSuCDPV000ZYEAXrG7MH34I4PCl7b/vjLf6mjk6crJmDvErIM7r5y0DpIyfZt
	iR02xddNzxVR8ZH5D632J4dzG29jnTdornDFfyzY/Ts5HvKheQVKuzXiGlc66B3YJVzRi3r7/ToTh
	ZEBu/2edxuyM6vEZlCopfBVI6Ki1Rli2l3yVRjwT5DeDNCfPu7rF2mjs9+MRfqmdikVF4D1M7WGfJ
	5eR3OJrkdRh27LILBKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCte-008eWB-0f;
	Mon, 20 Mar 2023 10:37:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCtb-008eT9-04
	for ath11k@lists.infradead.org;
	Mon, 20 Mar 2023 10:37:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K9n9Av020901;
	Mon, 20 Mar 2023 10:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=UyDSjOWUMAhgGku56xvpXeQrm7OSwHaBu4Pr/xi8Juo=;
 b=LJ9SAy5hME9QztezQE7a2wvdG3TUv1Sv3BxV/yNap7Mx5SaRLP0zeozTl6143fzWZSEi
 jjlfMxMBiyG/TM3IG3DXrqjPelp9M5VG6bUOdJFqENjyekm0lrYfsra8x622PI+gcdoU
 /7MZ5wwv+ZFBkd/zenDE6IKtEOWziTOFmIhL/IK7bxWknk54a53D1F+V/SiDZyypk8Mb
 O5NMEZbx+oKYQKZfrCWzRlEbU8pHFdtyvBEMnRP0NoW6c/KHBhb9g9Kyg2HYPKoFmZ6J
 XTaI9Bfe0K95e2nac2Zt5PpdhInxLqnmxavGStiNsw1l8JgKmO7F2CoIPEx5PSubCtIq 4g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pen6hr3nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 10:37:33 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32KAbWAg023801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 10:37:32 GMT
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 03:37:30 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix writing to unintended memory region
Date: Mon, 20 Mar 2023 16:07:12 +0530
Message-ID: <20230320103712.4949-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ufK-UGKApSt-xZ3Hn4lPe-ZXc9dOcFzM
X-Proofpoint-GUID: ufK-UGKApSt-xZ3Hn4lPe-ZXc9dOcFzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_06,2023-03-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=764
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_033743_177985_A8D827C4 
X-CRM114-Status: GOOD (  15.78  )
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
