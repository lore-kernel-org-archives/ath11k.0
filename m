Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E42CEB8FAF
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Z/PnTaDBCq7Si8iWdGbWd1KkT34U0dCZzk5o+FIgx0=; b=gc12gu3mMsoCd7
	zaO7VvLiZ4/JEM6Q9BbgUtlp+/6lQamshBm+3kbKP1u3WWAWK9QSBxb6K/pJzBM34C2pYA7ELD2Am
	83YOzm4quqBmba/4rs8G7jOh2+IwTZxePusGfEprZG+I99ndBw7ZHQgntoLeCRnHiOc2PKir0zo7z
	gF6/aGYA9HASz8w2CmQpUwIO4TXxldXJTPI+5LFrGiplZsKOtJUF55mQET1P8qI1ULcQiAICDrvRs
	hwtdftSTk+fsE+2RCx739MZWzE1YY8Gg96jbTBJjiPa60YBClxlBu/7YMUFDw6cPUVVozgxpXeJr6
	aKWYgDFzSXWzUGhGnhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdo5y-007ldd-2r;
	Wed, 06 Sep 2023 08:41:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdo5x-007ldJ-2v
	for ath11k@bombadil.infradead.org;
	Wed, 06 Sep 2023 08:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YUFebss2i1howj2H2bCpkSr1yD1P7RCpTR6z4A7omOE=; b=fxXK4Jeyv2gSPVI2P5/a6ledPl
	9nPUD2VP/sVU8WQs3WkCQQrOLbV2soudrfh86alFzuEmg1ft80tMiKpO+xHr2BdtAIRa6Qos5nfH1
	UwXDQl6yyGxsAEqnOL//n5ayzCm3qX76yHZ8SNTvh2MB+omUeCapg3mjb/fzP+p7AkwQpCI1WCpCw
	YsA2pZi02K9hsNsw7V4UuqxEokoFAxRg/NchhZ4o6hFtvfKI+qkzW5BmK7zyk4O5aPb57gpiopPNB
	WcnOLpPJogVutZt1AlOVK7i/ost2sY8A4dIDsPPpdYCW6q220hg1PIRh0OMcDvzgR+huG7TmMuJxR
	8KOIx1wg==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdo5s-000zKx-17
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 08:41:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8238BB818C2;
	Wed,  6 Sep 2023 08:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D520CC433C9;
	Wed,  6 Sep 2023 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693989656;
	bh=33osJvMi9BkVlhAaa6FIokdBDnUZlNZzV6kbO/dmsVI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qXSpfDQOyB1xWgYrcNz+6QSgQyCR06Yj44CINKaWehowHXiUO73ng8lfQD0d2Jpoj
	 wqHa7F3iZl7r0mzZIOu8Npa4pa9ZU/Qqssm7fcr6nWHRkT1aH7RSDg7gUeKcVp7EH6
	 dZsxh/Paw9NOLeWCrgtA8ps8tS3Va+53HBzYUaQZA/oBzj/yg96aBdGgGATzXa4T/k
	 gUQE6g+sDDTpHu4E6sRzJHM3uRN0AhxEzO0JyCErPqdh8hkiuOvDyZGiBODWbN/DJQ
	 02E2qr4cQGvwmYdHBbfLNm9v8oxAd2hJXhmWOn8lAYZ9ALF7QU+T3QtYGQAdcK7uXt
	 3ErZC2knqhscA==
From: Kalle Valo <kvalo@kernel.org>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,  linux-pci@vger.kernel.org,
  linux-kernel@vger.kernel.org,  ath11k@lists.infradead.org,
  regressions@lists.linux.dev
Subject: Re: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
References: <878r9sga1t.fsf@kernel.org>
	<CAG7k0Epk6KJvoDJKVc86sc_ems3DTbKvPLouBzOoVvn1tZwQ=w@mail.gmail.com>
Date: Wed, 06 Sep 2023 11:40:52 +0300
In-Reply-To: <CAG7k0Epk6KJvoDJKVc86sc_ems3DTbKvPLouBzOoVvn1tZwQ=w@mail.gmail.com>
	(Ross Lagerwall's message of "Tue, 5 Sep 2023 17:28:38 +0100")
Message-ID: <87o7ifelt7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_094102_019130_BD862E58 
X-CRM114-Status: GOOD (  17.64  )
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

Um9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNsb3VkLmNvbT4gd3JpdGVzOgoKPiBPbiBX
ZWQsIEF1ZyAzMCwgMjAyMyBhdCAxMDoyMeKAr0FNIEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4+Cj4+IEkgbm90aWNlZCB0aGF0IHN0YXJ0aW5nIGZyb20gdjYuNS1yYzEg
bXkgYXRoMTFrIHRlc3RzIHJlcG9ydGVkIHNldmVyYWwKPj4gbWVtb3J5IGxlYWtzIGZyb20gc3dh
cHBlci8wOgo+Pgo+PiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEwYTAyYjdhOCAoc2l6
ZSA5Nik6Cj4+ICAgY29tbSAic3dhcHBlci8wIiwgcGlkIDEsIGppZmZpZXMgNDI5NDY3MTgzOCAo
YWdlIDk4LjEyMHMpCj4+ICAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKPj4gICAgIDgwIGI4
IDAyIDBhIDgxIDg4IGZmIGZmIGI4IDcyIDA3IDAwIDAwIGM5IGZmIGZmICAuLi4uLi4uLi5yLi4u
Li4uCj4+ICAgICBjOCBiNyAwMiAwYSA4MSA4OCBmZiBmZiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAgLi4uLi4uLi4uLi4uLi4uLgo+PiAgIGJhY2t0cmFjZToKPj4gdW5yZWZlcmVuY2VkIG9iamVj
dCAweGZmZmY4ODgxMGEwMmI4ODAgKHNpemUgOTYpOgo+PiAgIGNvbW0gInN3YXBwZXIvMCIsIHBp
ZCAxLCBqaWZmaWVzIDQyOTQ2NzE4MzggKGFnZSA5OC4xMjBzKQo+PiAgIGhleCBkdW1wIChmaXJz
dCAzMiBieXRlcyk6Cj4+ICAgICA1OCBiOSAwMiAwYSA4MSA4OCBmZiBmZiBhOCBiNyAwMiAwYSA4
MSA4OCBmZiBmZiAgWC4uLi4uLi4uLi4uLi4uLgo+PiAgICAgYTAgYjggMDIgMGEgODEgODggZmYg
ZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KPj4gICBiYWNrdHJh
Y2U6Cj4+IHVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTBhMDJiOTU4IChzaXplIDk2KToK
Pj4gICBjb21tICJzd2FwcGVyLzAiLCBwaWQgMSwgamlmZmllcyA0Mjk0NjcxODM4IChhZ2UgOTgu
MTIwcykKPj4gICBoZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOgo+PiAgICAgMzAgYmEgMDIgMGEg
ODEgODggZmYgZmYgODAgYjggMDIgMGEgODEgODggZmYgZmYgIDAuLi4uLi4uLi4uLi4uLi4KPj4g
ICAgIDc4IGI5IDAyIDBhIDgxIDg4IGZmIGZmIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB4Li4u
Li4uLi4uLi4uLi4uCj4+ICAgYmFja3RyYWNlOgo+PiB1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZm
Zjg4ODEwYTAyYmEzMCAoc2l6ZSA5Nik6Cj4+ICAgY29tbSAic3dhcHBlci8wIiwgcGlkIDEsIGpp
ZmZpZXMgNDI5NDY3MTgzOCAoYWdlIDk4LjEyMHMpCj4+ICAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5
dGVzKToKPj4gICAgIDA4IGJiIDAyIDBhIDgxIDg4IGZmIGZmIDU4IGI5IDAyIDBhIDgxIDg4IGZm
IGZmICAuLi4uLi4uLlguLi4uLi4uCj4+ICAgICA1MCBiYSAwMiAwYSA4MSA4OCBmZiBmZiAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAgUC4uLi4uLi4uLi4uLi4uLgo+PiAgIGJhY2t0cmFjZToKPj4g
dW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMGEwMmJiMDggKHNpemUgOTYpOgo+PiAgIGNv
bW0gInN3YXBwZXIvMCIsIHBpZCAxLCBqaWZmaWVzIDQyOTQ2NzE4MzggKGFnZSA5OC4xMjBzKQo+
PiAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6Cj4+ICAgICBlMCBiYiAwMiAwYSA4MSA4OCBm
ZiBmZiAzMCBiYSAwMiAwYSA4MSA4OCBmZiBmZiAgLi4uLi4uLi4wLi4uLi4uLgo+PiAgICAgMjgg
YmIgMDIgMGEgODEgODggZmYgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgICguLi4uLi4uLi4u
Li4uLi4KPj4gICBiYWNrdHJhY2U6Cj4+Cj4+IEkgY2FuIGVhc2lseSByZXByb2R1Y2UgdGhpcyBi
eSBkb2luZyBhIHNpbXBsZSBpbnNtb2QgYW5kIHJtbW9kIG9mIGF0aDExawo+PiBhbmQgaXQncyBk
ZXBlbmRlbmNpZXMgKG1hYzgwMjExLCBNSEkgZXRjKS4gSSBjYW4gcmVsaWFiaWxpdHkgcmVwcm9k
dWNlCj4+IHRoZSBsZWFrcyBidXQgSSBvbmx5IHNlZSB0aGVtIG9uY2UgYWZ0ZXIgYSBib290LCBJ
IG5lZWQgdG8gcmVib290IHRoZQo+PiBob3N0IHRvIHNlZSB0aGUgbGVha3MgYWdhaW4uIHY2LjQg
aGFzIG5vIGxlYWtzLgo+Pgo+PiBJIGRpZCBhIGJpc2VjdCBhbmQgZm91bmQgdGhlIGNvbW1pdCBi
ZWxvdy4gSSB2ZXJpZmllZCByZXZlcnRpbmcgdGhlCj4+IGNvbW1pdCBtYWtlcyB0aGUgbGVha3Mg
Z28gYXdheS4KPj4KPj4gY29tbWl0IGU1NDIyMzI3NWJhMWJjNmY3MDRhNmJhYjAxNWZjZDJhZTRm
NzI1NzIKPj4gQXV0aG9yOiAgICAgUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJp
eC5jb20+Cj4+IEF1dGhvckRhdGU6IFRodSBNYXkgMjUgMTY6MzI6NDggMjAyMyArMDEwMAo+PiBD
b21taXQ6ICAgICBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+PiBDb21taXRE
YXRlOiBGcmkgSnVuIDkgMTU6MDY6MTYgMjAyMyAtMDUwMAo+Pgo+PiAgICAgUENJOiBSZWxlYXNl
IHJlc291cmNlIGludmFsaWRhdGVkIGJ5IGNvYWxlc2NpbmcKPgo+IEhpIEthbGxlLAo+Cj4gSSBj
YW4ndCByZXByb2R1Y2UgdGhlIGxlYWsgYnkgbG9hZGluZy91bmxvYWRpbmcgdGhlIGF0aDExayBt
b2R1bGUuIEkgc3VzcGVjdAo+IHRoYXQgdGhlIGxlYWsgaXMgYWx3YXlzIHRoZXJlIHdoZW4gUENJ
IHJlc291cmNlcyBhcmUgY29hbGVzY2VkIGJ1dAo+IGttZW1sZWFrIGRvZXNuJ3Qgbm90aWNlIHVu
dGlsIGF0aDExayBpcyBsb2FkZWQuCj4KPiBDYW4geW91IHBsZWFzZSB0cnkgdGhlIGZvbGxvd2lu
ZyB0byBjb25maXJtIGl0IGZpeGVzIGl0PwoKSSBydW4gdmFyaW91cyB0ZXN0cyB3aXRoIHlvdXIg
cGF0Y2ggYW5kIEkgZG9uJ3Qgc2VlIGxlYWtzIGFueW1vcmUuIEkKYWxzbyB2ZXJpZWQgdGhhdCB3
aXRob3V0IHlvdXIgcGF0Y2ggSSBzZWUgdGhlIGxlYWsgaW1tZWRpYXRlbHkuCgpUaGFua3MgZm9y
IGZpeGluZyB0aGlzIHNvIHF1aWNrbHksIGl0IHdvdWxkIGdvb2QgdG8gaGF2ZSB0aGlzIGZpeCBp
bgp2Ni42IGlmIHBvc3NpYmxlLgoKVGVzdGVkLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwu
b3JnPgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJl
bGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVy
cy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
