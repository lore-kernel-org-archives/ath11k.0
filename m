Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C9DC77B73
	for <ath11k@archiver.kernel.org>; Thu, 27 Apr 2023 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyikDaA0DwcyCLH2xuEd7/vAChzQzf7Dy1vKxwdvz6g=; b=Hq7O23u1zzz2oA
	A6/p9Y3bkq4LHOTLPzagcQf3uqfyFmeBmHrMyur52zSZj6xOO6VmcT+7Se4+F1d32FCuLNvceK2rJ
	/vuWWExMenYtTUD3FcWw8JdeeLuMjG56au1y7rZLFk6lcKD4KmKfwC23B/2rTOhZTpEjzEON+91Rw
	Mtg2b56/SVjKAgHs7rYApy1Ry44jzRhYw6V7XiSEMj+XX7IdCpNq7ClIH3ZGvhia3ZgkZK/p8gUmq
	CaUVKF7hk+r20EXqncxuPqt2BBvRqHTUimiiKugJp47P8yXEXXPIe6jGkXxhWUSNhNAy9k9sOs0oH
	uf0ww9x7iQUjkJDA1h5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prvGU-005Zai-2O;
	Thu, 27 Apr 2023 06:38:02 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prvGS-005ZYi-0D
	for ath11k@lists.infradead.org;
	Thu, 27 Apr 2023 06:38:02 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id rvGIpCZ6IgznKrvGIpsgaX; Thu, 27 Apr 2023 08:37:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1682577474;
	bh=15cN6xGXcPgpb6mMSQ+wGIww6r6XNUs6lYtchWqDdJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZE7oJredEGJMjLhQA6WdHlDvcNKKOaGT9pfVF/t/zF7ogQaRmm+bGxoFVu9RSXmxK
	 4FeRGHhzgL00PCAgxIQYNm6UFYYN/q3PNL1SWZlaqHELt82QRD5Z4x1+UeoiqYlWSU
	 /4NB0mb7+p81lyH0DIYeDMhQxFgUYvKXfZPK/izSXRxmmg1wWMrmWrymAgBqXc2MaH
	 6iWcIf3nV9B9jrmRAJ9Mdirh3dSB0Ti1sFpGlcimkJTuiTBrfVKRLPfVMYWuTzZNMX
	 +6bBSeJEiRePu3yKPpYNYm8HjQBkh3g4ESzvn+mi0gdHboKh+A5Seu19QW0FiTtdai
	 hdhBBe+oN0vZA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 27 Apr 2023 08:37:54 +0200
X-ME-IP: 86.243.2.178
Message-ID: <bf435a7f-aee6-0f45-2eb8-128977a8a6ae@wanadoo.fr>
Date: Thu, 27 Apr 2023 08:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
To: Kalle Valo <kvalo@kernel.org>, Joe Perches <joe@perches.com>
Cc: ath11k@lists.infradead.org, christophe.jaillet@wanadoo.fr,
 davem@davemloft.net, edumazet@google.com, kernel-janitors@vger.kernel.org,
 kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com
References: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
 <87v8hiosci.fsf@kernel.org>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <87v8hiosci.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_233800_509115_3DA0E241 
X-CRM114-Status: GOOD (  12.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

TGUgMjcvMDQvMjAyMyDDoCAwNjozNSwgS2FsbGUgVmFsbyBhIMOpY3JpdMKgOgo+IENocmlzdG9w
aGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0LTM5WnNiR0lRR1Q1R1d2aXRiNVFhd0FAcHVi
bGljLmdtYW5lLm9yZz4gd3JpdGVzOgo+IAo+PiBhdGgxMWtfd21pX2Z3X3N0YXRzX251bV92ZGV2
cygpIGFuZCBhdGgxMWtfd21pX2Z3X3N0YXRzX251bV9iY24oKSByZWFsbHkKPj4gbG9vayB0aGUg
c2FtZSBhcyBsaXN0X2NvdW50X25vZGVzKCksIHNvIHVzZSB0aGUgbGF0dGVyIGluc3RlYWQgb2Yg
aGFuZAo+PiB3cml0aW5nIGl0Lgo+Pgo+PiBUaGUgZmlyc3Qgb25lcyB1c2UgbGlzdF9mb3JfZWFj
aF9lbnRyeSgpIGFuZCB0aGUgb3RoZXIgbGlzdF9mb3JfZWFjaCgpLCBidXQKPj4gdGhleSBib3Ro
IGNvdW50IHRoZSBudW1iZXIgb2Ygbm9kZXMgaW4gdGhlIGxpc3QuCj4+Cj4+IFdoaWxlIGF0IGl0
LCBhbHNvIHJlbW92ZSB0byBwcm90b3R5cGVzIG9mIG5vbi1leGlzdGVudCBmdW5jdGlvbnMuCj4+
IEJhc2VkIG9uIHRoZSBuYW1lcyBhbmQgcHJvdG90eXBlcywgaXQgaXMgbGlrZWx5IHRoYXQgdGhl
eSBzaG91bGQgYmUKPj4gZXF1aXZhbGVudCB0byBsaXN0X2NvdW50X25vZGVzKCkuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0LTM5WnNi
R0lRR1Q1R1d2aXRiNVFhd0FAcHVibGljLmdtYW5lLm9yZz4KPj4gLS0tCj4+IFVuLXRlc3RlZAo+
IAo+IEknbGwgcnVuIHNhbml0eSB0ZXN0cyBvbiBhdGgxMWsgcGF0Y2hlcy4gSSdsbCBhbHNvIGFk
ZCAiQ29tcGlsZSB0ZXN0ZWQKPiBvbmx5IiB0byB0aGUgY29tbWl0IGxvZy4KPiAKPiBPaCwgYW5k
IGF0aDExayBwYXRjaGVzIGdvIHRvIGF0aCB0cmVlLCBub3QgbmV0LW5leHQuCj4gCkhpLAoKW2Fk
ZGluZyBKb2UgUGVyY2hlc10KCm1heWJlIGNoZWNrcGF0Y2ggY291bGQgYmUgaW5zdHJ1bWVudGVk
IGZvciB0aGF0PwoKU29tZXRoaW5nIHRoYXQgd291bGQgcHJpbnQgYSB3YXJuaW5nIGlmIHRoZSBN
QUlOVEFJTkVSUyBmaWxlIGhhcyBhIGdpdCAKcmVwbyBpbiBUOiBvciBpZiBGOiBzdGF0ZXMgc29t
ZXRoaW5nIHJlbGF0ZWQgdG8gJ25ldCcuCgoKV0FSTklORzogWW91ciBwYXRjaCBpcyBhZ2FpbnN0
IHRoZSB4eHguZ2l0IHJlcG8gYnV0IHRoZSBzdWJqZWN0IG9mIHRoZSAKbWFpbCBkb2VzIG5vdCBy
ZWZsZWN0IGl0LiBTaG91bGQgW1BBVENIIHh4eF0gYmUgdXNlZCBpbnN0ZWFkPwpBbHNvIG1ha2Ug
c3VyZSB0aGF0IGl0IGFwcGxpZXMgY2xlYW5seSBvbiB4eHguZ2l0IHRvIGVhc2UgbWVyZ2UgcHJv
Y2Vzcy4KCldBUk5JTkc6IFlvdXIgcGF0Y2ggaXMgcmVsYXRlZCB0byAnbmV0Jy4gU3VjaCBwYXRj
aGVzIHNob3VsZCBzdGF0ZSAKW1BBVENIIG5ldF0gd2hlbiByZWxhdGVkIHRvIGJ1ZyBmaXgsIG9y
IFtQQVRDSCBuZXQtbmV4dF0gb3RoZXJ3aXNlLgoKRXZlbnR1YWxseSwgc29tZXRoaW5nIGlmIG5l
dC1uZXh0IGlzIGNsb3NlZD8KCgpXaGF0IGRvIHlvdSB0aGluaz8KV291bGQgaXQgYmUgcG9zc2li
bGU/IFdvdWxkIGl0IGhlbHA/CgpDSgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMWsK
