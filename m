Return-Path: <SRS0=fg25=HP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E78C433DB
	for <ath11k@archiver.kernel.org>; Sat, 13 Feb 2021 18:37:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC46B64D9F
	for <ath11k@archiver.kernel.org>; Sat, 13 Feb 2021 18:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC46B64D9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4JEDSEMAgVSSRSEJMP1nbCAq0f8FsBw3WeFyedLavM0=; b=J82/qSVcEkYcOtPztK/j9ZQKM
	lzzu6L215x+v1G4rvbKaBAAdVZ1/XkA1BMjG42v5GR7cjU+X6rXqEhSzqK7yJsaJOBU9laq5lRbMz
	OzVtes4oeHlzCeM256bnI1trXBeVnZEDgdP4GtJ88T70zNBad1Nujmugr+kcuPgMuBAMa73XpFJPC
	tpPekfo1DAcGCCQrsebYhgUxIlObVR+UZnJ/zWw1kGniR2qsrbZWEyMaQhdDZu99RbqvhN8XwtWjr
	KEndeSxRczPvMTiFamCNYHRIepCuIG5ORJgGrBRhWkY0fVjJ/UHrIM+6G3OrwVzJ0qplwSrMD7Y3J
	V6Ch7gE7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAzmp-0003cu-St; Sat, 13 Feb 2021 18:36:55 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAzmn-0003cF-Lt
 for ath11k@lists.infradead.org; Sat, 13 Feb 2021 18:36:54 +0000
Received: by mail-qk1-x72d.google.com with SMTP id v206so2900335qkb.3
 for <ath11k@lists.infradead.org>; Sat, 13 Feb 2021 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=taaPamG7XxlK1qsdcTU2g5YBa6HMH7/OJ2REwIl32JM=;
 b=C7dUPfWK9lMKqcrZiYWn4apKE2Fq7HX82EhzaGoOWarjMynZ7SjX+rqzF+eGsnFymT
 6RrQMBMrMUEnCwItK0/bNwb5NhT9e8wRPYeTveEmkoYQ0Wy0rolvR0BABHABofC8G7Gj
 IwOLOJj8/OUlc+C9UDHNjkjscUVyuCCf8hr497Wta8VHjs1diw66yx9u6MDJUn4ic3qL
 u4+82g4V15IFbzVn+6hGM25eGLNLmC3CbdoJKEP8CktDu1huM5n9DmBrCr3Y/inrNCng
 jkwIpO2XJwOed26BMj8vWw03M8CmQtEAOXZFy3UB33K3pw0gduJMZLDZ9fRB4wRdhCdG
 PdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=taaPamG7XxlK1qsdcTU2g5YBa6HMH7/OJ2REwIl32JM=;
 b=JuKG39RdO3NbR/CpVxobwEX+0yqqJCD+9McCn1ba+tgF8vYaFF7+OrjIM+kylqjGr5
 05GXSz84xF6MiSgQVajVLJJhrfSpfDraWIkrgYNX5GXypvUxAYG8dsSJbLAyxcmXPgqp
 lImMY+3U75UJzAUBzHM39mWVRhYmX4VJH19Ex1Ms8cqMgXP0tST2X8l6kpG7WBs9SFj2
 O7SB8PK+NJymrzzJzbLyA738uTJJDu3WczeYiomC0C5yOp+QIpY/Ccc/NFBNSEgOjjbW
 d6p0PzntNlQfu00gHYP5LNKui5YwASIfq27zrmi9kfRoA8iGoCPeY2xjV91a4bW9ExOL
 6MWQ==
X-Gm-Message-State: AOAM53149NZYuVvprUzOfvR3cxohka9QE2caWf2qjLXdIrY5LvAODSIQ
 HQ0W95RMdFOShJ3N2WElUvE/XAIWfkDhyQ==
X-Google-Smtp-Source: ABdhPJwRgWtfDUlLwfqiTAW9DhL01mYGtcAzKun+l9J/lUJ+0hOzc/i+3jUSZVvN05JC+XnSTRFGQA==
X-Received: by 2002:a05:620a:22e4:: with SMTP id
 p4mr8136950qki.421.1613241409559; 
 Sat, 13 Feb 2021 10:36:49 -0800 (PST)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id 16sm7817833qtp.38.2021.02.13.10.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 10:36:48 -0800 (PST)
Subject: Re: ath11k: qca6390 firmware crashes while connecting to 160 MHz
 channel
To: Kalle Valo <kvalo@codeaurora.org>
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
 <874kkfozhp.fsf@codeaurora.org>
 <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com>
 <875z2yuafn.fsf_-_@codeaurora.org>
 <5fd39674-d513-c28e-5469-693d96e804c0@justinmp.com>
 <87k0rdste7.fsf@codeaurora.org>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <ed6c2f2b-3f47-007f-9bdd-135514121aa5@justinmp.com>
Date: Sat, 13 Feb 2021 13:36:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87k0rdste7.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_133653_836777_D83DA91D 
X-CRM114-Status: GOOD (  13.65  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: ath11k@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMi8xMi8yMSAxOjE2IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+IEp1c3RpbiBNYXp6b2xhIFBh
bHVza2EgPGptcEBqdXN0aW5tcC5jb20+IHdyaXRlczoKPgo+PiBPbiAyLzExLzIxIDY6MTAgQU0s
IEthbGxlIFZhbG8gd3JvdGU6Cj4+PiAoY2hhbmdpbmcgdGhlIHRpdGxlIHRvIGZpbmQgdGhpcyBl
YXNpZXIpCj4+Pgo+Pj4gSnVzdGluIE1henpvbGEgUGFsdXNrYSA8am1wQGp1c3Rpbm1wLmNvbT4g
d3JpdGVzOgo+Pj4KPj4+PiBPbiAxMi8yMS8yMCAxMjoxMSBQTSwgS2FsbGUgVmFsbyB3cm90ZToK
Pj4+Pj4+IE15IHJvdXRlciBzdXBwb3J0cyAxNjAgTUh6IGNoYW5uZWxzIGluIHRoZSA1IEdIeiBi
YW5kcyBbMV0uwqAgSQo+Pj4+Pj4gc3dpdGNoZWQgdGhlIHJvdXRlciB0byBhZHZlcnRpc2luZyA4
MCBNSHogY2hhbm5lbHMgYW5kIHRoZSBjYXJkIGNvdWxkCj4+Pj4+PiBjb25uZWN0Lgo+Pj4+PiBU
aGFua3MgZm9yIHRoZSBkZXRhaWxlZCBkZWJ1Z2dpbmcsIHRoaXMgc2hvdWxkIGhlbHAgdXMgcmVw
cm9kdWNpbmcgdGhlCj4+Pj4+IHByb2JsZW0uIFdoYXQncyB0aGUgZXhhY3Qgb3BlbndydCB2ZXJz
aW9uIHlvdSBhcmUgdXNpbmc/Cj4+Pj4gVGhlIE9wZW5XUlQgdmVyc2lvbiBpczoKPj4+Pgo+Pj4+
IE9wZW5XcnQgMTkuMDcuNSByMTEyNTctNTA5MDE1MmFlMyAvIEx1Q0kgb3BlbndydC0xOS4wNyBi
cmFuY2gKPj4+PiBnaXQtMjAuMzQxLjU3NjI2LTUxZjU1YjUKPj4+Pgo+Pj4+IChUaGlzIGlzIHRo
ZSBsYXRlc3Qgc3RhYmxlIHJlbGVhc2UuKQo+Pj4gVGhhbmtzLiBJIGdvdCBhIHJlcG9ydCB0aGF0
IHRoaXMgbWlnaHQgYmUgZHVlIHRvIGNvbW1pdCAzNTc5OTk0NDc2YjYKPj4+ICgid2lyZWxlc3M6
IGZpeCB3cm9uZyAxNjAvODArODAgTUh6IHNldHRpbmciKS4gQ2FuIHlvdSB0cnkgcmV2ZXJ0aW5n
IHRoZQo+Pj4gY29tbWl0IGp1c3QgdG8gY29uZmlybSB3ZSBhcmUgc2VlaW5nIHRoZSBzYW1lIGlz
c3VlPwo+PiBJIHdpbGwgdHJ5IG92ZXIgdGhlIHdlZWtlbmQuwqAgU2hhbGwgSSBzdGlsbCB1c2Ug
dGhlCj4+IGF0aDExay1xY2E2MzkwLWJyaW5ndXAgYnJhbmNoIG9yIHNvbWV0aGluZyBlbHNlP8Kg
IChJJ20gc3RpbGwgcnVubmluZwo+PiB0aGUgYXRoMTFrLXFjYTYzOTAtYnJpbmd1cCBicmFuY2gg
b24gbXkgbGFwdG9wKS4KPiBZZXMsIHVzZSB0aGUgc2FtZSBicmFuY2guIExlYXN0IGFtb3VudCBv
ZiBjaGFuZ2VzIHRoYXQgd2F5LgoKSSByZXZlcnRlZCAzNTc5OTk0NDc2YjYgYW5kIHJlLWVuYWJs
ZWQgMTYwIE1IeiBjaGFubmVscyBvbiBteSByb3V0ZXIuwqAgSSAKd2FzIGFibGUgdG8gY29ubmVj
dCB0byBteSByb3V0ZXIgdXNpbmcgdGhlIDUgR0h6IGJhbmQgYXQgODAgTUh6IChhcyAKZXhwZWN0
ZWQpLgoKSXQgc2VlbXMgdGhhdCByZXZlcnRpbmcgMzU3OTk5NDQ3NmI2IGZpeGVkIHRoZSBmaXJt
d2FyZSBjcmFzaCB3aXRoIDE2MCAKTUh6IGNoYW5uZWxzIQoKSSdsbCBsZWF2ZSBteSByb3V0ZXIg
aW4gMTYwIE1IeiBtb2RlIGZvciBhIHdoaWxlIHRvIHNlZSBpZiB0aGVyZSBhcmUgYW55IApwcm9i
bGVtcyB0aGF0IGNyb3AgdXAgb3ZlciB0aW1lLgogwqDCoMKgIC0tSnVzdGluCgotLSAKYXRoMTFr
IG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
