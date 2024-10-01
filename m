Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5504CE7D1F
	for <ath11k@archiver.kernel.org>; Tue,  1 Oct 2024 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MIGn1om5vsgY+s+l6ME+2I5TMskuBo3dAbFkTRDRS0=; b=r697yKnGb6BAvmPYWKlQjZwO5E
	nfKFRv07VvGiCKHDnDkkaRVuYgFPvEXEmRAV68iEj5O173hj8tiSUo9pYuEdYRPOtDc44d5KT2jM8
	jtCxPF/LRjPesoHkpcLwXHZbwwCaSCxh2DbfOfCv9iSdSzsyXSTgh7xBAPf/FWduNSAmHenjomHo+
	5I4Dnicj5Lw6EJOho/mX2nDt5f36BLqjH/K5xxwnI6am+H6Q/WrXFVfZvsPKKLsO7x0odv76H3W8h
	/1dqCtVt72NWKowBwJ6tuuCnwGqsl1v/VvYE6DEigg9NYxeEJNEG50LMYiG+L03/qyu9Y3VDW8ROP
	3AkvaaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svccc-00000002rpa-0kqa;
	Tue, 01 Oct 2024 13:08:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcca-00000002rpE-05Vf
	for ath11k@lists.infradead.org;
	Tue, 01 Oct 2024 13:08:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20b7eb9e81eso23999855ad.2
        for <ath11k@lists.infradead.org>; Tue, 01 Oct 2024 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727788135; x=1728392935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MIGn1om5vsgY+s+l6ME+2I5TMskuBo3dAbFkTRDRS0=;
        b=lvpnGwPjhloM8/jLsj7Jgtik+6Zf0EYXRIVlKY8ALB5vdtobg0/BL6VwaWUIxBJdI5
         serJTKXF/S0jGj72Q7tPwbL+qhEQvRi7xyXObaEfNRBMtHQZ7ulNFNyo6HyKfGteSg+E
         u2phV9lsYNLmW7ngQKudsU241fMWFVf0MK1ZYgKn1zZxoN14rW+veEG+SXpgesRhRDyF
         NftAeVhirnWykf14iAiR5emqhejmYBfqA8EXGOpxWci53E43LB0iE2yZXiP8xtptzYsl
         CLVxcGa54n1hzs0WS9y8tl3BxwFGPoBPaMJYTIs64OfLrcBncPH8IHtZ/4/uL8fQz40m
         YuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788135; x=1728392935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MIGn1om5vsgY+s+l6ME+2I5TMskuBo3dAbFkTRDRS0=;
        b=gObNsARQT3fnWZYUjHde4F6nMQFeQbR9iR7XYK73fIA0ni1w2QSy4wLAffU9Wj2AsI
         hUEqeiv3wlyiIEEHggZ3bn6I1W+Ifov6NvcLoftAAMc27O3JEp6FpX2aV2Xx5pEZUYuJ
         yDvuoB2EzSZ/vXfq0UA1oBvGEM4SnO5vXLu/Qt5QO6yAUjGTv/CWvDOWDJ2PEefkZYs3
         KaUZPW4/5fPxv7EeuSFK9b+ER8g3PERW9s/wvQ+T4YpE8FhK1ERhJYEmpVL74Cb07GPq
         KAKIy8F5uJYMirXPqQ1mj34xA81tWnp0a0LBxcWUsFhttFSrlZiR6b7+mWszAxNy+wLb
         w3FA==
X-Gm-Message-State: AOJu0Yx9wCObRRfErhtDT0SKlIQ5R80I7Ns9a1QNMjqDEKkKvC3XvmDP
	iJtQ6ok+yw0SPcgvnzRU2zHlIWP7YzixNY8q1OHWly/Vl4EL1jDecd8vug==
X-Google-Smtp-Source: AGHT+IFVvxiDfLEcCNjs4eYDnzm0XNEaSWnU8WMrXU+geuN613pFT2w3IwE6EFZ9U0gPSTYF5VvoYQ==
X-Received: by 2002:a17:902:ec81:b0:20b:6145:d0d5 with SMTP id d9443c01a7336-20b6145d23amr161880065ad.10.1727788134473;
        Tue, 01 Oct 2024 06:08:54 -0700 (PDT)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e4d6aesm69496715ad.233.2024.10.01.06.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 06:08:54 -0700 (PDT)
Message-ID: <b8afb2d6-02f6-4b6d-ae63-853225c28eea@gmail.com>
Date: Tue, 1 Oct 2024 06:08:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
 <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
 <0d1dab88-66a0-48c1-bdbe-777d07c3132e@gmail.com>
 <70567137-dfb9-4896-9e6c-6c02a97228cb@quicinc.com>
 <15c909da-f01e-43ee-b486-f9b6d5bcc29c@gmail.com>
 <26302980-4cd8-466a-8de1-4be10a42536a@quicinc.com>
 <f65b609c-0813-414b-885d-24257e76e6d0@gmail.com>
 <564bb38f-aef1-4981-b706-926eef5c6776@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <564bb38f-aef1-4981-b706-926eef5c6776@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_060856_096200_8BE9ABEB 
X-CRM114-Status: GOOD (  11.59  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 9/28/24 7:16 PM, Baochen Qiang wrote:
>
> On 9/27/2024 7:53 PM, James Prestwood wrote:
>>> here is the sequence I saw in sniffer:
>>> #1 AP send M3
>>> #2 station send 'neighbor report request' without encryption, though 'protected' flag is set
>>> #3 station send out M4
>>>
>>> is this the same with what you saw?
>> When I was able to capture the neighbor report request (rarely) it was after M4, not before. If you're seeing it prior to M4 that seems strange, unless the kernel/ath11k is doing some odd queuing?
> yeah... firmware has some odd assumption on the sequence of key install, causing such behavior.
>
Do you think maybe this has something to do with it? Its just a timing 
issue (both in my case and when you see it before M4) and in some cases 
the keys aren't fully installed and the request either gets dropped or 
just isn't encrypted correctly?

Like I said originally, its not like this issue is severe, we can just 
request a neighbor report later and that does work. It was just an 
observation and didn't seem right.

Thanks,

James


