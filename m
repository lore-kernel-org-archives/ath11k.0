Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE752FF8862
	for <ath11k@archiver.kernel.org>; Mon, 27 Apr 2026 07:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AOCdBsfFvhzm82Y7HwVDgjJ5b3lEg+pk3korNa2Gw/4=; b=cYSDM6/Z8MMP4EQG0XMn/ZD2TM
	nTB2S9KbktFRur8dYkvDiezNhZMwmOdPTu6618u3P10Ey9S2oTMHS+PyqnMsG0dSoJDuMgWTyucDC
	0hfwwmpITvSZBq6UoJS4m/EQNNMwWjOIny8ym+iFktjUC3jThk8M+9Rg7j0ICKDIX0vozUwbWR07i
	VJkb/2V1X3guPWMWcB8rXxRY5mE583JyneiuES3PGHZMTd+xe8sQxXDPmWtFDlEVErZt1FPqlpzZ4
	82aDD6WqstNOGRwy+LUBuSuXJhCV51VJIqwVA4CvzLW8iBVSe1Sw4NIXpVoJ5DqTazXFxTkt9aswm
	wes/X6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFxc-0000000GK1z-1Hmi;
	Mon, 27 Apr 2026 07:00:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFxW-0000000GK0Y-2gjy
	for ath11k@lists.infradead.org;
	Mon, 27 Apr 2026 07:00:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R64ZSe2583841
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 07:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AOCdBsfFvhzm82Y7HwVDgjJ5b3lEg+pk3ko
	rNa2Gw/4=; b=JnhWHvPhrWxthpIILyoPN64gvPMxZ5hgdDCLq7lXrcJDeyj3ZSt
	fH8Wl+ITSXPd63GIrGJBlgicLYa2CEGPryZBU+dHSiOEDxxXrZIh9X1uTHhNjz2s
	dBdN4dZS5xSNamCMSfSG/HNgcIPa0qoPR6Qjir9FefgqWPz3ulcGCCw3h0Xv9eM6
	hah1XSq4jcTRIQ7Z9vuUdNUqcqJ4qBakkZQegzjgDROz6BhuKKz5BOZlnYYfJkVq
	2QpyDHXleAFPEz+gUyKu9RGpkAFb+vLYUhszlEUR4d0VN+2PVGWHZfRHHDto6xsP
	hHkm4LlDFVFbBF8btAWjfoCJAfLitg5nLtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xg6gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 07:00:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fae95c82cso172739121cf.2
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273245; x=1777878045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOCdBsfFvhzm82Y7HwVDgjJ5b3lEg+pk3korNa2Gw/4=;
        b=iW14XqNclItPSThlyvH9gDU1ZeI7w3QZszUC0l8rpcZNMyeUEzvwkhgU3zDl3UB29J
         4dUqewlJyKPg5bygSh3LzgdrbQ+06ynFyssAZP5DuQC224dVQlSeJztQvF1y/kjbDycg
         IMFXsojjGtOBnIVatHZ/Op5OlqIB7Apc/3owCo8PXx2Xiai13B2RHuQZPhoN+yAq8zq6
         xodE9ivObyBbWvQVeertsE2mQApz7t7t8XIXdJ/W6XGeR/Kl4ocgaVbuDoffiN6PflHD
         BbIBc7uEdI0SDE24ufKzmnpJnwpW1sfdmIdSgC9r0vRD6Zoasb93vvWPMbGXwwtQ/Wvc
         O1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273245; x=1777878045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOCdBsfFvhzm82Y7HwVDgjJ5b3lEg+pk3korNa2Gw/4=;
        b=oH5BNMaVO2sz+Fgv1oV8FhnEQfQa5h3rFi+73CAObqPfE+B0LjPXplvQUTOJrVKqN7
         OMmiE8m4IvGjRt/VCCfgNPn68rEa3j0oyCwt9IcrAELAwtqeE3EkE2BZwWWbcGNlSS9a
         WtHGb/z3TbFvm4BUpo/w8geKbZjhMmVED5R7EH1KQY6PkT7Uoel6rpWcBJMwgNrRXBCk
         iWCXRdwV39qcS7feKsdbhpZtwd4HGeKPFe6lhlpkFFhG5P21BXjq9Hcy0FJK/qiwYIlr
         oVdHPaoYfv97f99T0XTowhQOOSPgPWIHxbl5eWxobvlxhQBz/jGzQUv33ZgWd2JqVEfS
         b0VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6eem6OnY83lcYQEV0dyTqeDXIj9xlimmomuk4fZyEIKCSugEHIKpHZ50LQoGVoqfNDpyOhoc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLA4Yn9SzaPu9i9uP6smzpsmGW6PBeQc4ADLZhkRysywZyFJZA
	pexYZTVM1OnsTtVz/o2XIjRlNcR0AqfrKYvX/e9ti3gmiPUnDpAmge77WrAWLvy8kcOlKguv3j4
	HF60P9+aaaTosA9mYtYwdm+8wkMLMGfI1sgQK1LrYaIx6/6LOpTMzeL0sHbPMmHGt
X-Gm-Gg: AeBDietzZtVOhBxvHq8TEfKH0+VQcUwH7Q5ZgxI7MFGx80ekYqNZgoOp0+cWPST0nFr
	PXZ+34StM7uONwnNHF55mVm1XReT6KJQOYix+sPrtEWSYk5u+tRgkBCJTZmzGZmMrVuq0GW5ezS
	+yL9ugDUC57LVFjEt3ujgdTYJb7Dh+JmUQZXq5ma7+pXnm4Kp0xw0ymsMym5++rVblhF3l3ceFD
	/iYNopWqBUaDKP+V90S6ZiqT1zpCHlJC1/ECvhRRTqSbpXc+kC2LI53uya9R2UZMtxTJKZ2Kt6f
	6E5A43Ezej++2Vwq0e8A17mfTVM3a7IX2LwPL/KCZOrWSZVNwstCDe+EtM6xuZPDcztXDdhT2h6
	9Va+BI3RFvD3db/NgBXxOgFeu0tN0R+bK5hs7Vxkl3tLYXvt9wNTLgw/XCbCGRrcTKZS7Qn7RCW
	5Mzrw2q7XZ3w==
X-Received: by 2002:a05:622a:4ac7:b0:50e:60b8:347e with SMTP id d75a77b69052e-50e60b836f6mr480760611cf.59.1777273244644;
        Mon, 27 Apr 2026 00:00:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4ac7:b0:50e:60b8:347e with SMTP id d75a77b69052e-50e60b836f6mr480759731cf.59.1777273244019;
        Mon, 27 Apr 2026 00:00:44 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489207ebd3asm265836175e9.6.2026.04.27.00.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:00:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] wifi: ath: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:00:41 +0200
Message-ID: <20260427070040.17928-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=781JDeG6Lz8AMiStfmG+9+hEpa+W1cDMNN2KksNJZL8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmYIlWEmGon/ehJbKFgm/iqgZwK5llIoV4h2
 SjcczTCT5eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JmAAKCRDBN2bmhouD
 1/mmD/wLsNSth6ayXMU5ThL/PVny9qMuzbLALU+OlaCD4IGolE8i+MBzeR0fZzOFSqkCWwmwBmw
 af11vr1NYYnkgUvA2LC0euYT0Dbzmnw95ADCadS6UCmCcBir/6WyykfTqf77AEFrIeJ/bSp2xWD
 EKjr55sqGDykyyxQ79ciSa/nqiTkWdXPK2dSIhYHDO8Jjx7N4eWBpHnTWoTEhuVg5X0Q8nB8PCS
 97Q5f/Yqel023+WJg6WVA/1UpgMspty2PZHyvVkOgUHDeSKXxmYmA2+0JivsiAXpwhzzMvrLtnn
 s3rokyjUYLFmjdI1yTTGjxWQ38PVR2T/mEW5VKoFpW+edkxRb4FDElr/GtF62rPNXFRFNPNvlL3
 9IjhPJtnjld6PmaWfxNGnJYdld0K3DbvPkJxRDDCmDQrzURRrmuImrEkuPAVLzV4NUGe3uz7TBW
 TdbbbAt7M2RIcSVv1TGH00GyZzSS0bZO1ahRERs0ZrrC9yZ9vjW6kwGnQLTuMDPFnReUw4PZ2m1
 ptbzOnJj1zKhXv5oJZzoN437RN9rxBNxAjiiQArOc8FO03TO7XQVR4QYBnYQ/5I480/CQ5Am+Ne
 5iYg4X3uWOG7vDrjIaGenOA8vpUY0TyCkp1DR1nmj6PshulRFTitM9qqd6NASpuPm5A7t/e9wMn UI6vqhrUWybBFYg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AOMqsr8Mf7tosbABR5YiveThBT0eHdBT
X-Proofpoint-ORIG-GUID: AOMqsr8Mf7tosbABR5YiveThBT0eHdBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX/cuRqXhTB636
 qgBiDw2c6J0JZkSzI+D9dCA0g4WA92U06WEmkYZM/NrdKqAA+2BgXFgYe4n2kByaJCCifzy6eE+
 3jhOZ1nvIFRWmaP1lFbHN4jHe6X1/ijqoxNP0fqWdIO6V3QKQFOlybzEt0RX66N6TJcA7m/vMEK
 cHilV+kU1GGuoi11TGb5iJIdDZVIKC+zeoKLweMWrp49d8n2B6dMhqRSlevsXi0uEobodgrZZeq
 fbD+Yx1SfPKk4iPKzzuIIPffXPdqjNqHLB4Lt0h6DyoWNaHw6TfAjzvFWcQ88sUJV+un6ZCTP+y
 vJaVGzHHGFFiZBcZxUuuV3u3UknOQjo0Folujn+dYWZhYzylRBdB3OCUHnkh1+jCw56oJvboxn7
 ShugxxSz3CgNXJ3fD6tW417Thpi0bMVTuv4Pr4cwos8MlKtM/pTSOgmPjnbtOimnmC73iiv2Fbj
 lmEkScMQtftuuyz4naw==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef099d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PHCmJKGvDbSP9W6LhaoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_000046_797158_D952034D 
X-CRM114-Status: GOOD (  12.40  )
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

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/net/wireless/ath/ath11k/Kconfig | 2 +-
 drivers/net/wireless/ath/ath12k/Kconfig | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 385513cfdc30..122726f84492 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 config ATH11K
-	tristate "Qualcomm Technologies 802.11ax chipset support"
+	tristate "Qualcomm 802.11ax chipset support"
 	depends on MAC80211 && HAS_DMA
 	select ATH_COMMON
 	select QCOM_QMI_HELPERS
diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
index d39c075758bd..4a2b240f967a 100644
--- a/drivers/net/wireless/ath/ath12k/Kconfig
+++ b/drivers/net/wireless/ath/ath12k/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 config ATH12K
-	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
+	tristate "Qualcomm Wi-Fi 7 support (ath12k)"
 	depends on MAC80211 && HAS_DMA && PCI
 	select QCOM_QMI_HELPERS
 	select MHI_BUS
@@ -15,7 +15,7 @@ config ATH12K
 	  If you choose to build a module, it'll be called ath12k.
 
 config ATH12K_AHB
-	bool "QTI ath12k AHB support"
+	bool "Qualcomm ath12k AHB support"
 	depends on ATH12K && REMOTEPROC
 	select QCOM_MDT_LOADER
 	select QCOM_SCM
@@ -33,7 +33,7 @@ config ATH12K_DEBUG
 	  you want optimal performance choose N.
 
 config ATH12K_DEBUGFS
-	bool "QTI ath12k debugfs support"
+	bool "Qualcomm ath12k debugfs support"
 	depends on ATH12K && MAC80211_DEBUGFS
 	help
 	  Enable ath12k debugfs support
-- 
2.51.0


