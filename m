Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MONEY_NOHTML,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF942C4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 21:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723CA6024A
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 21:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 723CA6024A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7ZJ/MwNdI6vDnmuZz9zDI9B+Te4oGl7YvspjOUnrtY=; b=Eo1A7Fm00AutlNTylzVKp2LDMb
	8efaeocNCBwnAhhUp12/WHGUKQgp3JHfilQBUOB7K5kPxyEim6PwqckEidh3eEBmZoRLvPsNHkqR2
	t9ssbI+XH6mbma1FNFQcEe7yUqkko9DmBKwn5fgqoO0dA76X89DNz516V8zYEMd4mpzCqB+JCzEFi
	oK+PhOpmsuvLNjg9uUpghNLEd3G1ASLNnm0eqWEfH9saNyN8JVIl13SuBJrki9nN+xf3zCMR+Tode
	bEypTDU3kAq+BGg0184XkJhJi39vWN/K/xpqJts45sJH65S8ic0QRG6Jso6BEyNbJOH8Iu8ZEBKTr
	f8p6GJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9aQY-00ALKl-8b; Fri, 30 Jul 2021 21:52:22 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9aQV-00ALKP-RD
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 21:52:21 +0000
Received: by mail-qv1-xf36.google.com with SMTP id p38so5946154qvp.11
 for <ath11k@lists.infradead.org>; Fri, 30 Jul 2021 14:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=L7+UIBiAF2mlTDMtNkv4AaMCEs1l7ZXRy5ji7Gm52fs=;
 b=NM77fmACg3gYyAOEL5vWHFHOBZqNv//V/oSAu9aLt5F8oIdzorEOWEtzSv9cqUwI8D
 ZxdD0ConlEePSNjkQjpO70NCXap+EJ8U4KZ1JKnCLIjE5JL2/Z/Fcwv0Bxi4bcRzaDUY
 XFULdd5KS579s4RSL7UFs/1Q5tTYsyngietEW3x8Sc0Xdp8va5CkUrf+lF3Rss8Jc9uY
 Btn8D9eSp8S3VctSbNefsEjUfoNSfxEz3o91fXIL+nxBSNq+rz6Uj3t08eko8WXSnGoZ
 x61ZIxu6sweK3bJcNRobJuRoNlA8LGirhciRDHdvlBqUvoENtKY7/NhLf/utrdKMXkfw
 Z4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=L7+UIBiAF2mlTDMtNkv4AaMCEs1l7ZXRy5ji7Gm52fs=;
 b=kD1DVzrwBAOlLI+vWZ5DvA4krQKapNktIXodgKlW78cDdnluIeGzyZCaxDYcKGpPts
 HRumRHAD83XcnWiDTfZ+UhD7m6hqAfQd3uvNZcIemcDijaMbXFCp5p8Q+tEAkbXklnBa
 T+CGzGn7K+jrrdeXjesegaGAUB1QfB22DI7nWQwh1l6zLOsgzvRZhjvd12oynoVbKZeO
 fDEhdaV5RZK3ln71cVva+RtTUi9EG5QymBqKmV4MBOqzBQnXQjRBE76tRFtblfRtIT6E
 YDgjs8BvH5JRRqPt4qGTKyDNmzzqbsXyE+an2qKD83NUTKV425f6CSoK22BnjdanDg4Z
 pRyA==
X-Gm-Message-State: AOAM532vqTYTuNDGJgr5HWAr7cfp3NBALNK4mnbse7ulYiYxP5iKrO9Y
 JuslgZzVtNrMULu2NxTXg4PK1mZp6sDYJK+8
X-Google-Smtp-Source: ABdhPJzpIZW3bfyC9yHbQ2jUaRFISP3HGTgMQdkHc1829YaHY0kP1wiybkioQ5hx6dT0yVq0IcsDGQ==
X-Received: by 2002:a0c:e3ce:: with SMTP id e14mr5104520qvl.32.1627681936726; 
 Fri, 30 Jul 2021 14:52:16 -0700 (PDT)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id 143sm1573071qkf.3.2021.07.30.14.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 14:52:16 -0700 (PDT)
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
To: wi nk <wink@technolu.st>, Kalle Valo <kvalo@codeaurora.org>
Cc: Mitchell Nordine <mail@mitchellnordine.com>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 <87y29nefm7.fsf@codeaurora.org>
 <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <bc4f75cb-89f9-fc15-b18e-2348e5d0c607@justinmp.com>
Date: Fri, 30 Jul 2021 17:52:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_145219_969076_41604CB8 
X-CRM114-Status: GOOD (  22.38  )
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

T24gNy8zMC8yMSA0OjA4IFBNLCB3aSBuayB3cm90ZToKPiBPbiBGcmksIEp1bCAzMCwgMjAyMSBh
dCAxMDowMSBQTSBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4+IE1p
dGNoZWxsIE5vcmRpbmUgPG1haWxAbWl0Y2hlbGxub3JkaW5lLmNvbT4gd3JpdGVzOgo+Pgo+Pj4g
SGkga3ZhbG8gYW5kIHdpbmshCj4+Pgo+Pj4gSXQncyBiZWVuIGEgd2hpbGUgc2luY2UgSSd2ZSBo
YWQgYSBjaGFuY2UgdG8gY2hlY2sgaW4gb24gdGhpcyAtIGhhdmUgSQo+Pj4gbWlzc2VkIGFueSBR
Q0E2MzkwIHByb2dyZXNzPwo+Pj4KPj4+IEN1cnJlbnRseSB0aGUgbml4b3MtaGFyZHdhcmUgcmVw
byBpcyBmaXhlZCB0byA1LjEwLjE4IGFsb25nIHdpdGggbW9zdAo+Pj4gb2YgdGhlIHBhdGNoZXMg
b24gYXRoMTFrLXFjYTYzOTAtYnJpbmd1cCwgYXBhcnQgZnJvbSB0d28gY29tbWl0cyB0aGF0Cj4+
PiBJJ20gc3VyZSB3ZXJlIG1lcmdlZCBhIHdoaWxlIGFnby4KPj4+Cj4+PiBodHRwczovL2dpdGh1
Yi5jb20vTml4T1Mvbml4b3MtaGFyZHdhcmUvYmxvYi8zMWY2MWI5MGRkYjkyNTdiOTQ4ODhlZTE3
Y2NmOTYyMzZlMTgwYzc2L2RlbGwveHBzLzEzLTkzMTAvZGVmYXVsdC5uaXgjTDE0Cj4+Pgo+Pj4g
SnVzdCB3b25kZXJpbmcgaWYgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoZXMgb3Igc29tZSBhbHRlcm5h
dGl2ZSBmaXhlcwo+Pj4gaGF2ZSBsYW5kZWQgaW4gYSBtb3JlIHJlY2VudCB2ZXJzaW9uIG9mIHRo
ZSBrZXJuZWwgeWV0LCBhbmQgd2hldGhlcgo+Pj4gaXQncyB3b3J0aCBkaXZpbmcgaW4gYW5kIHVw
ZGF0aW5nIG91ciBuaXggZXhwciB5ZXQ/Cj4+IEJhc2ljYWxseSBhbGwgeW91IG5lZWQgaXMgYSBC
SU9TIHVwZGF0ZSBmb3IgWFBTIDkzMTAgKHRvIGdldCAzMiBNU0kKPj4gdmVjdG9ycyB3b3JraW5n
KSBhbmQgYSByZWNlbnQgTGludXggcmVsZWFzZS4gSSBkb24ndCByZW1lbWJlciB0aGUgZXhhY3QK
Pj4ga2VybmVsIHJlbGVhc2UsIGFuZCBjYW4ndCBjaGVjayBpdCBub3csIGJ1dCBzb21ldGhpbmcg
bGlrZSB2NS4xMiBvcgo+PiB2NS4xMyBzaG91bGQgd29yayB3aXRob3V0IGV4dHJhIHBhdGNoZXMu
Cj4+Cj4+IC0tCj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13
aXJlbGVzcy9saXN0Lwo+Pgo+PiBodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9k
ZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKPj4KPj4gLS0KPj4gYXRo
MTFrIG1haWxpbmcgbGlzdAo+PiBhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo+Cj4gSGV5IE1pdGNo
ZWxsIQo+Cj4gICAgSnVzdCB0byBhZGQgYSBsaXR0bGUsIERlbGwgcmVsZWFzZWQgYSBCSU9TIHVw
ZGF0ZSB0aGF0IG5vdyBhbGxvd3MKPiB0aGUgZHJpdmVyIHRvIG9idGFpbiBhbGwgMzIgTVNJIHZl
Y3RvcnMgKEkgcG9zdGVkIGFyb3VuZCB0aGUgdGltZSB0aGF0Cj4gaGFwcGVuZWQgaWYgeW91IG5l
ZWQgdGhlIGVhcmxpZXN0IHZlcnNpb24sIG90aGVyd2lzZSBqdXN0IGdyYWIgdGhlCj4gbGF0ZXN0
IHZlcnNpb24pLiAgSSd2ZSBiZWVuIHJ1bm5pbmcgNS4xMiBhbmQgNS4xMyB3aXRob3V0IFdJRkkg
aXNzdWVzLgo+IE9jY2FzaW9uYWxseSBJIHN0aWxsIGhhdmUgYmx1ZXRvb3RoIHByb2JsZW1zIGFu
ZCB0aGUgaTkxNSBkcml2ZXJzIGFyZQo+IGNhdXNpbmcgdmlkZW8gYXJ0aWZhY3RzIHJhbmRvbWx5
LCBidXQgdGhlIHdpcmVsZXNzIGNvbm5lY3Rpb24gc2VlbXMKPiBwcmV0dHkgc29saWQgYXQgdGhp
cyBwb2ludC4KCldoaWNoIEJJT1MgZG8geW91IGhhdmU/wqAgSSBoYXZlIDEuMi41LgoKSSdtIGN1
cnJlbnRseSBydW5uaW5nIDUuMTMgd2l0aCBhIHBhdGNoIHRoYXQgcmV2ZXJ0ZWQgCjM1Nzk5OTQ0
NzZiNjVjYjVlMjcyZmYwZjcyMGExZmQzMTMyMmU1M2YuwqAgSSBuZWVkZWQgdG8gZG8gdGhhdCBv
ciB0aGUgCjUuMTMga2VybmVsIHdvdWxkbid0IGNvbm5lY3QgdG8gbXkgYWNjZXNzIHBvaW50IGJl
Y2F1c2UgdGhlIGZpcm13YXJlIApjcmFzaGVkLsKgIChJIGdvdCB0aGF0IHBvaW50ZXIgZnJvbSAK
aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTIwNTkuKcKgIFdp
dGggMzU3OTk5IApyZXZlcnRlZCwgZXZlcnl0aGluZyB3b3JrcyB3ZWxsLgoKSSBzdGlsbCBoYXZl
IHRoZSBtZW1tYXA9MjBNJDEyTSBrZXJuZWwgYXJndW1lbnQgc2V0IGZyb20gdGhlIG9sZCBxY2Eg
CmJyaW5ndXAgYnJhbmNoIGRheXMuwqAgRG8geW91IGFsc28gdXNlIHRoYXQ/CiDCoMKgwqDCoCAt
LUp1c3RpbgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
