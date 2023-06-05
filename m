Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1080EC7EE24
	for <ath11k@archiver.kernel.org>; Mon,  5 Jun 2023 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9CanTtjbFHTCOYllm0vHRAHGrgsMC7Et1lYfIxfUJYw=; b=t9k2xcxjTFNhCZ
	Vk7Ylq9sqSM7Sp04IRmTZwTVqpXI+YA6RFt89qGa17cIxjMyMjIYIeq3y2VpcKUxenTsLarVHpZeE
	E0/bjJUfA2dx7NyZgbrn/65ZcmIYEY9YDLmyGyyyOQNLvtw/nke2EpYIj05ZgZ0rygbxNP+rFsk7b
	UpK/Oq/DzQGGkTequrETAsugnU6WlQgCKeftoTvhu3RWLVvXK15Unvm8Fff0LIwXHgiKqXbPmb9EB
	KvSTgcv/kSnrnweUy2YtF8/HCj4c9Pchdu3UaCIZ6DGZhKh/TOwBA+Lrmm1B3EE0C+R+Dn3GqsCaC
	TR/5aZqaYGNdcf2z3e1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6IDR-00GwJ9-2x;
	Mon, 05 Jun 2023 21:58:17 +0000
Received: from shout01.mail.de ([2001:868:100:600::216])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6IDN-00GwHG-2K
	for ath11k@lists.infradead.org;
	Mon, 05 Jun 2023 21:58:15 +0000
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
	by shout01.mail.de (Postfix) with ESMTP id E4227A061E;
	Mon,  5 Jun 2023 23:58:07 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
	by postfix03.mail.de (Postfix) with ESMTP id C595580088;
	Mon,  5 Jun 2023 23:58:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
	s=mailde202009; t=1686002287;
	bh=VxH6TMoPTzxmyTAfKajqBAyIfUk5oMLIIfERggF+HW8=;
	h=Message-ID:Date:To:From:Subject:From:To:CC:Subject:Reply-To;
	b=xG2F37dpGcHNLFgr4FljAZqFecTIzOZEd321CQEe9Zr++LlCIfi70u6j3pzjlhZRj
	 a9mGifGF2LK6PU8uT9BzygP1bTlBI/IQ6LMNz920JVJHdiKZL7JNy4dMY7HWctZuDQ
	 ougHrxk6Od0z+0pe3TlplszgEkmj8dNuVZxTkVuHPF/x6/F+J51jOIbP79nOOHmWNb
	 kSmYyXFBP4RB0OORjViWt7sydmcyB++yZPd8EvnqgSpGTcuQm9ePdejQTp4fwJCwVL
	 rBgsCpV/MJZRECp+Xrq7NUv9gIQq2cdKUDBPJ1vm6SrkZblnumTsK8Lf6pTxQmH+gW
	 BVQFYsXERrHBA==
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp03.mail.de (Postfix) with ESMTPSA id 75830A02C3;
	Mon,  5 Jun 2023 23:58:06 +0200 (CEST)
Message-ID: <e6caae5c-e105-5db2-2982-1a31fbbc0b07@my.mail.de>
Date: Mon, 5 Jun 2023 23:58:06 +0200
MIME-Version: 1.0
Content-Language: en-US
To: ath11k@lists.infradead.org, kvalo@kernel.org
From: Christopher Klooz <py0xc3@my.mail.de>
Subject: slub_debug=F output indicates bug in ath11k: corrupting kmalloc-1k
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 2346
X-purgate-ID: 154282::1686002287-70FF9647-085AACE8/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_145814_064486_D12F9795 
X-CRM114-Status: UNSURE (   2.59  )
X-CRM114-Notice: Please train this message.
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

UGxlYXNlIHNlZSB0aGUgZnVsbCBzbHViX2RlYnVnPUYgYGpvdXJuYWxjdGwgLXJgOiAKaHR0cHM6
Ly9naXRsYWIuY29tL3B5MHhjMzEvcHVibGljLXRtcC1zdG9yYWdlLy0vYmxvYi9tYWluL3NsdWJf
ZGVidWctRi9ISVQvc2x1Yl9kZWJ1Z19ISVQubG9nCgpFeHRyYWN0cyBmcm9tIHJlbGF0ZWQgYGpv
dXJuYWxjdGwgLXJgOgoKYGBgCi4uLgpKdW4gMDUgMTg6NTY6MjAgZmVkb3JhLmRvbWFpbiBrZXJu
ZWw6IEhhcmR3YXJlIG5hbWU6IExFTk9WTyAKMjFDSENUTzFXVy8yMUNIQ1RPMVdXLCBCSU9TIFIy
M0VUNjBXICgxLjMwICkgMDkvMTQvMjAyMgpKdW4gMDUgMTg6NTY6MjAgZmVkb3JhLmRvbWFpbiBr
ZXJuZWw6IENQVTogMSBQSUQ6IDEzNTkyIENvbW06IAprd29ya2VyL3UzMjo2IFRhaW50ZWQ6IEfC
oMKgwqAgQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDYuMy41LTIwMC5mYzM4Lng4Nl82NCAj
MQpKdW4gMDUgMTg6NTY6MjAgZmVkb3JhLmRvbWFpbiBrZXJuZWw6IFNsYWIgMHhmZmZmZWZmZDRk
MzI0MDAwIG9iamVjdHM9MzIgCnVzZWQ9MTAgZnA9MHhmZmZmOGZkMTBjOTAxNDAwIApmbGFncz0w
eDE3ZmZmZmMwMDEwMjAwKHNsYWJ8aGVhZHxub2RlPTB8em9uZT0yfGxhc3RjcHVwaWQ9MHgxZmZm
ZmYpCkp1biAwNSAxODo1NjoyMCBmZWRvcmEuZG9tYWluIGtlcm5lbDogCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkp1biAwNSAxODo1NjoyMCBmZWRvcmEuZG9tYWluIGtlcm5lbDogQlVHIGttYWxsb2Mt
MWsgKFRhaW50ZWQ6IEcgCkLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKTogV3Jvbmcgb2JqZWN0
IGNvdW50LiBDb3VudGVyIGlzIDEwIGJ1dCBjb3VudGVkIHdlcmUgMjgKSnVuIDA1IDE4OjU2OjIw
IGZlZG9yYS5kb21haW4ga2VybmVsOiAKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KSnVuIDA1IDE4OjU2
OjIwIGZlZG9yYS5kb21haW4ga2VybmVsOiBEaXNhYmxpbmcgbG9jayBkZWJ1Z2dpbmcgZHVlIHRv
IAprZXJuZWwgdGFpbnQKLi4uCmBgYAoKYGBgCi4uLgpKdW4gMDUgMTg6NTY6MjAgZmVkb3JhLmRv
bWFpbiBrZXJuZWw6IE9iamVjdCAweGZmZmY4ZmQxMGM5MDIwMDAgCkBvZmZzZXQ9ODE5MiBmcD0w
eGM1ZDZlMzc1MmQ5MDEwOTIKSnVuIDA1IDE4OjU2OjIwIGZlZG9yYS5kb21haW4ga2VybmVsOiBT
bGFiIDB4ZmZmZmVmZmQ0ZDMyNDAwMCBvYmplY3RzPTMyIAp1c2VkPTEwIGZwPTB4ZmZmZjhmZDEw
YzkwMTQwMCAKZmxhZ3M9MHgxN2ZmZmZjMDAxMDIwMChzbGFifGhlYWR8bm9kZT0wfHpvbmU9Mnxs
YXN0Y3B1cGlkPTB4MWZmZmZmKQpKdW4gMDUgMTg6NTY6MjAgZmVkb3JhLmRvbWFpbiBrZXJuZWw6
IAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKdW4gMDUgMTg6NTY6MjAgZmVkb3JhLmRvbWFpbiBrZXJu
ZWw6IEJVRyBrbWFsbG9jLTFrIChOb3QgdGFpbnRlZCk6IApGcmVlY2hhaW4gY29ycnVwdApKdW4g
MDUgMTg6NTY6MjAgZmVkb3JhLmRvbWFpbiBrZXJuZWw6IAo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpK
dW4gMDUgMTg6NTY6MTcgZmVkb3JhLmRvbWFpbiBrZXJuZWw6IGF0aDExa19wY2kgMDAwMDowMjow
MC4wOiBGYWlsZWQgdG8gCnNldCB0aGUgcmVxdWVzdGVkIENvdW50cnkgcmVndWxhdG9yeSBzZXR0
aW5nCkp1biAwNSAxODo1NjoxNyBmZWRvcmEuZG9tYWluIGtlcm5lbDogYXRoMTFrX3BjaSAwMDAw
OjAyOjAwLjA6IEZhaWxlZCB0byAKc2V0IHRoZSByZXF1ZXN0ZWQgQ291bnRyeSByZWd1bGF0b3J5
IHNldHRpbmcKLi4uCmBgYAoKLT4gQWZ0ZXIgdGhlIGlzc3VlczogY2F0IC9wcm9jL3N5cy9rZXJu
ZWwvdGFpbnRlZCAtPiAzMgoKLT4gTm9ybWFsbHk6IGNhdCAvcHJvYy9zeXMva2VybmVsL3RhaW50
ZWQgLT4gMAoKVGhlIHByb2JsZW0vYnVnIGhhcyBiZWVuIGhhbmRsZWQgYW5kIGlkZW50aWZpZWQg
aW46IApodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIxOTMxMTAg
KHJlbGV2YW50IGFyZSBtb3N0bHkgCnRoZSBjb21tZW50cyBvZiB0b2RheSkKClRoYW5rcyB0byBZ
aSBIYW8gZm9yIGhlbHBpbmcgdG8gaWRlbnRpZnkgdGhlIGJ1ZyEKClRoYW5rcyAmIHJlZ2FyZHMs
CkNocmlzCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
