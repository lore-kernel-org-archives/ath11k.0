Return-Path: <SRS0=Cifq=M3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18918C4338F
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 13:06:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A697E60F35
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 13:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A697E60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mitchellnordine.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsYWBW7U6AdbPqxhcbWjwLTvn7+xazikwXCUzXG6YPk=; b=pp/d5ZkEKJ9HiV
	fa4u5+hT/hSjZLdoz7IW4fG06QEDyIOL6CJXaB5Q37sKmMaDNkvJH5T5aIB8NX3q+9eV5JLoBFaRx
	yxBMvprATIE9/g8HhPnsEwJTpHq32JYf8SYfFfA9B5eZMSQ/hcoOSdvv3y9XCGVO0+BEhc3572cZQ
	Z2cKA0x9TjQau+vcHoBJ/JXMUias3rHPsY3rYvHotkkuawi72w3rM58VDxMSsoZA7qjMDpL8k80RG
	LJ8sr9KwgCjtyys0A7CBzqjysa5Ym/cjY2juGIiWxWsUwWFWopewNNhzqG0GeWby1MvjlPgNi/1Xg
	4/9Y8ZmvkZspJM9eJ1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBGbZ-0064yo-Cx; Wed, 04 Aug 2021 13:06:41 +0000
Received: from mail-40131.protonmail.ch ([185.70.40.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBGbT-0064xs-3l
 for ath11k@lists.infradead.org; Wed, 04 Aug 2021 13:06:39 +0000
Date: Wed, 04 Aug 2021 13:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mitchellnordine.com;
 s=protonmail2; t=1628082387;
 bh=nqLH0SjiI0EjmoOlae/fDsZ+qbbRQjnA0ka/h3fe9YU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=nZquwlIn7yb+h1r6lZbnrDnB+pfjpuMBZQpGAV6QK0cyK6Y//eZChDvfAkeuNnDXo
 I+X9dDHoxLVh3JQk3DDt3wUVAokAL8bb28waXLuZboZclRLIRZtVIe39kyVda9S8QX
 j33sXY4TDyaJ+1h951LJ8hUpBBAN6vxo84F9Pp8a+MVbeRVO6BuytBhYc00yNMX69v
 rStJT3Y5ByuBrjid7pGrxCDiTdG+QzQy4U4bdR9Inz407lFzcX3x1M2mbjjMYKa59f
 BVxZoZDPejYLHQvd4ZU4nE4rxXon4Az0cPvKmvheplTAi4RQL0PTAMGO6deQMnLAGS
 psj82LPW9GdPQ==
To: wi nk <wink@technolu.st>
From: Mitchell Nordine <mail@mitchellnordine.com>
Cc: Kalle Valo <kvalo@codeaurora.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
Message-ID: <UUsN-OH9rM-606TuwUORGzSqrxv4eWc3pX5FYhYcS2eM9gpEG5NrqDgXKkhdkNDwdk_mEaoRoFhBlRahF_Pak_cI0YILecZzkAhEMfH6LZU=@mitchellnordine.com>
In-Reply-To: <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 <87y29nefm7.fsf@codeaurora.org>
 <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_060636_635523_8031587A 
X-CRM114-Status: GOOD (  12.04  )
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
Reply-To: Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

PiBJJ3ZlIGJlZW4gcnVubmluZyA1LjEyIGFuZCA1LjEzIHdpdGhvdXQgV0lGSSBpc3N1ZXMuIE9j
Y2FzaW9uYWxseSBJCj4gc3RpbGwgaGF2ZSBibHVldG9vdGggcHJvYmxlbXMgYW5kIHRoZSBpOTE1
IGRyaXZlcnMgYXJlIGNhdXNpbmcgdmlkZW8KPiBhcnRpZmFjdHMgcmFuZG9tbHksIGJ1dCB0aGUg
d2lyZWxlc3MgY29ubmVjdGlvbiBzZWVtcyBwcmV0dHkgc29saWQgYXQKPiB0aGlzIHBvaW50LgoK
VGhhbmtzIGZvciB0aGUgdWRwYXRlIQoKUmVjZW50bHkgYSBjb2xsYWJvcmF0b3IgdXBkYXRlZCB0
aGUgYG5peG9zL25peG9zLWhhcmR3YXJlYCByZXBvJ3Mga2VybmVsIHZlcnNpb24gdG8gYDUuMTIu
OWAgZm9yIHRoZSB4cHMgOTMxMCBhcyB3aWZpIGFuZCBibHVldG9vdGggaXMgd29ya2luZyBvdXQt
b2YtdGhlLWJveCBmb3IgdGhlbSBub3cuIEkgd2FzIGV4Y2l0ZWQgdG8gdXBkYXRlIGFuZCB0cnkg
dGhpcyBteXNlbGYsIGhvd2V2ZXIgZGVzcGl0ZSBoYXZpbmcgdGhlIHNhbWUga2VybmVsIHZlcnNp
b24gKDUuMTIuOSksIHRoZSBzYW1lIHFjYTYzOTAgZncgdmVyc2lvbiAoZndfdmVyc2lvbiAweDEw
MWMwNmNjIGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIwLTA2LTI0IDE5OjUwKSBhbmQgYWxtb3N0IHRo
ZSBzYW1lIHN5c3RlbSBmaXJtd2FyZSB2ZXJzaW9uICh0aGVtIDMuMC4zLCBtZSAzLjAuNCkgSSdt
IHJ1bm5pbmcgaW50byBhbiBpc3N1ZSB3aGVyZSBJIGdldCBzb21lIGBxbWlgIGVycm9ycyBhbmQg
dGhlbiB0aGUgd2lmaSBmaXJtd2FyZSBlbmRzIHVwIGNyYXNoaW5nLiBIZXJlJ3MgdGhlIHJlbGV2
YW50IGRtZXNnIG91dHB1dCBvbiBteSBzeXN0ZW06CgokIGRtZXNnIHwgZ3JlcCAtZSBhdGgxMQpb
ICAgIDMuOTM3MTI5XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFtt
ZW0gMHhhMjUwMDAwMC0weGEyNWZmZmZmIDY0Yml0XQpbICAgIDMuOTM3MTQ3XSBhdGgxMWtfcGNp
IDAwMDA6NzI6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpClsgICAgNC4yMDM1
OTZdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIg
Ym9hcmRfaWQgMHhmZiBzb2NfaWQgMHhmZmZmZmZmZgpbICAgIDQuMjA3MDA1XSBhdGgxMWtfcGNp
IDAwMDA6NzI6MDAuMDogZndfdmVyc2lvbiAweDEwMWMwNmNjIGZ3X2J1aWxkX3RpbWVzdGFtcCAy
MDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lkClsgICAgOS4yOTEyODFdIGF0aDExa19wY2kgMDAw
MDo3MjowMC4wOiBxbWkgZmFpbGVkIHNldCBtb2RlIHJlcXVlc3QsIG1vZGU6IDAsIGVyciA9IC0x
MTAKWyAgICA5LjI5MTI5M10gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IHFtaSBmYWlsZWQgdG8g
c2VuZCB3bGFuIGZ3IG1vZGU6LTExMApbICAgIDkuMjkxMjk3XSBhdGgxMWtfcGNpIDAwMDA6NzI6
MDAuMDogZmFpbGVkIHRvIGF0dGFjaCB3bWk6IC0xMTAKWyAgICA5LjI5MTMwNV0gYXRoMTFrX3Bj
aSAwMDAwOjcyOjAwLjA6IGZhaWxlZCB0byBzdGFydCBjb3JlOiAtMTEwClsgICAyMC4yNTA3Mjld
IGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBmaXJtd2FyZSBjcmFzaGVkOiBNSElfQ0JfU1lTX0VS
Uk9SCgpNeSBjb2xsYWJvcmF0b3IncyBzeXN0ZW0gKHdob3NlIHdpZmkgaXMgd29ya2luZykgaGFz
IHRoZSBzYW1lIG91dHB1dCwgYnV0IHdpdGhvdXQgdGhlIGxhc3QgNSBsaW5lcyBvZiBlcnJvcnM6
Cgp+IMK7IGRtZXNnIHwgZ3JlcCAtZSBhdGgxMQpbICAgMTkuODcyNTk5XSBhdGgxMWtfcGNpIDAw
MDA6NzI6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0gMHhhMjUwMDAwMC0weGEyNWZmZmZmIDY0
Yml0XQpbICAgMTkuODcyNjE3XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZW5hYmxpbmcgZGV2
aWNlICgwMDAwIC0+IDAwMDIpClsgICAyMC4zODAxNjhdIGF0aDExa19wY2kgMDAwMDo3MjowMC4w
OiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGIgYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHhmZmZm
ZmZmZgpbICAgMjAuMzgwMTcxXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogZndfdmVyc2lvbiAw
eDEwMWMwNmNjIGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lk
CgpIZXJlJ3MgdGhlaXIgUFIgdGhhdCByZW1vdmVzIHRoZSBwYXRjaGVzIGFuZCB1cGRhdGVzIHRv
IHRoZSA1LjEyIGtlcm5lbC4gaHR0cHM6Ly9naXRodWIuY29tL05peE9TL25peG9zLWhhcmR3YXJl
L3B1bGwvMjk4CgpJIGNoZWNrZWQgb3V0IHRoZSBidWcgcmVwb3J0IG1lbnRpb25lZCBieSBqdXN0
aW4gKGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjEyMDU5KSBo
b3dldmVyIGl0IGFwcGVhcnMgdG8gYmUgdW5yZWxhdGVkLi4uIGF0IGxlYXN0IEkgZG9uJ3Qgc2Vl
IGFueSBvZiB0aGUgc2FtZSBgcW1pYCBlcnJvcnMsIGFuZCB0aGVpciBmaXJtd2FyZSBhdCBsZWFz
dCBydW5zIGxvbmcgZW5vdWdoIHRoYXQgdGhleSBjYW4gY29ubmVjdCB0byBhIDIuNEdIeiBuZXR3
b3JrLgoKQW55IGlkZWFzIHdoYXQgbWlnaHQgYmUgZ29pbmcgb24gaGVyZT8KCgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
