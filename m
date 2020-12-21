Return-Path: <SRS0=/m/M=FZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CB8C433E0
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 19:26:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FA322B3B
	for <ath11k@archiver.kernel.org>; Mon, 21 Dec 2020 19:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9FA322B3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=justinmp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SIRYGrBlJzMeNRW1Tscfs39vTensGZFpO/u1s+GDkE4=; b=MgmlDEvPqL+wL8yd9TfK9gmhA
	VDq+QJXGgr8WP/vGe2nLFM8k8JevbJW1g81//SuvDuDQQat+c1oe0PZYk9VRC0vHZoUS/TnlVrX/l
	OomOIQXrNdwN6chaHdp6PUwDXNc/FzUT4SqKvgyFaaYwEgApuJcrxJj7IIzWsE+kDrcSKp5nIebTq
	4TVMKTbMb3Dd1/KpchSvcq9K9bEVGdfOmHUoqngquQp9zZuMsV/JBfgwDSzsuRoK0YpFdJk3n2vYo
	0X1Plc4jFiW6VSToiVGCsHCHdr70vWppvxTqWn2dQiMHkK2UdABYmvNQlbRyHrNnE/2rZuf4De1DK
	lE1V2bVhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQoj-0002FQ-CM; Mon, 21 Dec 2020 19:26:01 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQoh-0002E1-HF
 for ath11k@lists.infradead.org; Mon, 21 Dec 2020 19:26:00 +0000
Received: by mail-qt1-x835.google.com with SMTP id z20so7396751qtq.3
 for <ath11k@lists.infradead.org>; Mon, 21 Dec 2020 11:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=justinmp-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xfbkS0QPldoTJOGalHObwAcgjz5KS3UZCsDq/EhGDBE=;
 b=kRMn0fQDiwQNbdmQQCFgvOka0i3XlqRfD6iYEW3A6TMOzOsm1P1Tl+rRahzKtw4lH+
 SpGBSBDlZnNG47leoNaNtHKs1/LSROA9zs3EPVmJ+tJxYSrl6k2KKEMCj2NkYWPAaC8V
 oYlGr1Kw90yaNq5BcY1Gxp8ZK696F9KYo2HMm6npI0MyP9AlBRhjuL/DtwM+qp7Ff2+H
 N74kO9LTA0jhXNFE1hFMeXwNdGYI+CuEd38HuxM3X715Hhl93LLXhGcNIFZC++v0eDwM
 xZfsfkIP9DjDj3i7/sxnWEg106V5pke2XCfFUAfKx471Jx6FflNTPIuPYZAcpuYgx5nE
 TTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xfbkS0QPldoTJOGalHObwAcgjz5KS3UZCsDq/EhGDBE=;
 b=b8ngTtq6YBGA+QbB6kDK12+UQhTt3Y7scqPWIS7IADjQwJgMGJYjy/D4u5xxm59X3r
 L5hop8CNY6+cTP2mVSQq9eIlPrUsOD75WcTmIurFLtNQKbWkOSJLzabFrhweG82brQ9Z
 C1PWjjFzU7l+cq3TwKHz2YFES0xHRKy2nVU04LrTMAsCuKMUqwNQ7arcqdz49JgtzVIs
 SX9Y13eSikgsiuiNH6vrbKEBDoGLq22xhOQib/qDjOl+hNJItRDnrQ3JRXDwp3bkMxzM
 NF+5Oicu5u8X3G3U5eDbb8mbatMohkQ4nNBAs/nOYo15LPMT8zQdX7x8BGsUZSr5dh+e
 vxig==
X-Gm-Message-State: AOAM531XHhTunCvKI202aHgy8ADQixNtu5STUhmoHzNnJRcFqvIoJMh6
 5QbQUuqpwQFF6pTP0rYDSos5GrcyvIBi4A==
X-Google-Smtp-Source: ABdhPJwbxddtPMsVVWY/uGoSSQ6+dxJjBpY3qrZjEMKD/X7G0EzWDUifx8ZTf9DICKKFXX6BmjkKdg==
X-Received: by 2002:ac8:6b86:: with SMTP id z6mr18004833qts.26.1608578755386; 
 Mon, 21 Dec 2020 11:25:55 -0800 (PST)
Received: from ?IPv6:2601:184:4a7f:a732::1f1? ([2601:184:4a7f:a732::1f1])
 by smtp.gmail.com with ESMTPSA id r22sm11744197qkk.67.2020.12.21.11.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 11:25:54 -0800 (PST)
Subject: Re: ath11k-qca6390-bringup-202012140938: rebate to v5.10 and MHI M2
 workaround
To: Kalle Valo <kvalo@codeaurora.org>
References: <87blew3e4q.fsf@codeaurora.org> <87blew3e4q.fsf@codeaurora.org>
 <054ddea6-639e-c21e-d404-d551c65128df@justinmp.com>
 <920c8cc9-21fb-b7aa-4b49-be7656fb14b5@justinmp.com>
 <f776233a-0ed6-1ebc-3d68-be4a88514736@justinmp.com>
 <874kkfozhp.fsf@codeaurora.org>
From: Justin Mazzola Paluska <jmp@justinmp.com>
Message-ID: <a170a87b-072d-dc8e-6833-231e0df5b23c@justinmp.com>
Date: Mon, 21 Dec 2020 14:25:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <874kkfozhp.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_142559_699891_FB64B372 
X-CRM114-Status: GOOD (  10.01  )
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

T24gMTIvMjEvMjAgMTI6MTEgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+IE15IHJvdXRlciBzdXBw
b3J0cyAxNjAgTUh6IGNoYW5uZWxzIGluIHRoZSA1IEdIeiBiYW5kcyBbMV0uwqAgSQo+PiBzd2l0
Y2hlZCB0aGUgcm91dGVyIHRvIGFkdmVydGlzaW5nIDgwIE1IeiBjaGFubmVscyBhbmQgdGhlIGNh
cmQgY291bGQKPj4gY29ubmVjdC4KPiBUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBkZWJ1Z2dpbmcs
IHRoaXMgc2hvdWxkIGhlbHAgdXMgcmVwcm9kdWNpbmcgdGhlCj4gcHJvYmxlbS4gV2hhdCdzIHRo
ZSBleGFjdCBvcGVud3J0IHZlcnNpb24geW91IGFyZSB1c2luZz8KClRoZSBPcGVuV1JUIHZlcnNp
b24gaXM6CgpPcGVuV3J0IDE5LjA3LjUgcjExMjU3LTUwOTAxNTJhZTMgLyBMdUNJIG9wZW53cnQt
MTkuMDcgYnJhbmNoIApnaXQtMjAuMzQxLjU3NjI2LTUxZjU1YjUKCihUaGlzIGlzIHRoZSBsYXRl
c3Qgc3RhYmxlIHJlbGVhc2UuKQogwqDCoMKgIC0tSnVzdGluCgotLSAKYXRoMTFrIG1haWxpbmcg
bGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
