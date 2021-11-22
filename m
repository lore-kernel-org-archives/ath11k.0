Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D1BC433FE
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCMkxD+Cvq/pU0kU3arOfxPv/q3Muiii6EtDdIxqQNs=; b=0pxn1Y037ypLsuPllE9ceEA5nX
	En1nniZiEIgimDntQfVHN+Y1Xmxs6A6Um/KgJXQzGa9JBg+nKhIjH1bNDgnD7sikSbcmT6ziIOiRr
	oJQlCy3/8ChO0uiNsZzx3Hx8yZpp42Q8C0uuBx9pekhreqH8xA4sIEtafbVTAob+sc57/j96wNsUF
	wWyYrwfQ/Y2LXyLUesn1LMUGeLFjG/Bb9uCXztZFAgPT23xjN5VdfzwhWLE+doUwLHbm2eIoz6d61
	/wo2TuA+PsjoAgXqLooVw5i2q/o9/Gf4TX71Ey1aMlvaezylb7bb+Z/f4fipezxJJCqq5+gKTT4RM
	/c/Kj/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpDat-00HI8k-Bf; Mon, 22 Nov 2021 17:59:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpDar-00HI7w-AY
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 17:59:06 +0000
Received: by mail-lf1-x134.google.com with SMTP id bu18so84417194lfb.0
 for <ath11k@lists.infradead.org>; Mon, 22 Nov 2021 09:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Gko20DS1AZDMNnuAhnKTds8S3OUfVzVKr6Ai4EtHDgY=;
 b=od268HEAyAG6omdAhFW36mjc+TQ3DOz2cZ8OcvJm1lKz/WouAcejdRomllgHKMaZRi
 PdDmbb9RFd+SRMWfqH0wjG9RFdRqg/ba7WI5A9vpJQkKAMO4vpSBFi9R1pL7Xq8vh/ps
 0+bLK4rKKizIU3ewRtyWAuTo0KiifRnXSHzFh1IWltuJvQqfo1EG48WKJdqG6aipbeOj
 34lYIQ+vrgGXv1GLgDfgOzVvGRp7D04rSYgpg3RP64F1UWUyoGX4uW2Hzxghxbd83FJf
 wwrvjlZxgE0MrSD4UdnNPh4puVamS1iI8OL0jXtZTzR48k9gUV21fE7K8MpuBVMt+rNX
 6NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Gko20DS1AZDMNnuAhnKTds8S3OUfVzVKr6Ai4EtHDgY=;
 b=enoGsmF2tOzzZky9cF+INhhJJg4kqa6/leMY1+ecJPcAEmDEEz1p6AaGvVbWolCNCl
 YErRVZvFsEWo28bfEhH66IUH25fQ2O+0HF+1TVmDvc49xdm3L3liBSzKxfc14nuOJ/Y/
 F5qSjHaIFFbE8gghtEibPNZG1CqbdHC5AJEBMvZS1PvisMcrrGDudlAEWUw6divYvIZP
 WMPogd2uQnyTOVrDpJ0ktH4FbB7Sr/iE4e7nyPadT0HqYwHu3ki2ZSl6+7EyE3KgpQWq
 9PfHu48uXHHKLsZAPwIj1oIWhHtbfYPYmoil4xdl9ZFpGZORChtLSbtRW7XRtRzoudLZ
 ylMg==
X-Gm-Message-State: AOAM533ip8yLvgjFFhbw/Wq/ykX+89OYZJWkF8a1WU3Il63rrajfJKIg
 pzfH2JU8vlHD9ETn6tTRAkdBK/LHbbVs3g==
X-Google-Smtp-Source: ABdhPJyGxpAfOgl9P8QMQ82zXTMzVAq8nHh2+R7/htbbbXz33Hxw+Mec7Zc6ARRsZxV2tIqb0XPoOQ==
X-Received: by 2002:ac2:4d29:: with SMTP id h9mr58142252lfk.633.1637603942278; 
 Mon, 22 Nov 2021 09:59:02 -0800 (PST)
Received: from [192.168.8.100] ([176.59.41.199])
 by smtp.gmail.com with ESMTPSA id c34sm1036390lfv.83.2021.11.22.09.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 09:59:01 -0800 (PST)
Subject: Re: [PATCH v2] ath11k: add read variant from SMBIOS for download
 board data
To: Kalle Valo <kvalo@codeaurora.org>, Wen Gong <quic_wgong@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20211118100033.8384-1-quic_wgong@quicinc.com>
 <163759171706.17469.3004620526954131593.kvalo@codeaurora.org>
From: Mark Herbert <mark.herbert42@gmail.com>
Message-ID: <f237c04d-6574-ec9a-ebca-65d2d9ff9edd@gmail.com>
Date: Mon, 22 Nov 2021 20:58:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163759171706.17469.3004620526954131593.kvalo@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_095905_389501_F1C47F70 
X-CRM114-Status: GOOD (  12.28  )
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

VHJpZWQgdGhpcyBvbiBEZWxsIFhQUyAxMyA5MzEwCgpNYXliZSB0aGlzIHBhdGNoIGlzIGdvb2Qg
Zm9yIDY4NTUsIGJ1dCA2MzkwIGluIERlbGwgc2VlbXMgdG8gYmUga2lsbGVkIApjb21wbGV0ZWx5
IHdpdGggaXQuIFJldmVydGluZyBpdCBtYWtlcyB0aGluZ3Mgd29yayBhZ2Fpbi4KClvCoMKgwqAg
NS41MzcwMzRdIGF0aDExa19wY2kgMDAwMDo3MjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWls
eSAweGIgCmJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4ZmZmZmZmZmYKW8KgwqDCoCA1LjUzNzAzOF0g
YXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZ3X3ZlcnNpb24gMHgxMDFjMDZjYyAKZndfYnVpbGRf
dGltZXN0YW1wIDIwMjAtMDYtMjQgMTk6NTAgZndfYnVpbGRfaWQKW8KgwqDCoCA1LjUzNzIzNl0g
YXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZCBkYXRhIGZvciAK
YnVzPXBjaSxxbWktY2hpcC1pZD0wLHFtaS1ib2FyZC1pZD0yNTUsdmFyaWFudD1ERV8xOTAxIGZy
b20gCmF0aDExay9RQ0E2MzkwL2h3Mi4wL2JvYXJkLTIuYmluClvCoMKgwqAgNS41MzcyNTVdIGF0
aDExa19wY2kgMDAwMDo3MjowMC4wOiBmYWlsZWQgdG8gZmV0Y2ggYm9hcmQtMi5iaW4gb3IgCmJv
YXJkLmJpbiBmcm9tIFFDQTYzOTAvaHcyLjAKW8KgwqDCoCA1LjUzNzI1N10gYXRoMTFrX3BjaSAw
MDAwOjcyOjAwLjA6IHFtaSBmYWlsZWQgdG8gZmV0Y2ggYm9hcmQgZmlsZTogLTIKW8KgwqDCoCA1
LjUzNzI1OF0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IGZhaWxlZCB0byBsb2FkIGJvYXJkIGRh
dGEgZmlsZTogLTIKCk9uIDIyLjExLjIwMjEgMTc6MzUsIEthbGxlIFZhbG8gd3JvdGU6Cj4gV2Vu
IEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+IHdyb3RlOgo+Cj4+IFRoaXMgaXMgdG8gcmVh
ZCB2YXJpYW50IGZyb20gU01CSU9TIHN1Y2ggYXMgcmVhZCBmcm9tIERULCB0aGUgdmFyaWFudAo+
PiBzdHJpbmcgd2lsbCBiZSB1c2VkIHRvIG9uZSBwYXJ0IG9mIHN0cmluZyB3aGljaCB1c2VkIHRv
IHNlYXJjaCBib2FyZAo+PiBkYXRhIGZyb20gYm9hcmQtMi5iaW4uCj4+Cj4+IFRlc3RlZC1vbjog
V0NONjg1NSBodzIuMCBQQ0kgV0xBTi5IU1AuMS4xLTAxNzIwLjEtUUNBSFNQU1dQTF9WMV9WMl9T
SUxJQ09OWl9MSVRFLTEKPj4KPj4gU2lnbmVkLW9mZi1ieTogV2VuIEdvbmcgPHF1aWNfd2dvbmdA
cXVpY2luYy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJv
cmEub3JnPgo+IFBhdGNoIGFwcGxpZWQgdG8gYXRoLW5leHQgYnJhbmNoIG9mIGF0aC5naXQsIHRo
YW5rcy4KPgo+IDQ2ZTQ2ZGIzMTNhMiBhdGgxMWs6IGFkZCByZWFkIHZhcmlhbnQgZnJvbSBTTUJJ
T1MgZm9yIGRvd25sb2FkIGJvYXJkIGRhdGEKPgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
