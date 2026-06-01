Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3006CD6E62
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=; b=vC5j6t+skyVzawS3t1j1f9iCxj
	RR0nke1Tf6QHspAfBi1Hpp3lXX8ZvyM+5vJjaMRtR8GR3QwY0KWIuQShTic3JTtV1DMD6gzoFSm5R
	oZmw92o6Plwx28IoxKYL0BLbQnby7qLSfePBErwfNwNKDHp0yY2wBfZQnzCF+ZP0qwRbM3NIGZyKY
	hJtq0uGYAE6godc7LBoFi3a2cvB4bLTEQzNhloWdeH9dtUilAeWtJV/PQneTiya5msQqsyC+mW6UB
	gSmyhrXWdQdL1NqiNF+LDh9ZRJAy72LJubprGTfOIbFVg0Gp9lazEIxuRod3P7bcNB6kddIYj6DdE
	Hdhk1knQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEb-0000000AW5Z-0vL2;
	Mon, 01 Jun 2026 09:47:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEX-0000000AW42-33k7
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:46:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dtYG4111164
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=; b=DbacN/i32nHCv76p
	CcTtvGE5WRiPZvdQsMnzBqqyBcIes7Y785awJiz/7bkY1JRbZByFoGS9X/NaCkeD
	RDarenEiOYz+t0oIZ1eohicKGtRHTA62Wp0FfS8UlRLwoAWSIBLATFDS2EmABKyy
	5Qys48JivQRqIDKHh3gVhYByFbkAeqV3VMVc5rcmQQUch4ox/MQuloM98rRbguKv
	eBgkwKe21gm1mN0scSh7gLCfOhz1znqCIxi8UilJyeUgLdkz+0GPR+tudehQjv+x
	ZoiO8eVQghC0E+pcBIAJHp6D73GN6vSViYchXXJhI8PG2jcQjhobQVV1MKj7GZtN
	EVuBkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3r90p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:46:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51757a0de42so16039781cf.0
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307216; x=1780912016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=AimUtgvJBiq9R1trYC/TNqCT+/gt6I/6XSioXFr3KxPDfma+pYQ+JxlMXyWSJNjFMc
         oCGcSLpUUmU6gXp7WdcFJ9SMhYWnqTRaMtlX4oGUf8QCX5b7wuwfpP4n2UO1nNm144/T
         2sMPpfAkVi5RurYzoJq9cyOZhNGP9fImdTeTRxTvjtKTbw3ofsKOt/Ub0h8Gzhnt+U8U
         NFULgQ+CQ8h04PAZ4QP3ps0WsRLDOjvT2TKcBXPdOMgagLjWJEj3ZCV3XqOHWqUsdXsk
         amD21h2pTaUo5d9Ag1cRxnWuTrDSI45tCocKlwaY4rh3jdCG2MmMzBhCZzVF5mQP8Ez0
         VqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307216; x=1780912016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=InipLE+dsLOpks64QDOD6LvW0OrR2muxFI8gLw/DDLl/w4jJB1EBqmezwDIWogX6GM
         M3idebYfKFyXfubcG0fOl0RIQMxdZYWOlyofqmDGBG3vYmy+vZKkMgb54BlqCBUoUQ/Y
         cl6mYm6suhwD0eG3z7GAVjhx6QDvYU96PTsrehRGKbFJDIMmTH+92bEh6u1v43UWz/o9
         foImZmOlzW5t2svZ0TccoRD4Lwupe0Vu20lHnIzeeREQ+2ccorOU0NnF8Di/YCOM8fCU
         JcwwbovkFJeIQVz5fFK+DkATj9IT31Y5PmwN05lPq0CyVut43pWnULlMRwrMihwdrjfl
         OjgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qyQ5jaqYJLVBeUJbF+PgD6C5UyS5FfwtEX6PxvATSgWYD5xvyqSJOuzHJ/DhtAVtdEVPBbIQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsHYll3K7ynP3bRTlPqgeMwxvfq8xSiuOp6LKcnLajKJToXBlR
	6axijPn9R2+6eyAmtoibG53CtuwyrBFGSk4k+88K+maV+U2Dyth47mtvWcRBLWYRh3CaCyeTbpy
	jDkLgdiKRfMinEO7DLOrQ5wpPvWLfq5usEQaJDfernqomKgb67F0MAyKDcDgC1uCF
X-Gm-Gg: Acq92OHuGV0pwJ2izRvMrLms4cVC8tFTQMrsVtRkqg4hg1C2Iy9t7fFT4Rax0Q6D+HA
	4NkSMiuqFVCmPG664n6ZLDOb0JxeeySz8jf6MeFNlKDmPwAfLW7dPLErQRdQXTFH6NSARS2Hbpy
	/zfbyvG2N8zv5jCnqJqrCSfw+JcfNMf1i2nn+D4ZvwN9/DdP7Td3KrxgcWQ7aJfzDNOlZ9Ueam0
	Ml/ag6PQRi+dX/uLIZmU+0AdtOVOZk89wepNOK0Ulqdm3gFFnaJGNum9UTAZRbYsrZrJKfAiHIp
	QA95Iw8h9aIHeafwXhJGrjIKDrDNC4hYPfZ/J5dhKceNakH1dxFnI04gmyQ/0u23CSZonoy9uc2
	PBaTmDxxhamFVqimOeW2BjofclswXgEPGONqvUpzRtUEJaIxAlyKF9V/x/DXpOhsvIO6nmGC+Jd
	RoMXSrkBDKvZm4z1Rn2fOGQQwtX+i+9Zx/Cwlbp+KniTFoMA==
X-Received: by 2002:a05:622a:8d09:b0:516:d678:5337 with SMTP id d75a77b69052e-5173a821e2bmr134236701cf.28.1780307216128;
        Mon, 01 Jun 2026 02:46:56 -0700 (PDT)
X-Received: by 2002:a05:622a:8d09:b0:516:d678:5337 with SMTP id d75a77b69052e-5173a821e2bmr134236281cf.28.1780307215680;
        Mon, 01 Jun 2026 02:46:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:46:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:49 +0300
Subject: [PATCH 1/7] PCI: qcom: fix parsing of PERST# in the legacy case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-1-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h4yLRvqGyQTl6OR0GngMd/YRroUj4EhJo0XPHba7d0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVUKNC5BVKIlAxG4zUjN1XbSLdxsoCvWpGVK0
 0z1FLVXEJSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCgAKCRCLPIo+Aiko
 1W2gB/9Lau9+SFtTwoD1zoNdYwiTI7GJ0lR+ax0a5pUBEy7TmQ0zNhZbFGW7c9a4fX+LSd+hFwh
 8CQaB+kBl00XV7DyiCrsIx+EEJCh+n5cAepVIzn5Bm04TGrvR23SQfvZMtM61bSLX8Vi6LRO2Nd
 pnTfPqkPaeTKKJgXg3niJAfs42itlwqbsRppDov4fZBOuV//WQ4Dx+YJlORsNBNZVgo0aeOB7U2
 hpmAgna2xqgW15xKGR1B6dJpRFQI8fbO9Ptccp15mmy8Ymgyb823NdcqqCaFPx+zM0XYUrJRPvi
 TFwJfZyqnkXRSiofCiNz4Ho3rsc6VC/Ysc0ymEXwjTgxuwmR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d5511 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_p6hzaB3oH8elZwPmwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX4n29BprGawnl
 Tb2ZwEVIA6zDBPwaqpIDGTwGWYXQ8ZiTxN/CQiUTmgy0ZWYOneDWJeCwkBvqzMFZpd9Nujtb3+c
 obSFEPeuA0TK61P7uF3+sFkTWu6kcv/7Vcajaf4tcVXJrel/jWScC8wmF0Q2QZ8LFU/ionzLklE
 75wqg9vU0V23c2Z1qZHj8LNsCu7qjgvSa7sxkXf0aTgTtkSwhsezg7CwOjwt0Fc2ConFs8RcBrP
 BchMaw8tDBC5N6sse77F1if1bfouxh1P2A7BeHn+noP1ntK1KHbRvYrFpf4nZ7ZQXodye+qCfWo
 7Erl3cSik8I+CLNNilpMKJCbkQl3427Qqsy/PtFc8yETeXlLE+UT+ZbOBwgUDQPAfGAd+sAHABw
 Pacahai8thMzGW3uWAd4y2wB+iRCxM3Z7X6WAPgJcB3wldigBvh0KLamXYFxQccXZGE6FLBLhjb
 D5xGrrVvKjSjtNzN30w==
X-Proofpoint-GUID: -peT5FeT9ISwxh9DLfxAQ3gKHuETaN0s
X-Proofpoint-ORIG-GUID: -peT5FeT9ISwxh9DLfxAQ3gKHuETaN0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_024657_801167_8FD28329 
X-CRM114-Status: GOOD (  17.55  )
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

Commit deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT
configuration") fixed support for the "mixed" platforms which declare
PERST# pin the RC node and the PHY in the RP node, however it also broke
support for a majority of existing platforms, which declare both PERST#
and PHY in the RC node, because now PERST# is first acquired in
qcom_pcie_parse_ports(), which then returns -ENODEV (as there are no
PHYs in the RP nodes). Later qcom_pcie_parse_legacy_binding() tries to
acquire the PERST# GPIO again and fails with -EBUSY (as the GPIO has
already been requested).

Move parsing of RC's perst-gpios to qcom_pcie_probe(), making it obvious
that it's shared for both cases and skip parsing it in both functions.

Fixes: deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT configuration")
Closes: https://lore.kernel.org/r/gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 11fc60489892..7664c7c28c0e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1907,15 +1907,6 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	int ret = -ENODEV;
 
-	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
-		pcie->reset = devm_gpiod_get_optional(dev, "perst",
-						      GPIOD_OUT_HIGH);
-		if (IS_ERR(pcie->reset))
-			return PTR_ERR(pcie->reset);
-
-		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
-	}
-
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		if (!of_node_is_type(of_port, "pci"))
 			continue;
@@ -1942,7 +1933,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	struct qcom_pcie_perst *perst;
 	struct qcom_pcie_port *port;
-	struct gpio_desc *reset;
 	struct phy *phy;
 	int ret;
 
@@ -1950,10 +1940,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
-	if (IS_ERR(reset))
-		return PTR_ERR(reset);
-
 	ret = phy_init(phy);
 	if (ret)
 		return ret;
@@ -1970,7 +1956,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	INIT_LIST_HEAD(&port->list);
 	list_add_tail(&port->list, &pcie->ports);
 
-	perst->desc = reset;
+	perst->desc = pcie->reset;
 	INIT_LIST_HEAD(&port->perst);
 	INIT_LIST_HEAD(&perst->list);
 	list_add_tail(&perst->list, &port->perst);
@@ -2107,6 +2093,15 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
+	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
+		pcie->reset = devm_gpiod_get_optional(dev, "perst",
+						      GPIOD_OUT_HIGH);
+		if (IS_ERR(pcie->reset))
+			return PTR_ERR(pcie->reset);
+
+		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be updated!\n");
+	}
+
 	ret = qcom_pcie_parse_ports(pcie);
 	if (ret) {
 		if (ret != -ENODEV) {

-- 
2.47.3


