Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50228C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 13:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dB8/cjLF+QOUZrxjXUbyF4gMmJGCq/0h+giCOzn2vnc=; b=jieCgH4i3jGcXX
	+vm94/yiNsUAm9+qZwRCXRAbuOgwMYuNbgzeFpmqssjUQGBF04GGj4OZsjHDgdkp14zOJdocZz25V
	huFzNYRokjQRkV5XGUZDS+5ZCOkjXTRKLMlZHDQ8w5F24rMBZ8ZeWhhtibZsd3mMMyki88yW6jrAY
	JScVGcC2Nh7al7/ypeJ0K/vm4spfaeimFgRcsAHC9Rs4lLg6Yy0IMbDL1CEFNnqyZNZhi4wTs5Nl9
	R1Sh5z9ozm1JrRWdpsFT6gSZ1EdAfqLk7ediJQYagKwdZ5tNC5PM2yD9SwgkuQ/4sSX/WfCWm+WRb
	O+eWkdwMUwK35kEmJz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrHr-00607q-Em; Thu, 16 Dec 2021 13:59:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrA8-005xH7-4q
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 13:51:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E6F7B8245C;
 Thu, 16 Dec 2021 13:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894F2C36AE5;
 Thu, 16 Dec 2021 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639662668;
 bh=+Ui8+psUwSY1HhMnb2Pw+DoIUwFr/mdGbtqF2GV5jNo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=gvHmqy52RN3lK0rpKfJZzr+2f4dLjE1gFJLrOIH2kh1HheR53XZqi8nQ15JXjk/vZ
 zt6GoVb76p1LaGIk2PtCW4LyMwHANi5sg9ja39TetofZYt0UwVe2fkG/OHNrqkpoBu
 uC6JssAl4aMkr5DQrsKhW9bS7E4UqFH6ECRDqy+gisthxeWNCtEOKysU5Wym7nYIxS
 LRyaVvTF64vP9lviqAvkTN1KxBo/pzA+Cws5IW59W7eDum0cimrjChYsgsKWt2paag
 leljiGXqYBnor5WzV5fzHy0sGCZNUhoGoHghDDjN1e8QVMnJZz6fT3sxrC+k8VO86q
 gQ9qFm3NASzsA==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] ath11k: report tx bitrate for iw wlan station dump
References: <20211213102723.4857-1-quic_wgong@quicinc.com>
 <87y24ngjaa.fsf@codeaurora.org>
 <2aecb0d6-6710-d460-4505-0594ae7a55a2@quicinc.com>
Date: Thu, 16 Dec 2021 15:51:05 +0200
In-Reply-To: <2aecb0d6-6710-d460-4505-0594ae7a55a2@quicinc.com> (Wen Gong's
 message of "Thu, 16 Dec 2021 18:41:55 +0800")
Message-ID: <871r2cd5fa.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_055112_379189_6E429EAF 
X-CRM114-Status: GOOD (  12.14  )
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

V2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+IHdyaXRlczoKCj4gT24gMTIvMTUvMjAy
MSAxOjU4IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+PiBXZW4gR29uZyA8cXVpY193Z29uZ0BxdWlj
aW5jLmNvbT4gd3JpdGVzOgo+IC4uLgo+PiBJIGJyaWVmbHkgdGVzdGVkIHRoaXMgYW5kIHR4IHJh
dGUgZGlkbid0IGxvb2sgY29ycmVjdCB0byBtZToKPj4KPj4gJCBpdyB3bGFuMCBsaW5rCj4+IENv
bm5lY3RlZCB0byB4eCAob24gd2xhbjApCj4+IAlTU0lEOiA8Y2Vuc29yZWQ+Cj4+IAlmcmVxOiAy
NDQyCj4+IAlSWDogODgzOCBieXRlcyAoODAgcGFja2V0cykKPj4gCVRYOiAxNTUxIGJ5dGVzICgx
NSBwYWNrZXRzKQo+PiAJc2lnbmFsOiAtMTA0IGRCbQo+PiAJcnggYml0cmF0ZTogMzkuMCBNQml0
L3MgTUNTIDQKPj4gCXR4IGJpdHJhdGU6ICh1bmtub3duKSBNQ1MgMjUzCj4gWWVzLCBJIHJlcHJv
ZHVjZWQgdGhpcyBzdHJhbmdlIHR4IGJpdHJhdGUgdmFsdWUgYWZ0ZXIgdHJ5IHdpdGggMyBBUC4K
PiBBUDE6IHR4IGJpdHJhdGU6wqDCoMKgwqAgMTQ0LjQgTUJpdC9zIFZIVC1NQ1MgNyBzaG9ydCBH
SSBWSFQtTlNTIDIKPiBBUDI6IHR4IGJpdHJhdGU6wqDCoMKgwqAgMjg2LjcgTUJpdC9zIEhFLU1D
UyAxMSBIRS1OU1MgMiBIRS1HSSAwIEhFLURDTSAwCj4gQVAzOiB0eCBiaXRyYXRlOsKgwqDCoMKg
ICh1bmtub3duKSBNQ1MgMjU0Cj4gSSB3aWxsIGNoZWNrIGl0Lgo+Pgo+PiBJIGd1ZXNzIHRoZSBz
aWduYWwgaXNuJ3QgY29ycmVjdCBlaXRoZXIsIGFyZSB5b3UgcGxhbm5pbmcgdG8gZml4IGl0IGFs
c28KPj4gYXQgc29tZSBwb2ludD8KPiBJIGhhdmUgc2VudCBwYXRjaCB0byBmaXggc2lnbmFsOgo+
IFt2Ml0gYXRoMTFrOiBhZGQgc2lnbmFsIHJlcG9ydCB0byBtYWM4MDIxMSBmb3IgUUNBNjM5MCBh
bmQgV0NONjg1NQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13
aXJlbGVzcy9wYXRjaC8yMDIxMTIxNjA3MDUzNS4zMTczMi0xLXF1aWNfd2dvbmdAcXVpY2luYy5j
b20vCj4KPiBUaGUgbmV3IHNpZ25hbCB2YWx1ZSBvZiAiaXcgd2xhbiBzdGF0aW9uIGR1bXAiOgo+
IMKgwqDCoMKgwqDCoMKgIHNpZ25hbDrCoMKgwqDCoMKgwqDCoMKgIC01MCBbLTUxLCAtNTVdIGRC
bQoKR3JlYXQsIHRoYW5rIHlvdS4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwu
b3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0
aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
