Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2203AC433F5
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMITH0YJzhLOqnn4EPtVgduOYKBr+uZXL2caeipJJPY=; b=caUDfjPd6uHdj8
	PABgIow5VcfFEGX7B6H+ZWFz/5sceoZ+8tDAdCb8kOAoTexuey+qehsZJvialjHQGlpBke6WHrc5K
	1B+Mnwaz2VS7HCUgDO4RjYXSz1FdROsOcLlihtjSupQmHe1nO2QDFwKq98Sp1YeB4HiasrXy8bKEY
	e0f7u8E//tjFoGdAlmIJCzI5TUF0NjZi0uiefkKnj9psvpW/5NHaZtGwFb0soGJSQ6VUB4P/Wg7/Q
	87fHtAH962n94aPDDlxwgUJ93BEoUFpj4DvD2BQuZTx+lOdur1ocYdZ8lAiqXd9sWAt+JMk+NSwok
	v9PCu6BpYKh4hvCMQWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTGE-00EfdO-5t; Wed, 30 Mar 2022 08:00:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTGB-00Efd0-JI
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 08:00:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1270B617DE;
 Wed, 30 Mar 2022 08:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C78C340EC;
 Wed, 30 Mar 2022 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648627254;
 bh=ORDiI6EBk7hUlaXQdKllqRuCPHcKMOAfSx/WzBEWdeM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=LzD35rcX7zm6Ex5B0YJCJODrQbVaSDhLM7XyG6jojbyCJIqir/hAqeVRl6rrbzWW1
 oduAOkrmeNYk8Zmfv58y/Xt+hTcsjalJAAezcdldZdQgl/Mwp1CHT5pI9ENt37gfvg
 aiXV2hvQQdWOjmzYVuYoykvlLinn5pRZNoHWjVoj81vFa8dZ5kY0EqdTci6HGCc1MJ
 eQS3kUqLMNlNGrx1WmINV9uP3lavjcmhrkBZg/kpuHjUvZ0D+75bL1IX85QEITFXwc
 ohcEZMP4DO8PsQ2rp/ly7hQ1VNwact96gqVpaUaEjDT6+0qaEKnhooXVnYFtFTkp8T
 B63tEOHeSzU8g==
From: Kalle Valo <kvalo@kernel.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: QCA6390 power saving issue
References: <a70aba8a-cce4-a84b-ea70-5761bde1cbe5@gmail.com>
Date: Wed, 30 Mar 2022 11:00:51 +0300
In-Reply-To: <a70aba8a-cce4-a84b-ea70-5761bde1cbe5@gmail.com> (Mark Herbert's
 message of "Tue, 29 Mar 2022 11:11:42 +0300")
Message-ID: <87pmm3x424.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_010055_976885_92EC85E6 
X-CRM114-Status: GOOD (  13.95  )
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

TWFyayBIZXJiZXJ0IDxtYXJrLmhlcmJlcnQ0MkBnbWFpbC5jb20+IHdyaXRlczoKCj4gSSByZW1l
bWJlciB0aGVyZSB3YXMgYSBidWcgcHJldmVudGluZyBDUFUgZW50ZXJpbmcgdG8gZGVlcCBwb3dl
cnNhdmluZwo+IHN0YXRlcyBzbyBvbmx5IFBDMyB3YXMgcmVhY2hlZC4KPgo+IFRoZSBidXQgaXRz
ZWxmIGlzIGZpeGVkIC0gYnV0IEkgaGF2ZSBqdXN0IG5vdGljZWQgYSBzbWFsbCByZW1haW5pbmcK
PiBpc3N1ZS4gV2hlbiBJIHN0YXJ0IG15IFBDIGFuZCB0aGVyZSBpcyBubyBXSUZJIHRoYXQgSSBj
YW4gY29ubmVjdCBzbwo+IGF0aDExwqAgaXMgZW5hYmxlZCBidXQgbm90IGNvbm5lY3RlZCB0byBh
bnkgbmV0d29yayAtIGl0IMKgIHByZXZlbnRzCj4gZW50ZXJpbmcgaW50byBkZWVwIFBDIHN0YXRl
cyBhZ2Fpbi4gV2hlbiBJIGNvbm5lY3QgdG8gdGhlIFdpRmkgbmV0d29yawo+IC0gCj4gZGVlcCBQ
QyBzdGF0ZXMgYmVjb21lIHJlYWNoYWJsZSBhZ2Fpbi4gQW5kIHdoZW4gSSBkaXNjb25uZWN0IGFm
dGVyCj4gZmlyc3QgY29ubmVjdGlvbsKgIGFuZCBrZWVwIG15IGF0aDExayBkaXNjb25uZWN0ZWQg
KGV4YWN0bHkgc2FtZQo+IHNpdHVhdGlvbiBhcyBpbW1lZGlhdGVseSBhZnRlciBib290KS0gdGhl
cmUgaXMgbm8gaXNzdWUuCj4KPiBTbyBzZWVtcyB0aGF0IHRoaXMgcG93ZXJzYXZpbmcgZmVhdHVy
ZSBpcyBub3QgYWN0aXZhdGVkIG9uIGJvb3QgYnV0Cj4gb25seSBhY3RpdmF0ZXMgd2hlbiB0aGUg
Y2FyZCBjb25uZWN0cyB0byBhY2Nlc3MgcG9pbnQuwqAgSSBhbSBub3QgZ29vZAo+IGVub3VnaCBp
biBkcml2ZXIgZGV2ZWxvcG1lbnQgYW5kIGRlc2lnbiBhIGZpeCBteXNlbGYuIFNvIGp1c3Qgd3Jp
dGluZwo+IGhlcmUKClNlZW1zIHZlcnkgcGxhdXNpYmxlIHRvIG1lLiBDYW4geW91IGZpbGUgdGhp
cyB0byBidWd6aWxsYSwgcGxlYXNlPwpFYXNpZXIgdG8gdHJhY2sgdGhhdCB3YXk6CgpodHRwczov
L3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aDExay9idWdyZXBv
cnQKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxl
c3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMv
ZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
