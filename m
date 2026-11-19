Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FAD606A336
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ib2hrduJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRGivuQ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4EhHr9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=; b=Ib2hrduJMwe7as
	1QbM1f1xFe4ZNl57y7LcWgMXhcW52ARaH5v2rH+LCgdYkCDHJdy78gBPxVFtQhK/vbrZmJLg+534s
	kHHHlrF2CDj9jB6ZW2sCT6xRiihz3DXfXTSAi40gT+/e4b2fAI11Km+kS1HfPnEYtQZxo2PW7ibjv
	3LZY/Wvd5/ZVOHMyvmukZ+R+JatBXD1kWj/X7CuwnsWbZO8ovMys1vIO6y3cfIpwEqtZs1yl1Yf/j
	owb57QEG1v3k7VCNaZIDxwA8uEkdPSMOUXkTf3RhnKn0M5Tb/auBLfXEkJt4MRKXHpImFsPUlULOK
	RM0E6v8AcWUGPzP0cQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hT-0000000BwMc-2gZp;
	Thu, 19 Nov 2026 12:57:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1hR-0000000BwKM-2oLV
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 12:57:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJC0aia2250883
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=; b=ZRGivuQ1oWWQGCRi
	sCfEA/ppJkCsTOqCJL+s41gZI1kLSsJDxN9jfB8tC2tt3E+l2SBcZbDTRAQ2Nt5v
	ZOPtBlcVekwMteKFgFVUK/aHwbfkqAqOWSJq7J7uXF4eNAEaU6HXNM4pwrmBb46y
	o3lc1NqC2KrfxfSB5wILQ2xVlMZGwgnlzlphznYFAUi35fDj1icARv5quHfbj2cK
	Z8H8HbTsxJGGs6NVR8Evjyrb8lijApNynaAkgQxY4lkm2/R0B63ZOeg8wwXdfSnW
	0RqbJ2GYL2qrvF35pLsEyIjKx4Jf4CyUgfYNZO9JBSsjkQDHVrBFjAfDBk2EBOWs
	yfC7Gg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9kru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 12:57:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2699495eec.1
        for <ath11k@lists.infradead.org>; Thu, 19 Nov 2026 04:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093032; x=1795697832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=O4EhHr9lZbqv4h3xxrHGwJD4wZRhgjqMQUYvIECPbIu+rjIPOkAesDyUKbGEDx44HF
         8hxyJtKHNDq7ufSWoKteGY4VnO8EZTZ1MQ7sdkstzcl9rafJfAemiOtQIbdMxVo1pGiZ
         BL6bbGiWeEz7wRVWAxOlaGBGonjdCyRgeeudSVrU4w1YC6wWQDwBY0Sw3IPtP6wDL9Xl
         bfNhM7R5fHavqWmv+09QjDizdAqpjNa9uHD/MFdnpSWz32nmB4qlZUhsvhqLz8H7IfgV
         L8EVZu8pXxKzYIwEisILoNE/3hWH5mUxpmvbzAzA9ProyJ9Q25iNQn7J1ZNSjgbkgZDm
         ldkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093032; x=1795697832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNdkunqr6u9bKRK1A1668SbUnjs3NSYIwuYmzohANi8=;
        b=IiPfwnFZGgfi5+QZIiSUD9RykFeAOWN2JeZDjl8B98j+J/yH1dg2qctcraHMw7+MMU
         sD19YFb/GxJsSmSBnnmPwwKS1B38smEIKTEg6pYKJuEG8wza5HeaLpggD5h6SAzQDW53
         u3ZaBtkDAQPAZWws8Aonqh4cHEZWuwzTOwIGJAgV5+8+cGDQQZZHiy2XOKGipp4G97rz
         PlW2Opxd+mZlwvcrt8L70d33OrCakOmkgHQwwV2VdvjnfcKaR27gFQncfkv1KEGmNBi1
         6S2P4eRrRn6g6PQ5XJAbDbXhXr7gif7k8HmEkPgN4yMbZwfmj4iSk7Sy82RiK0Y/gvYT
         HGwQ==
X-Forwarded-Encrypted: i=1; AL+hErHe4sS4r/Oovl9wIn4jDLSutFKnbUM0aCAnnseMXr1gDEdfjkBPqjNaKVn60Hh06PsPqaD4/Es=@lists.infradead.org
X-Gm-Message-State: APuU4Z8n41ExuxjrWGx00rJhhcxOeboiEqfnwSfY7KS5K/0+rvBGw5yn
	+gCjg/7paUiODc61uMnIHa78L8UcYpdPV/6k9Kc/lXETOtYKGtQ1miPFH4fZEcnDOY/AqGDpi81
	ntFxbq1Uxzj8L86Rc5FQv0gtZVWzUQjg0xMAnzFdy0a+UkOt1618X+gBvGEqz2d/V
X-Gm-Gg: AZFdTZfuPp4aeGmJBSo2aetC98ImnaVdmOOguBkTcZIBFo3Jp/NBAazg9SctS2rQReV
	pIA/hRAywfYWBuJwoERtVPT4o/4WF0t8pdRh5LHqtlyBGGjTPR4TZxzg3ZFVkERahRsj0HgVtDg
	+sYP/+0BZjuujZINTjojcPkGfqKsE2Grs6IEAlLhwtdR4A7ZgIwo+I7xDAeMUmh+sigPr0vInHY
	bqc40VhTtYdfX/S9ayQ5thHajibK38axTCgWYbvmxaa0EaH3dB6B9DLad9BL5UkZu6RqqQcDKlk
	pUJlwzhiniZ1m9029FM36y/lcBDDcnwDOMdbhzZSXva3ICTslVzW8Ese6G448cuF+7Vd2UnMHOi
	hFh0SvecfcAeKvhbO1SIWH00xG54wzjNxD9NdYmZ+MAXawrRN4SirGIMDW6dMU1BriWQE1/x9NZ
	2zcPRhFu8M
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032262eec.13.1795093031600;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
X-Received: by 2002:a05:7300:bf86:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3827f98f348mr5032235eec.13.1795093031084;
        Thu, 19 Nov 2026 04:57:11 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:10 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:35 +0530
Subject: [PATCH v6 3/7] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-3-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1780;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0zEUl2S9sKA63T0Lpy4WWFHatcVllvfZJQrn5ZSlMz0=;
 b=QiPOhPdWYBohHyIwt2tF1rwyCA1O/3J19GBbfxfpRGsrmthwLR54jYh7vJieyTmuzer/m6ZUK
 +J7M4UBSalZDTdbAAM9bOcqLpdX402IQeObndCBqPYoPYTjrhrq7CX5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Mqz6CqRPKo1Kb8WRlr741K3d06YetdsK
X-Proofpoint-GUID: Mqz6CqRPKo1Kb8WRlr741K3d06YetdsK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX3y6ZYuR2iho8
 y1yuZH5NfXoARgWAIxVxiaFP8gEZa3GYFhk5e43WiPu5ZrJSE6Q+9ex5PeULpFKpyfQ0u+yCjNT
 F1ndqTv0yJQrS0WBPg0lyBhwkW7L7Pg=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afef228 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfXzqD/wzmsNRhZ
 MtO5kbFR4bP2ZE7xiMLu8PgO0cwcd7gy8rfzhWpGN1Kb71VZOZ9LjSq4hsyF10NslsGu4TQcREN
 ThlrT0dsk7z7sezNSobxR71csePtGEQe9j5y6AFa+4Cs28muPmsNQkEO43/YCyHpWM3qRmRoqgg
 MqP3IK2jnLssK/JMPgbQYWDhJ9G6bR/pLoE/NQemxAPou3JhwpBeErsiZyRtdK+OnYBsJ2IZ1mB
 Gu7CABJfZeG0KHz/A2VtBEUo0FCfmN4ymvY4+XId5dTR83Jo5BZ63mGF52qm9Zt85ip1HTZ0Vk3
 hIajBJ8JOmOP3ZX+YJQug+3Wq4P2c5QF1iddC2ZkJMQvecYHhceiR1rNleiGFwIbE3nBVF2cfWt
 wsGGxnzMB0VrZ1yJyzLYL1egRTJme+UgCkHYK9bEXTtVSaN28CyzhA7Ax7Ant23cq3V1NHptLOZ
 aBnXboOqfVrCRk0VClQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_045713_833537_0B88D301 
X-CRM114-Status: GOOD (  13.24  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..a89955617bec 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6056,6 +6056,21 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_bandwidth_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for 2.5 GT/s - 32 GT/s)
+ *
+ * Convert the Target Link Speed (TLS) field value from the Link Control 2 register
+ * to the corresponding enum pci_bus_speed.
+ *
+ * Return: pci_bus_speed corresponding to the TLS value
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 352079393edb..d12875c95491 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1739,6 +1739,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1


