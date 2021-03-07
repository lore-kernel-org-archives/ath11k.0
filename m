Return-Path: <SRS0=x0Dm=IF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2F3C433DB
	for <ath11k@archiver.kernel.org>; Sun,  7 Mar 2021 04:48:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C316502E
	for <ath11k@archiver.kernel.org>; Sun,  7 Mar 2021 04:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C316502E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5cEdd0aHNdBNWnSf9K9T7TVwPlBqjSOwdg7f1bRolk0=; b=j8sXmW6svpfylbhWY8+Q9S+Ua
	xQ2HtKqyLbl9bcCUG3YOtO34K4Ua7+BVVPKuDapqy3tKscjqz1jjSNMGvtYBB8zwwSnvWZCdiQyAt
	8RiIzx3k0ybd+xoS9Dol2ZtceOHborutRvHX5ExabC+lhARnoTPP+vVwAHD/EzYYdLT9R7Wc346Pz
	/34Ie7fHuG30aN8s5t+VPPp704z/gSLHRWQpehsXEwAYLwlqU2j6z2yRDBo60AwbTWZ3+fCfJ7DqQ
	aoS0AbDkPBjRnwYnWP5inLOHPaufZoe/8YqHggqXAv4mMGcnqbAi07MKGjW/tsN2vuMhViAdA2fl3
	Xt+XyA75w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIlLF-008Ehk-RB; Sun, 07 Mar 2021 04:48:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIlLB-008EbS-7j
 for ath11k@lists.infradead.org; Sun, 07 Mar 2021 04:48:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id j6so3329694plx.6
 for <ath11k@lists.infradead.org>; Sat, 06 Mar 2021 20:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=penguintechs.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s4PvjfvOnS1QaCgL2TcbfNKmRUAxRLdbgruJHxNVLNk=;
 b=R9Em18TAORFuFkeKd65q+KaMGZf2o7UUWS2V3bo6nlo2Lrb0hd0Ce3dOdxWlU+HTUO
 DISatuDb6eU7b1YzOUyVDXZBM2wnFnSTTNfrV4hzzQffN7g0n9K6Nn7bTyQlgISGGbbP
 EN5W1TqTniVYB3eW61vc8uzN3MoamdhCeA8jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s4PvjfvOnS1QaCgL2TcbfNKmRUAxRLdbgruJHxNVLNk=;
 b=BPFtw3dsZuh/2hf9xAwuTQ74IeH0ij/tPb51R3j8aD1x9kHflV/uVis6o7ljxZjNsK
 skGrf+IJLy5sHW3gABc/U2XEd0tUGi178pJ+CG+L2pBOEZVJvJCkk4GIU7topIlIQSwY
 CvnwNzd4ifqON3OPG+sftOiKp6iGv0+bosVUjrgJWNRxARsg+8/uaHbALWwujDAjh8CD
 mSk+qBpUmSsm0+Fc5ufvq8NSP+OIEqOSKSM8wPSQ92p+EGt9fFej4O6TGutWTrUtY7s5
 3mLbIFuaIjqVxr1/8mAaiXcDWlU5VDUZfDbBfGMPiIIc12ZkseCFtH/ulnaVHLB+jzGg
 u01w==
X-Gm-Message-State: AOAM531+QhVzX5z0hde0nuRG6rKujjY1jzvrcpTiRtSUwRGIxzVbyxmM
 bfpfJ2zET3AGR8egwRvF3l9nLg==
X-Google-Smtp-Source: ABdhPJwGIQhU3SHCSGpBDDDbTGheYoXP8yvCiSR4HkX5t2HsAtWGq5rzpqDuKxyKf66No4ZNiIXCrA==
X-Received: by 2002:a17:90b:794:: with SMTP id
 l20mr17913033pjz.207.1615092506561; 
 Sat, 06 Mar 2021 20:48:26 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net.
 [71.202.115.154])
 by smtp.gmail.com with ESMTPSA id w23sm3005175pff.194.2021.03.06.20.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 20:48:26 -0800 (PST)
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: Stelian Pop <stelian@popies.net>
Cc: Justin Mazzola Paluska <jmp@justinmp.com>, ath11k@lists.infradead.org,
 kvalo@codeaurora.org
References: <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org> <20210224091444.GA30965@calypso>
 <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
 <20210224220246.GA6104@calypso>
 <ca0dc6e4-364e-2525-b7d6-d02c2dc0c5fd@justinmp.com>
 <baeb852c-9248-d6d2-2e29-697f21604b9a@penguintechs.org>
 <20210306204943.GA4829@calypso>
From: Wren Turkal <wt@penguintechs.org>
Message-ID: <734138db-1ef4-1e5b-a37b-85d63bd5f915@penguintechs.org>
Date: Sat, 6 Mar 2021 20:48:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210306204943.GA4829@calypso>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_044829_501136_931E5619 
X-CRM114-Status: UNSURE (   8.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 3/6/21 12:49 PM, Stelian Pop wrote:
> Might be a good idea to publish a "me too" comment on the kernel bug
> entry here: https://bugzilla.kernel.org/show_bug.cgi?id=211879

I added my comment. Can you please change the affected version to 5.12-rc1?

Thanks,
wt

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
