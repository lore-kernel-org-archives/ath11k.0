Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A40EC2D0CD
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uU7PofubsUvHU2URxMpgS+EVNoeW1gK8KIbpSjZ8wvs=; b=FY/ov+ypF57kXc/wJEjq3ccGf4
	6yDSpFg51nFwxEkM2yndKT14fFmJzSsKFP5u3X2GIc5958KIQAkyH96fXnpggfMqBjjjC5HMNR9qh
	H4RTT/q/DR+rbUMr89tVc0avMIXMQeWWS0skaR+o1+ra0EH51PrsMR9Z48h1nvbIoY0paCSjZ1Jg5
	5/ntd6/O5AwYQb70VtQzEw0v2PdVI4dmCqDj5yGoKj9z0MbM1jhRCVfPWQXY9gm7896y35BBeKenA
	LKlj5mKw6CPuGpkIBO2eJTxhbbqm4SNQmAxYz1y85pDfYgOjftQ2SO2lVDOO2qh039NHXcHVor+zE
	dlLobGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxER-00000008gst-1orO;
	Mon, 19 May 2025 09:56:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx13-00000008ciC-3fbw
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 09:42:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dSle002440
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU7PofubsUvHU2URxMpgS+EVNoeW1gK8KIbpSjZ8wvs=; b=JsMyobqftJleRTbj
	B11FC/2JAVgMNtjie8qW+mRAiSMr00ZwBIKJaCtY3K7PJC1hvmlA+odTItz9mkCP
	GIU5Beb95mBvQF1MoNpLuAZAKckt3FHFHBhceDgDSiLuQSndTkJrh3vfHvxrVIyp
	5Y+5+bEuE1WQC5majbNemPAgNASOi3DER8bcp3B5C0fCH4hSP1TxY/fEQJYUKzPF
	uXoHW6oUhwk4bFr8uqL/aKBxxmsApl1JfFXI1U6EDfPjcYkiq/nG3RWA99sCIJtj
	ZtvMxwTMCxFSyfvqeexb0VY2onCr+1/JBfnbs5Tb36ISaKeTEGQGtL6FR/1P+pCX
	4KULVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atg6fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:42:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7377139d8b1so3489462b3a.0
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 02:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647756; x=1748252556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uU7PofubsUvHU2URxMpgS+EVNoeW1gK8KIbpSjZ8wvs=;
        b=Y16dng2Pf3uAnWSUBHugzA70EMpIXBjrlZRJcRgRl7yaWB/j0EjZoTgp8qyCcshsFl
         Pk5c0eQQ9/4SerAJk5UoURGaGIMSSLlwADsHQHDhGDZ9964ac0qGdEe47y6qnEalnTx1
         QLe4XGk5T7OeuiknC8OceNpXnCMUwYWIAWZLYSSgo4AkHcz2vUrGawCG8yncPo0LJlfs
         ag0OPcwqnzbpGPPT2iVe+jWoQMzlu2gAZR8RtNXiUaXtubp53lT9XQhPCrmwvL3uYdGI
         YmV2BtMmL8Y3s6AW4+lPqPUFcOJk5aRF6JAYLnQad2feZyQKvMILWzAtszDpELYMr1zv
         k5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVhdbEwoaDVIGrhjV1hCj2TqgBYhxvvveq83Wzfi0b8CGNEMHTs0gFQbIKEULZiWJUQyv+tSuc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjbPub1hB9wWSRLB6HaRRwPMo4icw9OUKyHuYJ2Gdjml4L3AMi
	RvcKHTP2UmbCVAGSrHcc/KP/P6APw7nd/3sQShHqpyy9IzVbyF6Z/TnlN7YtjVfUHJUiEzABpZd
	puW46JoAlHgFWkTAX2Reuk3ZFngJBdZMoBbVrTvAJDUwFUK8tOslW1KhfWWaxN7FB
X-Gm-Gg: ASbGncv70jfrYDV8yekxWHsFKaN3Zx4N5FTnHXX+D900ffB8/7C/AloNBFgxtN2HU1x
	kqjZVOKy462AjKTt6Zi0dRI2n/DKEiuwQq5fLCuYptrX9WDWXU6d6INp9fnsT25KDFKkZD5yR1F
	XYck9vUNaSH+d2pXf0O6G9snHvMH9+NDHSpjOlAbZDfS9gnXfoJO4cmlz/9Zv+ffzvvZ5HupxLP
	F0MW/karz989tKFyqluB9U1iR5dCpjRx+Kb+wP9wPjB3vPreQOkRMW4tKWib92fgAajdPRIhCIq
	a4UgHw8KzKuBIEW/WWsdmSHQACWygRrWBY8rExJewkBNyOM=
X-Received: by 2002:a05:6a00:ae1c:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-742b3a6dc2bmr11994285b3a.18.1747647755747;
        Mon, 19 May 2025 02:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE99iUQ+YVc/maiKCsxdLZP8n8nikcwdzK+f/VpTPSVQgsMwchfjJqT1QzUS2xVouHmoYvWTQ==
X-Received: by 2002:a05:6a00:ae1c:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-742b3a6dc2bmr11994251b3a.18.1747647755364;
        Mon, 19 May 2025 02:42:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:14 +0530
Subject: [PATCH v3 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-1-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=1353;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uFH7gvcXfq8PXUbSnW4zFmBHt5LxnpwhDzcE1X+yWFo=;
 b=lXyiRKWe2dUM/NoKi98YA2ST4iD+GyJH/JWFyhdLHqiaIoNSFdOEcmMxv7oVHUvW2lVe0h7ZL
 UYVeLSPwgrlBOdS2f0m/xziM1YsPsEV3QKXX1cYho1bhDVgeJ3/rrYA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682afd0d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3phiJa3m8EW-4BHYHVwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZUq4keBJfgtDz0vldMJm8cOKFScmpEOd
X-Proofpoint-GUID: ZUq4keBJfgtDz0vldMJm8cOKFScmpEOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX3mzfwnrGDS6k
 ggWOclEWX6jrxLtPvA4k0oR1g2/cbj5yAedHhkZfOV1R+xFvqPKlucRetPvX3kIEAa0wmzm4D+m
 +ao8zvVeKS1bS+6LFY8VF1H0kM+ffliP2JsqkNWHHKbSHpBwsFpq/iTQbegnRCFIS2oBtZhu1l8
 HMIvmCqV87nLGM/WbS3ah8Yhjg49s/1Yqzux8d7SmzaAj4bcMUL1V9hkEPET6v7mU54dbDcKVU8
 EnX1e3xNZA1DJS9VXKcgNA393yRggW4tSMSGc0ZX/jMhP9riusL5nmC83IsOSjAGQ7TTRNkkLpT
 GEzB8itQ73aYflsXCRQgL3CZEORbeU2EwmM07GMUtqK+zG9/uHsHvEA1R9Sx64621FpvaU/y8Y7
 gahA0LZrIAHVQCaJKqqOAViVq5x3GTqHVx/SSd2gM4z7XBo7tQeMxVmzARRNZG/7WWYuqTs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024238_036036_2FDD2279 
X-CRM114-Status: GOOD (  15.20  )
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

If the link is not up till the pwrctl drivers enable power to endpoints
then cur_bus_speed will not be updated with correct speed.

As part of rescan, pci_pwrctrl_notify() will be called when new devices
are added and as part of it update the link bus speed.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 9cc7e2b7f2b5608ee67c838b6500b2ae4a07ad52..034f0a5d7868fe956e3fc6a9b7ed485bb69caa04 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -10,16 +10,21 @@
 #include <linux/pci-pwrctrl.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include "../pci.h"
 
 static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
 	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
 	struct device *dev = data;
+	struct pci_bus *bus = to_pci_dev(dev)->bus;
 
 	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
 		return NOTIFY_DONE;
 
+	if (bus->self)
+		pcie_update_link_speed((struct pci_bus *)bus);
+
 	switch (action) {
 	case BUS_NOTIFY_ADD_DEVICE:
 		/*

-- 
2.34.1


