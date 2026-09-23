Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D463C98313
	for <ath11k@archiver.kernel.org>; Wed, 23 Sep 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H663O8isef1F9joPmKRk+XIhgnEwiu5yVkCMMznpdnQ=; b=ZOyEo3xgNMEkv+jaxMFSqeaQSo
	rNIj8LZA+pg1B8PlNv3CiAkYpD6+hCnPD9JqeOmaBM71vmcxPMoIHb35y4R+uUzrNriX90ygWfKJN
	7dar/49idC1uR6xuO+K3DYmRM2+WFBtHuw4TgdeCwj+MXTIEirH1OKFOpReEIRbaBBtHXJZrbYfBL
	zr8IyKvoYWiWm/imBh96sknH4D6KBDsDLDRZ98XCJyHc9HFcgqoGv71o7817FxnZKoEHmrTDSYAGa
	TjkXKtpZiw8AHQHnlJreZ9JVOBbATrzK0uFRYW5kQz+KFiOFQASgtt6CGjaGO2wCeSKCeVwwkHF/z
	MSq2I9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lj1-00000008BB1-3xZo;
	Wed, 23 Sep 2026 12:05:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Liz-00000008B8E-2ijV
	for ath11k@lists.infradead.org;
	Wed, 23 Sep 2026 12:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D6E560202;
	Wed, 23 Sep 2026 12:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3B8AC2BCB8;
	Wed, 23 Sep 2026 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790165120;
	bh=aiu5BQmooqpYpTxUiTsFRkUauq9c6vOlNTSSE9Hp2cE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hhMXezZC4F734ZEYTNu0ImTcn1++ayl23Vp6sFKPd6wz8iUNWKd5dHihz69NbPipQ
	 8zuPIAfqcHJxmsfBJqaky2XT7Qo/iSLlEWyAU30rqRAm/+OwRhvnJFxEzD1AMbu2Ep
	 p61wbSSdcNbKEkOv6szKDylR69JS0Ar+gB+4Az7yh17MqU6AkA+YYpaZ9OFirPcKtC
	 OAL3U7RwgixpYLNcKoIgv8yEwrvuuNgsR3Ib3g9SIiBM9HtAp+vWafn8THhRtWcj44
	 gWYi98hZ/3qaNXGLtoK2uLdg5U+3feDHBfqTXqCXZ3eDH7mkcOTpk2pL4EPQmhCSn4
	 6f8nPg6jXOWJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F91C98307;
	Wed, 23 Sep 2026 12:05:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 23 Sep 2026 16:05:07 +0400
Subject: [PATCH ath-next 01/16] dt-bindings: net: wireless: ath11k: Sort
 compatible names alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-ipq5018-qcn6122-mpd-v1-1-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790165117; l=1172;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=8Rc10oeOzKG46Y973OUa46HiYgABQNhQH09OMbqE0/A=;
 b=3+IjZNJc/3kIEHzthob1GBb8swjvmJm3tT2XGZdAeVqB3+1bxIGOUS3jPiFtH7zw2XhSFeb45
 S8mdKrSK7N/DUNla87oYJd+YhC7B6MW3DhOtcsbJ2gvPyGxpPV27ex4
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
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
Reply-To: george.moussalem@outlook.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

Sort the compatible names in the binding file alphabetically for
legibility and correct ordering.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index d4aa56e2f823..a846cd704b19 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -17,10 +17,10 @@ description: |
 properties:
   compatible:
     enum:
-      - qcom,ipq8074-wifi
+      - qcom,ipq5018-wifi
       - qcom,ipq6018-wifi
+      - qcom,ipq8074-wifi
       - qcom,wcn6750-wifi
-      - qcom,ipq5018-wifi
 
   reg:
     maxItems: 1
@@ -108,8 +108,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq8074-wifi
               - qcom,ipq6018-wifi
+              - qcom,ipq8074-wifi
     then:
       properties:
         interrupts:

-- 
2.53.0



