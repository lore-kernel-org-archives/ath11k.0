Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED30FC77B6C
	for <ath11k@archiver.kernel.org>; Wed, 29 Mar 2023 11:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8rRdG11XmsIfteEUzlOng+fY6t/O7aZbZFp+2r64N0=; b=aNT4wn2fMbS0km
	OuglH3Sp3OhFLXLRI9dRhGv88MHin+dpwpH3DiKs3BGQDysefAZUjzIvPhD+b9ODgAtkDwROVCZzz
	+W5thUqbnqriUrBnPiHLEgcIMgkABKAskYmRL3k0n356pPZi+EZZBE9Upp3DI44sMuTReQdKlPiCj
	DxuYpU+r6vxvdeYX0SI548XNUrdJwOSqy7mdd36ykMEjbksgM1UIl5v6NZ3d4ie+Sy1C+Yq5C+1zd
	FtvSr+du/co+FhP9hxUtK5wzbuNb6rAgfPhh4PVL8GkCuJ5hdow56x3dkNrTIhPYOCZFG1NwT28A0
	pfzcB3gxgO8ac7OgHAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTyR-0000on-0v;
	Wed, 29 Mar 2023 11:28:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTyO-0000oN-28
	for ath11k@lists.infradead.org;
	Wed, 29 Mar 2023 11:28:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3957EB822B1;
	Wed, 29 Mar 2023 11:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB3AC433D2;
	Wed, 29 Mar 2023 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680089289;
	bh=yrgPi3SJJBPVXBW7rWGkJfGUbY/VNnd5tktymM1MeZs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kWV9uS5hgUnTsZBPqINA4C+59hTtUcZRpn0DFJgiG//eEXgAnxRcu1tYbbjrnq/ER
	 WApLpesh5QGHKFdpPVaVtp02uzmqnOpFwlirh6VoFYPXKweDiycX/fR+NlxhW3w+GQ
	 7NLkOQr9cokjxLEeli+f0VcpllV9PCH1xDEAXc8D+jhjuEh5QmUIC3AtylvWA4jEaD
	 re/zaJWtzLT76Koo1EJK+SpTRfNaSiHXN0fN3E+EXp1rW+83wQyWeGXt1e18wlftm1
	 g+OF6zZd2yuRJvrO+hvifToTxyTXYPMslC4LbGawRRSnAegpbn2ryegRsBg2kp5W3h
	 61GioFF0AXl4A==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Muna Sinada <quic_msinada@quicinc.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Anilkumar Kolli <quic_akolli@quicinc.com>
Subject: Re: [PATCH v2 2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
	<1666128501-12364-3-git-send-email-quic_msinada@quicinc.com>
	<CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com>
	<87fs9ndh6s.fsf@kernel.org>
	<CA+HBbNEaNTkUv_UPgQievxaLya0XC6=AVj0=GWiH+qB9=vRZHg@mail.gmail.com>
Date: Wed, 29 Mar 2023 14:28:05 +0300
In-Reply-To: <CA+HBbNEaNTkUv_UPgQievxaLya0XC6=AVj0=GWiH+qB9=vRZHg@mail.gmail.com>
	(Robert Marko's message of "Wed, 29 Mar 2023 12:42:34 +0200")
Message-ID: <87bkkbdcfu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_042812_885560_23088752 
X-CRM114-Status: GOOD (  17.05  )
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

Um9iZXJ0IE1hcmtvIDxyb2JlcnQubWFya29Ac2FydHVyYS5ocj4gd3JpdGVzOgoKPiBPbiBXZWQs
IE1hciAyOSwgMjAyMyBhdCAxMTo0NeKAr0FNIEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Cj4+ID4+IEBAIC01MzY5LDYgKzU0OTEsMTAgQEAgc3RhdGljIGludCBhdGgxMWtf
bWFjX2NvcHlfaGVfY2FwKHN0cnVjdCBhdGgxMWsgKmFyLAo+PiA+Pgo+PiA+PiAgICAgICAgICAg
ICAgICAgaGVfY2FwX2VsZW0tPm1hY19jYXBfaW5mb1sxXSAmPQo+PiA+PiAgICAgICAgICAgICAg
ICAgICAgICAgICBJRUVFODAyMTFfSEVfTUFDX0NBUDFfVEZfTUFDX1BBRF9EVVJfTUFTSzsKPj4g
Pj4gKyAgICAgICAgICAgICAgIGhlX2NhcF9lbGVtLT5waHlfY2FwX2luZm9bMF0gJj0KPj4gPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgfklFRUU4MDIxMV9IRV9QSFlfQ0FQMF9DSEFOTkVMX1dJ
RFRIX1NFVF8xNjBNSFpfSU5fNUc7Cj4+ID4+ICsgICAgICAgICAgICAgICBoZV9jYXBfZWxlbS0+
cGh5X2NhcF9pbmZvWzBdICY9Cj4+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIH5JRUVFODAy
MTFfSEVfUEhZX0NBUDBfQ0hBTk5FTF9XSURUSF9TRVRfODBQTFVTODBfTUhaX0lOXzVHOwo+PiA+
Cj4+ID4gVGhpcyBpcyBjYXVzaW5nIGEgcmVncmVzc2lvbiBmb3IgdXMgaW4gT3BlbldydCBhdCBs
ZWFzdCBvbiBJUFE4MDc0IGJ1dAo+PiA+IHByb2JhYmx5IG9uIGFsbCBhdGgxMWstc3VwcG9ydGVk
IEhXLiBDYXVzZSA4MCs4MCBhbmQgMTYwTUh6IHN1cHBvcnQKPj4gPiBiaXRzIGFyZSBiZWluZyBj
bGVhcmVkIGhlcmUgc28gMTYwTUh6IGlzIG5vdCBiZWluZyBhZHZlcnRpc2VkIGFmdGVyCj4+ID4g
dGhpcyBwYXRjaC4KPj4KPj4gT2ggbWFuLCBub3QgZ29vZC4gUm9iZXJ0LCBzaG91bGQgd2UgcmV2
ZXJ0IHRoaXMgcGF0Y2hzZXQgZW50aXJlbHk/IE9mCj4+IGNvdXJzZSBpdCB3b3VsZCBiZSBiZXR0
ZXIgaWYgTXVuYSBjYW4gc3VibWl0IHF1aWNrbHkgYSBmaXgsIGJ1dCBJJ20gbm90Cj4+IGdvaW5n
IHRvIHdhaXQgZm9yIGxvbmcuCj4KPiBJIHdvdWxkIHByZWZlciB0byBzZWUgaXQgZ2V0IGZpeGVk
LCBjYXVzZSBqdXN0IHJlbW92aW5nIHRoZSBmbGFnCj4gcmVtb3ZhbCBnZXRzIDE2ME1IeiB3b3Jr
aW5nLCBidXQgSSBhbSBub3Qgc3VyZSBhYm91dCBvdGhlciBmbGFncyBhcwo+IHdlbGwuCgpPaywg
bGV0J3MgdHJ5IHRvIGdldCBpdCBmaXhlZCB0aGVuLiBNdW5hLCBjYW4geW91IGNvbW1lbnQgYW5k
IHNlbmQgYSBmaXgKQVNBUD8KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3Jn
L2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDEx
ayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
