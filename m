Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53100C74A5B
	for <ath11k@archiver.kernel.org>; Wed, 29 Mar 2023 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IFYNV7NEVzsoBx+BMreLyV3uXRcdKnLQK+wtguMdvs=; b=N8lDOHwfZYRKFO
	fj8ArASI/qeXFuWmnNb+3Mn8zCkRK6vOR+XV/4n4RrBwfiMt6J8Us+gJ+G2XBxCbG6ciFbxwI1VHg
	0xjukMckzh7i/sFsGBvIOCQf4SoB7g1YaPSrUYoWyupLG1Btf1TyqW431UfhK36NFh0Y5L+JV+MP8
	iRkazgr/TUh6XT61j+ZtCGfkNdHpnamNaxmdtOAoy5u7ElllbiRSFPYK3Y8H9K4Mdd3XFkKlB9zee
	XCmHyTMcOY5tYmo+m/TzDAPTC1OrHgrdjnB51eZ9LAj0eVmw/ljnwD7Y8d7I7/2lBQg62SEmuxaji
	JRLU8MrRIgM47uj3Qbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSNZ-00HLhc-2O;
	Wed, 29 Mar 2023 09:46:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSNA-00HLWp-1s
	for ath11k@lists.infradead.org;
	Wed, 29 Mar 2023 09:45:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EA1E61C2A;
	Wed, 29 Mar 2023 09:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E439AC4339C;
	Wed, 29 Mar 2023 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680083139;
	bh=bBrUy329B14lmah78gYYaC8CptR+CjuPDZjmY2/LIRU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dpviCasEkMvgojCweh3NCCwz+4NpoaKsU8stph2VKUpn6dTUD3b58N7bF74WAdALA
	 RaZ1nVPasGsEcWz34HJ3WoKoELoNr6B3Bn8+WI4tkvqy9QACxbl3PVmgcsYUF1Wcdw
	 Xx/rW1hbwr1Rh3W8YU06wePW5mtF9yqczHzHDo7ZMCBepjvhhA8mBdx/dxw5Lfq5Fi
	 wOA3sKBiER213Yjh+9Im+vOOs0VwkmggYdEtlHFOg9RM7zqxBoYXIZCpjUUG+j/Dhn
	 VGdqq3enJMSCAZDGFcRDrrIFwWl+t8MiKfOR5lSPZRtM4jFHZVeye8jIa01sLq3+ju
	 6ncS3f5sg7ohQ==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Muna Sinada <quic_msinada@quicinc.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Anilkumar Kolli <quic_akolli@quicinc.com>
Subject: Re: [PATCH v2 2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
	<1666128501-12364-3-git-send-email-quic_msinada@quicinc.com>
	<CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com>
Date: Wed, 29 Mar 2023 12:45:31 +0300
In-Reply-To: <CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com>
	(Robert Marko's message of "Tue, 28 Mar 2023 13:11:22 +0200")
Message-ID: <87fs9ndh6s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_024540_713399_FF8946BD 
X-CRM114-Status: GOOD (  17.17  )
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

Um9iZXJ0IE1hcmtvIDxyb2JlcnQubWFya29Ac2FydHVyYS5ocj4gd3JpdGVzOgoKPiBPbiBUdWUs
IE9jdCAxOCwgMjAyMiBhdCAxMToyOOKAr1BNIE11bmEgU2luYWRhIDxxdWljX21zaW5hZGFAcXVp
Y2luYy5jb20+IHdyb3RlOgo+Cj4+Cj4+IEluIHRoZSBwcmV2aW91cyBiZWhhdmlvdXIgb25seSBI
RSBJRSBpbiBtYW5hZ2VtZW50IGZyYW1lcyBhcmUgY2hhbmdlZAo+PiByZWdhcmRpbmcgTVUtTUlN
TyBjb25maWd1cmF0aW9ucyBhbmQgbm90IGluIGhhcmR3YXJlLiBBZGRpbmcgcHVzaCBvZgo+PiBN
VS1NSU1PIGNvbmZpZ3VyYXRpb25zIHRvIHRoZSBoYXJkd2FyZSBhcyB3ZWxsLgo+Pgo+PiBUaGlz
IHBhdGNoIGlzIGRlcGVuZGFudCBvbiBtYWM4MDIxMSBwYXRjaHNldDoKPj4gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvP3Nlcmllcz02ODMz
MjImc3RhdGU9JTJBJmFyY2hpdmU9Ym90aAo+Pgo+PiBUZXN0ZWQtb246IElQUTgwNzQgaHcyLjAg
QUhCIFdMQU4uSEsuMi40LjAuMS0wMDM1Ni1RQ0FIS1NXUExfU0lMSUNPTlotMQo+Pgo+PiBDby1k
ZXZlbG9wZWQtYnk6IEFuaWxrdW1hciBLb2xsaSA8cXVpY19ha29sbGlAcXVpY2luYy5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFuaWxrdW1hciBLb2xsaSA8cXVpY19ha29sbGlAcXVpY2luYy5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IE11bmEgU2luYWRhIDxxdWljX21zaW5hZGFAcXVpY2luYy5jb20+
CgpbLi4uXQoKPj4gQEAgLTUzNjksNiArNTQ5MSwxMCBAQCBzdGF0aWMgaW50IGF0aDExa19tYWNf
Y29weV9oZV9jYXAoc3RydWN0IGF0aDExayAqYXIsCj4+Cj4+ICAgICAgICAgICAgICAgICBoZV9j
YXBfZWxlbS0+bWFjX2NhcF9pbmZvWzFdICY9Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIElF
RUU4MDIxMV9IRV9NQUNfQ0FQMV9URl9NQUNfUEFEX0RVUl9NQVNLOwo+PiArICAgICAgICAgICAg
ICAgaGVfY2FwX2VsZW0tPnBoeV9jYXBfaW5mb1swXSAmPQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICB+SUVFRTgwMjExX0hFX1BIWV9DQVAwX0NIQU5ORUxfV0lEVEhfU0VUXzE2ME1IWl9JTl81
RzsKPj4gKyAgICAgICAgICAgICAgIGhlX2NhcF9lbGVtLT5waHlfY2FwX2luZm9bMF0gJj0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgfklFRUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJ
RFRIX1NFVF84MFBMVVM4MF9NSFpfSU5fNUc7Cj4KPiBUaGlzIGlzIGNhdXNpbmcgYSByZWdyZXNz
aW9uIGZvciB1cyBpbiBPcGVuV3J0IGF0IGxlYXN0IG9uIElQUTgwNzQgYnV0Cj4gcHJvYmFibHkg
b24gYWxsIGF0aDExay1zdXBwb3J0ZWQgSFcuIENhdXNlIDgwKzgwIGFuZCAxNjBNSHogc3VwcG9y
dAo+IGJpdHMgYXJlIGJlaW5nIGNsZWFyZWQgaGVyZSBzbyAxNjBNSHogaXMgbm90IGJlaW5nIGFk
dmVydGlzZWQgYWZ0ZXIKPiB0aGlzIHBhdGNoLgoKT2ggbWFuLCBub3QgZ29vZC4gUm9iZXJ0LCBz
aG91bGQgd2UgcmV2ZXJ0IHRoaXMgcGF0Y2hzZXQgZW50aXJlbHk/IE9mCmNvdXJzZSBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgaWYgTXVuYSBjYW4gc3VibWl0IHF1aWNrbHkgYSBmaXgsIGJ1dCBJJ20gbm90
CmdvaW5nIHRvIHdhaXQgZm9yIGxvbmcuCgpUaGUgcGF0Y2hzZXQgaXMgaW4gd2lyZWxlc3MtbmV4
dCBhdCB0aGUgbW9tZW50IGFuZCB0aGUgY29tbWl0cyBmcm9tIHRoZQpwYXRjaHNldCBhcmU6Cgph
OTZmMTA0MjJlNzQgd2lmaTogYXRoMTFrOiBtb2RpZnkgYWNjZXNzb3IgbWFjcm9zIHRvIG1hdGNo
IGluZGV4IHNpemUKMzhkZmU3NzVkMGFiIHdpZmk6IGF0aDExazogcHVzaCBNVS1NSU1PIHBhcmFt
cyBmcm9tIGhvc3RhcGQgdG8gaGFyZHdhcmUKODA3N2MxYmJiYzI4IHdpZmk6IGF0aDExazogbW92
ZSBIRSBNQ1MgbWFwcGVyIHRvIGEgc2VwYXJhdGUgZnVuY3Rpb24KZWJmODI5ODhmODQ0IHdpZmk6
IGF0aDExazogZ2VuZXJhdGUgcnggYW5kIHR4IG1jcyBtYXBzIGZvciBzdXBwb3J0ZWQgSEUgbWNz
Cgo+IEkgZmFpbCB0byB1bmRlcnN0YW5kIHdoeSBhcmUgODArODAgYW5kIDE2MCBNSHogZmVhdHVy
ZSBmbGFncyBiZWluZyBjbGVhcmVkPwoKTWUgbmVpdGhlci4gSSBtaXNzZWQgdGhhdCBpbiBteSBy
ZXZpZXcuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdp
cmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9w
ZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBs
aXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
