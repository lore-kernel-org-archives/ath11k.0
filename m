Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26804C77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgaaR7S+aOb/Wo5NpuIbpeTmP5xUzfCGdC00TcXm+/g=; b=XVnG0Bq/bP342l
	jXBh8eeK4/u3LTbDksK7qhGyPDjhNvWiosCLjAngrptHFKy2v3AkHLUM5/kICV7RSD+DBNiUBqmHT
	iQllc/TJGv/5rEQNSjj9eso7TqXp+X+W+4Sk3GhVUXIzkisz/HpwwwMzSmIUQxzSZ1pCrwipPyGUl
	EBJXU+eOThv8hDG95cyjO766hyN5NhAiXKtyQd7dxEMDk/357DghfgMRiTL3qMOLWjIlkp8x+pPtr
	ZU6Jkz9FHaqtgLBCJEFHI07cpUAl5a8qfWrrkG9P3nnwln3DZAoG4SsRhUyJo6RIaVkxMKs0EF9N7
	mTzH9+a0lW3owa1GyO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohL6-001PoY-2T;
	Tue, 18 Apr 2023 09:09:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohL3-001Pni-2c
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:09:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE34F62418;
	Tue, 18 Apr 2023 09:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094AEC433EF;
	Tue, 18 Apr 2023 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681808960;
	bh=w28Lfinz6EaBHtWGJs8L/2PATDDR+sdiC202nVpFOfg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qQPvGbHeC71jGB3U97vu7pBC+Pclh+kdzWcimAVG8KppgCM5l7YGtG3suphYAW4z1
	 PBxYVarOg3/lTCNH3SgCq436edzGUOItrbAtfxmFkGcXEshlOGXUbnvUiqFKBgOjGN
	 eAGNv87/Em9+yuNqoU2jbOPfIpBH0mlwbcrLNGyfJlvRuUwLZCptAvT41iDrmAGq8t
	 QNzUUZGlTUeXrBwUS53fV3mPGzwjkc7KCBmGVZYS4ZTcYjcBOk9QhEghxq2kn6BiW9
	 INe3Q8p7+RyMjjm6oKBBgxDImfOuEZi9NPFMsAjlEvZjlvXl1cUGbVb4oBZnQGiBiX
	 H06xmmaLahkug==
From: Kalle Valo <kvalo@kernel.org>
To: "Muna Sinada \(QUIC\)" <quic_msinada@quicinc.com>
Cc: Robert Marko <robert.marko@sartura.hr>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "Anilkumar Kolli \(QUIC\)" <quic_akolli@quicinc.com>
Subject: Re: [PATCH v2 2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
	<1666128501-12364-3-git-send-email-quic_msinada@quicinc.com>
	<CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com>
	<87fs9ndh6s.fsf@kernel.org>
	<CA+HBbNEaNTkUv_UPgQievxaLya0XC6=AVj0=GWiH+qB9=vRZHg@mail.gmail.com>
	<87bkkbdcfu.fsf@kernel.org> <87pm8iaggt.fsf@kernel.org>
	<BY5PR02MB6164BAC2A418B3C5462C2C348F9B9@BY5PR02MB6164.namprd02.prod.outlook.com>
	<87mt3b6nz6.fsf@kernel.org>
Date: Tue, 18 Apr 2023 12:09:15 +0300
In-Reply-To: <87mt3b6nz6.fsf@kernel.org> (Kalle Valo's message of "Fri, 14 Apr
	2023 08:18:21 +0300")
Message-ID: <874jpdwo90.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_020925_929220_346BE75F 
X-CRM114-Status: GOOD (  18.71  )
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

S2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiAiTXVuYSBTaW5hZGEgKFFV
SUMpIiA8cXVpY19tc2luYWRhQHF1aWNpbmMuY29tPiB3cml0ZXM6Cj4KPj4gTXVuYSBTaW5hZGEg
PHF1aWNfbXNpbmFkYUBxdWljaW5jLmNvbT4gd3JpdGVzOgo+Pj4gS2FsbGUgVmFsbyA8a3ZhbG9A
a2VybmVsLm9yZz4gd3JpdGVzOgo+Pj4+IFJvYmVydCBNYXJrbyA8cm9iZXJ0Lm1hcmtvQHNhcnR1
cmEuaHI+IHdyaXRlczoKPj4+Pgo+Pj4+PiBPbiBXZWQsIE1hciAyOSwgMjAyMyBhdCAxMTo0NeKA
r0FNIEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gPj4g
QEAgLTUzNjksNiArNTQ5MSwxMCBAQCBzdGF0aWMgaW50IGF0aDExa19tYWNfY29weV9oZV9jYXAo
c3RydWN0IAo+Pj4+Pj4gPj4gYXRoMTFrICphciwKPj4+Pj4+ID4+Cj4+Pj4+PiA+PiAgICAgICAg
ICAgICAgICAgaGVfY2FwX2VsZW0tPm1hY19jYXBfaW5mb1sxXSAmPQo+Pj4+Pj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgCj4+Pj4+PiA+PiBJRUVFODAyMTFfSEVfTUFDX0NBUDFfVEZfTUFD
X1BBRF9EVVJfTUFTSzsKPj4+Pj4+ID4+ICsgICAgICAgICAgICAgICBoZV9jYXBfZWxlbS0+cGh5
X2NhcF9pbmZvWzBdICY9Cj4+Pj4+PiA+PiArIH5JRUVFODAyMTFfSEVfUEhZX0NBUDBfQ0hBTk5F
TF9XSURUSF9TRVRfMTYwTUhaX0lOXzVHOwo+Pj4+Pj4gPj4gKyAgICAgICAgICAgICAgIGhlX2Nh
cF9lbGVtLT5waHlfY2FwX2luZm9bMF0gJj0KPj4+Pj4+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIAo+Pj4+Pj4gPj4gKyB+SUVFRTgwMjExX0hFX1BIWV9DQVAwX0NIQU5ORUxfV0lEVEhfU0VU
XzgwUExVUzgwX01IWl9JTl81RzsKPj4+Pj4+ID4KPj4+Pj4+ID4gVGhpcyBpcyBjYXVzaW5nIGEg
cmVncmVzc2lvbiBmb3IgdXMgaW4gT3BlbldydCBhdCBsZWFzdCBvbiBJUFE4MDc0IAo+Pj4+Pj4g
PiBidXQgcHJvYmFibHkgb24gYWxsIGF0aDExay1zdXBwb3J0ZWQgSFcuIENhdXNlIDgwKzgwIGFu
ZCAxNjBNSHogCj4+Pj4+PiA+IHN1cHBvcnQgYml0cyBhcmUgYmVpbmcgY2xlYXJlZCBoZXJlIHNv
IDE2ME1IeiBpcyBub3QgYmVpbmcgCj4+Pj4+PiA+IGFkdmVydGlzZWQgYWZ0ZXIgdGhpcyBwYXRj
aC4KPj4+Pj4+Cj4+Pj4+PiBPaCBtYW4sIG5vdCBnb29kLiBSb2JlcnQsIHNob3VsZCB3ZSByZXZl
cnQgdGhpcyBwYXRjaHNldCBlbnRpcmVseT8gCj4+Pj4+PiBPZiBjb3Vyc2UgaXQgd291bGQgYmUg
YmV0dGVyIGlmIE11bmEgY2FuIHN1Ym1pdCBxdWlja2x5IGEgZml4LCBidXQgCj4+Pj4+PiBJJ20g
bm90IGdvaW5nIHRvIHdhaXQgZm9yIGxvbmcuCj4+Pj4+Cj4+Pj4+IEkgd291bGQgcHJlZmVyIHRv
IHNlZSBpdCBnZXQgZml4ZWQsIGNhdXNlIGp1c3QgcmVtb3ZpbmcgdGhlIGZsYWcgCj4+Pj4+IHJl
bW92YWwgZ2V0cyAxNjBNSHogd29ya2luZywgYnV0IEkgYW0gbm90IHN1cmUgYWJvdXQgb3RoZXIg
ZmxhZ3MgYXMgCj4+Pj4+IHdlbGwuCj4+Pj4KPj4+PiBPaywgbGV0J3MgdHJ5IHRvIGdldCBpdCBm
aXhlZCB0aGVuLiBNdW5hLCBjYW4geW91IGNvbW1lbnQgYW5kIHNlbmQgYSAKPj4+PiBmaXggQVNB
UD8KPj4+Cj4+Pk5vIHJlcGx5IGZyb20gTXVuYS4gSSdsbCB0cnkgdGhlIG5ldyBidWdib3QgdG8g
b3BlbiBhIGJ1ZyBmb3IgdGhpcyByZWdyZXNzaW9uOgo+Pj4KPj4+YnVnYm90IG9uCj4+Cj4+IEkg
aGF2ZSBjcmVhdGVkIGZpeCwgdGVzdGVkIGl0IGFuZCBwdXNoZWQgaW50ZXJuYWxseSBmb3IgcmV2
aWV3Lgo+Pgo+PiBAS2FsbGUsIGhvdyBkbyBJIGdvIGFib3V0IGNvbnRpbnVpbmcgdGhlIGNvbnZl
cnNhdGlvbiBvbiBCdWd6aWxsYT8KPgo+IEJldHRlciB0byBjb250aW51ZSB0aGUgZGlzY3Vzc2lv
biBvbiB0aGUgbGlzdC4gSSBvbmx5IGNyZWF0ZWQgdGhlIGJ1ZyBvbgo+IEJ1Z3ppbGxhIHNvIHRo
YXQgSSBkb24ndCBmb3JnZXQgdGhpcyBhcyBJIGRpZG4ndCBoZWFyIGFueXRoaW5nIGZyb20geW91
LgoKTXVuYSBub3cgc3VibWl0dGVkIGEgZml4OgoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzE2ODE3NjI5NDctMTM4ODItMS1naXQtc2Vu
ZC1lbWFpbC1xdWljX21zaW5hZGFAcXVpY2luYy5jb20vCgpSb2JlcnQsIGNhbiB5b3UgcGxlYXNl
IGNoZWNrIGl0PyBBbmQgaWYgaXQgd29ya3MgYSBUZXN0ZWQtYnkgd291bGQgYmUKbmljZS4KCi0t
IApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlz
dC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1l
bnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMWsK
