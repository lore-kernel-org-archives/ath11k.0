Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7F8CD8CA6
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgUdrGoPw1Xu5Xr22jy0zL7ZwrcPwooNwDkwBB5G3IA=; b=w79ZVh9g9sBtoA5WCZtzcAGFVO
	ni253JcBVp9zhnt4MCDci4bc/fR3PXX9+/pEW1u8hos7WkSkLm0CSWgbFGDcFBtTJMT7DfhkXej/C
	JBSB+1Oc3BqlaKgznNC6zfrYNOf2NqwFX26rWmWubXtt6wc8Pq3auyZX23j8lyCIsyMRc0QwQTyN1
	2p7Rz0PX2g5z1iJPgHM5rxcF4OzD2hQPDst+nQatJXFVbpwJ2VVelqjkDewUAqbFsdVG83by1V1Xh
	9HWFVCIttiLW8zDvWkh9IlgDI31t5HpXGp+ySYci+j7pwg+u43FDO3us06d1nKXe20R8D1L4s9+rt
	iqV37Ijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxR-00000002vQe-1Adc;
	Mon, 08 Jun 2026 06:59:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxO-00000002vOD-391Y
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuPL2832965
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgUdrGoPw1Xu5Xr22jy0zL7ZwrcPwooNwDkwBB5G3IA=; b=MqAPwC2n2YBcrbGm
	B+wd/oLBLJa/2HJwNMtlj7vA7IdNp4IYBb2zBciTbmB/SypTYS6NK7pOe2OL+4C0
	6uLOrt1ypo0meMttsKaHEr3xzT+JqgD90WTTJBkHZ2Fk+GDRcR6Zxy/jLBbWgvlp
	h3amdyAUUppkopfpu9wY7mNmcoi98+nNJgM5Wmr1dNF3yWBAp8hbUrPsZyjzoc7B
	0b/0psSBMxKNeKIs3XbKiFZqcfF5IHULn5Q2BiepcInIgvji8nZiFr2/74H4PwV8
	c4QIr+6mT43zOHTSZbgmOerL7L0BoUfmn/fb9Nzly0m/yiPi5dwGexHIGHMsXoy/
	CjXZOQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmree9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:33 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a10923f7d7so7339571e0c.0
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901973; x=1781506773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgUdrGoPw1Xu5Xr22jy0zL7ZwrcPwooNwDkwBB5G3IA=;
        b=LZu8Za2SsyfJvn/PvyxVZJ/rmNZtI1DOSBwmNdkcNVOEaQQ3EvCYQKIopur8d3ZOAO
         YgSPPrm62gnCX5/w+C8o9e4NV3/kDapTgj42mnUWgNHkjk8RBT9F9L0LP29AnbkC7mT1
         85Ja6rYk6znKdDSEsr5ysguv2tQIK18Z6nvriAzz1OFBCzzz/Z8apHkT37bYMcT6lMFr
         4dknQIEnPVj2aMATiT94tjANraURmipw44O+86I73zpQNrWVCqVgRRMXJv8ZEoB3D7go
         Nkdbrd6ZcAX9kqSg8vTOvOpLCNeF8qIlgakXIPwhmT9iRt8BNnJZMWiX8PCSWpeJlQbS
         LMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901973; x=1781506773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgUdrGoPw1Xu5Xr22jy0zL7ZwrcPwooNwDkwBB5G3IA=;
        b=N/53DxwCqcPmCoxtEGcRpPPPjGQBf1Pi9D5hmuYK6Ffro4m1LBykw0ltGwSEJhksRB
         +nMnBxxmZZYc2LIR5RFw/DjxQI9tfW1BKpV7BV7l40f86gYQ021PWy+7YliGhrqEgt/v
         xVrf/EBfCQ1GGKQ3SCl4SKhsPN0MlTaxEaxtHgg9YxIBJAAkaIt6BOEFqS4Ae7bGGoix
         a7bCGKHO6/erPw/YulDsMlCXuCst0KKTxvSECe9q+8dXvYhmK035V1KKCt5teHoCmzS4
         Bq+On0ikpDYJ/1zGCx9e+3BT/c63Xy4n0tRX2wfYSOPx9d7G2W9Caex4Km6TQSkY1xK/
         zPUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BTvlFGFcEb70PMx/zmbIP8pT02zjJH3iqmtjvSGn5e+4zWE73WrQMyVdgRvSxEBTzCNrhDN8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqW1IUjnwEDgICvYCDChrds6rUcV8C/jw/AdBtbTYajAtTzecG
	Zj+q5OCR1XWb9ws0DIkvpB7sl/x/q1OzTR1VopzxY32ZNeeVAeKucSeY4qGALk73v/iWgntLpU8
	NaXi5x8x92HlUfdrkIH/HjBn/Ht/xbDUN/dDg+K0uEEgkSy7x/SleKUlmC1eTCAyh
X-Gm-Gg: Acq92OF3jRuETq1b2VrLq2TFG8Z/kLceB7kUqQ4fn9ju5mC+yQr+hrFtrAb4PAGl+Im
	ssy+fYIDanPzB9FfDbCEpcFWsV23kANsGAUxvEnhN0cDrDz0ZqDPojYNMSBcP1sIyb4qncCkjqV
	eNcvU61mzmD2V3XAvV0yuHiHEgzIRs2rLazfW3CqD1/FGICxFNsWJNL8Za5xbcQP7iViaZJzE2i
	UX1MdVzeTLCIj51wPgR8jxNKzsgENbkmN2MjkRNH9UgHSPBjcRBTa/58/8P3YjQ1Mc8rZuWij/t
	CDVV1+J6GQimofkZ7zoRWLblTrztnYQLtqQruzy8DsGYDo8Tg9Rx76OYhp/Ui7ES3zAl58F6NEk
	lM7RPAlz9TZuZMVG/OWJn1MuGE2VYq5CstIXpRSkIJHB/j3sAOI4cysKXgxutLIl9T8lKaquWru
	R3vO7IgHeB7ch2ELOJ1xwr7J9whLgYbz/X4uPvFWO4Jh45UA==
X-Received: by 2002:a05:6102:ca:b0:6d7:a2b4:bedd with SMTP id ada2fe7eead31-7002b70dd8cmr3085532137.5.1780901973225;
        Sun, 07 Jun 2026 23:59:33 -0700 (PDT)
X-Received: by 2002:a05:6102:ca:b0:6d7:a2b4:bedd with SMTP id ada2fe7eead31-7002b70dd8cmr3085506137.5.1780901972854;
        Sun, 07 Jun 2026 23:59:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:21 +0300
Subject: [PATCH v2 3/7] regulator: dt-bindings: qcom,qca6390-pmu: document
 WCN6851
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-3-efb68f1ff04c@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5nG1I+R9Y1uL6wRIFYf8yLD8UQdyGGQWO5A9cA0m00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhKC14cVjpzCIkVBne864oziewquNLDoUL52
 fYhWlSQOJaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSgAKCRCLPIo+Aiko
 1R0BB/9Y2mbz86gfOC9j2ZzYs8DhUI7Azoa8HkqS9yVCuC2ehrxEDHOwDXGIv3y2pjQit3dbAT1
 zTmRFLTkCh+GjwD2lPp4ARpJjOBCWapE7XfV7mab3lIcJzngU98Vn1P+rMRNTMheLk7BdHT1HdY
 +gCN1eOka+f3US0A1wlcHC0lU1pcIblMkkPyrYGmTVvKSlmTJPsyCjY7hN6B7vwOp6faOBcVP1q
 NHZNhc8e582lJFFdpAjrr0lIG0GRq6doXbo7yYW/37sSf4+KpdxHzkIYvtzAagFLeIG1XZ1sNS5
 Stk7EEhBUxMpVaERvPk3CP26ctrSxLZ6pbsUa3VRMt3StEUW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX9KEfVwD8u2xy
 Ct3phOtly2bx+Eg7Zc9e05Kg/7VinyaQoHqfj79fab4FwMUYa1/auLdnbPs+KIJVlXt0OzFd7pJ
 5Y8FI3f0EQPfRxsoGfTEEYV0rVLIo5LulcBkZcWihtY8CGvuSE+b4Y+ADxvnEu+LpQocO3V+i9k
 G360bbAnCLeBvTif7q8dnG0gJ2MAvy7w4wIC0oXbkjCaftG6IelhZtGewdHd5c5XKzYsi6oTO5G
 sOz+C+8/4VKuZu9GKCzEDt2FqNXxu9xqaazkBOHKV+EuJmAQ910gx//VszP+2Zh1LNS4JQwQykN
 vBXwdjuhAoZqslzM7vRKKBYXsXM+mdB5Mw6wLDOCWiV9K10LznWsTk2ebFsMbrBdVeDAR0niFH3
 p+mqRm2mEzAFQDOe1tzMPLs+xFJTB0BMxGKmjNIwlP2sTYRkv+h2oBoibwdg1X9Vkeohn3xjMGz
 CqlbOnQ030oYUisCzfw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a266855 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_jZoHPq4qSgluh34qd0A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: cTwOonEi3VzPYIsdNW2kJfOJdL01_qHO
X-Proofpoint-ORIG-GUID: cTwOonEi3VzPYIsdNW2kJfOJdL01_qHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235934_915587_9B65BFAF 
X-CRM114-Status: GOOD (  10.89  )
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

WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
it. Add a device-specific compat string with the fallback to WCN6855
one.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 105174df7df2..3d3c6fa7ecbc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -21,6 +21,10 @@ properties:
           - enum:
               - qcom,wcn6755-pmu
           - const: qcom,wcn6750-pmu
+      - items:
+          - enum:
+              - qcom,wcn6851-pmu
+          - const: qcom,wcn6855-pmu
 
       - enum:
           - qcom,qca6390-pmu

-- 
2.47.3


