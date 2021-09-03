Return-Path: <SRS0=YLPq=NZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E2CC433F5
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB3661051
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CB3661051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogEg4RfiAvB6wkH9IV+YPWeHDgSk2ViNHKhMwEMRrDU=; b=LWyJKWPnaWMlIa
	iK0TvMMweNGrjSvXlMIwe9qh3BddWf8dE+dgXEFwK91qGje70MLapTMoZnCsmzbbDjXWRHNEeulIU
	m0JPPrC1UMZHyu6my2AjMKBjKmJdxLLaaeM8RqaXUvKh5Skg9vgDidLZWmUqKl5I1E+lsuDFf23cA
	yK36zoPQ1C5AwRiKgC/LMpO9xDr08+XiWoEF9wv6HzO/Jhc4b8CnRphaulDAQ5Xihs+Bl0k5iPr6n
	uBhD/gsdwngH70GE+2HOAhPBjlB263yWkAC3LhHfsu/ETpJ6z0nOGGT1ud/LjG1u95IqukSZIAbLt
	A0OEfdVWOUSS6J0qbzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7gd-00BpU8-Aa; Fri, 03 Sep 2021 11:48:47 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7gZ-00BpOH-7e
 for ath11k@lists.infradead.org; Fri, 03 Sep 2021 11:48:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630669724; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=1NXJeUbnWJhpPLVO6LB2BPGMdz0cm2i+y35XfNacnKE=;
 b=HlWElphhTfeeTYKxxgimYd+6/Kbx5y21Fh8ZX3F6Uk8E5cPyJCLSiENfrfq7y7OKJBXUYbAs
 5MKIw/ncALPZU1WKEvG2x/gdIPbyut7PFB9UpxhPm4tifvYNRhvAisYRPcADCi0B22fPVG6X
 WI2JjMPrbvIu4euwKwN16kaGtNw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61320b9540d2129ac1e4900c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 11:48:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D19EDC4360D; Fri,  3 Sep 2021 11:48:37 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 37C97C4360D;
 Fri,  3 Sep 2021 11:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 37C97C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3 6/9] ieee80211: add definition for transmit power envelope
 element
Date: Fri,  3 Sep 2021 07:48:18 -0400
Message-Id: <20210903114821.23346-7-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903114821.23346-1-wgong@codeaurora.org>
References: <20210903114821.23346-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044844_952315_CFCEA0A9 
X-CRM114-Status: GOOD (  14.65  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SUVFRSBTdGQgODAyLjExYXjihKItMjAyMSBoYXZlIHNvbWUgY2hhbmdlIGZvciB0cmFuc21pdCBw
b3dlciBlbnZlbG9wZQplbGVtZW50LiBBZGQgdGhlIGRlZmluaXRpb24gb2YgaXQuCgpTaWduZWQt
b2ZmLWJ5OiBXZW4gR29uZyA8d2dvbmdAY29kZWF1cm9yYS5vcmc+Ci0tLQogaW5jbHVkZS9saW51
eC9pZWVlODAyMTEuaCB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oIGIvaW5jbHVkZS9saW51eC9pZWVlODAy
MTEuaAppbmRleCBiZWQ1MTBiN2JiNmIuLmIzNWNkZmFlMDYyNSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9pZWVlODAyMTEuaAorKysgYi9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oCkBAIC0y
MzI0LDYgKzIzMjQsNDYgQEAgc3RydWN0IGllZWU4MDIxMV9oZV82Z2h6X29wZXIgewogCXU4IG1p
bnJhdGU7CiB9IF9fcGFja2VkOwogCisvKgorICogSW4gIjkuNC4yLjE2MSBUcmFuc21pdCBQb3dl
ciBFbnZlbG9wZSBlbGVtZW50IiBvZgorICogIklFRUUgU3RkIDgwMi4xMWF4LTIwMjEiLCBpdCBz
aG93IDQgdHlwZXMgaW4gIlRhYmxlCisgKiA5LTI3NWEtTWF4aW11bSBUcmFuc21pdCBQb3dlciBJ
bnRlcnByZXRhdGlvbiBzdWJmaWVsZCBlbmNvZGluZyIuCisgKiBBbmQgaXQgaGFzIDIgY2F0ZWdv
cnkgZm9yIGVhY2ggdHlwZSBpbiAiVGFibGUgRS0xMi1SZWd1bGF0b3J5CisgKiBJbmZvIHN1YmZp
ZWxkIGVuY29kaW5nIGluIHRoZSBVbml0ZWQgU3RhdGVzIi4KKyAqIFNvIGl0IGl0IHRvdGFsbHkg
bWF4IDggVHJhbnNtaXQgUG93ZXIgRW52ZWxvcGUgZWxlbWVudC4KKyAqLworI2RlZmluZSBJRUVF
ODAyMTFfVFBFX01BWF9JRV9DT1VOVAk4CisKKy8qCisgKiBJbiAiVGFibGUgOS0yNzcgTWVhbmlu
ZyBvZiBNYXhpbXVtIFRyYW5zbWl0IFBvd2VyIENvdW50IHN1YmZpZWxkIgorICogb2YgIklFRUUg
U3RkIDgwMi4xMWF4LTIwMjEiLCB0aGUgbWF4IHBvd2VyIGxldmVsIGlzIDguCisgKi8KKyNkZWZp
bmUgSUVFRTgwMjExX01BWF9OVU1fUFdSX0xFVkVMCTgKKworI2RlZmluZSBJRUVFODAyMTFfVFBF
X01BWF9QT1dFUl9DT1VOVAk4CisKKy8qIHRyYW5zbWl0IHBvd2VyIGludGVycHJldGF0aW9uIHR5
cGUgb2YgdHJhbnNtaXQgcG93ZXIgZW52ZWxvcGUgZWxlbWVudCovCitlbnVtIGllZWU4MDIxMV90
eF9wb3dlcl9pbnRycHRfdHlwZSB7CisJSUVFRTgwMjExX1RQRV9MT0NBTF9FSVJQLAorCUlFRUU4
MDIxMV9UUEVfTE9DQUxfRUlSUF9QU0QsCisJSUVFRTgwMjExX1RQRV9SRUdfQ0xJRU5UX0VJUlAs
CisJSUVFRTgwMjExX1RQRV9SRUdfQ0xJRU5UX0VJUlBfUFNELAorfTsKKworLyoKKyAqIHN0cnVj
dCBpZWVlODAyMTFfdHhfcHdyX2VudgorICoKKyAqIFRoaXMgc3RydWN0dXJlIHJlcHJlc2VudHMg
dGhlICJUcmFuc21pdCBQb3dlciBFbnZlbG9wZSBlbGVtZW50IgorICovCitzdHJ1Y3QgaWVlZTgw
MjExX3R4X3B3cl9lbnYgeworCXU4IHR4X3Bvd2VyX2luZm87CisJczggdHhfcG93ZXJbSUVFRTgw
MjExX1RQRV9NQVhfUE9XRVJfQ09VTlRdOworfSBfX3BhY2tlZDsKKworI2RlZmluZSBJRUVFODAy
MTFfVFhfUFdSX0VOVl9JTkZPX0NPVU5UIDB4NworI2RlZmluZSBJRUVFODAyMTFfVFhfUFdSX0VO
Vl9JTkZPX0lOVEVSUFJFVCAweDM4CisjZGVmaW5lIElFRUU4MDIxMV9UWF9QV1JfRU5WX0lORk9f
Q0FURUdPUlkgMHhDMAorCiAvKgogICogaWVlZTgwMjExX2hlX29wZXJfc2l6ZSAtIGNhbGN1bGF0
ZSA4MDIuMTFheCBIRSBPcGVyYXRpb25zIElFIHNpemUKICAqIEBoZV9vcGVyX2llOiBieXRlIGRh
dGEgb2YgdGhlIEhlIE9wZXJhdGlvbnMgSUUsIHN0YXRpbmcgZnJvbSB0aGUgYnl0ZQpAQCAtMjkw
NSw3ICsyOTQ1LDcgQEAgZW51bSBpZWVlODAyMTFfZWlkIHsKIAlXTEFOX0VJRF9WSFRfT1BFUkFU
SU9OID0gMTkyLAogCVdMQU5fRUlEX0VYVEVOREVEX0JTU19MT0FEID0gMTkzLAogCVdMQU5fRUlE
X1dJREVfQldfQ0hBTk5FTF9TV0lUQ0ggPSAxOTQsCi0JV0xBTl9FSURfVkhUX1RYX1BPV0VSX0VO
VkVMT1BFID0gMTk1LAorCVdMQU5fRUlEX1RYX1BPV0VSX0VOVkVMT1BFID0gMTk1LAogCVdMQU5f
RUlEX0NIQU5ORUxfU1dJVENIX1dSQVBQRVIgPSAxOTYsCiAJV0xBTl9FSURfQUlEID0gMTk3LAog
CVdMQU5fRUlEX1FVSUVUX0NIQU5ORUwgPSAxOTgsCi0tIAoyLjMxLjEKCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
