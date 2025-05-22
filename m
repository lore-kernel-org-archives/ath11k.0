Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D924C54ED0
	for <ath11k@archiver.kernel.org>; Thu, 22 May 2025 01:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0H/cVOIUNpwOrSLOFwCw7lBPYVeMWU0kmPUgQl1LAeQ=; b=ZxVCx7eHtzGM4aCwFhWra1dWat
	gZQ/3XK0uXu55KOd91jVMgBLhcnL11a0+HgZrtAg9oBlLH4dWP4O5/0qnor+CvECRlv13hoqkdB42
	6vOLuRFRAlNV97xp61OqVBntxnNSCjBGHuXdbMCetlZBe/GYA739AWNO3Xfg5qP7deXgkIzEMNslt
	cbktSrejKTc5u+uPtxQm+7sQSCMPJMkXAOpyO+xnimUNU45BU/52TVHfaHvcQ44B+2mZkHhVAlZpc
	NvksScQdX/GZ6cbQ1rHKFqtEZ65aulRlX7ZTvu4pVL6baqkG4/B43ToI6vFSg1zU7x76pt++UzSDt
	Fjx39a/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuqA-0000000HBvS-1K6l;
	Thu, 22 May 2025 01:35:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuq8-0000000HBtn-0dx5
	for ath11k@lists.infradead.org;
	Thu, 22 May 2025 01:35:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHSdiM024849
	for <ath11k@lists.infradead.org>; Thu, 22 May 2025 01:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0H/cVOIUNpw
	OrSLOFwCw7lBPYVeMWU0kmPUgQl1LAeQ=; b=l5gzgfnANzrKADxGGtEb8waxTgo
	GysetOkI9QJ82PDIrqKKw2P5NgS2FYwdB2DP6uMk+DoYFZsDowkiF3wcBffg3mZi
	jIedsCfAdOHhnuh5T7NIJJ977ZKJyDhFlWI3I2SdtEJF62KrllE2C+/V/PJIZmT9
	xxVt0M+kfMKDaqGHCpskZvh8pVdji+1Hlkqj2Hsnmobtc3mkR/FlD/ycAQwG/mSZ
	+2L4pDg7Dj8B1T1ULGE+oP9EAp3LUXyh3LsH3I2HaluMGpv7wW30jJ1xJ+LiPYof
	mCDb2hlReqKySPvwhV2eo0KElPHDk2gyhiCZOzP4cb17tvU13vDejEBvCGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4vmcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 22 May 2025 01:35:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e895056f0so7682305a91.3
        for <ath11k@lists.infradead.org>; Wed, 21 May 2025 18:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747877718; x=1748482518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H/cVOIUNpwOrSLOFwCw7lBPYVeMWU0kmPUgQl1LAeQ=;
        b=RGU+9x1rWZSzmOyw8JyZENgSqHPC2dNkYnLc3JUmA+EK9ylw40aNXb/cktGcFEqKES
         Dz8dnq+QnxcADTYa2plnfsJpHVp7KcMjj07ZUKaWgkmW17wU9TWPZLzZdybmJiJtYLm2
         20GrsBul6WMp2K4I8B3DKkDYRCcz2bfkNkThDXIC3tuLQCf7kXGYIV9K7muLApYhN6j5
         mB2zQmkslEyAfscIjrQfOyN1Uq9RnHkj/rNktOJgo9wmBj4cgu2+/5mERDgTGmqWmGbs
         /LjpWzeXfpjApt/BqUV7icmrqfsogun0jug+yhu0W02koBXi5AoHkLcTJCguCPFVU8sD
         AM/A==
X-Gm-Message-State: AOJu0YwSk0lKpD45QxrPD/v/VfZ6jXaVw4O/p9zMG1BCgTNMuWdieLLx
	sUo84S0/DYxyZI4QtxJG0rl0rFsZWRoBTq3JLK1NqFFM8Sq605Bb5xFIWjH92zmM00k7TFdmK9K
	omorpf6NJZOVuXL23TTE3yvI+GjegcNch7dwKhV67E2vpW3JfU8fILBd1BuY0AiXHSJwS6Ika3f
	I=
X-Gm-Gg: ASbGncvBIvtC7JfDosxJ87pignQ+nexpxEX/o1E63YzqP8NNPPTZDsxQrtMgfEtPClA
	qbWF+SlhsZakN9CslX4uoYdorrGsOngq2PhXGBT0O3pTwIdULrYUILv21TIgQeiXXpXGAISDeu9
	GSW5NpXw7+PFXkkjqS2rKD3lkNb2KAf7X3Y2jFf/srVY6wKq2ORJ/cJKXW4mfPxhpPqSzQ/TOd2
	kmKyCF3OdbhW8dbyuPN5nzpKxkC3jpAO5/E72rlNEm7kcYPbeN7SUmoc0NptTalTe14boDYyAhO
	nKilofEfsp7Njjo5V56gxefggU/fbfGtkuLzBlcy/INO4XlgbPPzT+JkVKhgzSZZpJv4SAA=
X-Received: by 2002:a17:90b:48c3:b0:30e:8c5d:8e4 with SMTP id 98e67ed59e1d1-30e8c5d0945mr40642076a91.16.1747877717690;
        Wed, 21 May 2025 18:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbuUE9/ZskXFCWiI6dbO621KmEQBhp02PqxKIAGf7sPxeTpyZYhpy777m3MSdwOFa0Q247xg==
X-Received: by 2002:a17:90b:48c3:b0:30e:8c5d:8e4 with SMTP id 98e67ed59e1d1-30e8c5d0945mr40642040a91.16.1747877717338;
        Wed, 21 May 2025 18:35:17 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d45b2sm4341488a91.26.2025.05.21.18.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:35:17 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/2] wifi: ath11k: support usercase-specific firmware overrides
Date: Thu, 22 May 2025 09:34:44 +0800
Message-Id: <20250522013444.1301330-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
References: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r_qWf6MhE1bdo0Lcxb4e2j9Xulb_Zgs0
X-Proofpoint-ORIG-GUID: r_qWf6MhE1bdo0Lcxb4e2j9Xulb_Zgs0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAxMyBTYWx0ZWRfX7ddi8NYKWRbp
 sZ4yc8kr2LugSoF3GoLWUkRqnQW7WCYRzSiAcOBitbSgZ13Q7EVvkMmGzCse/nNzY79xkpz7Pbk
 Jekh4UuZiaYZ0ue6RnDT9LV063qIJor5zRnPci1BcIneIJNlh7cESaqa6BYoUIofTZjKsjEdPRn
 KItkfiM4uUYU0N/n2bBzi6nSx79IBgKr9T9WF6kWSyD7awWYViMf0rCrY6qCxw71TBoupvqY5bo
 ZHSoMS/57UWfrq+zCzL1gLz7moNHtmfZ7eMHCo4vrbdAvYdAX9gXEzZdMRe1HxWC03ViAMVt4VT
 Xno27wKbspKR86LvfkLhlnUXwf5Qrj2rIsrUSDfgAmqVeMBYCdwX1FuRtpnfuTv/qGxUyjnmPwS
 7lWhkDVQ4xCnoBX0aGCtZyPfh3uP8oB+UXC5/YH2yzh7J3ZC1bK6kY1/GjEGudWnXunaFNos
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682e7f57 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jX1nYg6MY8bSXAgjlsoA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 mlxlogscore=871 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_183520_307327_C20A619C 
X-CRM114-Status: GOOD (  15.94  )
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

Introduce 'firmware-name' property to allow end-users and/or integrators to
decide which usecase-specific firmware to run on the WCN6855. This is
necessary due to resource limitations such as memory capacity and CPU
capability, or performance and power optimization for different application
scenarios.

Currently, there are two firmwares, both files can be executed
interchangeably.
For example:

- ath11k/WCN6855/hw2.0/amss.bin,
  ath11k/WCN6855/hw2.0/m3.bin
  ath11k/WCN6855/hw2.0/board-2.bin

- ath11k/WCN6855/hw2.0/nfa765/amss.bin,
  ath11k/WCN6855/hw2.0/nfa765/m3.bin
  ath11k/WCN6855/hw2.0/board-2.bin

The former is the default firmware, suitable for most WiFi 6 STA functions.
The latter adds support for commercial-quality SAP and optimizes power
consumption for IoT applications. And both use the same BDF/regdb data
within the main board-2.bin.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 339d4fca1ed5..67b3b6d898fa 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -17,6 +17,7 @@
 #include <linux/average.h>
 #include <linux/firmware.h>
 #include <linux/suspend.h>
+#include <linux/of.h>
 
 #include "qmi.h"
 #include "htc.h"
@@ -1320,8 +1321,16 @@ static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
 						    const char *filename,
 						    void *buf, size_t buf_len)
 {
-	snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
-		 ab->hw_params.fw.dir, filename);
+	const char *fw_name = NULL;
+
+	of_property_read_string(ab->dev->of_node, "firmware-name", &fw_name);
+
+	if (fw_name && strncmp(filename, "board", 5))
+		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
+			 ab->hw_params.fw.dir, fw_name, filename);
+	else
+		snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
+			 ab->hw_params.fw.dir, filename);
 }
 
 static inline const char *ath11k_bus_str(enum ath11k_bus bus)
-- 
2.34.1


