Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998EFC0502C
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 06:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cM7lGN88PknUvj+mI10Gx3h3oxlPnejkVI39DmV5Gx8=; b=cT69ihhAL9JFU6
	Zl3MG9v91H9ZnjL+E7pQJa5gmXMkjidboAFasHmBcstHlewIuzK33nC7uQcJ0/jlWUK6Jr/KSVeK0
	Ry5R81HTx8g77CCHSiFdYmSJWZ18/yTNFO/BsemlM2L6WUNfHA7sDHgg8SYMhk4AxGo9CSvwxpZ2z
	xZHHRBzVp3xw/GKZvK45kOObmOiRgCBrKrEpTI0AncJfDGsczVRnbFUIuX4bgCfeBcVKGpK2fvYX+
	1rJVPu7dYWs0RxZyr2PrJjOUpFPCYjCvSgo4fDMtkfpoC4N0wuhxDL/E2iYFHq6X3vbIjABMNrx63
	4GpTDQN5ITs1nx9VYNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYF6-005Giw-IG; Mon, 29 Aug 2022 06:27:28 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYF3-005Gfz-Is
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 06:27:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id z25so9785934lfr.2
        for <ath11k@lists.infradead.org>; Sun, 28 Aug 2022 23:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=VWWhzQYOJYmKYEvMvpj/k5/jRSFeG6RXp63LJ7w0hVM=;
        b=DlZwyqvMPjn9q7RTFNFefRdHJ9N1DCgo/6UbbUjWQxxbnWQKNgSvZhipTxbA8we+0K
         RZ4AwvnHqscE70w232igZ8cnwA94cu5RxOcccvuAA5B7DNdX6TrD2Bv3V8qqh6fiKgWd
         18qc65FXANU8UWpb1uOnUG3FydNR5kZgqtBkYRFW8eW6Yg4AqScvITQm+ojjtebisaPX
         uAKVNCMSF/Wg4DKn8JC7rzx1aq5YVFiYKjsijxm1DiW1HkGMX6UXSmeNkee4A8JwT/AK
         Yq3wV83dwmGN98Z3uScKEKZYmpQziit74H+XMaFuNDnyuRzhHCGMwTIi/KCohYPTXHgG
         ovaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=VWWhzQYOJYmKYEvMvpj/k5/jRSFeG6RXp63LJ7w0hVM=;
        b=dk2JPFSo4P/cs3Y03LwpKrg6So2SDQyXXDimLSQzaDBJWWOWGAdtRVPNv20MMXm8Qp
         5qiyXQog400HKVNkqjicyvVLJkBu+Sf8pJL/twzF/7uSfH9t3kkx9EKwMpT3JQZ9spfB
         L/9PuzTaHB8h0GZ8vcZYLRhGQsLtLySz9mRk4ZYSBQ6Y1q4Q+eTCjI2mdNZmBtw/ixt0
         OTThcyz/hOBIFZHBdgzVAlt1cc7+QKLamv76wy0CXpNRQlSdjTtLr/dDIjyWLRMmWFIe
         WGXzjw7Po4in2LhdhTOrAzGKKNpLXbsUhpkd4hMxQ4tzlCP5K2XwC9NNEm4j4fwpwLHz
         ndTg==
X-Gm-Message-State: ACgBeo3pwzBWIYlQ9mbd1oHXhAdZW6r+JVe7x2RTAhD/3M17xSA/9kCa
	FAYxKM1v8uOaWLzG6fXlxPk=
X-Google-Smtp-Source: AA6agR5HLmedpY/e6Gf+gxzMrQlhbF+vYFGB2BUkcCn9huWXNlu5gZbEdeW1PVWwUNXUGh/5HhP+HA==
X-Received: by 2002:a05:6512:ad4:b0:492:c013:2359 with SMTP id n20-20020a0565120ad400b00492c0132359mr6478787lfu.376.1661754441779;
        Sun, 28 Aug 2022 23:27:21 -0700 (PDT)
Received: from [192.168.8.100] ([176.59.56.247])
        by smtp.gmail.com with ESMTPSA id q15-20020ac25fcf000000b0048b03ec561fsm1160940lfg.150.2022.08.28.23.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 23:27:21 -0700 (PDT)
Message-ID: <b4b5a72e-4ad2-e249-c71c-c64cf5902a66@gmail.com>
Date: Mon, 29 Aug 2022 09:27:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/4] ath11k: Enable low power mode when WLAN is not active
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
 <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
 <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
 <ecce8764-1760-4617-49aa-c111305ebd55@quicinc.com>
 <7e00cc36-3a07-92e2-c60e-a3c8939b407e@amd.com>
 <ccdb8f94-0879-2c06-5b48-25c2340d1659@gmail.com>
 <7df6efae-0797-a27a-1372-db7ad16e71d2@quicinc.com>
Content-Language: en-US
From: Mark Herbert <mark.herbert42@gmail.com>
In-Reply-To: <7df6efae-0797-a27a-1372-db7ad16e71d2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_232725_681085_E70C15FF 
X-CRM114-Status: GOOD (  18.29  )
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

Ck9uIDgvMjkvMjIgMDg6MzAsIE1hbmlrYW50YSBQdWJiaXNldHR5IHdyb3RlOgo+IE9uIDgvMjYv
MjAyMiAyOjMxIEFNLCBNYXJrIEhlcmJlcnQgd3JvdGU6Cj4+Pgo+Pj4+IFRoZSBjaGFuZ2VzIHRo
YXQgSSBoYXZlIHBvc3RlZCB3aWxsIG5vdCB3b3JrIG9uIG90aGVyIHRhcmdldHMgbGlrZSAKPj4+
PiBXQ042ODU1IGFzIGlzLiBJdCByZXF1aXJlcyBhZGRpdGlvbmFsIGNoYW5nZXMgYW5kIHRoZXJl
Zm9yZSBsb3RzIG9mIAo+Pj4+IHRlc3RpbmcuCj4+Pgo+Pgo+PiBXaWxsIHRoZSBjaGFuZ2VzIGJl
IHBvc3NpYmxlIGZvciBRQ0E2MzkwIGFzIHdlbGw/wqAgQ3VycmVudGx5IHRoaXMgCj4+IGNoaXAg
b25seSBhY3RpdmF0ZXMgcG93ZXIgc2F2aW5nIG1vZGUgd2hlbiBpdCBpcyBjb25uZWN0ZWQsIGJ1
dCAKPj4gYmVoYXZlcyBiYWRseSB3aGVuIG5vdCBhc3NvY2lhdGVkIHRvIGFueSBuZXR3b3JrLiBT
byB0aGVyZSBpcyBhIAo+PiBjaGFuY2UgdGhhdCB0aGlzIGtpbmQgb2Ygc29sdXRpb24gd2lsbCBo
ZWxwLgo+Pgo+Cj4gTm90IGFzc29jaWF0ZWQgdG8gYW55IG5ldHdvcmsgYXMgaW4gV2ktRmkgaXMg
T04gYW5kIG5vdCBjb25uZWN0ZWQgb3IgCj4gV2ktRmkgaXMgb2ZmPwo+Cj4gTWFuaWthbnRhCgpU
aGUgd2F5IGl0IHdvcmtzIG5vdy4KCkkgYm9vdCBteSBsYXB0b3AgKGl0IGlzIERlbGwgWFBTIDEz
IDkzMTApLiBJZiB0aGUgbmV0d29yayBpcyBhdmFpbGFibGUgCmFuZCBRQ0E2MzkwIGFzc29jaWF0
ZXMgd2l0aCBpdCAtIHRoZSBDUFUgcGFja2FnZcKgIGdvZXMgZm9yIFBDMTAgc3RhdGUgCmZvciBh
Ym91dCA3MCUgb2YgdGltZSBvbiBpZGxlLiBFdmVuIGlmIEkgZGlzY29ubmVjdCBub3cgaXQgd2ls
bCBiZSBzdGlsbCAKZ29vZC4KCkJ1dCBpZiBJIGJvb3QgbXkgbGFwdG9wIGFuZCBuZXZlciBjb25u
ZWN0IChhc3NvY2lhdGUgdG8gYW55IFdpRmkgKSAtIHRoZSAKQ1BVIHdpbGwgbmV2ZXIgcmVhY2gg
YmVsb3cgUEMzIHdpdGggV2lGaSBvbi4gSWYgSSBkaXNhYmxlIFdpRmkgLSBpdCAKcmVhY2hlcyBQ
QzEwLCBpZiBlbmFibGUgYmFjayAtIGFnYWluIFBDMy4KCgpUaGUgcG9pbnQgaXMgUUNBNjM5MCBu
ZWVkIHRvIGJlIGFzc29jaWF0ZWQgdG8gbmV0d29yayBhZnRlciBib290IChvciAKaGliZXJuYXRp
b24gcmVzdW1lKSBiZWZvcmUgaXQgYWN0aXZhdGVzIHBvd2Vyc2F2ZSBtb2RlLiBJZiB0aGlzIHZl
cnkgCmZpcnN0IGFzc29jaWF0aWlvbiBpcyBub3QgaGFwcGVuaW5nIC0gaXQgd2lsbCBlYXQgYmF0
dGVyeSBhcyBtYWQuCgpGb3Igbm93IEkndmUgd29ya2Fyb3VuZGVkIGl0IGJ5IHNldHRpbmcgYSBz
eXN0ZW1kIHRpbWVyIHNlcnZpY2UgdG8gY2hlY2sgCmlmIHRoZSBXaUZpIGlzIG5vdMKgIGFzc29j
aWF0ZWQgZm9yIGYgMyBtaW51dGVzIGFuZCBpZiBpdCBpcyBub3QgLSBzd2l0Y2ggCndpZmkgb2Zm
LgoKQnV0IGl0IGlzIHZlcnkgc3RyYW5nZSB3aHkgdGhpcyBmaXJzdCBhc3NvY2lhdGlvbiBpcyBt
YW5kYXRvcnksIGJlY2F1c2UgCmlmIHRoaXMgZm9yc3QgYXNzb2NpYXRpb24gYWZ0ZXIgYm9vdCBo
YXBwZW5lZCAtIFFDQTYzOTAgYmVoYXZlcyAKcGVyZmVjdGx5IHdpdGggV2lGaSBvbiBidXQgbm90
IGFzb2NpYXRlZC4gQW5kIGNvbnRpbnVlIHRvIHdvcmsgcGVyZmVjdGx5IAp1bnRpbCBoYXJkd2Fy
ZSByZXN0YXJ0IChyZWJvb3Qgb3IgaGliZXJuYXRlIHJlc3VtZSkgLSB0aGVuIGFnYWluIGZpcnN0
IAphc3NvY2lhdGlvbiBpcyBuZWVkZWQuwqAgSSB3YXMgdGhpbmtpbmcgdGhhdCBpdCBpcyBoYXBw
ZW5pbmcgYmVjYXVzZSB0aGUgCmF0aDExa19tYWNfdmlmX3NldHVwX3BzIGlzIGNhbGxlZCBvbmx5
IGFmdGVyIHRoZSBhc3NvY2lhdGlvbiBzbyBJJ3ZlIAp0ZXN0ZWQgdGhlIHBhdGNoIHRvIGNhbGwg
aXQgZWFybGllciwgYW5kIHN0aWxsIG5vIGx1Y2suCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
