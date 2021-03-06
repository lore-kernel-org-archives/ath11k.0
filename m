Return-Path: <SRS0=fz1E=IE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F85C433DB
	for <ath11k@archiver.kernel.org>; Sat,  6 Mar 2021 20:22:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991B964FEF
	for <ath11k@archiver.kernel.org>; Sat,  6 Mar 2021 20:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991B964FEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BKu49nCn4w7JoY1tWASSldKbP9SU8AWOkwq/f47STK0=; b=JhGraNxywXEdvJ4irAikdANt1
	a3Jdk9Wxd0v1g7e1YbC27WB3JP2Y/nJykrd7BbWwjTL6kZqmCLEOkS1mYQcMQGs/06+j3S4AcY1gn
	jhfImVo8ip+ruI7mExWAwIYVbYC2ctPUxKWOaTwC15orwMSv+zgcQ2xj6JP4pnpZeKc7cHpGiF4SF
	S/8bUKi4IBtBIjRzrhqMbCnk++uBgAw2kstKH6r921N0fE2ZJKaf8axBUE5xFX61sffWl940M0FTL
	ACwnSs/eaLnM5zgEIVQn28e9LwmqpKX4W2zeZDtj2xaBNmq7LEH1rl0ftMaRWlOPCKQnNlFg6NZnk
	/qV4jugIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIdRQ-004g2a-K3; Sat, 06 Mar 2021 20:22:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIdRM-004g0x-OT
 for ath11k@lists.infradead.org; Sat, 06 Mar 2021 20:22:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so948377pjb.0
 for <ath11k@lists.infradead.org>; Sat, 06 Mar 2021 12:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=penguintechs.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=feOXcCWD6endoU56+wloByzAVCNlEa3U6NYV3bdwr/Y=;
 b=h/EV8d2Xl5wyc6jY5prx4UwihUA4gbOsszkIluC7B/o56Ezbw91DySp6tX/HyFSzVo
 ac+WhBcXHGhyxHdR7+YptbuHAkMTnxEzFF1Z+TWu135KZgRJlg9kzQbsBvcZCztWxvqU
 /tKA7ySmhyxpyJgwb/s3/vAkoTSihQoikvnOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=feOXcCWD6endoU56+wloByzAVCNlEa3U6NYV3bdwr/Y=;
 b=Z9HqeHLI/4WBCi5dL4RQHTXFOSiIzhxWL535g17OEUzJo2tnzdrt3ZpCT9QlwqJPMT
 Pz74LnFf8OntgG9hjuqnbGWRsX7UP72riXfGOeiUfpEe5jdECHTPiqysDoUfZPM+XV5q
 +xkxRQr4S3yd2dnbv9Cq7ebyqSjKE5K5hsuh0rCX7HzR7hZQkTinTva4tfqj+yvoe5YL
 2YsYqKvZfcU5k28o+GmcD54zo1gtuG0ox3Rvov0b1rI+DIIjyIFYVWf6Yy75MdN0w/YD
 2SK17G5lc/B1euN6mcvkAd8B7Ru/hIcaa1nMYIHF8nn7M8FpQWfiNJljmYuW4RhlwVj/
 +SkQ==
X-Gm-Message-State: AOAM5318Gi24W1Rv3dUSx8HVbpKuaPkEbQQ64GkvGMmzEiPJL89JZyLy
 L8emFef2rT/Q2OCD5FbJb1ABwrNhPWysGw==
X-Google-Smtp-Source: ABdhPJwsHZ2EMnRRxSOUXBpNzsCugl/l80EsL5XM/y5oSIph4GTySOtsxDxPoE8OrGs/NSaEG8/K+g==
X-Received: by 2002:a17:902:ab8b:b029:e5:ea3a:3d61 with SMTP id
 f11-20020a170902ab8bb02900e5ea3a3d61mr9073853plr.71.1615062138299; 
 Sat, 06 Mar 2021 12:22:18 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net.
 [71.202.115.154])
 by smtp.gmail.com with ESMTPSA id u20sm6137343pfm.146.2021.03.06.12.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 12:22:17 -0800 (PST)
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: Justin Mazzola Paluska <jmp@justinmp.com>, Stelian Pop <stelian@popies.net>
Cc: ath11k@lists.infradead.org, kvalo@codeaurora.org
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org> <20210224091444.GA30965@calypso>
 <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
 <20210224220246.GA6104@calypso>
 <ca0dc6e4-364e-2525-b7d6-d02c2dc0c5fd@justinmp.com>
From: Wren Turkal <wt@penguintechs.org>
Message-ID: <baeb852c-9248-d6d2-2e29-697f21604b9a@penguintechs.org>
Date: Sat, 6 Mar 2021 12:22:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ca0dc6e4-364e-2525-b7d6-d02c2dc0c5fd@justinmp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_202221_014337_C0F1258C 
X-CRM114-Status: GOOD (  13.00  )
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

T24gMi8yNC8yMSAyOjM4IFBNLCBKdXN0aW4gTWF6em9sYSBQYWx1c2thIHdyb3RlOgo+IE5vLCB0
aGUgYmVoYXZpb3IgSSBzZWUgb24gYSBwcmUtMi4wLjAgQklPUyBpczoKPiAKPiBzMmlkbGUgc3Vz
cGVuZCB3b3JrcyB3ZWxsIChpbmNsdWRpbmcgZ2V0dGluZyBpbnRvIFMwaXggc3RhdGVzKSB3aXRo
IG5vIAo+IGVmZm9ydCBvbiBteSBwYXJ0LsKgIEkgaGF2ZSBubyBpZGVhIGlmIHMyaWRsZSBkb2Vz
IHJma2lsbCBieSBpdHNlbGYsIGJ1dCAKPiBhbGwgSSBkbyBpcyBzaHV0IHRoZSBsaWQgYW5kIHRo
ZSByaWdodCB0aGluZyBoYXBwZW5zLgo+IAo+IE9wcG9ydHVuaXN0aWMgUzBpeCAod2hlbiB0aGUg
bGFwdG9wIGlzIGZ1bGx5IHBvd2VyZWQgdXAgYW5kIGluIHVzZSkgb25seSAKPiBoYXBwZW5zIGlm
IEkgdXNlIHJma2lsbCB0byBzaHV0IGRvd24gV2lGaSBhbmQgQmx1ZXRvb3RoLsKgIElmIGVpdGhl
ciBXaUZpIAo+IG9yIEJsdWV0b290aCBhcmUgb24sIHRoZSBsYXB0b3Agc3RheXMgaW4gcG93ZXIg
c3RhdGVzIHdlbGwgYWJvdmUgdGhlIAo+IGxvd2VzdC1wb3dlciBTT2l4IHN0YXRlcy4KPiAKPiBJ
dCBzb3VuZHMgbGlrZSB0aGUgMi4wLjAgQklPUyBwcmV2ZW50cyB3aGF0ZXZlciBzMmlkbGUgaXMg
ZG9pbmcgZnJvbSAKPiB3b3JraW5nIHdpdGhvdXQgYW4gcmZraWxsLgoKSSBzZWUgdGhpcyBiZWhh
dmlvciBhbHNvLiBIb3dldmVyLCBJIGFtIGN1cmlvdXMuIERvZXMgYW55b25lIG9uIGhlcmUgCmtu
b3cgaWYgc3VzcGVuZCBpcyBicm9rZW4gaW4gb3RoZXIgT1NlcyB3aXRoIHRoaXMgZmlybXdhcmUg
dmVyc2lvbj8KClRoYW5rcywKd3QKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
