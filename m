Return-Path: <SRS0=LKqF=JF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A18AC433B4
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 10:01:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FD3861104
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 10:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FD3861104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HTGVtNcPPtmbbF+SRO7ZbBHXnICsxbPSAmvphzVxPt0=; b=K/1QqoO2UuMoJbocNOVjhFcNH
	0jZJwxg4BcipXXcuOHHIG1gmheLJWftO88HcF+/wordFAJ/Fiml/VZqgMQ4+y5yR8oFTsTTS1QWJu
	OGDS/mEvUXzvN/ppuZPlo9yUzHDl0ZlLryDZTueEaAJQ+OYrneEZrJXjSVR+Dnay5/Delkid+Ykf+
	2Mb52SjgL73w620zJ4HTfcKEEtfPBP71pBxZzUpU/0z+86vAmxeHndoSS0M/2cM+94aAf/Fd0tl5y
	TX+WHnij7Scj91uXDZkAsRX84NQUbbAMeg80vhmAfZk18WpVBnbUGcxB3Xrev9TYnN3sRKyH4Lok8
	clACILtFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lURTh-007aIQ-37; Thu, 08 Apr 2021 10:01:33 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lURTc-007aHm-Nq
 for ath11k@lists.infradead.org; Thu, 08 Apr 2021 10:01:30 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lURTb-008wq0-Fh; Thu, 08 Apr 2021 12:01:27 +0200
Message-ID: <c0aef41d2ecf09188de372fe4f7d6b1954e54e07.camel@sipsolutions.net>
Subject: Re: [PATCHv2] mac80211: increment rx stats according to USES_RSS flag
From: Johannes Berg <johannes@sipsolutions.net>
To: Thiraviyam Mariyappan <tmariyap@codeaurora.org>, 
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 08 Apr 2021 12:01:26 +0200
In-Reply-To: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20210217_125904_154301_738B3086)
References: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
 (sfid-20210217_125904_154301_738B3086)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_110129_054328_484065E3 
X-CRM114-Status: GOOD (  15.35  )
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

T24gV2VkLCAyMDIxLTAyLTE3IGF0IDE3OjI2ICswNTMwLCBUaGlyYXZpeWFtIE1hcml5YXBwYW4g
d3JvdGU6Cj4gQ3VycmVudGx5LCByeF9zdGF0cyB3ZXJlIHVwZGF0ZWQgcmVnYXJkbGVzcyBvZiBV
U0VTX1JTUyBmbGFnIGlzCj4gZW5hYmxlZC9kaXNhYmxlZC4gU28sIHVwZGF0aW5nIHRoZSByeF9z
dGF0cyBmcm9tIHBlcmNwdSBwb2ludGVycwo+IGFjY29yZGluZyB0byB0aGUgVVNFU19SU1MgZmxh
Zy4KCk9LIGFjdHVhbGx5LCBJJ20gbm90IGdvaW5nIHRvIGZpeCB0aGUgY29tbWl0IGxvZywgeW91
J2xsIHByb2JhYmx5IGhhdmUKdG8gcmVzZW5kIGl0IGFueXdheS4KCgo+IEBAIC00MjUsNyArNDI2
LDggQEAgc3RhdGljIHZvaWQgbWVzaF9zdGFfaW5mb19pbml0KHN0cnVjdCBpZWVlODAyMTFfc3Vi
X2lmX2RhdGEgKnNkYXRhLAo+IMKgCQkJCQkmYmFzaWNfcmF0ZXMpOwoKPiDCoAlzcGluX2xvY2tf
YmgoJnN0YS0+bWVzaC0+cGxpbmtfbG9jayk7Cj4gLQlzdGEtPnJ4X3N0YXRzLmxhc3RfcnggPSBq
aWZmaWVzOwo+ICsJc3RhdHMgPSBpZWVlODAyMTFfZ2V0X3J4X3N0YXRzKCZsb2NhbC0+aHcsIHN0
YSk7Cj4gKwlzdGF0cy0+bGFzdF9yeCA9IGppZmZpZXM7CgpUaGlzIGRvZXNuJ3QgcmVhbGx5IG1h
a2UgbXVjaCBzZW5zZT8gTm90IHN1cmUgd2h5IHRoYXQgaXMgZXZlbiB1cGRhdGluZwphbnl0aGlu
ZyBhdCBhbGwsIGl0IGRvZXNuJ3QgdXBkYXRlIGFueXRoaW5nIGVsc2U/CgpPciBhdCBsZWFzdCB5
b3UgZGlkbid0IGNoYW5nZSBhbnl0aGluZyBlbHNlLCBtYXliZSB5b3Ugc2hvdWxkIGhhdmU/Cj4g
Cj4gQEAgLTE3MzQsNDkgKzE3NDUsNDkgQEAgaWVlZTgwMjExX3J4X2hfc3RhX3Byb2Nlc3Moc3Ry
dWN0IGllZWU4MDIxMV9yeF9kYXRhICpyeCkKPiDCoAkgKiBzb21ldGhpbmcgd2VudCB3cm9uZyB0
aGUgZmlyc3QgdGltZS4KPiDCoAkgKi8KPiDCoAlpZiAocngtPnNkYXRhLT52aWYudHlwZSA9PSBO
TDgwMjExX0lGVFlQRV9BREhPQykgewo+IC0JCXU4ICpic3NpZCA9IGllZWU4MDIxMV9nZXRfYnNz
aWQoaGRyLCByeC0+c2tiLT5sZW4sCj4gKwkJdTggKmJzc2lkID0gaWVlZTgwMjExX2dldF9ic3Np
ZChoZHIsIHNrYi0+bGVuLAoKVGhhdCBzZWVtcyB1bnJlbGF0ZWQuCgo+IEBAIC0zNjI1LDggKzM2
NDgsMTAgQEAgaWVlZTgwMjExX3J4X2hfbWdtdChzdHJ1Y3QgaWVlZTgwMjExX3J4X2RhdGEgKnJ4
KQo+IMKgCS8qIHF1ZXVlIHVwIGZyYW1lIGFuZCBraWNrIG9mZiB3b3JrIHRvIHByb2Nlc3MgaXQg
Ki8KPiDCoAlza2JfcXVldWVfdGFpbCgmc2RhdGEtPnNrYl9xdWV1ZSwgcngtPnNrYik7Cj4gwqAJ
aWVlZTgwMjExX3F1ZXVlX3dvcmsoJnJ4LT5sb2NhbC0+aHcsICZzZGF0YS0+d29yayk7Cj4gLQlp
ZiAocngtPnN0YSkKPiAtCQlyeC0+c3RhLT5yeF9zdGF0cy5wYWNrZXRzKys7Cj4gKwlpZiAocngt
PnN0YSkgewo+ICsJCXN0YXRzID0gaWVlZTgwMjExX2dldF9yeF9zdGF0cygmcngtPnNkYXRhLT5s
b2NhbC0+aHcsIHJ4LT5zdGEpOwo+ICsJCXN0YXRzLT5wYWNrZXRzKys7Cj4gKwl9Cj4gCgpQaWNr
aW5nIHRoaXMgZm9yIG5vIHBhcnRpY3VsYXIgcmVhc29uIC0gZXZlcnl0aGluZyBlbHNlIGluIHRo
aXMgcGF0Y2ggaXMKdW5uZWNlc3Nhcnkgc2luY2Ugd2UgaGF2ZSByeF9wYXRoX2xvY2sgaGVsZCBh
ZmFpY3QsIHNvIGl0IGRvZXNuJ3QKbWF0dGVyLiBUaGUgd2hvbGUgcGVyLWNwdSBzdGF0dXMgc3R1
ZmYgb25seSBtYXR0ZXJzIG9uY2UgeW91IGdldCBpbnRvCmZhc3QtcnggcGF0aC4KCgpJJ2QgYXJn
dWUgdGhhdCBoYWQgeW91IHdyaXR0ZW4gYSBwcm9wZXIgY29tbWl0IGxvZyB0aGF0IGFjdHVhbGx5
IHNheXMKd2h5IHlvdSBuZWVkIHRvIGNoYW5nZSB0aGluZ3MsIHlvdSdkIHByb2JhYmx5IGV2ZW4g
aGF2ZSBub3RpY2VkIHRoZXNlCmlzc3VlcyB5b3Vyc2VsZi4KCmpvaGFubmVzCgoKLS0gCmF0aDEx
ayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
