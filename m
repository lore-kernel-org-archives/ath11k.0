Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF37C433EF
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 15:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF4B60FBF
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 15:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EF4B60FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CA/8O9owyovjmj5JeXawGS2otCZFKtO4mNLgnUgh9zM=; b=iLhfw1y5Y0P51z
	/r/ECuBZAdI1uCWIaR8tLr2DtiOk0gecwFla422hFPmvO4AC9RJZpFLWbyCh+bLtEK8bwInXVi8Db
	bEMn3uk7OpFFHe22HuBgRDONv+X1m+bJKBJReOS8TjE58OhpgPayHSEb6mhEi62/HR7Imk9bDad+2
	MOQV6GuC/liL3PN2+YqVRUZv28s6kFEtrAp3kUTsxuAI2+wx5n/ZD987BsoWGrK1YAdNDN79yDZsK
	MRdMnjn4fcd4HtlwezvNuNOJ/ddLisezPhPNQyNUNxU1QifyemJh5KXwgwbrE8Fklm4ap4ZwIQ3M5
	3RqruoFsTQkNrZp6tqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf1tN-00GtNV-Fu; Mon, 25 Oct 2021 15:28:05 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf1tJ-00GtMj-O7
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 15:28:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635175682; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3zTsPRswybeqkW/NN/9MmGt5qZUFbx0X45N/ZZo5/Fc=;
 b=hDne9z9d6/0F0EDndQ8jKYam6Rkafl/X7mpSKuahxj2YTVxjkBZ+7iwqFb3VCrmI2mNkEcvj
 LQZC0CgLVE2BcyDo2+iJYIUZJeryF1Ios5ZSMu2XF9H5Mh2UcHHeODkzsXksTX0h2RJUcvp5
 m0eL02wkZjWYiJWiwNEHQdhRgpk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6176ccf359612e0100ce8f29 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Oct 2021 15:27:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DCBBAC43460; Mon, 25 Oct 2021 15:27:46 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EFDEDC4338F;
 Mon, 25 Oct 2021 15:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EFDEDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Date: Mon, 25 Oct 2021 20:57:27 +0530
Message-Id: <1635175648-23491-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_082803_025546_000287B2 
X-CRM114-Status: GOOD (  10.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ath11k driver supports PCI devices such as QCN9074/QCA6390.
Ath11k firmware uses host DDR memory, DT entry is used to reserve
these host DDR memory regions, send these memory base
addresses using DT entries.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 .../bindings/net/wireless/qcom,ath11k.yaml         | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 5ac9616c9239..c7e6612e949c 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -19,6 +19,10 @@ description: |
   These devices use HOST DDR memory, HOST DDR memory can be reserved
   and send to ath11k driver from DT.
 
+  ATH11K supports PCI devices like QCA6390,QCN9074.
+  These devices use host DDR memory, host DDR memory can be reserved
+  and send to ath11k driver from DT.
+
 properties:
   compatible:
     enum:
@@ -177,6 +181,29 @@ properties:
     description:
       HOST DDR end address.
 
+  qcom,base-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Host DDR base address for firmware. QCN9074 firmware uses 45 MB of host
+      DDR memory in mode-0 and 15 MB of host DDR memory in mode-2.
+
+  qcom,caldb-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Host DDR address to store CALDB. CALDB is calibration data base
+      for WLAN channel and tx power.
+
+  qcom,start-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Host DDR start address. For example on x86 it is 0x0,
+      on IPQ8074 it is 0x41000000.
+
+  qcom,end-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Host DDR end address.
+
 required:
   - compatible
   - reg
@@ -317,3 +344,14 @@ examples:
         qcom,end-addr = <0x80000000>;
       };
     };
+
+  - |
+
+    pcie0_rp {
+      ath11k0 {
+        qcom,base-addr = <0x50F00000>;
+        qcom,caldb-addr = <0x53E00000>;
+        qcom,start-addr = <0x41000000>;
+        qcom,end-addr = <0x80000000>;
+      };
+    };
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
