Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A414BC4332F
	for <ath11k@archiver.kernel.org>; Wed, 28 Dec 2022 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5iXs+BeTqPp3vN+VL0sUFzLWX8ft3YmuES6ycGA8I0=; b=XQOtCCv/hoxzLJ
	dDueEdTpKkZTpDzYeRRrq4QjKFb/VjMahQGsBBaibNwy5/D/unECJRAV7AkljbBxR01Kj9rzLHzFG
	mDHtJOqJY4eiRtGMUb1L43bFAmt/qC8mY55/ZL3/VCQ0Meg9sBumD47fOeI40wvfWXdxGCK9rKuz3
	gBvuHqejyWI1UxeTOpaB69H1aECAEvx6ljZjY39gQfFZquPVPf8tE74RvHZ3XqcgMyZP+OiUpbIj9
	xPOxyuc96s3ihn8+2sJg51NQPL8uZOo9NlCqf+3pIoCzbuMvNtqMnXo9ziWFGqeFZA3YRzcE/NcVk
	npEOJJqfWN4BUbLg9avg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAdsR-008KGW-LO; Wed, 28 Dec 2022 21:22:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAdsO-008KEC-Mg
	for ath11k@lists.infradead.org; Wed, 28 Dec 2022 21:22:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id k137so6683890pfd.8
        for <ath11k@lists.infradead.org>; Wed, 28 Dec 2022 13:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xx3EP6ODYC48OXDEIcqjUBuNhmOgyXFl+VG+rCLYnqU=;
        b=m6aSduj7fW4JNEnSmIxkkz7pBaOO/mRMhCGZ4AXTLHjHisrVejpvGTTE64SnXJKeJt
         gPDkAiNQBOHwm2Maoq8jLZXFrcibn9dKJLUZ+teWK5nHSFXO+o1vADLFeM+ZwvFKuNk4
         KC5h1IKliojQFqlIvg7RO/Jo5qgS4AZTK0b9BAAPA62ccI0QDIOoGUtay6M2jzie7tmu
         c/JuLkZ0fE5HT8Nyni2MFhC3HULIkEYUsus2EAgtQhxfvtWZEDL1jq2tDOdm5cPSYmIH
         TE2qjjhedgbg9aFmSDWKT+JU54Q2dLYMeLrkD5ItmiRRdi7NXxBAFyuk5zfqUduicOIZ
         HKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xx3EP6ODYC48OXDEIcqjUBuNhmOgyXFl+VG+rCLYnqU=;
        b=PRBPFT0JdFAiGxxdiJG4dGV7LrqbhbHH4wcPeZiviww60wqKM/EFq8mvr1uJNJsh1Y
         OrygAXbUacAKJ3xVl0XtWBPKIvhCDhFilS2uooj8XlxxQ+X63E8QkHfDvgYAzhe4TdhG
         bjUqNZKy0z7E370iFZXA9bxyFvgA0OI6i5gRyanFVZ0Wzft6btVcXsGUs7QhEv4cu9oO
         eJdmiN1OX5Fp1w+MptN3SBqu+VFN8gy5/cSe4Er7CDbXxtdLF7mtblCAWtPcZkKikEUB
         AW79eSnBKTfE3018ZXXxC1h7hNcU0bqnVCscx0vKp4J5gl9WyrmJu+Lxp1nEDnxHgtR7
         hWAQ==
X-Gm-Message-State: AFqh2krS4pMbTpVGjeq3VhxGjDM1Nu19SMPivxZ8TJy3sD33SaktGskb
	RjsV/6mWlyLRW0KEHq9JDZ4=
X-Google-Smtp-Source: AMrXdXtYOgHQvLrDx2+vQ91DWrdV0XMnfyR70ZTHkZudkWh3UaCcZyw+oWDaK0v3YRqNrQJqHMeZCg==
X-Received: by 2002:a05:6a00:1a01:b0:580:8d40:cb9d with SMTP id g1-20020a056a001a0100b005808d40cb9dmr29010338pfv.27.1672262534958;
        Wed, 28 Dec 2022 13:22:14 -0800 (PST)
Received: from [192.168.254.20] ([50.39.160.234])
        by smtp.gmail.com with ESMTPSA id c23-20020aa79537000000b005747b59fc54sm361718pfp.172.2022.12.28.13.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 13:22:14 -0800 (PST)
Message-ID: <378a1d63b3752ace7384c44d6f5184753fa7795d.camel@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
From: James Prestwood <prestwoj@gmail.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, Marcel Holtmann
	 <marcel@holtmann.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Wed, 28 Dec 2022 13:22:14 -0800
In-Reply-To: <2861463e-a097-7efe-bc75-f13c8faf9547@quicinc.com>
References: <20221220043823.20382-1-quic_mpubbise@quicinc.com>
	 <5DAEA8B2-2B44-4A91-9E57-12B6C6B6C1FC@holtmann.org>
	 <2861463e-a097-7efe-bc75-f13c8faf9547@quicinc.com>
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_132216_767573_6C5F32BC 
X-CRM114-Status: GOOD (  15.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Manikanta,
> By the way, userspace itself selects the frequencies to scan, not the
> driver.
> 
> If we see the split scan implementation in cfg80211, this is the how
> it 
> is implemented. If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set, it
> selects 
> all PSC channels and those non-PSC channels where RNR IE information
> is 
> found in the legacy scan results. If this flag is not set, all
> channels 
> in 6 GHz are included in the scan freq list. It is upto userspace to 
> decide what it wants.


This isn't your problem, but it needs to be said:

The nl80211 docs need and update to reflect this behavior (or remove
the PSC logic). IMO this is really weird that the kernel selects PSC's
based on the co-located flag. The docs don't describe this behavior and
the flag's name is misleading (its not
SCAN_FLAG_COLOCATED_AND_PSC_6GHZ) :)

If userspace doesn't specify a channel list then the kernel can do
whatever it wants, but otherwise it should stick to the requested
channels and scan only for co-located APs if the flag was set, not
PSC's too.

This basically adds ~3x the time to IWD's quick scan's for 6GHz capable
cards regardless if there are any co-located AP's. ugh.



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
