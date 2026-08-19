Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A86BC5DF6D
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzW5IHj5NxVpXb/NDn7q5pRWgTqd/agwSM5EqGTVbRM=; b=Ds86GIOMcmPSf/oQtOQEnKJc9C
	24PgHXc65lUCNruYJ3NpIRXfNUfaNr+eRv5D0M5ZGZR2LClNGcp2XA3ebtLbtDQ5tC7gGVQgQmfxL
	2I/dEeAN0acspfZtBwU0TSwKLH5dF6gYs92VpkORmEfTNO4QJcyVTqH6n9esnoPG59Ux35h9J1r2d
	KyZIAE9RKw9n6hRRiYKwkqElQ86B583u+IZuxrIyzXsrdvcQMophnPLQkstxtu8AcaZVXE80/38SH
	swdEWgyWron6gMkT1O/hqJh8HpHcc+rW8vvj5tTFB8o+oaLiyn4I9k+GgYPo9kuaF2vbL7RuNimVC
	jB5VoaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJl-00000009s15-2hyg;
	Wed, 19 Aug 2026 13:26:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJi-00000009rye-0wYX
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 13:26:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JDLlQl399307
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzW5IHj5NxVpXb/NDn7q5pRWgTqd/agwSM5EqGTVbRM=; b=AI4H7C3b2DllNm2C
	mfg1zG4Qe5AQ2RDvEozScu2JhP59LxOlpO0t8kYdXGsG6rvLT4oTJV6kIKItX2SV
	6UpDb80fjlTebjInuL7bYXpQua+NFIF5K3oqhl+VvrorbLWr7wDi/3DrBf72MGco
	pHGj1IXiBZl9/pmhgeXGOqb9IMVStj9yHg+T8wUsiOVnnHHLbudJIKpRrg2P3lXb
	y7LEdNPzdVRtknGlZ8dDuDqpuB58QjdDJPujDAtaLqoBnUFcHwWTcGEeAwG/xuaJ
	ca2vRrZJDCucdQb4oVZb63L2u4Pi81PFW0YmfaA4MZ5g1ZftrY4X4MEE9kA4i2s1
	YosDxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa00qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cd01a14e81so14462865ad.1
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787146013; x=1787750813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzW5IHj5NxVpXb/NDn7q5pRWgTqd/agwSM5EqGTVbRM=;
        b=VJ8TbUNyYV7UTteAcgy8o9MHMr0PZRWgvsZLXDNr997wKl4XkllfVkE6KAWZWgAV8M
         8syGSejRWuxCGJSWI6Kn0YZ2Wv9FD/LJnIBeuaHiJUexPqMoZf4BsXcr0v5Eu8nKKipL
         DBKjLdN4+m++fODq3iiyIJ4S5vdrS1HZP4bJesWt+KWTnIATtkyJVrM7ybH85jbVh+FM
         0gK3s15zEcGt4mf2W3SoJZze/rAQKyYvbctREYXKBA9MaQY7UDxSqqP8ZsnIJI5nPBHH
         fynPnPr8OrWhPE4g3c7xwnh16d5vQHjq0XumJr+oTrxn0gGnsEN+D+yTr+NC0gXw4Ho3
         zT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146013; x=1787750813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzW5IHj5NxVpXb/NDn7q5pRWgTqd/agwSM5EqGTVbRM=;
        b=oqMdtfevjya6y4f2gPmp3p5CYSY849kHHPOZB6zJ/E9Qin5n2UVA77azd2K8oE/2zX
         K3QpMa6ByMqmjwtIK9pq34Zmfo11mQdOi8ZmLw5fpAPIDeIU2gQYTJLOe7YU16eXkGQy
         /lDQcFH7eroE3eYVK421MsdKlHm+waRJFGgFN+o9ISUstkXIv9FE4XEX3qJ9036ceFxd
         XtBCJV4Lz8ZvbMWxELGzp+yjYuzoVnSRz/21lAknVc0Eg4gBVNZ9wTcDrdp7jI2qZbNT
         +msoP3q4TiuVmre9ejHzOLThvHptneAhQTH2PZhzTcy8BC9F3agkjJD4WnIDLT2rP/ri
         miqg==
X-Forwarded-Encrypted: i=1; AHgh+RplBAzRBzKQYRgDUe4n0vkmv2d2JxzvdEgHXQTZ79kOsjIHjXgTfFoi6tFHkgm9CBcmUAlvLTQ=@lists.infradead.org
X-Gm-Message-State: AFuF++n0+RGdL3z02PFGZ87TqouaDrOF3m2351rlBgQ/wxZhrOUM58ji
	/hNWC2JBWTYoAnEdXuU42uN6l8nm2xiEWcbG5G03F/uPRpe8MslviX4NIklokXdhMEJi13WjCY1
	ejgm61Q4aoUkpa6pBdkGtibL27zzz2K0zmc0+WQYjur45tNz+AYyn0oD3Xsi7SBM4
X-Gm-Gg: AR+sD12PkEpzQxnc2n3WHU1+QSN93HDb3qSvUMEDCn8GtebJQPzP34OyRiDcPYzIIzx
	KyAscVEEPD6IuHrIbEUUz5yeazTkFgzPgIWez7tr48pX7XHnbaItbiLKd3Lo3CpSPGy3Fp8tEms
	JvXkNRgI+Dfkd6BytH5eKO6BCjFVM7a4qfWjPvUE0xOoRTo9nt9N6ihun7U5U87BQVdzxmChRtu
	1BMpaYfwUIQjSC84E1ZwH18gUKJTGZx5rifUt4R5yXuwykq+U+pYcqPpfUH60oAMXMUl/dZN5jJ
	6yZyjqSR1qkE/wdYKU49WykEl/emzTt6lLsn1ge+DRB/o327hHb1v4ZcJytffVPJ7ZPo8oehnKF
	vk+h6LqPVoJ8gKbruwMsk7Wc1T7/7V5GQmUY=
X-Received: by 2002:a17:90b:510d:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39580f2d498mr9334495a91.8.1787146013013;
        Wed, 19 Aug 2026 06:26:53 -0700 (PDT)
X-Received: by 2002:a17:90b:510d:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39580f2d498mr9334409a91.8.1787146012498;
        Wed, 19 Aug 2026 06:26:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:57 +0530
Subject: [PATCH v5 6/6] PCI: qcom: Enable ASPM disabling during link
 retraining
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-6-6dea79786b37@oss.qualcomm.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
In-Reply-To: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishnac@codeaurora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=907;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=f9YlB0Fh+bNAledBbgwJEMD/HQiDELnKiSK0+Ha5n1U=;
 b=OgQCeukC0yqHkRBcMr7JYdM2b51+4QKimpjb1JOms87pWnVBZMA/wPJfz26Gp6RTe0N2xIQPZ
 HXv8nvTacz5BZOz8pgiG9ztzWQqkRsKziXtqPbqDfuD+EpVFPQQZzA2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a85af1d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=LpQP-O61AAAA:8 a=0KoEUwRExAGgTGxQCIUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: m8JsIbn96Z4TC4mf8U1J5xF8kHx9h4vW
X-Proofpoint-ORIG-GUID: m8JsIbn96Z4TC4mf8U1J5xF8kHx9h4vW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX8zpxa4PAmfXw
 /LDDW4nhOIGySOtLjR0E/Kk1NC496vTRgPP6RtEOib97o/inEMUfv5n6jQOM+aHLKRLQ/f42k1S
 QFFWZg/j7QHcoK0dAKHO2serutyeYfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXy0tzB8OYUrIV
 oXqpqVJJW5x62OJioWj1iPWsCXuTipJR8M/gWX49AecK605ObWVqlW48nS54928PPSkqPOcsOe8
 QRsF7V1Ua5aKuphslRqSnV/bu5TiXz8NKtiN7InC7BlSSQ5w0KeXz4XNxYydzQqBkCj5j+xlNAD
 QSi7g1M2cC9mLvUxkBEU92VsxYAGJBmr8SC6u/upRolcNNOv7fnJf5tbrDY5HXF7TRXNh+dNfQi
 +qhkwaLYBfG+DawQcTJNfpomoZxLESKxiFuSa0Bxh7bWIORUs3hG90rFwzR2s2WFOWPDQU4Dsnv
 RK1bq8YYoVheVvmmoBgJ4QgphrKDAGmRn1M315LOlWmW2ZTjdt+E+6+GDVNXH2h93BANQZty6Lz
 lhwixA6C6IZRTUAjfgorzOrpF0A3PMHYBW34cHJYd+kKJUFv+dTjGyqHebW+hRSt0HlC37QJ//D
 gJTFoMO1ThNOoYzMt6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_062654_288338_F5E3BD4B 
X-CRM114-Status: GOOD (  10.73  )
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

Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() to ensure
ASPM is disabled during link retraining operations. This prevents potential
issues with link state transitions during bandwidth scaling on Qualcomm
PCIe controllers.

Signed-off-by: Krishna Chaitanya Chundru <krishnac@codeaurora.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 45f4caeb0814..0237f747b69a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1395,6 +1395,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_deassert(pcie);
 
+	pp->bridge->disable_aspm_for_retrain = true;
+
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
 		if (ret)

-- 
2.34.1


