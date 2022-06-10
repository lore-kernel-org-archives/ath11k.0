Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB7ECCA47C
	for <ath11k@archiver.kernel.org>; Fri, 10 Jun 2022 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+yDeg3L49vW4Ar9gNJncZr7EgJyZuZYuOtpR8ukT0c=; b=MZWZoddk9zCBH2
	hJ2EeFURnK8rsaNLvG7Ly6kI8h8opYncoNUqlHoVZjMeyVLi3zNL1dj01bzZM9UBXRf9ezXDhlMDJ
	HWPYW9cmxY1JX/2YrE2b3qIOXjp+cwtrLvMZAEVFakfZElM44+6XkLy7bGeeS2i3RsiJKM74gyNVv
	4XOtitYX7nDpz9qlNM22Z/zjvAEZXP4UIlHmJrWpDzQ2quClunS34JvW6y2X+itIS5rEGdEQnSKNV
	J2FmO/mYejlFbHfrNOmC2OjBC/x5h4D00lJk1GGBd/q3ka3e/d4HhekcvfRj66wp10kMUWG4u44Bd
	bSGt5fspFR4UGsDOuzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeol-008OIi-5P; Fri, 10 Jun 2022 13:36:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeoi-008OHe-R9
	for ath11k@lists.infradead.org; Fri, 10 Jun 2022 13:36:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 28249B83508
	for <ath11k@lists.infradead.org>; Fri, 10 Jun 2022 13:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C32C3411D;
	Fri, 10 Jun 2022 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654868205;
	bh=eWtXFCIMMjAECVlg9VhbeBeG9zH5I9ug3qsVfDGrJqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJ3V4kt/wphjanHfPRz/ZOgFljSKViw96sn1+/A5OPFmLryR7H/QnLE8lcP3xSalP
	 ub7bthVbGo1cHhMPS45uH1a3dP0RA2zWEQoJ2maGSa/CDGGhtJ5BKEjjQk3xt/xnZ+
	 zu2f7aUofbGD7ImjoONOxeq5UKmnqNA4IbLv7oPG0jaKcdGVdrEjlRgcMPjlMX8YEc
	 8CkhXjf73JCZRTgQGHitoGYZTaC7gBGlRqoxLnwtOB2Pjs8f6oNE8mMxKmEHze6iew
	 WaYqEyDu3WIIdj9+RmYJbRsu18HWqUY5+FjRpbKg8qa3zOLUxQ01SkqwFSTRhfMMWE
	 AlA+gMh4iCueQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless v2 2/2] dt-bindings: net: wireless: ath11k: change Kalle's email
Date: Fri, 10 Jun 2022 16:36:40 +0300
Message-Id: <20220610133640.10810-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220610133640.10810-1-kvalo@kernel.org>
References: <20220610133640.10810-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_063649_069190_93FD8C24 
X-CRM114-Status: GOOD (  10.61  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

My codeaurora.org email doesn't work anymore, so switch to my preferred
kernel.org address.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 8c01fdba134b..a677b056f112 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -9,7 +9,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies ath11k wireless devices Generic Binding
 
 maintainers:
-  - Kalle Valo <kvalo@codeaurora.org>
+  - Kalle Valo <kvalo@kernel.org>
 
 description: |
   These are dt entries for Qualcomm Technologies, Inc. IEEE 802.11ax
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
