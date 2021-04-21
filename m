Return-Path: <SRS0=XU0s=JS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B7FC433B4
	for <ath11k@archiver.kernel.org>; Wed, 21 Apr 2021 16:49:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8063B61454
	for <ath11k@archiver.kernel.org>; Wed, 21 Apr 2021 16:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8063B61454
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OIn2TzLS2D5mINWk092v77nmo/5hU4yUcl9DucjKT04=; b=oRrWMLpMLm6A7vIGK+7YbqbGh
	NoFwCa8eW7mpjk5Urs6aZJNB6K6Tl6vh8qiFtwf+xvDCP0E41phmnawsYCMc+mACixGZhSlaIehd/
	au/CVhUgplyg3QbzGrsgDt8Onr5cA4CsUmgGrYKgik25rX+FK+MdKKEfjyymMXRR5pQsWwISqnJRu
	vPveQDdzIQVzHfuddfumXouwW7mwEzarNo0YmufmexIHK2BHGycS3kWXXlK8gYMbnI23B1emlC14U
	8qk1BFDP9yQ4Nz37WiASTkfJRT+1zYNA/Jv8YvCqwP7jaU2cbEwBlUqyemSkJq+6k/QzG4x1vBoG1
	xcjPWSiig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZG2N-00Emdb-6a; Wed, 21 Apr 2021 16:49:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZG2K-00EmbN-S3
 for ath11k@desiato.infradead.org; Wed, 21 Apr 2021 16:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=b2vSrMuvPJjOMbW7n080LCHh9qe/uKyEaEDzIt6e9gY=; b=fuWxAOIO7rFFNG2T1iYVDoCeUj
 8stahf5N+KRmtJUJmlwhEV2d7ElKQ4/15zA9sUEnwbKSKqrKProsfWeZFNkGoieokK4siRgdIBd7/
 7NdY+qhk62ZzSxZvzZrO9TIISuSNoMna+b0ZF9e1OTJyxdR+nvqeyBAnKSZfVwExW7Paeh+0EOtw8
 C44KSQ/pYSlI3Ia0RmT6+YhNYka2FJeD6IKUSxgb1705IJB4yULiUMfn0TlZXD0kCIyiedNLnJAit
 2hQlXuYBwnSF8TPFlgnzZweZxJl/y8qqXZqDwfBaYfFCA5dzFMGHovVq/tms0hizwhzXOqFM6qiK8
 WSkI1SXQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZG2H-00D2Sn-Se
 for ath11k@lists.infradead.org; Wed, 21 Apr 2021 16:49:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619023749; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=b2vSrMuvPJjOMbW7n080LCHh9qe/uKyEaEDzIt6e9gY=;
 b=nRKxXVy3jZxN+QTyxfnRpexf11LlA+hE6XsFUH+KRNun0WgTuS2mO/vHeS6DApnqWXD1CxoS
 1kKlI0FEQJ4Og/VjCvnUPcKpw9mW8XuPbrf3aCNwKh9ybwRbj7ezTnhyrcfKzEKpRWHNdgz2
 BOl7cfvwiH1HmINwm06y8FSA33U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6080576f2cbba88980a7c6f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 16:48:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 14F39C4338A; Wed, 21 Apr 2021 16:48:47 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tmariyap)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B532AC433D3;
 Wed, 21 Apr 2021 16:48:46 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 21 Apr 2021 22:18:46 +0530
From: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCHv2] mac80211: increment rx stats according to USES_RSS flag
In-Reply-To: <c0aef41d2ecf09188de372fe4f7d6b1954e54e07.camel@sipsolutions.net>
References: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20210217_125904_154301_738B3086)
 <c0aef41d2ecf09188de372fe4f7d6b1954e54e07.camel@sipsolutions.net>
Message-ID: <1ee8d562986128767c037d20aedb96a5@codeaurora.org>
X-Sender: tmariyap@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_094910_149087_4D407AEA 
X-CRM114-Status: GOOD (  24.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wNC0wOCAxNTozMSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiBPbiBXZWQsIDIwMjEt
MDItMTcgYXQgMTc6MjYgKzA1MzAsIFRoaXJhdml5YW0gTWFyaXlhcHBhbiB3cm90ZToKPj4gQ3Vy
cmVudGx5LCByeF9zdGF0cyB3ZXJlIHVwZGF0ZWQgcmVnYXJkbGVzcyBvZiBVU0VTX1JTUyBmbGFn
IGlzCj4+IGVuYWJsZWQvZGlzYWJsZWQuIFNvLCB1cGRhdGluZyB0aGUgcnhfc3RhdHMgZnJvbSBw
ZXJjcHUgcG9pbnRlcnMKPj4gYWNjb3JkaW5nIHRvIHRoZSBVU0VTX1JTUyBmbGFnLgpUaGUgaXNz
dWUgaXMgcnggcGFja2V0cyBub3QgaW5jcmVtZW50ZWQgaW4gbWVzaCBsaW5rIGFuZCB0aGlzIGNo
YW5nZSAKbWFkZSB0bwpvdmVyY29tZSB0aGUgaXNzdWUuCj4gCj4gT0sgYWN0dWFsbHksIEknbSBu
b3QgZ29pbmcgdG8gZml4IHRoZSBjb21taXQgbG9nLCB5b3UnbGwgcHJvYmFibHkgaGF2ZQo+IHRv
IHJlc2VuZCBpdCBhbnl3YXkuCj4gCj4gCj4+IEBAIC00MjUsNyArNDI2LDggQEAgc3RhdGljIHZv
aWQgbWVzaF9zdGFfaW5mb19pbml0KHN0cnVjdCAKPj4gaWVlZTgwMjExX3N1Yl9pZl9kYXRhICpz
ZGF0YSwKPj4gwqAJCQkJCSZiYXNpY19yYXRlcyk7Cj4gCj4+IMKgCXNwaW5fbG9ja19iaCgmc3Rh
LT5tZXNoLT5wbGlua19sb2NrKTsKPj4gLQlzdGEtPnJ4X3N0YXRzLmxhc3RfcnggPSBqaWZmaWVz
Owo+PiArCXN0YXRzID0gaWVlZTgwMjExX2dldF9yeF9zdGF0cygmbG9jYWwtPmh3LCBzdGEpOwo+
PiArCXN0YXRzLT5sYXN0X3J4ID0gamlmZmllczsKPiAKPiBUaGlzIGRvZXNuJ3QgcmVhbGx5IG1h
a2UgbXVjaCBzZW5zZT8gTm90IHN1cmUgd2h5IHRoYXQgaXMgZXZlbiB1cGRhdGluZwo+IGFueXRo
aW5nIGF0IGFsbCwgaXQgZG9lc24ndCB1cGRhdGUgYW55dGhpbmcgZWxzZT8KPiAKPiBPciBhdCBs
ZWFzdCB5b3UgZGlkbid0IGNoYW5nZSBhbnl0aGluZyBlbHNlLCBtYXliZSB5b3Ugc2hvdWxkIGhh
dmU/Cj4+IAo+PiBAQCAtMTczNCw0OSArMTc0NSw0OSBAQCBpZWVlODAyMTFfcnhfaF9zdGFfcHJv
Y2VzcyhzdHJ1Y3QgCj4+IGllZWU4MDIxMV9yeF9kYXRhICpyeCkKPj4gwqAJICogc29tZXRoaW5n
IHdlbnQgd3JvbmcgdGhlIGZpcnN0IHRpbWUuCj4+IMKgCSAqLwo+PiDCoAlpZiAocngtPnNkYXRh
LT52aWYudHlwZSA9PSBOTDgwMjExX0lGVFlQRV9BREhPQykgewo+PiAtCQl1OCAqYnNzaWQgPSBp
ZWVlODAyMTFfZ2V0X2Jzc2lkKGhkciwgcngtPnNrYi0+bGVuLAo+PiArCQl1OCAqYnNzaWQgPSBp
ZWVlODAyMTFfZ2V0X2Jzc2lkKGhkciwgc2tiLT5sZW4sCj4gCj4gVGhhdCBzZWVtcyB1bnJlbGF0
ZWQuCj4gCj4+IEBAIC0zNjI1LDggKzM2NDgsMTAgQEAgaWVlZTgwMjExX3J4X2hfbWdtdChzdHJ1
Y3QgaWVlZTgwMjExX3J4X2RhdGEgCj4+ICpyeCkKPj4gwqAJLyogcXVldWUgdXAgZnJhbWUgYW5k
IGtpY2sgb2ZmIHdvcmsgdG8gcHJvY2VzcyBpdCAqLwo+PiDCoAlza2JfcXVldWVfdGFpbCgmc2Rh
dGEtPnNrYl9xdWV1ZSwgcngtPnNrYik7Cj4+IMKgCWllZWU4MDIxMV9xdWV1ZV93b3JrKCZyeC0+
bG9jYWwtPmh3LCAmc2RhdGEtPndvcmspOwo+PiAtCWlmIChyeC0+c3RhKQo+PiAtCQlyeC0+c3Rh
LT5yeF9zdGF0cy5wYWNrZXRzKys7Cj4+ICsJaWYgKHJ4LT5zdGEpIHsKPj4gKwkJc3RhdHMgPSBp
ZWVlODAyMTFfZ2V0X3J4X3N0YXRzKCZyeC0+c2RhdGEtPmxvY2FsLT5odywgcngtPnN0YSk7Cj4+
ICsJCXN0YXRzLT5wYWNrZXRzKys7Cj4+ICsJfQo+PiAKPiAKPiBQaWNraW5nIHRoaXMgZm9yIG5v
IHBhcnRpY3VsYXIgcmVhc29uIC0gZXZlcnl0aGluZyBlbHNlIGluIHRoaXMgcGF0Y2ggCj4gaXMK
PiB1bm5lY2Vzc2FyeSBzaW5jZSB3ZSBoYXZlIHJ4X3BhdGhfbG9jayBoZWxkIGFmYWljdCwgc28g
aXQgZG9lc24ndAo+IG1hdHRlci4gVGhlIHdob2xlIHBlci1jcHUgc3RhdHVzIHN0dWZmIG9ubHkg
bWF0dGVycyBvbmNlIHlvdSBnZXQgaW50bwo+IGZhc3QtcnggcGF0aC4KSW4gY2FzZSBvZiBNZXNo
IGZhc3RfcnggaXMgbm90IGFwcGxpY2FibGUsIGJ1dCBzdGlsbCBVU0VTX1JTUyBjYW4gYmUgCmVu
YWJsZWQgZnJvbSBkcml2ZXIKd2hlbiBwYXJhbGxlbCBSWCBpcyBzdXBwb3J0ZWQgYnkgSFcvRHJp
dmVyLCByaWdodD8gSGVuY2UgY2hlY2tlZCBmb3IgClVTRVNfUlNTIHN1cHBvcnQgdG8KdXBkYXRl
IHBlciBjcHUgc3RhdHMuUGxlYXNlIGNvcnJlY3QgbWUgaWYgdGhlIG1lYW5pbmcgb2YgVVNFU19S
U1MgaXMgCm1pc3VuZGVyc3Rvb2QgYW5kCml0IGFwcGxpZXMgb25seSB3aGVuIGZhc3RfcnggZm9y
IGEgU1RBIGlzIGVuYWJsZWQuCj4gCj4gCj4gSSdkIGFyZ3VlIHRoYXQgaGFkIHlvdSB3cml0dGVu
IGEgcHJvcGVyIGNvbW1pdCBsb2cgdGhhdCBhY3R1YWxseSBzYXlzCj4gd2h5IHlvdSBuZWVkIHRv
IGNoYW5nZSB0aGluZ3MsIHlvdSdkIHByb2JhYmx5IGV2ZW4gaGF2ZSBub3RpY2VkIHRoZXNlCj4g
aXNzdWVzIHlvdXJzZWxmLgo+IAo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAph
dGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2F0aDExawo=
