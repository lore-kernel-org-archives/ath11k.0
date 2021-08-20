Return-Path: <SRS0=xirI=NL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBC1C4320E
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FAA160FE7
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FAA160FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LkOqDmlZTh/aKOdawMKWb9l6cPkZus/BVARuM7aq2Y=; b=QT88y4fZ33q2v+
	cpMoUtNFGm8S/AqNO1gmocifbR0JehErtePsdjaPCo1+SG5woyZocoNOzVQKn48tbZpbI7OYnzJsj
	fKRNK10U1360V0UQKAPqra3pdNmJXj1xzszUo3yGHkvVS+E8aCpSrnJnyMUFqRKvihzZx9+DomD6b
	dHRsTe+J0Wll0KkWm+bE4PLUs+v2p8LGwodexyIrsqhH417p+58/7kJ7SlYlauzNHjB5PATZaWgTT
	AsiN40yWensmo9kWNqGQccCPhfH+IkWpAvsEaMnbBulCsers0wClPbwULRdfUYueOJweVmsGCXv8m
	ClVOyG/gtXU1sgUiHsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3WK-00B6gP-Du; Fri, 20 Aug 2021 12:21:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3WB-00B6az-GK
 for ath11k@lists.infradead.org; Fri, 20 Aug 2021 12:21:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629462065; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=FWAdQvk77qrO6Tl6VfjrO/jDpGXvuqY5rxBG+Qw/HHI=;
 b=mk9qQL9Z3dQdX2UwHrIZQv8a7bVbOLKkwT6WhJW/c5GFY+sVESCLZVhqcbmlGdZtBUEf9OIs
 8H2x9D6buSSn0E5oLcoeLIg87tXjp26SD+VRdsu68G89rTQUiCkTAYTIS8agrAhvSyJfbTi4
 hnhtvBK9i//NEQCEkcdVNU1yGfc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 611f9e2b0f9b337f11cd2c79 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:20:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16302C43460; Fri, 20 Aug 2021 12:20:58 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EDD2C43616;
 Fri, 20 Aug 2021 12:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7EDD2C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2 6/8] mac80211: add definition for transmit power envelope
 element
Date: Fri, 20 Aug 2021 08:20:39 -0400
Message-Id: <20210820122041.12157-7-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820122041.12157-1-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_052105_575102_98FFE6DB 
X-CRM114-Status: GOOD (  14.01  )
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
b3dlciBlbnZlbG9wZQplbGVtZW50LiBUaGlzIHBhdGNoIHRvIGFkZCB0aGUgZGVmaW5pdGlvbiBv
ZiBpdC4KClNpZ25lZC1vZmYtYnk6IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVyb3JhLm9yZz4KLS0t
CiBpbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaWVlZTgwMjExLmggYi9pbmNsdWRl
L2xpbnV4L2llZWU4MDIxMS5oCmluZGV4IGRlYjJmNTM2ZDEwNC4uNjVmNTEwMDA1MmRmIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L2llZWU4MDIxMS5oCisrKyBiL2luY2x1ZGUvbGludXgvaWVl
ZTgwMjExLmgKQEAgLTIyOTAsNiArMjI5MCw0MyBAQCBzdHJ1Y3QgaWVlZTgwMjExX2hlXzZnaHpf
b3BlciB7CiAJdTggbWlucmF0ZTsKIH0gX19wYWNrZWQ7CiAKKy8qKgorICogSW4gIjkuNC4yLjE2
MSBUcmFuc21pdCBQb3dlciBFbnZlbG9wZSBlbGVtZW50IiBvZiAiSUVFRSBTdGQgODAyLjExYXgt
MjAyMSIsCisgKiBpdCBzaG93IDQgdHlwZXMgaW4gIlRhYmxlIDktMjc1YS1NYXhpbXVtIFRyYW5z
bWl0IFBvd2VyIEludGVycHJldGF0aW9uIHN1YmZpZWxkIGVuY29kaW5nIi4KKyAqIEFuZCBpdCBo
YXMgMiBjYXRlZ29yeSBmb3IgZWFjaCB0eXBlIGluICJUYWJsZSBFLTEyLVJlZ3VsYXRvcnkgSW5m
byBzdWJmaWVsZCBlbmNvZGluZyBpbiB0aGUgVW5pdGVkIFN0YXRlcyIuCisgKiBTbyBpdCBpdCB0
b3RhbGx5IG1heCA4IFRyYW5zbWl0IFBvd2VyIEVudmVsb3BlIGVsZW1lbnQuCisgKi8KKyNkZWZp
bmUgSUVFRTgwMjExX1RQRV9NQVhfSUVfQ09VTlQJOAorLyoqCisgKiBJbiAiVGFibGUgOS0yNzfi
gJRNZWFuaW5nIG9mIE1heGltdW0gVHJhbnNtaXQgUG93ZXIgQ291bnQgc3ViZmllbGQiCisgKiBv
ZiAiSUVFRSBTdGQgODAyLjExYXjihKLigJAyMDIxIiwgdGhlIG1heCBwb3dlciBsZXZlbCBpcyA4
LgorICovCisjZGVmaW5lIElFRUU4MDIxMV9NQVhfTlVNX1BXUl9MRVZFTAk4CisKKyNkZWZpbmUg
SUVFRTgwMjExX1RQRV9NQVhfUE9XRVJfQ09VTlQJOAorCisvKiB0cmFuc21pdCBwb3dlciBpbnRl
cnByZXRhdGlvbiB0eXBlIG9mIHRyYW5zbWl0IHBvd2VyIGVudmVsb3BlIGVsZW1lbnQqLworZW51
bSBpZWVlODAyMTFfdHhfcG93ZXJfaW50cnB0X3R5cGUgeworCUlFRUU4MDIxMV9UUEVfTE9DQUxf
RUlSUCwKKwlJRUVFODAyMTFfVFBFX0xPQ0FMX0VJUlBfUFNELAorCUlFRUU4MDIxMV9UUEVfUkVH
X0NMSUVOVF9FSVJQLAorCUlFRUU4MDIxMV9UUEVfUkVHX0NMSUVOVF9FSVJQX1BTRCwKK307CisK
Ky8qKgorICogc3RydWN0IGllZWU4MDIxMV90eF9wd3JfZW52CisgKgorICogVGhpcyBzdHJ1Y3R1
cmUgcmVwcmVzZW50cyB0aGUgIlRyYW5zbWl0IFBvd2VyIEVudmVsb3BlIGVsZW1lbnQiCisgKi8K
K3N0cnVjdCBpZWVlODAyMTFfdHhfcHdyX2VudiB7CisJdTggdHhfcG93ZXJfaW5mbzsKKwlzOCB0
eF9wb3dlcltJRUVFODAyMTFfVFBFX01BWF9QT1dFUl9DT1VOVF07Cit9IF9fcGFja2VkOworCisj
ZGVmaW5lIElFRUU4MDIxMV9UWF9QV1JfRU5WX0lORk9fQ09VTlQgMHg3CisjZGVmaW5lIElFRUU4
MDIxMV9UWF9QV1JfRU5WX0lORk9fSU5URVJQUkVUIDB4MzgKKyNkZWZpbmUgSUVFRTgwMjExX1RY
X1BXUl9FTlZfSU5GT19DQVRFR09SWSAweEMwCisKIC8qCiAgKiBpZWVlODAyMTFfaGVfb3Blcl9z
aXplIC0gY2FsY3VsYXRlIDgwMi4xMWF4IEhFIE9wZXJhdGlvbnMgSUUgc2l6ZQogICogQGhlX29w
ZXJfaWU6IGJ5dGUgZGF0YSBvZiB0aGUgSGUgT3BlcmF0aW9ucyBJRSwgc3RhdGluZyBmcm9tIHRo
ZSBieXRlCkBAIC0yODcxLDcgKzI5MDgsNyBAQCBlbnVtIGllZWU4MDIxMV9laWQgewogCVdMQU5f
RUlEX1ZIVF9PUEVSQVRJT04gPSAxOTIsCiAJV0xBTl9FSURfRVhURU5ERURfQlNTX0xPQUQgPSAx
OTMsCiAJV0xBTl9FSURfV0lERV9CV19DSEFOTkVMX1NXSVRDSCA9IDE5NCwKLQlXTEFOX0VJRF9W
SFRfVFhfUE9XRVJfRU5WRUxPUEUgPSAxOTUsCisJV0xBTl9FSURfVFhfUE9XRVJfRU5WRUxPUEUg
PSAxOTUsCiAJV0xBTl9FSURfQ0hBTk5FTF9TV0lUQ0hfV1JBUFBFUiA9IDE5NiwKIAlXTEFOX0VJ
RF9BSUQgPSAxOTcsCiAJV0xBTl9FSURfUVVJRVRfQ0hBTk5FTCA9IDE5OCwKLS0gCjIuMzEuMQoK
Ci0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
