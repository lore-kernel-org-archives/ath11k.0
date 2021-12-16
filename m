Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC0EC4332F
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Acb7ana2O7Pgt9rGOC1oQ/H4pBsa10aKyctF+4IbvWY=; b=BB3Vu0G+CnLi7L
	XQxlFEJsayHbOYIrLPB9wfERth/aEPCHOIJy9btn4zXiE5VT6JF614eJWpTDHd1SoYya7pY7I29f5
	R5RPdHimdQmq+1LQVqnHRTXUja2yH0sGzl7IvLxaILcynf90EWfDORRWP5IreZZLh+kPjR8WzMPde
	lipRGdw5I9ohy4z/MhVIigQ29oSzbQiu06U9Brme8sxPeuYewbqdIuKRtxpnnfcpmvp4sUQMhIMqk
	lpPEa+DPVRjviVnBKmchcQpXMF29iMJzb0RanwOeMk3NdpA1p92N99Q5QIDLdIPrGi9wPvK/a85eG
	LoGQOLlp8lItvdpM0yzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxnr9-004oq0-Qt; Thu, 16 Dec 2021 10:19:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxnr6-004ooD-Ma
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 10:19:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EEC761C61;
 Thu, 16 Dec 2021 10:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB68C36AE2;
 Thu, 16 Dec 2021 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639649959;
 bh=PDpeqXOT2HlE/bj1xLfwgQv6NYNI9hxiVrFqrx8ObXM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=hnGXbstmJpsC+yrkeBHwWoJCqQ6ibPN+WG8e4h2IHNTva1AjdV87yP7919NGM358Q
 W7EZJahvueWw6QdVNZh81mBLAbwKWLMUT2Erv78OXm5NqPxAfwAp4KRHsGqCYihjL7
 3H9mY63CZCAi70rO7epfOr7fxdq9dpV4zHt9EIo0KjVhVMOJXcuoeDh846yNnMYmLx
 iBoN98UaQJjrO86nlcSUc/xmdX7alxUgbA3P4uSgn8y/MTuPATCBsDKkcdj/HuL1vH
 /BjZ1ccJh1ywyDyIDOl5o4amLo3J3GlP3rg7Swjm7KoCBSnPiLtzuzNpsPVCDoBOTK
 x904wYxXaDicA==
From: Kalle Valo <kvalo@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Hemant Kumar <hemantk@codeaurora.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Richard Hughes <hughsient@gmail.com>, ath11k@lists.infradead.org
Subject: Re: [RFC] bus: mhi: core: Load firmware asynchronous
References: <20211210161645.10925-1-linux@weissschuh.net>
Date: Thu, 16 Dec 2021 12:19:10 +0200
In-Reply-To: <20211210161645.10925-1-linux@weissschuh.net> ("Thomas
 \=\?utf-8\?Q\?Wei\=C3\=9Fschuh\=22's\?\= message of "Fri, 10 Dec 2021 17:16:45
 +0100")
Message-ID: <87k0g4n97l.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_021920_829840_D6625733 
X-CRM114-Status: GOOD (  16.01  )
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

VGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PiB3cml0ZXM6Cgo+IFRoaXMg
Z2l2ZXMgdXNlcnNwYWNlIHRoZSBwb3NzaWJpbGl0eSB0byBwcm92aWRlIHRoZSBmaXJlaG9zZSBi
b290bG9hZGVyCj4gdmlhIHRoZSBzeXNmcy1maXJtd2FyZS1BUEkgaW5zdGVhZCBvZiBoYXZpbmcg
dG8gbW9kaWZ5IHRoZSBnbG9iYWwKPiBmaXJtd2FyZSBsb2FkcGF0aC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KPgo+IC0tLQo+Cj4g
UGxlYXNlIG5vdGUgdGhhdCB0aGlzIGlzIG5vdCB0ZXN0ZWQgeWV0LCBhcyBJIGRvbid0IGhhdmUg
YWNjZXNzIHRvIGEgbWF0Y2hpbmcKPiBmaXJtd2FyZSBmaWxlLgo+IFRoaXMgc3VibWlzc2lvbiBp
cyB0byBnYXRoZXIgZ2VuZXJhbCBmZWVkYmFjayBmcm9tIHRoZSBtYWludGFpbmVycyBhbmQgdGhl
bgo+IFJpY2hhcmQgd2lsbCBkbyB0aGUgYWN0dWFsIHRlc3RpbmcsIHdoaWxlIEknbGwgZG8gdGhl
IGRldmVsb3BtZW50Lgo+Cj4gVGhpcyBwYXRjaCBpcyBzaG91bGQgbm90IGhhdmUgYW55IGltcGFj
dCBiZXlvbmQgbW92aW5nIGZyb20gcmVxdWVzdF9maXJtd2FyZSgpCj4gdG8gcmVxdWVzdF9maXJt
d2FyZV9ub3dhaXQoKSBhbmQgdGhlIGludm9sdmVkIGNvZGUgcmVzaHVmZmxlLgoKUmVsYXRlZCB0
byBmaXJtd2FyZSBsb2FkaW5nLCBmb3IgYXRoMTFrIEkgaGF2ZSBhIGRpZmZlcmVudCBraW5kIG9m
IG5lZWQKZm9yIGZpcm13YXJlIGhhbmRsaW5nIGluIE1ISS4gSW5zdGVhZCBvZiBwcm92aWRpbmcg
dGhlIGZpcm13YXJlIG5hbWUgdG8KTUhJIGFuZCBNSEkgc3VieXN0ZW0gbG9hZGluZyB0aGUgZmly
bXdhcmUgZnJvbSB1c2VyIHNwYWNlLCBJIHdvdWxkIGxpa2UKdG8gYXRoMTFrIGxvYWQgdGhlIGZp
cm13YXJlIGZyb20gdXNlciBzcGFjZSBhbmQganVzdCBwcm92aWRlIGEgcG9pbnRlcgp0byB0aGUg
ZmlybXdhcmUgZGF0YS4KClRoZSBsb25nIHN0b3J5IGhlcmUgaXMgdGhhdCBjdXJyZW50bHkgYXRo
MTFrIHBjaSBkZXZpY2VzIGhhdmUgdHdvCmRpZmZlcmVudCBmaXJtd2FyZSBmaWxlcywgYW1zcy5i
aW4gYW5kIG0zLmJpbi4gYW1zcy5iaW4gaXMgbG9hZGVkIHZpYQpNSEkgYW5kIG0zLmJpbiB2aWEg
UU1JLiBXaGF0IEkgd291bGQgbGlrZSBkbyBpcyB0byBjcmVhdGUgb25lIGNvbnRhaW5lcgpmaWxl
IGZpcm13YXJlLTIuYmluIGFuZCBpdCB3b3VsZCBjb250YWluIGFtc3MuYmluLCBtMy5iaW4gYW5k
IHZhcmlvdXMKbWV0YSBkYXRhIG5lZWRlZCBieSBhdGgxMWsuIGF0aDExayB3b3VsZCB0aGVuIHBh
cnNlIGZpcm13YXJlLTIuYmluIGFuZApwcm92aWRlIHBvaW50ZXIgdG8gYW1zcy5iaW4gZGF0YSBm
b3IgTUhJLgoKV2UgYWxyZWFkeSB1c2Ugc2ltaWxhciBmaXJtd2FyZS0yLmJpbiBmaWxlIGluIGF0
aDEwaywgYnV0IG9mIGNvdXJzZQphdGgxMGsgZG9lc24ndCBuZWVkIE1ISSBzbyB0aGlzIGhhc24n
dCBiZWVuIGFuIGlzc3VlIGJlZm9yZS4gV2UgbmVlZApmaXJtd2FyZS0yLmJpbiBmaWxlcyBiZWNh
dXNlIG9mIHR3byByZWFzb25zOiBzZWFtbGVzcyBiYWNrd2FyZHMKY29tcGF0aWJpbGl0eSBhbmQg
YSByZWxpYWJsZSB3YXkgdG8gcHJvdmlkZSBtZXRhIGRhdGEgdG8gdGhlIGRyaXZlci4KClRob3Vn
aHRzIGFib3V0IHRoaXM/CgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9l
bi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsg
bWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
