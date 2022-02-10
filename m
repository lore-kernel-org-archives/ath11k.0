Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58EBC433F5
	for <ath11k@archiver.kernel.org>; Thu, 10 Feb 2022 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBjfrgHuzmem8nTrOMP1dwc8JP6zQjEswdiCiLWuATE=; b=WcobqoYfjAptBz
	BUKruqCMftiuM+6WDW2HNQ3izVawpQ7/xxDnWW/mcOMY9lw5+sTitd8cNIQGe1feQ9QuE+FwHzvZX
	Xcokvf9fruMiZz3coJmBXHVSerUYuEDHfzrmaKbf1LJihFoSIFftgyyONyPxIL2Fdx4MIFApvFAhQ
	WpXAVpvQMHP5qwuYAhp/fqAz3peaaPZznOxKq+f2xVZQjVckfmnwIvbmLyJaJk1IIQwJSiHU6EB2u
	a1qH4i5nq7Yot+pzrDlQuHv8avfvKs/1Ut3EWkfDrwwe2SWx7WaI/ZtesAKRhJ06NBvFPQV682v4+
	2aJA7YmdEwVo0kcnXHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI6xK-003UeY-Bk; Thu, 10 Feb 2022 10:45:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI6xH-003Ue3-Jc
 for ath11k@lists.infradead.org; Thu, 10 Feb 2022 10:45:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E000A619BC
 for <ath11k@lists.infradead.org>; Thu, 10 Feb 2022 10:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CB6C004E1;
 Thu, 10 Feb 2022 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644489938;
 bh=32OaQk+UQ/kYTL9+dr4DZaoEDesEdMynTCoF8QwK6Gg=;
 h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
 b=obTGnW2sLiEcWnt5c70h0ewCHsXuXXd1D24gLvdZjhxbSSTsdoY7tsPIVgJEI9OON
 Yi2cKM7/VFZGYk4kb5WuM3Bc/W1kYoSRY4mJLndhaQSSdNpqMWXvFIddkyymTXwGc4
 E8yfNpW51Rdw2ARkCHYq4vARI5fF5IC7Z3zuHczXTiJYrfE4wDaiBJIxXlGjHZP1hv
 Y39hGf3xlXJ1zgMuR9cYNfKbT9Y781u13ouLIM1aI+w0xIMsSuHb7kAH3bHiAWdi9d
 gDd8wgOG+77qUdqyZYm7mU+uCHzcMepXqDYB0o/U84pcNzi+vi1NwC1ck2mem1pCiH
 5qpZ2bjHCmb1A==
From: Kalle Valo <kvalo@kernel.org>
To: Josh Boyer <jwboyer@kernel.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
Date: Thu, 10 Feb 2022 12:45:32 +0200
In-Reply-To: <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 (Josh Boyer's message of "Wed, 29 Dec 2021 08:41:45 -0500")
Message-ID: <87ee4brodv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_024539_706767_BEA086F6 
X-CRM114-Status: GOOD (  14.56  )
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

SGkgSm9zaCwKCkpvc2ggQm95ZXIgPGp3Ym95ZXJAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBPbiBU
aHUsIERlYyAyMywgMjAyMSBhdCA5OjAzIEFNIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+Pgo+PiAgV0hFTkNFICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDE0ICstCj4+ICBhdGgxMWsvSVBRNjAxOC9odzEuMC9Ob3RpY2UudHh0ICB8ICAgNDggKy0KPgo+
IFRoZXNlIE5vdGljZSBmaWxlcyBzZWVtIHByb2JsZW1hdGljLiAgVGhleSdyZSBjbGVhcmx5IHdl
bGwgaW50ZW5kZWQsCj4gYnV0IHRoZXkgaGF2ZSBsYW5ndWFnZSB0aGF0IGFsbHVkZXMgdG8gYW4g
YWdyZWVtZW50IHdpdGggQXRoZXJvcyBhbmQgYQo+IGNvbmZpZGVudGlhbCBuYXR1cmUgdG8gc29t
ZSBvZiB0aGUgZmlsZXMuICBTcGVjaWZpY2FsbHk6Cj4KPiAiLi4ueW91ciB1c2Ugb2YgdGhlc2Ug
c29mdHdhcmUKPiBjb21wb25lbnRzIHRvZ2V0aGVyIHdpdGggdGhlIFF1YWxjb21tIEF0aGVyb3Mg
c29mdHdhcmUgKFF1YWxjb21tCj4gQXRoZXJvcyBzb2Z0d2FyZSBoZXJlaW5hZnRlciByZWZlcnJl
ZCB0byBhcyDigJxTb2Z0d2FyZeKAnSkgaXMKPiBzdWJqZWN0IHRvIHRoZSB0ZXJtcyBvZiB5b3Vy
IGFncmVlbWVudCBmcm9tIFF1YWxjb21tIEF0aGVyb3MuIgo+Cj4gTm9ib2R5IGhhcyBhbiBvcHBv
cnR1bml0eSB0byBhZ3JlZSB0byBhbnl0aGluZyB3aXRoIEF0aGVyb3Mgd2hlbiB0aGV5Cj4gY29u
c3VtZSB0aGUgZmlsZXMgZnJvbSBsaW51eC1maXJtd2FyZS4gIFRoZXJlJ3MgYWxzbyBubyBleHBs
aWNpdCBncmFudAo+IG9mIHJlZGlzdHJpYnV0aW9uIGZvciBhbnkgb2YgdGhlc2UgZmlsZXMuCgpT
byB0aGlzIGZpbGUgd2UgYXJlIGRpc2N1c3NpbmcgaXMgdGhlIG5vdGljZS50eHQgZmlsZS4gSW4g
dGhlIFdIRU5DRQpmaWxlIHRoZSBhY3R1YWwgbGljZW5zZSBmb3IgYXRoMTFrIGlzOgoKTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrIGZv
ciBkZXRhaWxzCgpEb2VzIHRoYXQgY292ZXIgeW91ciBjb25jZXJucyBhYm91dCByZWRpc3RyaWJ1
dGlvbj8KCkknbSBzdGlsbCB3b3JraW5nIG9uIHlvdXIgb3RoZXIgY29tbWVudCBhYm91dCBub3Rp
Y2UudHh0LCB3aWxsIGdldCBiYWNrCm9uIHRoYXQgbGF0ZXIuCgotLSAKaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVs
ZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGlu
Z3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
