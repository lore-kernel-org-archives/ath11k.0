Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356C9ECAAA1
	for <ath11k@archiver.kernel.org>; Mon, 12 Sep 2022 11:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmc77irmmm/oK+t61s2gYLwuQMDIt87yeHxtjIM/ZZM=; b=aomXFcovy59Vv8
	47UAlllvWgRNfcI5eAvstP5jV2fsBpowPPfOL7MfYtDjVsbnlSq3FQfJxw0jDyhHHPLsp1JNTlEVR
	0Dc+/zR44f6H9XzKNyojviHpLPwcqAvPlwVKxCO0oVYURdigCA0JVmU4792QmJvwA23kVKAvgv1dy
	cON+Rg7uGNjeMyyhpNVuedhRMaU8KyG6U+1hQHWc8y3QcUeMxA1B9tnByzW8z3BOqX3IJt2lGVc0X
	ZFeRpQf5lvdF+/OVLFWNRATGw52DWnc2KoHHqqn4V2FgYCyYeJ+/D6LnJTQxVMXW74YyUCC0hvkeO
	Hp6VVeiZdcWXltekcDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXhMh-009CLR-VS; Mon, 12 Sep 2022 11:12:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXhFm-0098BI-F7
	for ath11k@lists.infradead.org; Mon, 12 Sep 2022 11:05:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6691561199;
	Mon, 12 Sep 2022 11:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17F2C433D6;
	Mon, 12 Sep 2022 11:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662980724;
	bh=1jdBK1FYwxGWlVf8w771PuvsjoYlHEa5EkUVnGz8ZKQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KyxFCSdf/UPDgRM9F+OXgmYJ6YU2lxhOiETTtCjEyZqEaEWFThZXID76//ZbFK7l5
	 /WGv9ZrrlE7uHfpGj19+PxvAIiYOXwDU+fwWlqEDFFt5/Z1MBUx0XjSyuDyMiVuidG
	 rGOYqqUEONmEVXN0Ol6gBBQbtJ21+FVo1aLrTEWIJDifOJzwwmLNcDJ+vTM9fjsbo1
	 SB3KganF9lZtdzyuNy0GP4zNnM0TiixZUjWldmpTtIKXkE1O2a6MZdMjx/RA07xOoP
	 axY0XrBKGXemWDmDUbapc0slx0eXzQzXMEDzmrlmvxSm7W6UqIZc81xigQxHwfeuAU
	 Cn5RzAL3lK98w==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,  linux-wireless <linux-wireless@vger.kernel.org>,  <ath11k@lists.infradead.org>
Subject: Re: [PATCH] wifi: mac80211: RCU-ify link STA pointers
References: <24df3a0c-a312-d9b6-5840-1eacd79d824b@quicinc.com>
	<87a67498b4.fsf@kernel.org>
	<7199bd7d-b45c-5c72-576e-363ad37cce82@quicinc.com>
Date: Mon, 12 Sep 2022 14:05:19 +0300
In-Reply-To: <7199bd7d-b45c-5c72-576e-363ad37cce82@quicinc.com> (Wen Gong's
	message of "Mon, 12 Sep 2022 18:55:04 +0800")
Message-ID: <875yhs97kg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_040526_941777_FA0A9609 
X-CRM114-Status: GOOD (  14.33  )
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

V2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+IHdyaXRlczoKCj4gT24gOS8xMi8yMDIy
IDY6NDkgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+IFdlbiBHb25nIDxxdWljX3dnb25nQHF1aWNp
bmMuY29tPiB3cml0ZXM6Cj4+Cj4+PiBIaSBKb2hhbm5lcywKPj4+Cj4+PiBDdXJyZW50bHkgZm9y
IE1MTyB0ZXN0LCB0aGUgb3RoZXJzIGxpbmtzJ3MgcnhfbnNzIG9mIHN0cnVjdAo+Pj4gaWVlZTgw
MjExX2xpbmtfc3RhIGlzIHN0aWxsIHZhbHVlIDAgaW4gaWVlZTgwMjExX3NldF9hc3NvY2lhdGVk
KCksCj4+PiBiZWNhdWUgdGhleSBhcmUgbm90IHBhc3MgaW50byBpZWVlODAyMTFfc3RhX3NldF9y
eF9uc3MoKSBpbgo+Pj4gbWFjODAyMTEgZXhjZXB0IHRoZSBkZWZsaW5rIHdoaWNoIG1lYW5zIHRo
ZSBwcmltYXJ5IGxpbmsuCj4+PiBUaGlzIGxlYWQgZHJpdmVyIGdldCBuc3MgPSAwIGZvciBvdGhl
ciBsaW5rcy4gV2lsbCB5b3UgZml4IGl0Cj4+PiBvciBpcyBpdCBkZXNpZ24gYnkgZGVmYXVsdD8K
Pj4+Cj4+PiBPbmx5IHByaW1hcnkgbGluayBoYXMgdmFsaWQgcnhfbnNzIHZhbHVlIHdoaWNoIGlz
IG5vdCAwIGJ5IGJlbG93IGNhbGwgc3RhY2suCj4+PiBpZWVlODAyMTFfYXNzb2Nfc3VjY2Vzcygp
LT4KPj4+ICDCoMKgwqAgcmF0ZV9jb250cm9sX3JhdGVfaW5pdChzdGEpOwo+Pj4KPj4+IGNvbW1p
dDpjNzE0MjBkYjY1M2FiYTMwYTIzNGQxZTRjZjg2ZGRlMzc2ZTYwNGZhCj4+PiB3aWZpOiBtYWM4
MDIxMTogUkNVLWlmeSBsaW5rIFNUQSBwb2ludGVycwo+PiBTdHJhbmdlIGZvcm1hdCBhbmQgcy1v
LWIgbWlzc2luZy4gV2FzIHRoaXMgbWVhbnQgYXMgYW4gUkZDIHBhdGNoPwo+Cj4gVGhpcyBpcyBu
b3QgYSBwYXRjaCBmb3IgcmV2aWV3LCBpdCBpcyB0byBhc2sgc29tZSBxdWVzdGlvbiBhYm91dCB0
aGUgcGF0Y2gKPgo+ICJ3aWZpOiBtYWM4MDIxMTogUkNVLWlmeSBsaW5rIFNUQSBwb2ludGVycyIg
d2hpY2ggaXMgYWxyZWFkeSB1cHN0cmVhbS4KClRoZW4geW91IHNob3VsZCBub3QgYWRkICJbUEFU
Q0hdIiBpbiB0aGUgc3ViamVjdC4gVGhlIHN0cmluZyAiW1BBVENIXSIKaXMgc3VwcG9zZWQgdG8g
aW5mb3JtIHRoYXQgdGhlIGVtYWlsIGNvbnRhaW5zIGEgcGF0Y2ggd2hpY2ggc2hvdWxkIGJlCmFw
cGxpZWQuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdp
cmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9w
ZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBs
aXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
