Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36095CD8CA4
	for <ath11k@archiver.kernel.org>; Tue,  9 Jun 2026 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lMR7DNyFrCJR1oBUZx5aCLEhe3qVrp/ulGbYrnrVCog=; b=avGx9+FiEl/P287wZORKXWT7a+
	JaPX9Le+exKYzMwkYVOADKMtEuKMu7MRK1j/nAOchoNNZx1KZhUetgN+mlkVxmIBpTTdfWs8XILnI
	BTYadO+CC994//in89fHnBNnHTUmENRCTLFRO0LYM1z5CBdsNsj8sDVpD74hVFBIUreuNRzzkWwqA
	7V1sA6LgY0DqTK2WmhCns77DKFEjkRJxZ9VmdY4qn/V7RjVH61bWF8ZNUuNw0EAkJoIIH+nSyPU3R
	SKfhqVzTwG/WT+XSJdulVJV+2KCMWDyLmKEGpO8jU1jAWfMLhmGc097ysdJT/3s3fqrPsv6Jt7Dox
	X44lYOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsPb-000000059Ft-1PfP;
	Tue, 09 Jun 2026 09:06:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsPZ-000000059Ez-0U4m
	for ath11k@lists.infradead.org;
	Tue, 09 Jun 2026 09:06:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rbgf1923220
	for <ath11k@lists.infradead.org>; Tue, 9 Jun 2026 09:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lMR7DNyFrCJR1oBUZx5aCLEhe3qVrp/ulGb
	YrnrVCog=; b=dOblSGYFmtztB+LRnDpxLu1Y2AU1mOCBt/d49dQZCCg/f8b5/qw
	0g49d62XJS9lVsE1Nd4TJmWWeT/+gR6hh3CbhOru9T0+hQZEl6NAX5Yail/nJES7
	d2gvOmGlKcvLWNdPtoBGIvRH0NbXSiYknFdtebwOS3SiY1LwVWrBYl5hymGgrqyW
	YZWUOg3o20SJxbI9cEi0vbP/A7A46Dn71io9s7b2OKH9szq8ts2+Pwk5JNnL6Fv3
	iotxrqJzil+Su7lF+EoUHAIY5Z6cilvknVcLH6RO94skQVDQbxTil3CzrCY0MLXL
	JmqnaoyLGIwpMJD7VAV6PwAKUmWgtq0FTMw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gdbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 09:06:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383414cf84so147007c88.1
        for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995974; x=1781600774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMR7DNyFrCJR1oBUZx5aCLEhe3qVrp/ulGbYrnrVCog=;
        b=Rhr7pD8qpPsmvuOR3YPdJMfR4dKmD0WglbG9LW/n8sMUcuMAlRuEw9AmqMP+7lkxWy
         aaU+4kBMc0wvzWQgBQwBq8UtlmRWSsUUluoNDnn7IpzRG+1VhDuZADoNW8TZSFeQ+NsM
         xo+xH0pjs45QVUklho0TB2c4valJl/lVi3L3sVv4jrm4eyKz2tfcNIHeWLgstfmBetjb
         xnVv9RrMzR1DDe7KDwA09FCOoJfshNp0P+gVHuDXty9p+wrS+IOZs3cL5a+93yXA9JyP
         QiFG8igrlG5e5ocEWuXoFKDTv5N+Wma53IApI61ERqM1MbubV1rJwQOgtnKyQr0MHenT
         Ttag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995974; x=1781600774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMR7DNyFrCJR1oBUZx5aCLEhe3qVrp/ulGbYrnrVCog=;
        b=lndr7cc5breIWu0slri6L9ZNZPHh3ct0Qkq6650T1AM08IIDW/3Nl29PN5Lbu0WBP9
         UzCzZKJElsBiCWOdD5QNZcbikYnqA7dYmVIIyJBD8BM7OvksP3pCMiS4oKGkYNsUm9c6
         BnzSSzYVnOUTSPWEeBtwJrB0joG8FNqlJo5uj/xzM/TdIqXmYT4s6JRAmnGs/u1SS5S/
         9naMVZ4AwfBWnxVvPV7B/syt1gh5khqmbNUn6xtLdJxQcfMYD5q6I7IxscYKWxCb0a22
         rY795HVQMqvqjaThkeO6h5kzRehLe9iW5XUPFg3nCfwchhl/hRfjI6OYa8JKkCqsBsiI
         b//w==
X-Gm-Message-State: AOJu0YzxcCLGs9B/uicEM6BHR0ERWskvQbwnCP5n4PycMqx4bd8xwtg2
	iCfDYrfkkCW+MHxYljpve3k/FDCY8AeihjVmtvTuenxOrQpQnnJGIF8uL1umeXHT6si1DTIgMKj
	eyM1fRVWeenYHv1KzvfrxrBxHRX+9xmRp9dxw1a8bqUaR6QKvnYZA7HFr+VOWmmZXuLiTnpBT54
	k=
X-Gm-Gg: Acq92OHQw+C2+abG9bPqsVuSY5gxyZySBL596Vq7wPEntE+bVL/kcuAggAwN8Tv81MT
	j4J/CfDPifQKoNhXDoeMUW427xp6/j4qFG/1JaC7VOjjk/10FzwN4TzrXmOft6kyXpWb3JD5hsN
	WkAhM9eMgA0PraOIqwBmEGNrMjTjjdmC0bp/KwsbGsAahhcqgm+qAJgN6k16sdQfNLIU0vSWB/A
	n21ZMB8NXxTU8H54J/fyeps9JKHf/iYC7Nj9QKu62LpxJedkjgxkljZESMkkcGwS5cV3M+cZgKy
	BxLHIIa88Nfq13PjtF43FQbqoyFGBaJBr3rP2s1TaWkPILj9Z2Dx1Nug68tN17wxqTuXtHTKKuP
	yGTChLw0OUx9uDI8TlE1aLEc45Jlw7Ou6DYE2ShelECmVjxiw+MM7d+zs67bwz+wjhfStFPi1Yc
	hGzlt1oOga4NIlqQ==
X-Received: by 2002:a05:7022:ec4:b0:12d:de3f:f3e5 with SMTP id a92af1059eb24-138067571bbmr8812605c88.37.1780995974271;
        Tue, 09 Jun 2026 02:06:14 -0700 (PDT)
X-Received: by 2002:a05:7022:ec4:b0:12d:de3f:f3e5 with SMTP id a92af1059eb24-138067571bbmr8812570c88.37.1780995973648;
        Tue, 09 Jun 2026 02:06:13 -0700 (PDT)
Received: from sdciot-sh03-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db528dcsm24532741eec.3.2026.06.09.02.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:06:13 -0700 (PDT)
From: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: gaole.zhang@oss.qualcomm.com, miaoqing.pan@oss.qualcomm.com,
        hangtian.zhu@oss.qualcomm.com
Subject: [ath-current] wifi: ath11k: fix NULL pointer dereference in ath11k_hal_srng_access_begin
Date: Tue,  9 Jun 2026 17:06:09 +0800
Message-Id: <20260609090609.4041009-1-gaole.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27d787 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3g4jOkLtDLcfbKciuAwA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: WZ9X1BZMWWazXg66-CnikFdudzKELgwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX7Cv9+c5EYQEU
 OcgIN/3XlndIdCKLxjbVbvHD3zl2qby3/Z9CQ3Lb2Xs5A6rgebAzbrS4wRraFrsxtmW97Z9D5gO
 eJzKevHJV+IkPqA54EnA1JU3Ntnmaa3F/7THCgDnhuQMIjRlvvMJqPjRei1K6W+OsFbehWCBAMT
 1ekNQ1MEmelT4VMvR883SxRWYFhM0Ut3SMC3dGkr4BXNEnAi8pbx0WA4KmoU9n49Z0w8L/Hp7j+
 FuQXKul/aQ+/FyeCB0AizBHHAYix6o8Qg8MR6glt1rrXg+TTUlL7HJDiXFF+SGm1R/91FI6Q6I7
 q3Wr4XzVYrC8+uCBXdcnglHuwaAe5Bia5fG0G3ukCj1fY5s6DieL8o7XQYwX9hTgxMsHsSs57Cl
 enXdJUEneXGQ4sL81NlPWIhvbcdinZ7mxou6XXb6ffo0Qpv+DCopo7C6XnF5AF0N9K1O5yQALKc
 oHQh2vtkJqMEMzEFcnA==
X-Proofpoint-ORIG-GUID: WZ9X1BZMWWazXg66-CnikFdudzKELgwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_020617_270209_1F90FF69 
X-CRM114-Status: GOOD (  12.29  )
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

In ATH11K_QMI_EVENT_FW_READY, ATH11K_FLAG_REGISTERED is set
unconditionally even when ath11k_core_qmi_firmware_ready() fails.
This leaves the driver in an inconsistent state where
initialization is considered complete although the firmware ready
handling did not finish successfully. During the subsequent SSR,
the driver enters the restart path based on this incorrect state
and dereferences uninitialized srng members, resulting in a NULL
pointer dereference.

Call trace:
  ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
  ath11k_ce_cleanup_pipes+0x17c/0x180 [ath11k]
  ath11k_core_restart+0x40/0x168 [ath11k]

Fix this by:
- skipping firmware_ready if ATH11K_FLAG_REGISTERED is already set
- setting ATH11K_FLAG_REGISTERED only when firmware_ready succeeds
- setting ATH11K_FLAG_QMI_FAIL and aborting the FW_READY handling
on error

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 6fe62a8cec51c ("wifi: ath11k: Add cold boot calibration support on WCN6750")
Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index feebbc30f3df..a304feca7042 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3295,9 +3295,14 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			clear_bit(ATH11K_FLAG_CRASH_FLUSH,
 				  &ab->dev_flags);
 			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
-			ath11k_core_qmi_firmware_ready(ab);
-			set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
-
+			if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
+				ret = ath11k_core_qmi_firmware_ready(ab);
+				if (ret) {
+					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
+					break;
+				}
+				set_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags);
+			}
 			break;
 		case ATH11K_QMI_EVENT_COLD_BOOT_CAL_DONE:
 			break;

base-commit: dc14686f27df6454b13b16ad1c9203ab3e9b0375
-- 
2.34.1


