Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64C5C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKaKzA+5+VXHkG/pqpc2QCoKap8hcvYZqDn/yc9V9z4=; b=aA/i4Q1Ctxznkc
	W1qS0/tKnSzrrqBVcn+kDqZbXoMAfqGcxbl7y/0+1xDvVkks4ZO4ZSRKs60zQhm4yeGJuZ//6Mwwd
	LSYgfg16Whq90Xim14pOKh1eFTIjgOhYSc7R+IWwU3kpgut907oQ2cup0NE35OIdio3KijLP50Rkf
	FeiYMeUgzlJ58nXna3fgD/fhP3IL6YGd8DHFDDwhCPviL4fJVQnDho+sLWXm4Ce567HGwMjvrQJwQ
	Yww5djoded+MEve8lSlZLnkrOYWj2xY7uuJsQoHVVUiuFwFq64TYw/1/rDXm8v1BQZBmIhgdre4uM
	FWK/opGaiFf+C40rfQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNKm-00Gzzn-90; Thu, 09 Dec 2021 17:35:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNKi-00Gzy8-SI
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:35:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C9E7B825C9;
 Thu,  9 Dec 2021 17:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8CDC004DD;
 Thu,  9 Dec 2021 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639071350;
 bh=yCIcOrylHhJkQEjyCwdGDKK55E0S8HrOQym/CUh4qPI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=oeWsgeHKXK8Ar9oVz6wkEycEH3fphtynsGn/KiiGHJvz9AaNLmY0J4VV1qaDz7DnO
 yyPFbDpVTrdU/hmLCYmUybZnuHa4QhnAS5Y3WrzJcDHxBZZEgpTYw7U2W07gIWBO6U
 NQdKbFkgr+UtmfHcDiRnlZgFQ4yALkW14lFOt/Yhos5zEPrOKqAmCEBOo9egmmGgji
 qZ1BODy7hFbqninrO325EGnAMOebIAKXrZHTMVnGsLpR5UN7df7Me9YNBwaghvu2VE
 BIP7mZ31XN5/QR+vEnc6CGcQsVKT3T3elmeKOY2w09SHEnlp1yOtBqelY9a5gDuCuO
 HDofRYK9ECYJg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 09/15] ath11k: add parse of transmit power envelope element
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
 <20211026111913.7346-10-quic_wgong@quicinc.com>
Date: Thu, 09 Dec 2021 19:35:47 +0200
In-Reply-To: <20211026111913.7346-10-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 26 Oct 2021 07:19:07 -0400")
Message-ID: <87y24tvfyk.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_093553_119147_E40F23F3 
X-CRM114-Status: GOOD (  12.21  )
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

V2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+IHdyaXRlczoKCj4gVGhlIHRyYW5zbWl0
IHBvd2VyIGVudmVsb3BlIGVsZW1lbnQgaGFzIHNvbWUgZmllbGRzIGZvciBwb3dlciwgYXRoMTFr
Cj4gc2hvdWxkIHBhcnNlIGl0IGFjY29yZGluZyB0byBJRUVFIFN0ZCA4MDIuMTFheOKEouKAkDIw
MjEuCj4KPiBUZXN0ZWQtb246IFdDTjY4NTUgaHcyLjAgUENJIFdMQU4uSFNQLjEuMS0wMTcyMC4x
LVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0xCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZW4g
R29uZyA8cXVpY193Z29uZ0BxdWljaW5jLmNvbT4KClsuLi5dCgo+ICtzdGF0aWMgdTggYXRoMTFr
X21hY19nZXRfbnVtX3B3cl9sZXZlbHMoc3RydWN0IGNmZzgwMjExX2NoYW5fZGVmICpjaGFuX2Rl
ZikKPiArewo+ICsJdTggbnVtX3B3cl9sZXZlbHM7Cj4gKwo+ICsJaWYgKGNoYW5fZGVmLT5jaGFu
LT5mbGFncyAmIElFRUU4MDIxMV9DSEFOX1BTRCkgewo+ICsJCXN3aXRjaCAoY2hhbl9kZWYtPndp
ZHRoKSB7Cj4gKwkJY2FzZSBOTDgwMjExX0NIQU5fV0lEVEhfMjA6Cj4gKwkJCW51bV9wd3JfbGV2
ZWxzID0gMTsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBOTDgwMjExX0NIQU5fV0lEVEhfNDA6Cj4g
KwkJCW51bV9wd3JfbGV2ZWxzID0gMjsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBOTDgwMjExX0NI
QU5fV0lEVEhfODA6Cj4gKwkJCW51bV9wd3JfbGV2ZWxzID0gNDsKPiArCQkJYnJlYWs7Cj4gKwkJ
Y2FzZSBOTDgwMjExX0NIQU5fV0lEVEhfODBQODA6Cj4gKwkJY2FzZSBOTDgwMjExX0NIQU5fV0lE
VEhfMTYwOgo+ICsJCQludW1fcHdyX2xldmVscyA9IDg7Cj4gKwkJCWJyZWFrOwo+ICsJCWRlZmF1
bHQ6Cj4gKwkJCXJldHVybiAxOwo+ICsJCX0KPiArCX0gZWxzZSB7Cj4gKwkJc3dpdGNoIChjaGFu
X2RlZi0+d2lkdGgpIHsKPiArCQljYXNlIE5MODAyMTFfQ0hBTl9XSURUSF8yMDoKPiArCQkJbnVt
X3B3cl9sZXZlbHMgPSAxOwo+ICsJCQlicmVhazsKPiArCQljYXNlIE5MODAyMTFfQ0hBTl9XSURU
SF80MDoKPiArCQkJbnVtX3B3cl9sZXZlbHMgPSAyOwo+ICsJCQlicmVhazsKPiArCQljYXNlIE5M
ODAyMTFfQ0hBTl9XSURUSF84MDoKPiArCQkJbnVtX3B3cl9sZXZlbHMgPSAzOwo+ICsJCQlicmVh
azsKPiArCQljYXNlIE5MODAyMTFfQ0hBTl9XSURUSF84MFA4MDoKPiArCQljYXNlIE5MODAyMTFf
Q0hBTl9XSURUSF8xNjA6Cj4gKwkJCW51bV9wd3JfbGV2ZWxzID0gNDsKPiArCQkJYnJlYWs7Cj4g
KwkJZGVmYXVsdDoKPiArCQkJcmV0dXJuIDE7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCXJldHVybiBu
dW1fcHdyX2xldmVsczsKPiArfQoKbnVtX3B3cl9sZXZlbHMgdmFyaWFibGUgaXMgbm90IHJlYWxs
eSBjcmVhdGluZyBhbnkgZXh0cmEgdmFsdWUsIGl0J3MKY2xlYXJuZXIgdG8gZGlyZWN0bHkgdXNl
ICdyZXR1cm4nIG9uIGV2ZXJ5IGNhc2UuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2Vy
bmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
