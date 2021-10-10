Return-Path: <SRS0=Brmj=O6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AB9C433EF
	for <ath11k@archiver.kernel.org>; Sun, 10 Oct 2021 12:24:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FB360EDF
	for <ath11k@archiver.kernel.org>; Sun, 10 Oct 2021 12:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93FB360EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C00gEnh5BTqG+Z6P+sg4iW74UsJ+7dEQu/Z/sq2KpLw=; b=Hw8P7sak9PgJOw
	VVu3UV482ql5gV7//sNLP5NNm0b9Mq/sBI9d+r+aRJMCyKY3GL8Xe5xTb4mFDp8PL8Eo1yQyToKmK
	2w8A5JWY7QezQLvSwAKKdV0ZOBEQ5lWb5+miSCe1DxUyKynJchBoWusowhIepsvFYAxBN+AE2GGvQ
	MBelWOqLWyVUiyfeYEFV7Tq9LhiVnQ3CUPIVT27NuZUhJeAQXJMOu0q6RfXg9ibE++9jM+jEzbWP1
	hn5OfzAuJpqEwo64aOo6ARXIn26GXSeaMdneeweOpebZlCCyI0pDHyKxzkzSD13JEv8AB5RfIb4AO
	Bh50buttbab0NM8CG1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZXsM-006nBN-9V; Sun, 10 Oct 2021 12:24:22 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZXsJ-006nAk-NB
 for ath11k@lists.infradead.org; Sun, 10 Oct 2021 12:24:21 +0000
Received: by mail-lf1-x134.google.com with SMTP id x27so61069138lfu.5
 for <ath11k@lists.infradead.org>; Sun, 10 Oct 2021 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=QxIXfw+iEB+O50nHXkct59CkhvewPxxS178vXKslwKA=;
 b=MNm4SRwMR+njMXjaQHeU0xGtJH8ZO+PspTpC+PSvTF6Z3ox9l6TXManwxh5j2eYRl6
 q69u5aX9j7VVy5itk59tHivlFx6jx5iNlbfOZxKQ4CP8t/0HGxGcYphqWgCTU8t4uBP4
 0jpFZZno5NVHVh4BnuOPfxuoLX2eSK58vvZK9cnrYXTJUqhzDvzR2X+IwNmYtSf7e2Sn
 4OS3kWGdZyCXM9KxRhXcRcYbM2Vgz2sdEAb5hgMTRLdbBfac+Cz9oxMG61iC3loERWd9
 VeYs0R8d0tBKRc0//a32wS9qB9a36S7s1ITAqPpjJNEH9zVh5QE9oqZAGDUikJG1ARqW
 w5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=QxIXfw+iEB+O50nHXkct59CkhvewPxxS178vXKslwKA=;
 b=6rNK/kk0jHRNCuPPJUdpw2yJEQCezYAKxF1mwslVUw8WLSxPck13sDYxFp7wc10rrf
 B/xgGFQBAbgD9b+AUNxLUk4AN74t+Q9nbnemaYXVRKWdpmE1bZIn6Vm/J+QB7BwwGIki
 mfovFRQQhsrSQgGwNT9DpevVcGtMhnJ59nj8s6LIJ7gtbV5EpTYR9CWcZOdf0pQk0n/j
 n1YeF4SZi958MKAJzMeE6Wzoi4fRq93xjJHxlQckHZeZEXawTqU7URjUSLzHiv+Ymui1
 zGOIYK16bwpEhpePCkOSYTfBRH7VSc6mNMqjY4rPAJj/JgYJYSVkAE41m+BPeTxe3k8n
 dZTg==
X-Gm-Message-State: AOAM531cVUSdr2V7iRL28Kr/ygmhW6kRdWDJiihJOfKBHeF5ahgzF+zD
 3x76qW3mudRt9O2roWTu4VABHYhnoYhX6A==
X-Google-Smtp-Source: ABdhPJx0N8TlhOQogMG86TrqrarOgjiqYwFi274qCqs3Aykc0hGN+h3cGTmrtvnRJfikMmTDh6TN7g==
X-Received: by 2002:a05:6512:31cb:: with SMTP id
 j11mr21290108lfe.368.1633868655216; 
 Sun, 10 Oct 2021 05:24:15 -0700 (PDT)
Received: from [192.168.2.114] ([5.187.75.16])
 by smtp.gmail.com with ESMTPSA id m11sm523227ljp.27.2021.10.10.05.24.14
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Oct 2021 05:24:14 -0700 (PDT)
To: ath11k@lists.infradead.org
From: Mark Herbert <mark.herbert42@gmail.com>
Subject: High battery usage with ath11k on Dell 9310
Message-ID: <c2c790a6-b86a-6664-e147-bc642e00e325@gmail.com>
Date: Sun, 10 Oct 2021 15:24:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_052419_781607_F97353FF 
X-CRM114-Status: UNSURE (   8.06  )
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

U2ltcGx5IGRpc2FibGluZyB3aWZpwqAgZHJvcHMgMC44LTEgd2F0dHMgZnJvbSBwb3dlciBjb25z
dW1wdGlvbi4gCkNvbXBhcmluZyBhbG1vc3Qgc2FtZSBtb2RlbCAoMTYgZ2IgUkFNIHZzIDMyKSBi
dXQgYmFzZWQgb24gSW50ZWwgY2FyZCAKc2hvd3MgdGhlIHNhbWUgZGlmZmVyZW5jZSAtIEludGVs
IGJhc2VkIGxhcHRvcCB3aXRoIFdpRmkgY29ubmVjdGVkIApjb25zdW1lcyBhYm91dCBzYW1lIGFz
IGF0aDExayB3aXRoIFdpZmkgZGlzY25uZWN0ZWQuCgpQb3dlcnRvcMKgIG5ld2VyIHNob3dzIFBD
IHN0YXRlcyBiZWxvdyBQQzYuIERpc2FibGluZyBXaUZpIGFsbG93cyBQQzgsIApkaXNhYmxpbmcg
YXRoMTFrIGNvbXBsZXRlbHkgKGJpb3MpIC0gUEMxMC4KCldpZmkgZW5hYmxlZAoKIMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFBrZyhIVykKQzIgKHBjMinCoMKgIDE4LDUlwqDCoMKgIHwKQzMgKHBjMynC
oMKgIDE0LDIlwqDCoMKgIHwKQzYgKHBjNinCoMKgIDQ3LDUlwqDCoMKgIHwKQzcgKHBjNynCoMKg
wqAgMCwwJcKgwqDCoCB8CkM4IChwYzgpwqDCoMKgIDAsMCXCoMKgwqAgfApDOSAocGM5KcKgwqDC
oCAwLDAlwqDCoMKgIHwKQzEwIChwYzEwKcKgIDAsMCXCoMKgwqAgfAoKV2ZpIGRpc2FibGVkIChi
eSBuZXR3b3JrbWFuYWdlci9ubS1hcHBsZXQpCgoKIMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBrZyhI
VykKQzIgKHBjMinCoMKgIDEwLDglwqDCoMKgIHwKQzMgKHBjMynCoMKgIDE4LDUlwqDCoMKgIHwK
QzYgKHBjNinCoMKgwqAgMSwxJcKgwqDCoCB8CkM3IChwYzcpwqDCoMKgIDAsMyXCoMKgwqAgfApD
OCAocGM4KcKgwqAgMjgsMyXCoMKgwqAgfApDOSAocGM5KcKgwqDCoCAwLDAlwqDCoMKgIHwKQzEw
IChwYzEwKcKgIDAsMCXCoMKgwqAgfAoKU2VlbXMgdGhhdCBldmVuIG9uIG5vIG5ldHdvcmsgYWN0
aXZpdHkgYXRoMTFrIGZvcmNlcyBDUFUgdG8gc3RheSBhd2FrZSAKYW5kIGVhdCBiYXR0ZXJ5LiBU
aGVyZSBhcmUgc29tZSBiYWNrZ3JvdW5kIHRyYW5zZmVyIGhhcHBlbmluZyBhcyBJIGhhdmUgClZp
YmVyLCB0aHVuZGVyYmlyZCBhbmQgZmlyZWZveCBvcGVuZWQgc28gSSBiZXQgdGhleSBkbyBzZW50
IHNvbWUgYnV0IAp0aGVyZSBpcyBubyBmaWxlIHRyYW5zZmVycywgbWVkaWEgc3RyZWFtcyBldGMu
IFVuZGVyIHRoZSBzYW1lIGNvbmRpdGlvbnMgCih0YWtpbmcgdGhpcyBkaXNrIGZyb20gb25lIDkz
MTAgdG8gb3RoZXIgOTMxMCAtIHNhbWUgc29mdHdhcmUsIHNhbWUgCmtlcm5lbCAtIGp1c3Qgd2lm
aSdzIGRpZmZlcmVudCkgLSBpd2x3aWZpIG1hbmFnZXMgdG8gcmVhY2ggUEM4LVBDMTAgCmJlaW5n
IGNvbm5lY3RlZC7CoCBXaXRoIGF0aDEwayBvbiBkZWxsIFhQUy0xMyA5MzUwIGludGVsIGFsc28g
d2FzIHNhdmluZyAKYmF0dGVyeSBtdWNoIGJldHRlciB0aGFuIGF0aDEwaywgYml0IHRoZXJlIHdh
cyBsaWtlIDg4JSBvZiBQQzEwIHdpdGggCmludGVsIGFuZCA2NSUgUEMxMCBhbmQgMjAlIFBDOCB3
aXRoIGF0aDEway4gQnV0IGl0IHdhcyBub3Qgc3VjaCB0ZXJyaWJseSAKYmFkIGFzIHdpdGggYXRo
MTEuCgpUaGVyZSBpcyBhbHJlYWR5IGtlcm5lbCBidWcgZm9yIHRoaXMsIG5vdCBjcmVhdGluZyBk
dXBsaWNhdGVzCgpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIx
NDU0MwoKCgoKCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
