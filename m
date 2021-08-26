Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED01C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D94861027
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D94861027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtwpwV7WOz3C4CHPvllTIsYbUX3O+fezKXGPPif1zCc=; b=vpQrvecd88swyq
	qH7HNHGMdOnmv/SIwNdh4x3P/ZCE0ZenDDalgn0fkq6+NaJCGuymlj5hyHzHVDMVhkdczu94SfoNl
	TUZfhALJyMnkW9uRW7fLD/BhGSWLlT7Bsoa+UEQR9XkG4JTx+vzAjA4ZOz3XovqIF2+NKbY0cjyCs
	+YbtVmdlPIcfAqxbOA3snhZ9S8Nd/zTtvbP5dH8QrK2xUqWaHS+Mx1yEgV8W+4dmg7qajX+hincm5
	JGJopVej0HqVRup+lvlYoJs4zFgetzYhBybE6+BT7WXJIWoYX1viMrGzj5LhRYJbCN0nnVbSjU0f/
	aSvSftb3FbS4siB1JICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGYX-00AOPa-4H; Thu, 26 Aug 2021 14:40:37 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGYQ-00AOOy-Q0
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 14:40:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629988831; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=t/7pdKnzGnHtqh0EfJ4IWSTMUAVvbpMP0qmwvMti+T4=;
 b=GJXULE/F9q9obKH5UpMKUUvwie2AH22+v3za9WWXhNxex/6ns0lpbmgAtzXZ5HxeLXwUwA2l
 q0/TAa+4DFyCwktAGT0GGjkJdqDDqIEI9TbC0Qjrl6fVulYmQcI73mvY9BSYiKFbtjj7/WzD
 VuXez81n6KDE3iSotP9AvHwdae0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6127a7d8d15f4d68a2a0fabe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 14:40:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0FFBEC43460; Thu, 26 Aug 2021 14:40:24 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A17D5C4338F;
 Thu, 26 Aug 2021 14:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A17D5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mitchell Nordine <mail@mitchellnordine.com>
Cc: wi nk <wink@technolu.st>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 <87y29nefm7.fsf@codeaurora.org>
 <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
 <UUsN-OH9rM-606TuwUORGzSqrxv4eWc3pX5FYhYcS2eM9gpEG5NrqDgXKkhdkNDwdk_mEaoRoFhBlRahF_Pak_cI0YILecZzkAhEMfH6LZU=@mitchellnordine.com>
Date: Thu, 26 Aug 2021 17:40:18 +0300
In-Reply-To: <UUsN-OH9rM-606TuwUORGzSqrxv4eWc3pX5FYhYcS2eM9gpEG5NrqDgXKkhdkNDwdk_mEaoRoFhBlRahF_Pak_cI0YILecZzkAhEMfH6LZU=@mitchellnordine.com>
 (Mitchell Nordine's message of "Wed, 04 Aug 2021 13:06:25 +0000")
Message-ID: <87ilzs6zhp.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_074031_985336_B877EF54 
X-CRM114-Status: GOOD (  24.10  )
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

TWl0Y2hlbGwgTm9yZGluZSA8bWFpbEBtaXRjaGVsbG5vcmRpbmUuY29tPiB3cml0ZXM6Cgo+PiBJ
J3ZlIGJlZW4gcnVubmluZyA1LjEyIGFuZCA1LjEzIHdpdGhvdXQgV0lGSSBpc3N1ZXMuIE9jY2Fz
aW9uYWxseSBJCj4+IHN0aWxsIGhhdmUgYmx1ZXRvb3RoIHByb2JsZW1zIGFuZCB0aGUgaTkxNSBk
cml2ZXJzIGFyZSBjYXVzaW5nIHZpZGVvCj4+IGFydGlmYWN0cyByYW5kb21seSwgYnV0IHRoZSB3
aXJlbGVzcyBjb25uZWN0aW9uIHNlZW1zIHByZXR0eSBzb2xpZCBhdAo+PiB0aGlzIHBvaW50Lgo+
Cj4gVGhhbmtzIGZvciB0aGUgdWRwYXRlIQo+Cj4gUmVjZW50bHkgYSBjb2xsYWJvcmF0b3IgdXBk
YXRlZCB0aGUgYG5peG9zL25peG9zLWhhcmR3YXJlYCByZXBvJ3MKPiBrZXJuZWwgdmVyc2lvbiB0
byBgNS4xMi45YCBmb3IgdGhlIHhwcyA5MzEwIGFzIHdpZmkgYW5kIGJsdWV0b290aCBpcwo+IHdv
cmtpbmcgb3V0LW9mLXRoZS1ib3ggZm9yIHRoZW0gbm93LiBJIHdhcyBleGNpdGVkIHRvIHVwZGF0
ZSBhbmQgdHJ5Cj4gdGhpcyBteXNlbGYsIGhvd2V2ZXIgZGVzcGl0ZSBoYXZpbmcgdGhlIHNhbWUg
a2VybmVsIHZlcnNpb24gKDUuMTIuOSksCj4gdGhlIHNhbWUgcWNhNjM5MCBmdyB2ZXJzaW9uIChm
d192ZXJzaW9uIDB4MTAxYzA2Y2MgZndfYnVpbGRfdGltZXN0YW1wCj4gMjAyMC0wNi0yNCAxOTo1
MCkgYW5kIGFsbW9zdCB0aGUgc2FtZSBzeXN0ZW0gZmlybXdhcmUgdmVyc2lvbiAodGhlbQo+IDMu
MC4zLCBtZSAzLjAuNCkgSSdtIHJ1bm5pbmcgaW50byBhbiBpc3N1ZSB3aGVyZSBJIGdldCBzb21l
IGBxbWlgCj4gZXJyb3JzIGFuZCB0aGVuIHRoZSB3aWZpIGZpcm13YXJlIGVuZHMgdXAgY3Jhc2hp
bmcuIEhlcmUncyB0aGUKPiByZWxldmFudCBkbWVzZyBvdXRwdXQgb24gbXkgc3lzdGVtOgo+Cj4g
JCBkbWVzZyB8IGdyZXAgLWUgYXRoMTEKPiBbIDMuOTM3MTI5XSBhdGgxMWtfcGNpIDAwMDA6NzI6
MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0KPiAweGEyNTAwMDAwLTB4YTI1ZmZmZmYgNjRiaXRd
Cj4gWyAgICAzLjkzNzE0N10gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGVuYWJsaW5nIGRldmlj
ZSAoMDAwMCAtPiAwMDAyKQo+IFsgNC4yMDM1OTZdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBj
aGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIKPiBib2FyZF9pZCAweGZmIHNvY19pZCAweGZmZmZm
ZmZmCj4gWyA0LjIwNzAwNV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZ3X3ZlcnNpb24gMHgx
MDFjMDZjYwo+IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lk
Cj4gWyA5LjI5MTI4MV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IHFtaSBmYWlsZWQgc2V0IG1v
ZGUgcmVxdWVzdCwKPiBtb2RlOiAwLCBlcnIgPSAtMTEwCj4gWyAgICA5LjI5MTI5M10gYXRoMTFr
X3BjaSAwMDAwOjcyOjAwLjA6IHFtaSBmYWlsZWQgdG8gc2VuZCB3bGFuIGZ3IG1vZGU6LTExMAo+
IFsgICAgOS4yOTEyOTddIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQgdG8gYXR0YWNo
IHdtaTogLTExMAo+IFsgICAgOS4yOTEzMDVdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWls
ZWQgdG8gc3RhcnQgY29yZTogLTExMAo+IFsgICAyMC4yNTA3MjldIGF0aDExa19wY2kgMDAwMDo3
MjowMC4wOiBmaXJtd2FyZSBjcmFzaGVkOiBNSElfQ0JfU1lTX0VSUk9SCj4KPiBNeSBjb2xsYWJv
cmF0b3IncyBzeXN0ZW0gKHdob3NlIHdpZmkgaXMgd29ya2luZykgaGFzIHRoZSBzYW1lIG91dHB1
dCwKPiBidXQgd2l0aG91dCB0aGUgbGFzdCA1IGxpbmVzIG9mIGVycm9yczoKPgo+IH4gwrsgZG1l
c2cgfCBncmVwIC1lIGF0aDExCj4gWyAxOS44NzI1OTldIGF0aDExa19wY2kgMDAwMDo3MjowMC4w
OiBCQVIgMDogYXNzaWduZWQgW21lbQo+IDB4YTI1MDAwMDAtMHhhMjVmZmZmZiA2NGJpdF0KPiBb
ICAgMTkuODcyNjE3XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgw
MDAwIC0+IDAwMDIpCj4gWyAyMC4zODAxNjhdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBjaGlw
X2lkIDB4MCBjaGlwX2ZhbWlseSAweGIKPiBib2FyZF9pZCAweGZmIHNvY19pZCAweGZmZmZmZmZm
Cj4gWyAyMC4zODAxNzFdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmd192ZXJzaW9uIDB4MTAx
YzA2Y2MKPiBmd19idWlsZF90aW1lc3RhbXAgMjAyMC0wNi0yNCAxOTo1MCBmd19idWlsZF9pZAo+
Cj4gSGVyZSdzIHRoZWlyIFBSIHRoYXQgcmVtb3ZlcyB0aGUgcGF0Y2hlcyBhbmQgdXBkYXRlcyB0
byB0aGUgNS4xMgo+IGtlcm5lbC4gaHR0cHM6Ly9naXRodWIuY29tL05peE9TL25peG9zLWhhcmR3
YXJlL3B1bGwvMjk4Cj4KPiBJIGNoZWNrZWQgb3V0IHRoZSBidWcgcmVwb3J0IG1lbnRpb25lZCBi
eSBqdXN0aW4KPiAoaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0y
MTIwNTkpIGhvd2V2ZXIgaXQKPiBhcHBlYXJzIHRvIGJlIHVucmVsYXRlZC4uLiBhdCBsZWFzdCBJ
IGRvbid0IHNlZSBhbnkgb2YgdGhlIHNhbWUgYHFtaWAKPiBlcnJvcnMsIGFuZCB0aGVpciBmaXJt
d2FyZSBhdCBsZWFzdCBydW5zIGxvbmcgZW5vdWdoIHRoYXQgdGhleSBjYW4KPiBjb25uZWN0IHRv
IGEgMi40R0h6IG5ldHdvcmsuCj4KPiBBbnkgaWRlYXMgd2hhdCBtaWdodCBiZSBnb2luZyBvbiBo
ZXJlPwoKRGlkIHlvdSBzZXQgdGhlIG1lbW1hcCBwYXJhbWV0ZXIgZXhwbGFpbmVkIGluIFsxXS4g
SSBzdHJvbmdseSByZWNvbW1lbmQKZXZlcnlvbmUgdG8gc2V0IHRoZSBtZW1tYXAgdW50aWwgdGhl
IGZpcm13YXJlIGlzIGZpeGVkLgoKWzFdIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MjEwOTIzCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9y
Zy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
