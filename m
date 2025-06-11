Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FEBC71148
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=; b=4xADCs4/ttn45vRUbTB57aclGs
	WHRQBfbcwhL3KmKUo0L1Rnn5womFxKXdhFFVqlYflcXTEDibqdX/3xa+CBv2tFtgHzvTeSfngojQF
	wMpgQXNfTe4NyaJmqFrKdK0CjL/EIbIX7dR6VuFqV37QmFl1/WddXw4m8qNkwZy0VuljYA6GuBpcx
	4eOvI5WiKMq9JPq0Lfih01tnFerb/Vnv5YsTYiRunt0ER5S8lis386y8lSYK67rKuGXIXE5J1Z8qH
	C2zkHFSTkm/tbVHHyH8Vu5/tVp+Hx3r775UPozSPzelP1q8+1lw81EMAbJEYIUpLXKao5Gxj9xqwf
	tAmlp8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSo8-0000000BGJT-3PuM;
	Wed, 11 Jun 2025 21:16:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5W-0000000AZAn-3Iao
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEiq029279
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=; b=pRSNC7R6l5HnmRsq
	Scnjy8EdxHE1eJmHy9ZUbZAHkX8hC30QotCClFjZ3pNSON3KxyhSz6Oo0+F/24WE
	5r/hzrSpnTcFpocwRCW0w26zWx/n6q9ptqLi9ABqjXZ4R8i+rtzZu8uM9v13astM
	YIxexQdGRM7WMPScyf3oLUwix5uCDdN2pIhqfRtoUFk/i8yNBQuUnTUuvoGtC7rW
	H9sH8oS+0VDXP5mONn5IBw0Ng+gDpkJaX/9alty3gELd7c4145JggGTHAKMyTWXl
	BGqleD2qrXDTtFhVE8Nxi3Sva+otxjR8V2KcTQYF4tTWQUOjyfFN4DR9n6l3HkcN
	fRoN6A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6djch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7377139d8b1so48916b3a.0
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658445; x=1750263245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH2j/JcGCi/wRGQ9dQsBU2fKYdtjABlsIMmBhcg0SgE=;
        b=RVHZUaaVCArXNrywx5ekVnNRCXJSuvvDj6IiXS+eCRPFa6aucQSFgVESBCntFKgz1F
         dYbwRRQkUVVZXHEcSY4xq4QQk11j4j1Hz26lnZo6mUtW23ondM+LM3zD7oXRvYAg9J+M
         3yPMMu5VOAL3n4BslQ1o9lMb0HZlrfVBg1JaVSb4FMR2utuEIb1f9L+HBqXTk0FBR0or
         7A7TbegJ7NfcZTcmBNo8UDgl/WRE1l3xe388L5nBQGJAC7Q4u2U5Y3DSAPLo08OwFZwC
         WrOxUnFBcxhMmSNq8getAIi6cJ85EiFz3b7k7i4LYaT7UJdX9CZBiLrOzOvYE1zj8neD
         Xo6w==
X-Forwarded-Encrypted: i=1; AJvYcCWmb3/JtijlybzFbVm3V2xS84oTz9cV3OBg7PHlcNx6fpd6Vo1YhfBpWOF7qu6TBHj/NYFKwF8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyVXOCA324R6znubapV/aCiMmp+j5RTIbVmdlmSiSMPryhPu69
	+vt8YPPFOYay8Gdr1BJT8Hjof6CpWQRgEc3GoG4AHHBSEhL/aJcQO8959mDKHBFnRx9gulsFx5X
	tMpd5uBaLbgagcS4/sJUi+KB9d3C/YZDLz4QhBgB95oLOkeBqT06SYBGjGRx93GgK
X-Gm-Gg: ASbGncvnBA2WE73/hji50B5RW8UP/r9a2d4Wfp5/Yh4z6z3ET175J+kZY0zsnIo5Rqt
	QGqS0zE8JHrHwZiSNZI5hQgVjaD2P+IYR+pQFGX/sM4kPLuc3M6zPxDHCFY1IY7uvaRlqPstS9i
	W3gZUcHlb+Gg+faGMJ4sTQQ4bOXDn5MyhuH7uSX89IWGr574RYGEDo5J9GD+HQHaaC1IkDRKDAD
	ly59zUWH7of0ckaIQNqvzN/Cgt8LZXR8aZ5/VmxLzlwHSVb1R6ymv805QzW/T94vextvA4yX7uB
	D+y8kzpFC6mXLpj1UBgbqyMf64/zBXSo1GqKIbydZFFr8GWC4Pm2QblrdoU=
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863604637.34.1749658445469;
        Wed, 11 Jun 2025 09:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhF50A00ZTd8vFQ+6dCgRXF844Xy0RmBjMaSc4ILELsZo+JvEhAIFYPQ0WDZr7mZZy0t8u+A==
X-Received: by 2002:a05:6a21:3943:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21f8672f2a9mr6863542637.34.1749658444992;
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:58 -0700
Subject: [PATCH ath-next 5/5] wifi: ath12k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX/vVYsy1sosaE
 5gGTxPxbBWeFG+ompB9WxCqsjHcYw2GRkO3iUEttq2oBsl70XWrO1DFYspmKAwMJKdi8Iyx99qK
 +XJJQDQx6gEwbZa4A3tvO+X8TTSsO8ovX60slgTsYWJwohMhBmtv6mZYyXXLAbRpWwQXK58lErr
 r0gMuduLdNGh1efi6Y2Sk9uUnAf1suFdyBnmZ7GG6jcaVPMv8aEJMNttEnKHSe1DDXrhuQUTNAe
 kqxIUfXVqTUEeEpGKNdpuLkqHVaj1q+sR89L16mcTH81N9F8iPtE0bYXFJRE0EnClkFU9ERWDkE
 GRcX0op7zOVSHfHXvaK5o3RLehx3q2j3XCsRBZEhLRyUWnDrPYS+24qzaA4wwTeuQEuM0NavU4J
 b9DYrr84q9O9048RF8ySapXn1jPjr0dpvL+UiKfDWzHRC5xrJ95h3dJTrJnA6GP98F3ClNr8
X-Proofpoint-GUID: hfRcop4jlxdm85nB6Mvm9YExxLi0Q8za
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6849ab4e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xduYLtDgZ1illbjtIHAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: hfRcop4jlxdm85nB6Mvm9YExxLi0Q8za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091406_828536_686C348F 
X-CRM114-Status: GOOD (  12.89  )
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

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warning:

drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ebc0560d40e3419130e4caf01c9b91bd9affb3bd..ee0ac2e4e74b4b7a700b68a2077aa5b9938362c0 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/remoteproc.h>

-- 
2.42.0


