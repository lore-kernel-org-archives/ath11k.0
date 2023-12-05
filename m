Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B13C4167B
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PlydpWRjHtHic2XxvMv/KvRCxL0wDGS/TfYuHMvLVH8=; b=M8KHE1viRCfN01dygXOncLEGav
	r0PKVmt3OOwkesqv0fu8lpvD/IMnFC3gjJLX5P4on8xZ3sKfT+TG2BWoP5L5ECF074xvaeI+obeht
	j7hp2djOcHJhJUFy4AIWS5XsCQkXZ36oGS0OB8CbX9NAphJBTYj3871hfNgqftbIZA8asWGYUFLDC
	rLXwRkZxfpbfcMiyIoBPgkLUjBZsxKSGfycW1bGlhEp9PxE6tn/HQ2Rsa6zwlKNkEnCLJYyB7z4P6
	U0fdxQqBgc2FqPr0+Z7B+1X4IUny1ds4NLB2ZPO+XFqlq14OtxlwkBCvkPaXoTci8WN/V9kE79rWp
	fOFjS88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAcWs-008P3I-2K;
	Tue, 05 Dec 2023 21:00:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAcWo-008P2m-36
	for ath11k@lists.infradead.org;
	Tue, 05 Dec 2023 21:00:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5KCpa8027610;
	Tue, 5 Dec 2023 21:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=PlydpWRjHtHic2XxvMv/KvRCxL0wDGS/TfYuHMvLVH8=;
 b=VmL83gv5+Ea2Ms9hTUP4+lpmFijdLhl7kcMHqRi68oOHq38SgHdn1z0CUmXzVzg+fwmx
 I2ffILlns32I8SHWCh/TgVqqDp/gYRitTfWYJtuBzF8llo+MtgEyY2lMrMrdDLgGkbRN
 av32i9rmddVtEV0Q75gEgiTeztLMS6M0otnLXWAZTfoFRUIbiprZfIA9SABn3SvDuCZN
 meSeiDflbrG3STs/G+zui0LFATcPuLOqTUlT7R3prpypX3fidDCOqGQBiAd8KO2pkSwR
 aCcJWldD+F+UXsDlLugr1EWT4kBCvAQRFFw3o6JM8AZyhoif+frsnZxusrLBvvUoWlNv oA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utapgr30x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 21:00:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B5L0IQj017032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Dec 2023 21:00:18 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 13:00:17 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 5 Dec 2023 13:00:17 -0800
Subject: [PATCH v2] wifi: ath11k: Fix ath11k_htc_record flexible record
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGCPb2UC/4WNyw6CMBBFf4V0bU1bSH2s/A9DTB8zMolSbZFAC
 P9uwZUbXZ6bnHMnliASJHYsJhahp0ShzaA2BXONaa/AyWdmSqhSSqk53mAwMZqRN527RHAhem6
 g0ijKg68ssqw+IiANa/ZcZ24odSGO60svl/VPsJdccAVeCWtxDx5Pzxc5at3Whfvy8NHV7oeuL
 UgstVQa/Zdez/P8BloMeTD5AAAA
To: Kalle Valo <kvalo@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook
	<keescook@chromium.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jTLfMYYRSr1i-mXPq7trv5a3bVfsyhQu
X-Proofpoint-GUID: jTLfMYYRSr1i-mXPq7trv5a3bVfsyhQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_16,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=500 bulkscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312050163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_130027_150332_FB5E7834 
X-CRM114-Status: GOOD (  14.13  )
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

Transform the zero-length ath11k_htc_record::credit_report array into
a proper flexible array. Since this is the only array in
ath11k_htc_record, remove the unnecessary union.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Changes in v2:
- Original patches 1/4 2/4 3/4 already accepted
- This is original patch 4/4, updated to incorporate Gustavo's review
  comment, removing the `union` and just do a direct transformation
  [0] -> [ ]
- Link to v1: https://lore.kernel.org/r/20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com
---
 drivers/net/wireless/ath/ath11k/htc.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index d5864a35e75b..86f77eacaea7 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -151,9 +151,7 @@ struct ath11k_htc_credit_report {
 
 struct ath11k_htc_record {
 	struct ath11k_htc_record_hdr hdr;
-	union {
-		struct ath11k_htc_credit_report credit_report[0];
-	};
+	struct ath11k_htc_credit_report credit_report[];
 } __packed __aligned(4);
 
 enum ath11k_htc_svc_gid {

---
base-commit: c8a5f34ad811743d1b3aeb5c54198eebd413bc6d
change-id: 20231116-flexarray-htc_record-ae46f039d4bf


