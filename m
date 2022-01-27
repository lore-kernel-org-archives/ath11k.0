Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F7EC433EF
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 05:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnFz3j6Vss/AMrard5+z66dXx32PKLrsI4+e9DZJg8w=; b=TX7JhVkyRmpJhp
	X1h3ydwGVCQXQL/eUVrbs5cJ1m7lAyG33sDfCxNH5AJVVzMjMzN88YKrVzY9W9ajesixgr4BQMwGg
	c8TaHVweu9cOIc7LrI4yL1Fd4E8iswNFLgGjgIEjIRTT7L5A448BhPRm+jVwAAdGW/5nObI7oik3T
	lJWs8b1/2zhSJWTpx5q+3cShHeZxV+ecqJEaMXBH/n9arQ0gcGWx8EEzVmgPzJFb4wISzAfymX2zk
	iOu6MeM5iSrMsMS1z9cFinctuUl9BPrrjDyFCTLPxt24i/N9wLkjPuSrdVpLASYOxisGxJPVM6VWN
	dElNj8KWaGGLSIFEF9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCxI5-00EOXc-KJ; Thu, 27 Jan 2022 05:25:49 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCxI3-00EOVz-5C
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 05:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643261147; x=1674797147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iaMIhpzzqIVueVu4CbfPorPRdKKm1rjacCwoYKP8zKE=;
 b=DFyjTbBTUlSC1iZnvsWpTByOCHSe2aNa4hqJIJan21Rxmst+MfMHKJCQ
 7DPblEwsRgXia2o0/ccGLY/u6YuZFcbmnpJSN5Uzo0CNdoSahm2oXtIfE
 wOP3yjzcoLqI7HaANBTqWAPAzu+pzTCGtEV+4ODx6ZmaPZW9D7FgZj4IS c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 26 Jan 2022 21:25:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:25:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:25:22 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:25:20 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH 1/2] dt: bindings: net: add bindings to add WoW support for
 WCN6750
Date: Thu, 27 Jan 2022 10:54:52 +0530
Message-ID: <1643261093-12400-2-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643261093-12400-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1643261093-12400-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_212547_259644_5CB7D482 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add required bindings to support WoW (Wake on Wireless) for
WCN6750 used by ATH11K driver.

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index dba1434..aead001 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -71,6 +71,14 @@ properties:
     required:
       - iommus
 
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: State bits used in WCN6750 to signal the firmware
+                 to exit from WoW.
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
@@ -415,6 +423,13 @@ examples:
         };
     };
 
+    smp2p-wpss {
+        wlan_smp2p_out: wlan_smp2p_out {
+                qcom,entry-name = "wlan";
+                #qcom,smem-state-cells = <1>;
+        };
+    };
+
     wifi: wifi@17a10040 {
         compatible = "qcom,wcn6750-wifi";
         reg = <0x17A10040 0x0>;
@@ -454,6 +469,8 @@ examples:
                      <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
         qcom,rproc = <&remoteproc_wpss>;
         memory-region = <&wlan_fw_mem &wlan_ce_mem>;
+        qcom,smem-states = <&wlan_smp2p_out 0>;
+        qcom,smem-state-names = "wlan-smp2p-out";
         wifi-firmware {
                 iommus = <&apps_smmu 0x1C02 0x1>;
         };
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
