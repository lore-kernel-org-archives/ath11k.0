Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A141C43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 02:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IqI7QBEnD99A9xQfzy37mGvJ6+18Nd5vcj2Jej2Ru9I=; b=eZhMeHYSS+JlnwAnmrSOAIYpq1
	csCiyKRpaAZTb79hUJfCbdnTUU2Ni5JmvsMGZ0FDJU/n15L4gvEbb5ueoFvOyaBXqAO8VO1TbnUxN
	HENPCteUcYUcjS7xyetLEqvHoVSNFJX7LxEcQRifdn4DmhQ3EW9i0+Ule1ORG5bOwz4mz/EesXdSn
	8PbeHzZ3NCf6Vx49JTvyWDI6+dh36rr94YmNlW+yf/XMdLvQq79caT65WXfOBgKpFk6EkUAhuEIlw
	SGTv3G0+2CEvltmLG08XbtJazs8trA6WgTkGwozyC6JLPtaEB+bmPDU/Pt6wd9K8XcDqkqtehe1Nr
	BlI6GHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj61i-00000007wym-3TKN;
	Mon, 13 Jul 2026 02:04:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj61g-00000007wyP-2UxW
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 02:04:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D0kL2K4140033
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 02:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IqI7QBEnD99A9xQfzy37mGvJ6+18Nd5vcj2
	Jej2Ru9I=; b=lzZarns4DcOH3Adkezj1JAQsshicXcOPihdBlu3bOElC//5SeUm
	qwhiUfoBo9XGqO8fPoL4mPmN3LM+ZYPKeMJO2Q2Wduv5iucncbDxcgKR2Z+x/ObJ
	X8hZiFDf9CbwhUbDVPOtX8Bg8PNuPYLO7kquxIii6+6h+T0YkhFC5iFFZhXIJtHK
	IrC2R3/MWwzNlmsN5cUfMPKn8UKW/0/A4weZN6Y6BhW/bAw8V85JhTUSA696kHfq
	rHLpF3G2qELSpdqnvSXx9EqjZyBCdbe6HxrPskpJPHlC77hmw3xgvuhwHjn7q/wz
	EB80rOB+OMaT76n5iq5wiuEYrLbGn15z4Ow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hm039-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 02:04:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c804e38c65so54075945ad.2
        for <ath11k@lists.infradead.org>; Sun, 12 Jul 2026 19:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783908246; x=1784513046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqI7QBEnD99A9xQfzy37mGvJ6+18Nd5vcj2Jej2Ru9I=;
        b=C7gWC3FYcM+EtJ5FoEVl3T2lBfMVuUNprYocIi3OT1ib4MxInKXJQoEn/ejfQsSwiu
         waXH5Q2H14hWDINLAlkPa7QEa9CejOpHInj720hFQBr5yQuwMBFTbO/Cfv/1CqBj6XtZ
         vC6DqlS4yitf/it9HM2y3NR0g4rpFBMOrz7qbIzpSTWrP7JJC22Uc5jHV9FHVxFUtiKL
         6NdEQR3cPuDnrGfPoUB+Tj57PHlBQGKRRA0iCwI7qc5yEnAIklKGBGp0Vb+dS1y6w6t4
         COOd/GL0JsDllwAMr1HnuTEl3IlDGa61alV+Y49MOpRrXWyX0wWOF+WncBHlwbkEXQBS
         w/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783908246; x=1784513046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqI7QBEnD99A9xQfzy37mGvJ6+18Nd5vcj2Jej2Ru9I=;
        b=T63i1G8Bd5943GolspnT4/C6UtiFr+igXf8qlCAEi+KHyhoySnzxXHkkYbKJsGxnap
         XA/9VM27O70oITjfGQ5IH0rSHsJqL/pnMQ+MINwBE3EfO9hZOMBlvJAk/DPG0APvPDAW
         Gdu6xWJmpdtpq1FhMkh3ghrTHcA2N3dtnIegbJCBlYSiHTioc1/h+FwW+iXmp/ifhfcw
         mmZC3wW8evtDZNo2I4idqf2ZXJJiGmrcXtzqJ6GYz2GYfMMgoV5am+hljBDulrWuz0Fg
         Ce55aWLhP5aCQwk5pcCBQl8QzR7EdCwgeTfeyZZf4kVF7JwtMjmvPJtuaReVwtoALPKZ
         2/aw==
X-Gm-Message-State: AOJu0YwkARcrQQvw9/aeDuTKrLkH2UlKeC2H2wQeCIkNuT03p+x22Wus
	qNb68WhdE/eMkFrVg6ixzG3F9cNwA++LzvUUMwAsQQlNK2YFHhf6FEVY3x/4tqFh8WxgNzxja+S
	hXBM44Ez2DlFPy+RlvZSox8YKLo1xMdAHdvgemBIgSduPQcw42dBJ4xbwMAZOgquX
X-Gm-Gg: AfdE7cl0yxu7VtZ4bxJFnRGU1jNPevUvrx1lVqEClYQL7I9i11J9pGZ9xzjbY1kAYUs
	+xPY6rz8dVst0XesRSxGqLPrZqfL2qiJ5thZjGvb8llrv0QyF11E4OyvOrZGVTasTc2VPDa9bnx
	8KWFvnhu5ndQeO6kap1UouvLu5oBtT6hs8nAkiNJb2s5qCnlsa4FsMm3jGMw4z1wTv8CeNWu9GN
	6OiYT1Yc8jujDm4mwST1uHT/0tI7glI7jGlvTJ2EFF+oqc+WHsjTWqzqTxYBwHAN4xvxVbEQjCN
	PVQhZfZ6HJiFS2AchdYQmKYDS5Ynp/tHnsmPpvtOmvw3h/dzCYd6kdu1EHIP5PEBxIc8iND4p+4
	7N5TOF24zcH1LCuWmH3T49FVHlV99wdIJ4IesohnZt5dd/FZ5e/YYf9nKy0HA3Q65cGPAiQ==
X-Received: by 2002:a17:903:2d1:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2ce9eabdb5cmr66409865ad.19.1783908245913;
        Sun, 12 Jul 2026 19:04:05 -0700 (PDT)
X-Received: by 2002:a17:903:2d1:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2ce9eabdb5cmr66409605ad.19.1783908245426;
        Sun, 12 Jul 2026 19:04:05 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf7678sm91862655ad.20.2026.07.12.19.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 19:04:05 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath11k: add purwa-iot-evk and qcs6490-rb3gen2 to usecase firmware table
Date: Mon, 13 Jul 2026 10:03:59 +0800
Message-Id: <20260713020359.3618193-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jr-ZumHsLwPWn8ICVF3wAzqHs77PRSCl
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a544796 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VTncd2SxVE48FkO8qcgA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Jr-ZumHsLwPWn8ICVF3wAzqHs77PRSCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAxOSBTYWx0ZWRfX5gqM16KG7vJZ
 66g0HOd/bbsO/F7IA3nKotwsH/NSBhJ/SfrAhhcsK/jD7zuzMOpus4GXaWfGtME0oKA4I6SGt8t
 LEIMo/BO9hH2ffhrvgNn3JlEy1J45BxwQd3DpArLndk6Gxa6Aj6PexK3YmfUIBhJMdEv9i/3gb9
 jWh0z4V1tODCMmsKPmau20FUH8BMqEXSfUOlOx6vjid07pFeGUdrSbSac3h2zfDgpfuybdLs6C7
 o/ZqMKs7G9uWuZ7w4YjvdRDwNlDwrzVf4UsVCPJ5SNPYExWlSFU82Xld7lRLgTRxd+sQtJyg/gY
 cEdVg3pNNhkt3/qfecB2h+9xbCUT894B1XO9hKR+jkhOiPUVHysOvWPLACJb4joj1HdOSpd3VkR
 d1mtfSOpYA9Bvqc+AbLHMZ5SL4Mnnt6Ma7vsyEsZbLMp5bxtl4vy63h41LZcnVBoQ7nPVznOC1R
 JbwcCFUHsu5OR4ZETdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAxOSBTYWx0ZWRfX249jjnmoXZ/F
 2I2xB3A3MCgizjT6n2h6/i1D57s2r9Sso+GXsSQZuE5i17+IIX/knZgbKYqU1PZtV3NnmC1+ACu
 wVe75CHYGzxvk3E0yW7bVdaBF7IZksk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_190408_753204_A34BE34B 
X-CRM114-Status: GOOD (  12.51  )
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

Add purwa-iot-evk and qcs6490-rb3gen2 platform support to the
usecase firmware lookup table for WCN6855 hw2.1.

These platforms use the nfa765 firmware path for usecase-based
firmware selection.

Also reorder the table entries by compatible string.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8dacc878c006..8039124e7832 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1049,9 +1049,11 @@ static const struct __ath11k_core_usecase_firmware_table {
 	const char *compatible;
 	const char *firmware_name;
 } ath11k_core_usecase_firmware_table[] = {
+	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},
-	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
+	{ ATH11K_HW_WCN6855_HW21, "qcom,purwa-iot-evk", "nfa765"},
+	{ ATH11K_HW_WCN6855_HW21, "qcom,qcs6490-rb3gen2", "nfa765"},
 	{ /* Sentinel */ }
 };
 

base-commit: 951dc0a744e4dc8490935316d3b76e23990bde3c
-- 
2.34.1


