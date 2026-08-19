Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ADFC5DF81
	for <ath11k@archiver.kernel.org>; Wed, 19 Aug 2026 13:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=; b=HM7PEhB1a3gFey9bWREoWLlT0I
	YrtgfmFpp9mddkW5RwEbJqOhRXmqnBZyyMR2e/0ZmJss7X3wmYIGEtRYy1K2hXA9WHdB02e+74lFg
	Nd6bDYD6FADgFcn7Q3D+Ph4JD6fgPh+Bx7FjLWUsc2wvroElQ4vkuU6LGsiPWU3wOI3N0WtKUBcFz
	9JNS2C3FW1fTcIcGdQFjhW/zZ9ptSOxjy0SxklByHZQlTrocf3/Nbqhl3ZZ7+gKZQtbm54+7Y8eqV
	GEyY6PdjNI6+uEtf9kPcMk2EoMM6VVrDpFJClsFmhxM4412z2pbRlL2gskMbXDTdK8Txm+LuZfVXL
	xVODYjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJU-00000009rpP-2yRd;
	Wed, 19 Aug 2026 13:26:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgJS-00000009roR-0gBC
	for ath11k@lists.infradead.org;
	Wed, 19 Aug 2026 13:26:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD08vL174197
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=; b=e/wHwrFYq42rNYiU
	I1hvIeC9ytkAoW6qxsQOgpdSbzt3axbxn9xFlUl+SLna8EukIwer79oGUe/+VIQx
	MP+zC6DOWjvWBw2UavA/HQokpKD3SF9vYuIlUjSeCm51sMW3rA2W64cam7BSWulb
	Zl7BgdaHw6OBlKUb6Ok7RzFfD93cUHxpVH0m1YU7N0BYAcmwXfbht2r0F+4SI9jI
	2/WMIqqQG6itQ+xW+47XGUJ8OquEjrw/+8EYCckbQRJWSDEiviaVOiYRv8r9+jTp
	AOFLh2COC5GxMP/L/vWytpDb9kdYFc3oRQHVPumz/u1PqKIjVvbLmzmItZXi2AcH
	1Wpsbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkhdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 13:26:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so1689290a91.0
        for <ath11k@lists.infradead.org>; Wed, 19 Aug 2026 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145996; x=1787750796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=;
        b=USlrv+j+2dDtpXigObyyAqjYvZcXg5buFIh56cxsOoZMufGrI51vFk4JZG1MX7PbW6
         T4yYhmiDNQ3Yosf1oyzAPcYc7jTPKS5ki24pKSLbghj6fOMX5YMsN5GIUXF+Ee27YHao
         F9jPL7L/VCJol7W4mP6ApOCC6+XvOl91AlWBJnG3irxgMvlVIufuvwqj2llF2vSTo1EZ
         eClhgm9uEqcalw+Si8LYz+C0kzRizZvr/Lg82R0qLw29QtpDik4NmlmuCkXbUbp0HAKR
         XijYiuiN5bxJv/x2TXbQhhdZI9zqHF884anhPvZuSOx74whHx+Aga4gNM2Gp2ok1spfl
         G1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145996; x=1787750796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CJo47Rs0M9LCBUMPKGSlXpd8LIC7VDX3pXhIIqAfsk=;
        b=bojzd5BckESXxWA1IBjklGCCPZlzii2rMLct/f052gTBb4HHxnfNzMiHeY9ge8yD3v
         ep8WaMqz3lv75YhwxSKbOgUA+xDKHrECPr7WNfnUBNVciFXdHQCsnorzFOKQtRDc6J6d
         qyh8vNnKPZdBRlbnglFZVMlC5PybQEZ9EPgH0kl+3mOetLXf6klom7HdhHSP+gHwhddD
         6IXJOpidAMFAWxTB+dhOb8WAFTo0yoxHWTDM8FnFPfmJ8DuLuOKkWhLliOuBZ6hAsxsf
         Vk7CeCD5CO1apJQZFY+0GXi7PX4/HeMcyfoVpPDqkRFy3wW4NJvFGifpS6Mckn1y86JK
         vpjA==
X-Forwarded-Encrypted: i=1; AHgh+RoR0+A1qJ5ttW2VMuMjjEe0zugb4Dc/1AQLykJ/f5XATqW9uUoPJJ2aQIPDgQiDGdMdCls2HeQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lL4yi5MHcqy+FD6wn2TnktKdAVE2EK01SLDBTPiuN2crDozXLo
	q0dlZxPqs1yEeLvP0FqUUCd2hE0uA+9RyKWWKGkupBg4Nj8twvk1oGIQbXo4ehrgcWQol16VdKU
	ClPFsGcTyEYkl9JGqrvBz1aIAAWafAsDyoldizAdjcfS0PZNhgX+GFkAFNJbI6vrz
X-Gm-Gg: AR+sD12h9pEsu5Oc95ZDAcEkkPfb39EMgplimlAqB2vO+6SL7aNDwjdTysq5a8U5+kw
	TK1QNi+QTgj9Djj6pRVzwlvnq8e8gTQEWFC31uTx2CspYsBS4nBAZCOBn0lvLfgsE8SdypW/Qu+
	MITegK5aeizGV9y1DTo8osVxAvOItmkBwyS2cNf2baYMEoD46Pmirr7G6qjJaKhqhEz2JZcWt8V
	0aJEAckHBjtStZpoK6lQqQ3Fi/yk9vYwWU0N40G29CKXPShym4/BPfA+S4gJEE2UhK+D0VcpJfm
	30Vr7RHYRk3+pzouWxShxcPbfdnHYoY24d6CxF5zsPjpwameuTRjvnPfkwmf+aO7m1fOMHKgbXe
	K6EZSg6E7O/SFeXDCp2Pm8Ri0zZKpMbcJHDU=
X-Received: by 2002:a17:90b:2792:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39581212156mr9783589a91.10.1787145995945;
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2792:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39581212156mr9783480a91.10.1787145995520;
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm6126465eec.11.2026.08.19.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:26:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:55:54 +0530
Subject: [PATCH v5 3/6] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-bwscale-v5-3-6dea79786b37@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787145973; l=1763;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gzbJaxCxPVY8JnK4ZtjTaXSHrAoIPOQmaGGP+IIpy80=;
 b=loA59unnBaRnNZxvG/WUrecr0BJunX0WpPSWWcivrQvZy9B0XTfHfNyaXVEQX9wEluKQnYWPM
 L8B/TkvKplZDph1FExIucdFvjt33wTNOLQlKQDL/w7YzJYt5HKKSivy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX7k8Zg5fERiRi
 20IDyZBEENniVGfvbeI2yiUE9CvSbQntSjlvsOko3G6VkFIsOy8nXGBT4a1PD8r152/KIU1WC0a
 ypEot53M0bwPZi7q3lh/2vmUs3Gursbbq2wK7ChjEULzRkNlYuVF484lbr197cyqH61tHLzoE8B
 nOXZDZbwOFZiMXr9REM5iFlTGMcEG3eoOP6tTBnWuxg9Y2LKsYBFYrnBmLN5cAapzjeWIc9xlHX
 Kd5BRufDgUAwoW2jfW36Ji/IKhdbyryUgODHvbsDgdMNd3XkwD1j5KPo6GMsLOMEb9V+84TpCM6
 /BNEa/72GtN3GoeorGHtv2EMsxk+CnpclJmwfVacX5iRmLIvK7XUmRu3My+YMUjQNg50WARcQsL
 CpKvu5X3XsDh6La0GzpFG3pwfPJ9MWSHNiczYWYeCldfPdQlqV0HrCrnMH9x+K0ipHX7h3V6K5p
 ohCkeG77obttLQQpaMg==
X-Proofpoint-GUID: PQthoG0eafp9GdvZZhTIbT-Urb8ZNTgV
X-Proofpoint-ORIG-GUID: PQthoG0eafp9GdvZZhTIbT-Urb8ZNTgV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX8TNab3hyctV+
 bg1HDzTXKGCatqjrYrC0rEYmt/boOczbGKphGQSxRpvEUsBz58jg38NnOSmB+xxi00yaDjxr/EI
 aJ2RUgpM+GLThPItV7RkMwJrJ+GZp20=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85af0d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rcts_Xg4tTJKaDXoMsUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_062638_327649_8E9A3C50 
X-CRM114-Status: GOOD (  13.46  )
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
 drivers/pci/pci.c   | 15 +++++++++++++++
 include/linux/pci.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 77b17b13ee61..cda7d210ddbf 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5939,6 +5939,21 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcie_link_speed_mbps);
 
+/**
+ * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
+ * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for Gen1-Gen5)
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
index d1f2d382189d..244c145af04f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1727,6 +1727,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
 unsigned char pci_bus_max_busnr(struct pci_bus *bus);
 resource_size_t pcibios_window_alignment(struct pci_bus *bus,
 					 unsigned long type);
+enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
 
 #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
 #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)

-- 
2.34.1


