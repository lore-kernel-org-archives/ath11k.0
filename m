Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625CCCD6E60
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDyyuyKqHdudCgNoWARWqTpLRahQhURVWMq0HVDCdFY=; b=y0hbAQZVjOiA4GJCuku8H5bjwC
	ue+Nqjd1ElUlzY63Kr6Qzt9/zLDF16xc1Uol9N+jCr9H3ULSKuHuRqkLnX93fA94dSk+ZM0ZJM3ex
	ZB5rxpMiCelFNNvYi/Dmuj3AJntGMgVMD1yqHL9FjZZS7urn5aU93bRQxm5cp73PclgiTeEIhEDSI
	dQYVmj+R5/i/WpLUcAtUROnDYSem+ydkqcHNH8LPn5CKa0Q77ZjrozluTq1yAYwngT3TY7yz8kRch
	pqjb2hyglcuK9OAA4p0TxwR9wiWD6A/6NwzveKJJotfjdvmqnJKM5rf0bigi7WHApqxEq+mQMWr6m
	ijcfpbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEl-0000000AWCQ-2oaB;
	Mon, 01 Jun 2026 09:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEk-0000000AWAZ-0WLV
	for ath11k@bombadil.infradead.org;
	Mon, 01 Jun 2026 09:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kDyyuyKqHdudCgNoWARWqTpLRahQhURVWMq0HVDCdFY=; b=EVFsN/AEH8sqyzpSDFIFmScxS2
	tvPpFXUY1rV4/B0GXu0hG7Mkci086mv4vPkJ48puerFJi5mMrj7rcOGW3PXypOiAgghTn2e/hsFVv
	V2/ptuEqI+BwEEX4jJLNanltZoz2F2BozFgeV86+kD/5ySO4yzIwHhDReS0eeFUV2ZRsrRt2nLnFK
	1zZIx4Gm1t7nL/Lk3Anq8a4j8gXoXDfOs3fvh2o9K4LL8HvXxlXMf8EA3tYFLGxjJjf0noeneScF+
	fDKh6aVCbVcR8X/6idXveDIS7olStdrYf+RgpefoWWaEVgkXHgjSNQPn3LkSzq51xT1Hi8TLdODfo
	0xmEFhDw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEg-00000006HHW-0NqD
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:47:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6517LQ4V3034776
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDyyuyKqHdudCgNoWARWqTpLRahQhURVWMq0HVDCdFY=; b=L4Lwew6BYmpAZpET
	uHq4mtGVCxQZUNjMnxV3CC4hzBtfhrmfd7igLZjjj0sidERPJ898KZaVPkAeu83f
	OxAZw/BKROk7Sj2YkW8Jts6KslZOTurqlZWSA5vqYrWjKkHS6SnXTzHYevzAMu3R
	qnNl3BS9aO79MHakyoXmfhz9hQtdwiCvldtNOZU1TB2z3tjofliUELawBCusx/bR
	n0ZjRKAVHXg06cWceKTJozqjeWY3AZLdJSqbYysjsxRKlBmj0udfC2JospiXICUM
	6PGjTCT50C5qGrghFHU4NyDkbarxyb76y8JFl+H4isQvysTcN1hUmb0nyvXpfQov
	D9IzSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuxyys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:47:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51736a08ce6so39046841cf.1
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307222; x=1780912022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDyyuyKqHdudCgNoWARWqTpLRahQhURVWMq0HVDCdFY=;
        b=H1gyjEWsNvUCRDeOmzUHOu3WvNRiUMkryMn3kXRJgkt3XqjRhOlIGcdBbbaA+lNFit
         7PtVLHrnQFF2sHEW/QVGHg99GyJ+VlMAJtW7zcY+zvh1d0H/Ej6K5j840vUx89Hp805w
         2mY6zJGsoDgL8BFP0fDopVMdYfOTirugAu8HU6N/lLUctOUOzLQYV8dVMccq0JuWlmAP
         l4Q6yWjHPPssZTPhD/3cvb3X+D0mJ7GxI7+Qv08HY7Y36/mBLlKv3r6zyf5HWtYYLqUT
         RfM6u8HLl07+Lcs9p1kj053WTnHhWweIetJMlk6C1t+Lx98YuOM3OKL+HohZwJ3lhAjH
         Mb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307222; x=1780912022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDyyuyKqHdudCgNoWARWqTpLRahQhURVWMq0HVDCdFY=;
        b=eOeUSflPGCfDCRMuwp6gPxk83VP0zJpFGjhOR6nMCGzAllGvZdSKvWS+OaPZWO75NE
         7qUz3SpZk/8VtT8bCQoqkoKm8mn+cztNr03TPEOVWDVzodHwIxwpxqduaqYJnU9MScw6
         KufA5uPGoXqebP+T6rEyndhYqkgsI7kurtHzHgy5NIB4BFa5mLrzRZUx67rgd2MZG2d+
         kWbotsS+QnIopMWUj53XSq/uuep1VDiic4bADsBzFuAsjr3PJxQkIdMQM/isvx3ZqVEq
         GsBY+cjboKamfhAYGV9ig149lE8KHmyIa1Hd71VQLFAS/x9nBe14O5o1Y5AaFB5p6K0v
         YV6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9VPFg3ZtLKXuYNYjMWq2/lDG9w0xKwBxAwfoNa2NHXsCYyjkhEN+YGX54Nw+cWywntFh3swWs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrWhY5dCY/nljUipiM3rdrwRWA8CQb6rF6W9aNmHAs+HLj/M6l
	9cmgf3HA/HWZYNOYrO0MhimuDNBMu5oBMpeM8nw/zGkxeZRB1EB2c1JghOTgngz4/Avp1cFivf4
	M/ce3cktA95hK5GkRaOmAwQD0qUssxWuwmaQBKoEB6dfYJZqJ7nyT99aSNWHgm1Yy
X-Gm-Gg: Acq92OEaxTPmYDHUcsjL/lB8rFId3li4k9dodgg0boyOKhsD32HA88qXzoeWlXdIfzb
	mRYRGNea1uhuKxQ4GnpE0X04LGM/IG/5cwFd+Jh63o+SfDGN/0iyb2LQo2TUxwloqo4F/iSfuAX
	Gl4GMs5Biig6LVU6TBlZYV0kxD4kOAaY3ryQnpi8mypI/V8nciRkrr5tUwnHn0dT2lXA8cziT3h
	bOSbYMKR5bRa3GmvGTmQ3sPiAWx/Pqjljasgwwsdfphc3Gobo6NCCU3vfR2cRr92RKlTEUOWBqa
	Gkwm+0PW/3f+IgzkR5eWHTIzP2icP6UVzByBYAqhrpt2eJ+l+/0flOWB3YDzCHum/rXD8xOxq0e
	yzV9F0TMVYZffRZmZYH95It1BiVRmETXtwrRhTiROy5bCy63Bfi3A31fAmAf0hQ8WJd5ZR06GVj
	BKdKBscKjKs0GGv6JbeOrj8uiAjpixmorQlF1GPrvTRoI/aQ==
X-Received: by 2002:a05:622a:1dc4:b0:517:5e1e:f8b9 with SMTP id d75a77b69052e-5175e1efa52mr8691851cf.28.1780307221806;
        Mon, 01 Jun 2026 02:47:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc4:b0:517:5e1e:f8b9 with SMTP id d75a77b69052e-5175e1efa52mr8691441cf.28.1780307221405;
        Mon, 01 Jun 2026 02:47:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:52 +0300
Subject: [PATCH 4/7] dt-bindings: bluetooth: qcom,wcn6855-bt: document
 WCN6851
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-4-242917d88031@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJL7aaDGxCG7o8iXjt5pBDebjiba9LJ5/Sp6HGBrv0I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVUKFzA2GWzfnPbRBNnS53Q+2DwhhafI85JAG
 lkifT4EHP6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCgAKCRCLPIo+Aiko
 1TRLCACzFCWDg8vta0kl/Q/xGa4mRMzH/xV5T9QwD5QgcFB6m/mbqBfpwArl2qrB7+QImIHy6ky
 RJo19vvWTsrpy/+sirk4YeZAQUWPh8VcZDHbHc8Pb5eps096styxqBgKh7bLK4YqBw17Tb26H9A
 XP9BNsdX91u6ESQLUeMCDyrtrzNRZqu9EvZ4w3jaYtrn/egKh8Kqe1NcaJUgWwsXxKZlWuCV46A
 K5OOz2knudfmQxcsf94iP4X21eov3JvZadH1H/Sq190qQO/nxHoxk9XIn+VPnVEBM8AExGcP5LH
 c7Jp1/RdMTRgcnzWPbINBFsPk6VDwXdh+4KRhhs10LRk+rhh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfXxYjVMgrxRMLx
 a2DRywyaB87bDo6FVaXk7uiRnQDx2QOZdi88jf859YzcONEN3udQrYiyizF48z72rMm9A+yJJnC
 GXz0fzVjiDRGXnmo7e4swN9/MHs8n9TRPYI8oXWtSS+Zlo7VkKir5uohBalFo+61Ha3RzRAC62J
 DojJ4ohFrPeoX+Z7iExJRg1fbXjgS1kbKifbGxKJloekbLMG8ohK/P0At6RXV5UnN4LOt1Qu0jc
 DqhHnVLNamZ4CvMyfUEFCYiD8eS8IKeioaxdwKcTCTGGkG/yUJme1vF94SHc8oUKvNp5wqx2/Nd
 30qWA9Toaz984zfNHBtVWLzJn9z274YQ3XhYOoRw9kuWiyctvUwVMEnguuo2caBkEyj5XqyefNT
 zy6wl7NzOii/R/WcjJ4n3rcYUsStE3lf0BQomwqoL11mnqUIu4hmerK49yUDnU11FmWQbIb+ubL
 fmQLoX42TrcXwng/AEQ==
X-Proofpoint-ORIG-GUID: bPPJUeMA4OUkG3O6WvzM1A1Bt3G4Yhh7
X-Proofpoint-GUID: bPPJUeMA4OUkG3O6WvzM1A1Bt3G4Yhh7
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1d5516 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=CPtQq55eJxPKLu9fJ8AA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_104706_791836_0C633BEC 
X-CRM114-Status: GOOD (  12.08  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index 0beda26ae8bb..ec766f40a042 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -13,8 +13,12 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,wcn6855-bt
+    oneOf:
+      - items:
+          - const: qcom,wcn6851-bt
+          - const: qcom,wcn6855-bt
+      - enum:
+          - qcom,wcn6855-bt
 
   enable-gpios:
     maxItems: 1

-- 
2.47.3


