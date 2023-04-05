Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E43C7619A
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPH2WxUqIlKpUCUqiScNc05R8oISx/de7XcXL5GM+2E=; b=PT5N8fz7NnffML
	n59Guo2ASUjXxeM8crok1JlLVylWKytvBpzGWpT6yr8TaP4r5HxOFrKvqnQNxxi9qbaPBwVoSgvL+
	BmyHrjzaVvYegphapk8FK1kX4YY9Zt7CqmFKLKEh7//AyH4zo/DboI/TTjB365jqfb+EkokIwRzlE
	e0f+ocDOCzokftW6s6xxj+7FGMN0LPwgdVnOI7m2FNcuozL1bZJmS9i9uJLsFKw8OIF8aJ4lB32BS
	hRQ3aMzS9PQVkEAxYjWyg+J4oE3SfSzaoddt6H14Cd6dU/cmbnSUvc3R5265Thub/1gHiu1wVROk8
	D+edawdq+jVu77mWxxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyN2-003lV6-2W;
	Wed, 05 Apr 2023 08:19:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyMz-003lUR-2G
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 08:19:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACB3562138;
	Wed,  5 Apr 2023 08:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22BBC433D2;
	Wed,  5 Apr 2023 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680682792;
	bh=h+azRsNrQNvSZoKtD4Pui+A0ykChj4PqevmHG3PaPRE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NCPSlq0Eqb+yBe0xLWN+z75QKKMsUuFqxNA0Eck9RlIlBkyrvQQQyiu7q4hTXwpES
	 xxJebdlWrmIEr03OD3WNNQeLzq6uF1/iRWYiIXVdIbvU5YjbAI3reUAboZEFha/AzV
	 LjWDaWZCXBnyGZZ9tSsLOuUYe699QZYkAelLVxAHXRDFg+FHIqBP7/s0RnY+j2sKx7
	 fb87wJk/FAov51bmWxh0+uswFGm3PTtSR9CCaRE6Vh6rPA7i8sAju9J57eZtTACVbJ
	 BClSLHHB+p3YBwcmnTDF1KOP1KpvOFm/cNTZzxfhIJeVjUIIMnPqGGgqG1Kv0Hdftr
	 rhuNX+o+9fPUg==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: Muna Sinada <quic_msinada@quicinc.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Anilkumar Kolli <quic_akolli@quicinc.com>
Subject: Re: [PATCH v2 2/4] wifi: ath11k: push MU-MIMO params from hostapd to hardware
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
	<1666128501-12364-3-git-send-email-quic_msinada@quicinc.com>
	<CA+HBbNHw-0+Ty_-masxGKwT6ju_EBxT3n5B0Ygcn3XzQi_CzWg@mail.gmail.com>
	<87fs9ndh6s.fsf@kernel.org>
	<CA+HBbNEaNTkUv_UPgQievxaLya0XC6=AVj0=GWiH+qB9=vRZHg@mail.gmail.com>
	<87bkkbdcfu.fsf@kernel.org>
Date: Wed, 05 Apr 2023 11:19:46 +0300
In-Reply-To: <87bkkbdcfu.fsf@kernel.org> (Kalle Valo's message of "Wed, 29 Mar
	2023 14:28:05 +0300")
Message-ID: <87pm8iaggt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_011953_797046_E1EA702F 
X-CRM114-Status: GOOD (  16.20  )
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

S2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBSb2JlcnQgTWFya28gPHJv
YmVydC5tYXJrb0BzYXJ0dXJhLmhyPiB3cml0ZXM6Cj4KPj4gT24gV2VkLCBNYXIgMjksIDIwMjMg
YXQgMTE6NDXigK9BTSBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4+
ID4+IEBAIC01MzY5LDYgKzU0OTEsMTAgQEAgc3RhdGljIGludCBhdGgxMWtfbWFjX2NvcHlfaGVf
Y2FwKHN0cnVjdCBhdGgxMWsgKmFyLAo+Pj4gPj4KPj4+ID4+ICAgICAgICAgICAgICAgICBoZV9j
YXBfZWxlbS0+bWFjX2NhcF9pbmZvWzFdICY9Cj4+PiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICBJRUVFODAyMTFfSEVfTUFDX0NBUDFfVEZfTUFDX1BBRF9EVVJfTUFTSzsKPj4+ID4+ICsgICAg
ICAgICAgICAgICBoZV9jYXBfZWxlbS0+cGh5X2NhcF9pbmZvWzBdICY9Cj4+PiA+PiArICAgICAg
ICAgICAgICAgICAgICAgICB+SUVFRTgwMjExX0hFX1BIWV9DQVAwX0NIQU5ORUxfV0lEVEhfU0VU
XzE2ME1IWl9JTl81RzsKPj4+ID4+ICsgICAgICAgICAgICAgICBoZV9jYXBfZWxlbS0+cGh5X2Nh
cF9pbmZvWzBdICY9Cj4+PiA+PiArICAgICAgICAgICAgICAgICAgICAgICB+SUVFRTgwMjExX0hF
X1BIWV9DQVAwX0NIQU5ORUxfV0lEVEhfU0VUXzgwUExVUzgwX01IWl9JTl81RzsKPj4+ID4KPj4+
ID4gVGhpcyBpcyBjYXVzaW5nIGEgcmVncmVzc2lvbiBmb3IgdXMgaW4gT3BlbldydCBhdCBsZWFz
dCBvbiBJUFE4MDc0IGJ1dAo+Pj4gPiBwcm9iYWJseSBvbiBhbGwgYXRoMTFrLXN1cHBvcnRlZCBI
Vy4gQ2F1c2UgODArODAgYW5kIDE2ME1IeiBzdXBwb3J0Cj4+PiA+IGJpdHMgYXJlIGJlaW5nIGNs
ZWFyZWQgaGVyZSBzbyAxNjBNSHogaXMgbm90IGJlaW5nIGFkdmVydGlzZWQgYWZ0ZXIKPj4+ID4g
dGhpcyBwYXRjaC4KPj4+Cj4+PiBPaCBtYW4sIG5vdCBnb29kLiBSb2JlcnQsIHNob3VsZCB3ZSBy
ZXZlcnQgdGhpcyBwYXRjaHNldCBlbnRpcmVseT8gT2YKPj4+IGNvdXJzZSBpdCB3b3VsZCBiZSBi
ZXR0ZXIgaWYgTXVuYSBjYW4gc3VibWl0IHF1aWNrbHkgYSBmaXgsIGJ1dCBJJ20gbm90Cj4+PiBn
b2luZyB0byB3YWl0IGZvciBsb25nLgo+Pgo+PiBJIHdvdWxkIHByZWZlciB0byBzZWUgaXQgZ2V0
IGZpeGVkLCBjYXVzZSBqdXN0IHJlbW92aW5nIHRoZSBmbGFnCj4+IHJlbW92YWwgZ2V0cyAxNjBN
SHogd29ya2luZywgYnV0IEkgYW0gbm90IHN1cmUgYWJvdXQgb3RoZXIgZmxhZ3MgYXMKPj4gd2Vs
bC4KPgo+IE9rLCBsZXQncyB0cnkgdG8gZ2V0IGl0IGZpeGVkIHRoZW4uIE11bmEsIGNhbiB5b3Ug
Y29tbWVudCBhbmQgc2VuZCBhIGZpeAo+IEFTQVA/CgpObyByZXBseSBmcm9tIE11bmEuIEknbGwg
dHJ5IHRoZSBuZXcgYnVnYm90IHRvIG9wZW4gYSBidWcgZm9yIHRoaXMgcmVncmVzc2lvbjoKCmJ1
Z2JvdCBvbgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13
aXJlbGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxv
cGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTFrIG1haWxpbmcg
bGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
