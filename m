Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C12CD8C8E
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=; b=QZMRF6pVrCQxtTDCJU7RJlPekr
	ahir3s11UMyqBRy57Ih8WPPlYKBzNVBB6wtWijO6/hGId1Vno63jPytOMpyXEvvBOqwKFLEViptZo
	FjRffP5p2fmHSBSzJo/XjQC1P5ffZZoH2vGrl7ANdD9HBqnu4owuQbC/YZ7F2kGwyKNpLMp1HHBjH
	5SPEYmjTFdfliK+ib/pHYV1qPUUAivC84BRFoc3zX5cboZxL4QL/2gUNf1UOgduDLN0Ypn5Etgpwa
	Rq2n3mIaVsFAMLDBVuO/5lpB8o/ZFO9k6V7Paf+VbnsbeuG6K5JIfcEUjd5WJJTSFKg9m1eazxHtu
	MzpOVyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxO-00000002vO8-0D9a;
	Mon, 08 Jun 2026 06:59:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxL-00000002vMe-1OsT
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PW1g2808320
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=; b=jmWamVzifzUA7OyK
	S4oIA1/vlZxiYhDV90onPQ0h2LcNIWYzMSNaUTfnLYHHGfFWxeK6agFN69na9bWR
	kjELk4NUA10ReeOKwXNAvaf7pqBHZEM2QNJM/f9LzxRY9I5CF5GbIvLFXd42RKej
	6gd39AaKkn3I5tIOT2eKqJfnHj/xb2tToLX0nN80Z3lNYSbMPJCLix+6b1d0LHSY
	4/ubfgizZJ/3gNqlgauLFrCDsylkF5nhyNem3lY18RbNv2kAEFpMsUbRIuNuqUN/
	sGK0DZWtA4lez1hsReBdarZ7cCmT8MQd8vRo0x1nu21BbyS7sPYaglofBwc0dy3M
	9P8+Hw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6e5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b744b61cso3914358241.1
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901969; x=1781506769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=MQwBZTE55cizDZVslAC70ddfhT28gHRyEHvq8xyn1vRPbAQRG4tcJLt+t6UPdhvbhs
         kfahezzJUyKhVpVjz0XDCi63IM0UVWznKs/J+No8jJsuZ27pmo7e6GY0qv8tAlrzK2Fv
         KeCp8hE3Ydlqfo6GtzsTeVIehXLeDiuXl8Hty57G19HSGG2jJ4QjC4vG1vEp1dM19yDR
         o0TjIupE7je+SixgTCz9W0ldx0FNSTnFEKb8Wh8ZQMTy5MEIjFROQOVtLeF1hMGdrr8s
         s+L0bM47UTd0DWVsSfe8D9w4yqCZPfVWXvbA+Oiqjp2EesBjmWNV7cYB6zLH9BTrVXO8
         bJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901969; x=1781506769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4dWomgyfsAxdHYGato4YCIl0rH04fg4NjCDPCL3Zf8=;
        b=A0qW4XZ3IWWn+KebzwDHCQFR19Oh986hz0HQOToMHfEl+G2jYDperiFCephAuKu+fe
         DbTlxLBmtGk+zrGJJ4ra8soZ7p1k2Uj5dt08i40iHRUF4xkojezPeTDrVno7/Pls8LmL
         AVTidaiHmJgxR/qvesKBOlWaixt8/e+CIqIhQb03c7Xe8QP2OAgtF55Y9JdP1JZudhWq
         cVJaI8/UpS951rerFAz/NXLrTziJT2SX8vDnJJCxQrxY22H6e3pzHPPQogaptQZ9tFMx
         1/zHhMYimpKnZIcvG7YWTF94Pu1mKqzWs9jCdOkfiZhzrDRrCWc7Pqd0ajJgwcchKBfu
         Bxvw==
X-Forwarded-Encrypted: i=1; AFNElJ+tbVwGzZo1MxJss+yKLTcLcWtirrkvb4v6LNrN+wW2sr5eOcVCSmT5lMlh+UEtttYwfyTtd2I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyB4f7zzAlZNgSdPx8pjW8EyhhSWreCnboIEbOiLEZuyJM8/Ezl
	3TfLKsSz2eQuaazD8K6MFMsWLJsX3havoLhZ1F5moZOiULRhYMdVznFq5naNPLVd2/B/jjmPLxp
	3KOzHviVBq7iS0dF+yoLfuqilYVH2rEsbOOkBNn2pi2bIRo8ASEHGETfwkg11d884
X-Gm-Gg: Acq92OHejqe+TsaBhHbUqMRLQAq1aj6N0FV+4SKqmoPhuh4Jz/cE13sWkuIULZBYmpk
	HCQ7ZE4rYnWHhiKKqtMbsbH8MAqb4nFQSRS22S9xavRfzBlOPBnjJ535sKCf3yKwf/AG1TRmbmq
	xPcHNeabwaKuVvPrplRaIVnk9Hh5MJBha1OaNfd8JMiSJ+cj93HGKRNMFG+H4B6Q+Mzw8FkMzWO
	SezXaRQEUAah7XAoEPsiQPhJUPdDv3qRtOcStUa/sAzUjvdF/cFl0pM+ZdWGnbWuVlJ8UdOdQDY
	BKLx79abxwYd9l+W8ufRuO6KxAyD9kXIi3GsZSPO8dLrjpLh3bjP8Sh6uEregJKcf+frsKD5k4e
	AQRh9g8Rg+0016Uszi1r7aKjU4O4jecEnHocjNdiN4j+Fdw+ZnjDDpWx6W3bXATWqBwSDUYXFLb
	BqMrP0DrLzv/hcgMscMl6RQqhsNLJotlpn+4kI5NoU7uFRKg==
X-Received: by 2002:a05:6102:6b0a:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-6ff09f907c7mr7172111137.23.1780901969466;
        Sun, 07 Jun 2026 23:59:29 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:633:1fbe:79c8 with SMTP id ada2fe7eead31-6ff09f907c7mr7172103137.23.1780901969023;
        Sun, 07 Jun 2026 23:59:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:19 +0300
Subject: [PATCH v2 1/7] PCI: qcom: fix parsing of PERST# in the legacy case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-1-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ZahpdkIc/m2AU14Tot6u730x8n+R6Ny+q0YatY9z5p0
 4SPgmydjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjIrDccDH1i8QtkmXQ2xZTW
 b1zltt7i/P81d0XO/4gTdw1jO/yv2Uo0IWb22yesSzpb/83cH7cxnOm6xv6KoCURiq+6AmQ36/S
 77q+1fONfHV9zeMKG647/DxsEB4evcv/7+0Bm789ttzXbM5a4zAzxP1eQtEfWS/Pm+m9TX2j2fW
 eOrzE/5/Tg50/m3sk7MiSy/0jcvuAY/ODdnxhT8e4ZPUeZVsgmyb+9/OiI/UuJ0CphjZwNM9zEZ
 0fVpL61rNm7/HSlRJJhZVvRffZ19dt/rN6ZMqnlg/Fjtb7jTzncP7ftlmlnnf7ZVdjd7PznrO/L
 fDzMej0lEl7+ycgTU/dn5OUIMZodpsfIOS9N1XB322FNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: M1Vw2pBJx-qAZcbWzUAs3LN0omk_Db_8
X-Proofpoint-GUID: M1Vw2pBJx-qAZcbWzUAs3LN0omk_Db_8
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a266852 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_p6hzaB3oH8elZwPmwA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX5XwxWO2xF2Sz
 aV7kKcIgqiDY5aI5bq3V1D/YLzZIgbN6ECt+GVBZzLVa92EjuotkWKkbtHEgDyERCNNsKpFtROC
 nPQf2sVhnH44JBuPoQJj5D8U1VAicWyTcUkmwfgIbNwHZ5uYzQJRlkfACxTrADTZioh0MWM6h4D
 LvX+QdmhGeiTG4QuW3dHqZjMjN6Avmq94OwymHiMxENBPDs9qvN7CVJ1P4ya/6ltikPAiD1rc59
 Ds5pDmvN53Q/7QiMc7PP/BaHpEtIvkITGP9IlVc/j16Bd4atyqUhspGBdju4yEnKjS8+f4ssDgv
 rDSu7p3ShNHGHYNikmNX//nUzlz8WMYIYAVRhTLWIrzbaANrUfUethd2OcCGqTBW8HYo5N+PaD0
 gkjliLiDnLGLPdfmFm+StlsHpvV4XXrm2jzJ/lHNij3F3YmNfgA31icDxz0pDj+a6FbQx61L1bF
 W7xSCM0EythvMM6mpqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235931_811383_AD51B659 
X-CRM114-Status: GOOD (  17.21  )
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


