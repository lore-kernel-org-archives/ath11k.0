Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C4C67861
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf3T1+3GASlWJzZ0bWsqvC6Cu4nVbS7t3i233bUQno4=; b=paz1kgt9qUjWC9qLXA+vz6939x
	Z93WLMagk6QMJ3Q8uQFAi4yHn17JsShunhRYOY6716pbwquX0pWdaTcT6EZ9wtZ8OQ+/cpKtqyrPq
	q+ys51wMo8eCQe5R/Cyo6ZaKKI9f0aW9Ee1urlWAejwyl6Po+RoHBRCmPDTB+X5wQBnm7t8TRQOmj
	LvJ03S0sk/xU3Ja0snl4aAM2v7o6wRI0mkkK0mwE1QarZE93bs5c6OKfByepOGOX1fZewGsLlPpUa
	sSLzxfV+klRQr6+eLrvSw6RzckrGNZgyiK7PRow8jzj79NZUbCjsEMcMHatah7IO4wK3/XsmG36o2
	CEc96gCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaV1-000000040XV-2vpV;
	Mon, 09 Jun 2025 11:17:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa7J-00000003xAD-46X5
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 10:52:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599VVtM015275
	for <ath11k@lists.infradead.org>; Mon, 9 Jun 2025 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rf3T1+3GASlWJzZ0bWsqvC6Cu4nVbS7t3i233bUQno4=; b=QdVfk1RHP9aFEftv
	jffgvjF6vy41GBr7vtN3G8DmLCPOlFlFUA/D9ctuL3rFx+++2QK6He3h3xq0QEPq
	uiCmC4p26jBkB5ff3eP876Rd6X2dc1af3pNYR2OEdNGTjK56v17lnw5GwDbitwzI
	qZDQyKDjgiqFvMdK2O+1F3Eo9SIkRFSJUGzbnXJ61JDK5BnXfvQKsqphxFLyT1gO
	d6uj1vUfvkug3wvw2RLRPy8T8R8fovwQTcrGEIfn35ft1PNrmu8ehIo2q0CjO86j
	VU/vSoth44dMy7SWgvRLaCm6BdPkfPJJgAfJ4GgPlBIHZKCLNoMEHL1X+y/FksI1
	9ItvDw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11wxr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 10:52:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23494a515e3so31163345ad.2
        for <ath11k@lists.infradead.org>; Mon, 09 Jun 2025 03:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749466356; x=1750071156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf3T1+3GASlWJzZ0bWsqvC6Cu4nVbS7t3i233bUQno4=;
        b=fZCt5PF0Ccayz7iDMZgShJ46OWixtW2ZXboaUuSFAsWRo7GNSuKZJOXgARt8LAehoR
         5H7s8dtpkScs4MX93Xj57vwipTHHvqSSBglO3FLjokfY17dVmhPNkKzfrqR2YLek+5HR
         vLGv0ChhsCH3N/IAEQuwfwgAFP3paIFoCwUXHhAXEYyG3jkXMMgH4ZMp3BgBrIAHe4cs
         t3HEyAxp8/WqygGdYlmhROI1jRrPEuzHTeOKbW8O9kuf+9FZWJPNt7Cjxiz6CD+u/zhs
         x8OkaAF6s3rFUlG9Ll50DhEe5U33nRvnj3KFhYGy7NpI7FcSrBnWexUFjpIBm9KW+Qf3
         w5lA==
X-Forwarded-Encrypted: i=1; AJvYcCVRnASDWHAlVOlA/FLzFWiSFedTisjw7SUFmmg/TGOGR9HhrObeDzBzH1UL0ED+DLd51+K9ezo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2yk/sWacFOGX2OJt5y+/TB9cMvL2YqbGO5UhmD+Jmj5FZHupj
	kd0baaUifnkBY4B7wuDFsu2VNvs5snpy8Yw6GVAl5CovyG/PzKAHuhDIs5wExB++4wPd3oKQtcF
	ksfM4qxilne1hB0dyRueDbmhidG/R6HDP5ZUqNaRbylDTbmixALV4+ORbAZbZ/Csn
X-Gm-Gg: ASbGncsVnepuR58czdTnV0P5IwXdx4nDAZdDhY2MxaYQ6sehROyhSsfQef0JhihKsoc
	Q//zQJ1weGOLGCKy29LOiCCGCXF0g7PzEaozAs9oapJhzWzezey/S8sevhpBSwLXAMBLcqZuF3a
	10Al/Ggq8MnHSOXYBJVK40sfg0rAKiBfBReGJkYo0eyIoClvuFxCzOmaD7dCG3IbRTkKO/6rVIt
	NaxpBe851Ezfj2Dz4onLc1NYFMFfuaC0B3TYiKUz+2ejDt8BM4DF/9SC86N01VG14DE/AIVM/zp
	ii4bXZJgkXlA9FJVPdh/feZAW5r8EpC7TM0k7pMVvtLm/cXmw5jrJDI7jg==
X-Received: by 2002:a17:902:e892:b0:234:1163:ff99 with SMTP id d9443c01a7336-23601dbda63mr188272035ad.43.1749466355784;
        Mon, 09 Jun 2025 03:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfOtxSShcIPHOq4ERfbAdlOhJ+1CY8bWvhhbD6i4sNfbzlFHhLFu/fy1Gvh29SHVHghOb2zg==
X-Received: by 2002:a17:902:e892:b0:234:1163:ff99 with SMTP id d9443c01a7336-23601dbda63mr188271785ad.43.1749466355402;
        Mon, 09 Jun 2025 03:52:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f44sm51836465ad.63.2025.06.09.03.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:52:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 09 Jun 2025 16:21:31 +0530
Subject: [PATCH v4 10/11] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-mhi_bw_up-v4-10-3faa8fe92b05@qti.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
In-Reply-To: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749466291; l=1624;
 i=krichai@qti.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ozgpq2xmvi4UJqJjNIVDkHjQo77lQtGFPl31rvLet4w=;
 b=yaLOh4FX5gPQeN9e5bGsAkcMXFcxKgY8uVvM1nj/u8Ux7O6Q0xBWEZ19LjFKr1TFtB3aF2ufv
 5EL3YOyrIgoD5l4/FTIM/xHGeEl1CjT+2Ytmco4OKC5eUZzGNbxgip+
X-Developer-Key: i=krichai@qti.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: M-zn8rzfVHO-EdqZsGZs4Dmf7Ah63aJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4MiBTYWx0ZWRfX5a4orkd/A6yU
 /z/vrZPfIaUOtZIEhyhF+IxcvcS7SjzexV7mwfzW/5ds15ok3H7u4YmKlp3DrLh+nbFBOubht4U
 D0E7wjg9oxef1V7J1Gp+GavlUHKXG14Okgj5yJma/9XlNKNzgb7DjgZhnNucXYYuXEYGYvganv/
 arygA9EMNi9xamH+ytzxHbPC9Z7GdFoeAyus4jismMdNg1nOloVkWRt4Mp+7XYhzvPQM8cJ7ZE1
 NqXvJTlNa1lORsI0jhmSUoDdGRWzOt7+/2aOA3//HsWVGJ6H/CBHwJvFsl7zILCxD78CYuuI1pX
 fuwkkBqWOcUuU6yPaL958zaAULV1o3pVtvckIZeW+EwZQ/wJMGOjeL+yrsP0nVPd1BNnvS1+iEd
 WZN2NuOG2d06XIV7P8HvuWSAF/JzDVCqnNDfbBSQB9CNJoRp7/Md1wFVACw4YxPINm4ueKKX
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846bcf5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: M-zn8rzfVHO-EdqZsGZs4Dmf7Ah63aJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035238_147880_4DCF2BA0 
X-CRM114-Status: GOOD (  12.23  )
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

Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
so that other kernel drivers can use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.c   | 12 ++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..8950e88826e27accfe699e31fba8f4077c26296f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6018,6 +6018,18 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert lnkctl2 speed to pci_bus_speed
+ * @speed: LNKCAP2 SLS value
+ *
+ * Return: pci_bus_speed
+ */
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed)
+{
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
diff --git a/include/linux/pci.h b/include/linux/pci.h
index cb703443290a013c8372333fc8d547d190d9f3b4..900f2aad5caf664eb89babca82e1921b1ca2fe5f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1654,6 +1654,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(int speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1


