Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11FFC636CC
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXWCpDScQasKQg6wISsrpzeYlJwFNXAhBSsJHTWGhjQ=; b=nq64twRjyidXE9
	klGAudyZr7APCWDF3EP8VxK8kEeIAQrpwLjWuAsyVSwifCXKLK4G0WuZkX5RMlurLvd082LCFEZgi
	68sMyoB5NSSpwp6y+q7XJf405YYnwqPcmnInl6VllrMHk6geQ6cZ68Bl6Cnd8kbpAsyWsu4HKu6i/
	/oXKSY1OxdziIFnJ578pQO5g96ES8Buao9ce0BvX9cwEALPCgk7zbyTL4t0wq5Zk5x9Pum9SOpYWe
	IRD2yxHZCIHAplgUu2qTRiJ1x0m7TmCgsCS0/jEGJx3EWSdBRbtFT/S4qYO4tlQJojYIEIimEY52R
	YhNb2IY7ShZQwj4W9KIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRdQp-00Fse2-2q; Mon, 13 Feb 2023 18:20:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRdQl-00Fscz-07
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 18:20:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EBD46121C;
	Mon, 13 Feb 2023 18:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F83C433EF;
	Mon, 13 Feb 2023 18:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676312397;
	bh=+nSmVIqceQOP3XOZIFOHSsu9Xtpv5k9IyO91zr3Z0oU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KYsGonICOTDUObgAA2zXbc0fBDScnB5//FjSXv91gOjgFRQ1hrTOpiGztxGBdZ5VB
	 rwmFJGwRDNm70E1rFZsJtgEgA359FPT9qGlTORmvZTxHsh8koeMdZyRvQvryIPtsze
	 4G2UUpn+Q0i+ywnBQObbkdCBc7Dcn0hDjjDLVhGE1Jm6twiv3hDTIkXD5Kv1gXQha+
	 AtV/YHXEze2TfpT0q2LFc2TBdxDvWH4bqV3xcroIGnf/LqdVO4SnovEmZCF0c5NnSN
	 3PhP/pu3ivzp8+Q5Y6FBTmCyRTp4XXqjPTE0kbPLicmUtNUiMaJZDMBlrxx6jkhv9S
	 aFf0JqhIDOipQ==
From: Kalle Valo <kvalo@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,  ath11k <ath11k@lists.infradead.org>
Subject: Re: Resume from hibernation fails due to ath11k_pci
References: <1263051271.53086.1674425560245.JavaMail.zimbra@nod.at>
	<873579wze8.fsf@kernel.org>
	<370539199.123516.1676291073661.JavaMail.zimbra@nod.at>
	<87pmadvj66.fsf@kernel.org>
	<1617726247.124241.1676294102295.JavaMail.zimbra@nod.at>
Date: Mon, 13 Feb 2023 20:19:53 +0200
In-Reply-To: <1617726247.124241.1676294102295.JavaMail.zimbra@nod.at> (Richard
	Weinberger's message of "Mon, 13 Feb 2023 14:15:02 +0100 (CET)")
Message-ID: <87lel1v35i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_101959_102916_5D815898 
X-CRM114-Status: GOOD (  15.72  )
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

UmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JpdGVzOgoKPiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImt2YWxvIiA8a3ZhbG9Aa2VybmVsLm9yZz4K
Pj4gSUlSQyB0aGUgaXNzdWUgaXMgdGhhdCBhdGgxMWsgZXhwZWN0cyB0aGUgZmlybXdhcmUgdG8g
YmUgcnVubmluZyBkdXJpbmcKPj4gc3VzcGVuZC4gQW5kIHRoaXMgd2FzIGJlY2F1c2Ugc2h1dHRp
bmcgZG93biB0aGUgZmlybXdhcmUgZm9yIHN1c3BlbmQKPj4gY2F1c2VkIHByb2JsZW1zIGluIHRo
ZSBNSEkgc3Vic3lzdGVtIGR1cmluZyByZXN1bWUuIFRvIGZpeCB0aGlzIEkKPj4gc3VzcGVjdCB3
ZSBuZWVkIGNoYW5nZXMgYm90aCBpbiBhdGgxMWsgYW5kIGluIHRoZSBNSEkgc3Vic3lzdGVtLCBz
byBub3QKPj4gZWFzeS4KPgo+IEhtLiBTbywgY3VycmVudGx5IHRoZSBkZXZpY2UgaXMgcHV0IGlu
dG8gV29XIG1vZGUgaW5zdGVhZCBvZiBwb3dlcmluZwo+IGl0IG9mZiBiZWNhdXNlIG9mIGlzc3Vl
cyBpbiB0aGUgTUhJIHN1YnN5c3RlbS4gQXQgbGVhc3QgdGhpcyBwYXRjaAo+IHNlcmllcyBpbmRp
Y2F0ZXMgc286Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzE2MDc3MDgxNTAtMjEwNjYt
MS1naXQtc2VuZC1lbWFpbC1rdmFsb0Bjb2RlYXVyb3JhLm9yZy8KPiAgCj4gT24gdGhlIG90aGVy
IGhhbmQsIG15IGRldmljZSBzZWVtcyB0byBoYXZlIHRyb3VibGUgd2l0aCB0aGF0IHdvcmthcm91
bmQuCj4gTWF5YmUgcG93ZXJpbmcgaXQgb2ZmIGNvbXBsZXRlbHkgaGVscHMuCj4KPiBEbyB5b3Ug
aGF2ZSBhIHBvaW50ZXIgdG8gc2FpZCBNSEkgaXNzdWVzPwoKTm8gcG9pbnRlcnMgYnV0IElJUkMg
aXQgd2FzIHNvbWV0aGluZyByZWxhdGVkIHRvIE1ISSBjcmVhdGluZyBhIHN0cnVjdApkZXZpY2Ug
aW4gYW4gaW52YWxpZCBjb250ZXh0IGFuZCBNSEkgZmFpbHMgYmVjYXVzZSBvZiB0aGF0LiBNYXli
ZSBpdCB3YXMKc28gdGhhdCB3aGVuIG1hYzgwMjExIGNhbGxzIGF0aDExa19tYWNfb3Bfc3RhcnQo
KSBkdXJpbmcgcmVzdW1lLCBhdGgxMWsKY2FsbGVkIE1ISSB0byBlbmFibGUgcG93ZXIgb24gdGhl
IGRldmljZSBhbmQgTUhJIHRyaWVzIHRvIGNyZWF0ZSBhCnN0cnVjdCBkZXZpY2UgYXQgdGhlIHNh
bWUgdGltZSwgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4gVGhpcyB3YXMgYSBsb25nCnRpbWUgYWdv
IHNvIG5vdCBzdXJlLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC13aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4v
ZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
